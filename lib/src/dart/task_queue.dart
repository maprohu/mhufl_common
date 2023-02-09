import 'dart:async';

import 'async.dart';
import 'streams.dart';
import 'dispose.dart';
import 'rxvar.dart';

class TaskQueue with DisposersMixin {
  final _queue = StreamController<Future<void> Function()>();
  final _busy = RxVar(0);

  late final busy = _busy.map((value) => value > 0);

  TaskQueue() {
    final processing = _queue.stream.asyncForEach((task) async {
      _busy.update((value) => value + 1);

      try {
        await task();
      } finally {
        _busy.update((value) => value - 1);
      }
    });

    disposers.add(() async {
      await _queue.close();
      await processing;
    });
  }

  Future<T> submit<T>(Future<T> Function() task) async {
    final completer = Completer<T>();

    _queue.add(
      () => completer.completeWith(task),
    );

    return await completer.future;
  }
}
