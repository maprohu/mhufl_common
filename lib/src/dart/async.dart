
import 'dart:async';

typedef AsyncVoidFunction = AsyncFunction<void>;
typedef AsyncFunction<T> = Future<T> Function();

extension CompleterX<T> on Completer<T> {
  Future<void> completeWith(Future<T> Function() fn) async {
    try {
      complete(await fn());
    } catch (e) {
      completeError(e);
    }
  }

  Future<void> completeWithSync(T Function() fn) async {
    try {
      complete(fn());
    } catch (e) {
      completeError(e);
    }
  }
}

class Futures {
  static final Future<void> voidValue = Future.value();

  static Future<void> voidFn() => voidValue;
}

