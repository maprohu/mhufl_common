import 'dart:async';

typedef Setter<T> = void Function(T value);

class Functions {
  static T identity<T>(T value) => value;

  static Future<void> asyncNoop() async {}

  static T invoke0<T>(T Function() fn) => fn();
}

T createWithSelf<T>(T Function(T Function() self) fn) =>
    _CreateWithSelf<T>().create(fn);

class _CreateWithSelf<T> {
  late T selfRef;

  T create(T Function(T Function() self) create) {
    return selfRef = create(() => selfRef);
  }
}

extension AnyX<T> on T {
  T Function() asConstant() => () => this;
}

extension ListX<T> on List<T> {
  bool addOnce(T item) {
    if (contains(item)) return false;
    add(item);
    return true;
  }
}
