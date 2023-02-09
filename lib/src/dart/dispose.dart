import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:retry/retry.dart' as retrypkg;


import 'async.dart';
import 'commons.dart';
import 'rxvar.dart';
import 'streams.dart';

typedef DisposeFn = void Function();
typedef DisposeAsync = Future<void> Function();

final log = Logger('dispose');

class Disposers {
  bool _disposed = false;
  List<DisposeFn> _disposers = List.empty();

  void add(DisposeFn fn) {
    if (_disposed) {
      fn();
    } else {
      _disposers.add(fn);
    }
  }

  void dispose() {
    if (!_disposed) {
      _disposed = true;

      final disposers = _disposers;
      _disposers = List.empty();

      for (final fn in disposers) {
        fn();
      }
    }
  }
}

class WithDisposeAsync<T> {
  final T value;
  final DisposeAsync dispose;

  WithDisposeAsync(this.value, this.dispose);

  static WithDisposeAsync<T> noop<T>(T value) =>
      WithDisposeAsync(value, DisposeAsyncs.noop);
}

class DisposedException {}

extension StreamDisposeX<I> on Stream<I> {
  Stream<WithDisposeAsync<O>> disposeInit<O>(
    Future<WithDisposeAsync<O>> Function(I input) init,
    WithDisposeAsync<O> seed,
  ) {
    return asyncScan<WithDisposeAsync<O>>((wd, value, _) async {
      await wd.dispose();
      return await init(value);
    }, seed);
  }
}

class DisposeAsyncsMixin {
  @protected
  final DisposeAsyncs disposers = DisposeAsyncs();

  Future<void> dispose() => disposers.dispose();
}

extension StreamSubscriptionX<T> on StreamSubscription<T> {
  void cancelBy(DisposeAsyncs disposers) {
    disposers.add(cancel);
  }
}

class DisposeAsyncs implements AsyncDisposable {
  static Future<void> noop() async {}

  bool _disposed = false;
  List<DisposeAsync> _disposers = [];

  bool get disposed => _disposed;

  final _done = Completer();

  Future<void> add(DisposeAsync fn) async {
    if (_disposed) {
      await fn();
    } else {
      _disposers.add(fn);
    }
  }

  void addSync(DisposeFn fn) async {
    if (_disposed) {
      fn();
    } else {
      _disposers.add(() async {
        fn();
      });
    }
  }

  @override
  Future<void> dispose() async {
    if (!_disposed) {
      _disposed = true;
      final disposers = _disposers;
      _disposers = List.empty();
      _done.completeWith(
        () => Future.wait(disposers.map((e) => e())),
      );
    }
    await _done.future;
  }

  Future<T> run<T>(Future<T> Function() fn) async {
    if (disposed) {
      throw DisposedException();
    } else {
      return await fn();
    }
  }

  Future<T> Function() runner<T>(Future<T> Function() fn) => () => run(fn);

  Future<T> retry<T>(Future<T> Function() fn) => retrypkg.retry(
        runner(fn),
        retryIf: (_) => !disposed,
      );
}

abstract class AsyncDisposable {
  Future<void> dispose();
}

abstract class InitDispose implements AsyncDisposable {
  Future<void> init();

  static const noop = _InitDispose(Futures.voidFn, Futures.voidFn);

  factory InitDispose({
    required Future<void> Function() init,
    required Future<void> Function() dispose,
  }) =>
      _InitDispose(init, dispose);

  factory InitDispose.build(
      Future<void> Function(DisposeAsyncs disposers) builder) {
    final disposers = DisposeAsyncs();

    return InitDispose(
      init: () => builder(disposers),
      dispose: disposers.dispose,
    );
  }
}

class _InitDispose implements InitDispose {
  final Future<void> Function() _init;

  final Future<void> Function() _dispose;

  const _InitDispose(this._init, this._dispose);

  @override
  Future<void> dispose() => _init();

  @override
  Future<void> init() => _dispose();
}

abstract class DisposersMixin implements AsyncDisposable {
  @protected
  final DisposeAsyncs disposers = DisposeAsyncs();

  @override
  Future<void> dispose() => disposers.dispose();
}

abstract class InitDisposers implements InitDispose {
  @protected
  final DisposeAsyncs disposers = DisposeAsyncs();

  @override
  Future<void> dispose() => disposers.dispose();
}

extension InitDisposeBehaviorSubjectX<T extends InitDispose>
    on BehaviorSubject<T> {
  Future<void> transitionDIS(T next) async {
    await value.dispose();
    await next.init();
    add(next);
  }

  Future<void> transitionISD(T next) async {
    final current = value;
    await next.init();
    add(next);
    await current.dispose();
  }
}

extension InitDisposeAsyncsX on DisposeAsyncs {
  Future<void> initDispose(InitDispose item) async {
    await item.init();
    await add(item.dispose);
  }
}

class InitDisposeQueue<I, D> with DisposeAsyncsMixin {
  final _queue = StreamController<Future<void> Function()>();
  final RxVar<_InitDisposeQueueItem<I, D>> _var;

  late final RxVal<I> value = _var.map((v) => v.item);

  InitDisposeQueue(I initial, AsyncFunction<D> disposeInitial)
      : _var = RxVar(
    _InitDisposeQueueItem(initial, disposeInitial),
  ) {
    final queueDone = _queue.stream.asyncForEach((e) => e());

    disposers.add(() async {
      log.finer('awaiting InitDispose queue onComplete');
      await _queue.close();
      await queueDone;

      log.finer('awaiting InitDispose value dispose');
      await _var.value.dispose();

      log.finer('InitDispose dispose complete');
    });
  }

  Future<I> transitionDIS<P>({
    required FutureOr<P> Function(D disposed) init,
    required FutureOr<I> Function(P internal) value,
    required FutureOr<D> Function(P internal) dispose,
  }) {
    final completer = Completer<I>();
    _queue.add(
          () => completer.completeWith(() async {
        log.finer('transitionDIS start');
        final previous = _var.value;
        final disposed = await previous.dispose();
        final internal = await init(disposed);
        final next = await value(internal);
        _var.value = _InitDisposeQueueItem(next, () => dispose(internal));
        log.finer('transitionDIS end');
        return next;
      }),
    );
    return completer.future;
  }

  static InitDisposeQueue<void, void> basic() =>
      InitDisposeQueue(null, Futures.voidFn);
}

class _InitDisposeQueueItem<I, D> {
  final I item;
  final FutureOr<D> Function() dispose;

  _InitDisposeQueueItem(this.item, this.dispose);
}


extension InitDisposeQueueVoidVoidX on InitDisposeQueue<void, void> {
  Future<void> transition(
      FutureOr<void> Function(DisposeAsyncs disposers) init) {
    return transitionDIS<DisposeAsyncs>(
      init: (_) async {
        final disposers = DisposeAsyncs();
        await init(disposers);
        return disposers;
      },
      value: Functions.identity,
      dispose: (disposers) => disposers.dispose(),
    );
  }
}

extension InitDisposeRxVarX<T extends InitDispose> on RxVar<T> {
  Future<void> transitionDIS(T next) async {
    await value.dispose();
    await next.init();
    value = next;
  }

  Future<void> transitionISD(T next) async {
    final current = value;
    await next.init();
    value = next;
    await current.dispose();
  }
}