import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';

extension StreamAsyncX<T> on Stream<T> {
  Future<S> asyncFold<S>(
    S initialValue,
    Future<S> Function(S previous, T element) combine,
  ) {
    return fold(
      Future.value(initialValue),
      (previous, element) async {
        return combine(await previous, element);
      },
    ).then((value) async => await value);
  }

  Stream<S> asyncScan<S>(
    Future<S> Function(S accumulated, T value, int index) accumulator,
    S seed,
  ) {
    return scan<Future<S>>(
      (acc, value, index) async {
        return await accumulator(await acc, value, index);
      },
      Future.value(seed),
    ).asyncMap(
      (event) async => await event,
    );
  }

  Future<void> asyncForEach(Future<void> Function(T element) action) {
    return asyncMap(action).forEach((_) {});
  }
}

extension CommonsStreamX<T> on Stream<T> {
  StreamSubscription<T> pipeTo(StreamSink<T> target) => listen(target.add);
}

extension BuiltListBehaviorSubjectX<T> on BehaviorSubject<BuiltList<T>> {
  void append(Iterable<T> items) => add(value.followedBy(items).toBuiltList());

  void remove(T item) => add(value.rebuild((b) => b.remove(item)));
}