import 'package:flutter/material.dart';

import '../dart/rxvar.dart';
import 'widgets.dart';




class RxBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T value) builder;
  final RxVal<T> stream;

  const RxBuilder({
    Key? key,
    required this.stream,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: stream.value,
      stream: stream.tail,
      builder: (context, snapshot) => builder(context, snapshot.requireData),
    );
  }
}

class RxText<T> extends StatelessWidget {
  final RxVal<T> _stream;
  final String Function(T value) _text;

  const RxText(this._stream, this._text, {super.key});

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      stream: _stream,
      builder: (context, value) {
        return Text(_text(value));
      },
    );
  }
}

extension RxValWidgetX<T> on RxVal<T> {
  RxText<T> textWidget(String Function(T value) text) => RxText<T>(this, text);
}

extension RxValStringWidgetX on RxVal<String> {
  RxText<String> toTextWidget() => textWidget((value) => value);
}



extension WidgetX on Widget {
  Widget when(RxVal<bool> condition) => RxBuilder(
        stream: condition,
        builder: (context, value) {
          if (value) {
            return this;
          } else {
            return const NullWidget();
          }
        },
      );
}
