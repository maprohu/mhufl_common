import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';

import 'widgets.dart';

class RxBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T value) builder;
  final IRxVal<T> stream;

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
      builder: (context, snapshot) => builder(context, snapshot.data as T),
    );
  }
}

class RxText<T> extends StatelessWidget {
  final IRxVal<String> _stream;

  const RxText(this._stream, {super.key});

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      stream: _stream,
      builder: (context, value) {
        return Text(value);
      },
    );
  }
}

extension RxValWidgetX<T> on IRxVal<T> {
  Widget rxText(String Function(T value) text) => map(text).rxText();
}

extension RxValStringWidgetX on IRxVal<String> {
  Widget rxText() => RxText(this);
}

extension RxValOptStringWidgetX on IRxVal<Opt<String>> {
  Widget rxTextOrNull() => rxBuilderOrNull(
        (context, value) => Text(value),
      );
}

extension StreamStringWidgetX on Stream<String> {
  Widget rxText([String initial = ""]) => rxWidget(
        initial,
        (context, value) => Text(value),
      );
}

extension WidgetX on Widget {
  Widget when(IRxVal<bool> condition) => RxBuilder(
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

extension NullableRxValWidgetX<T extends Object> on IRxVal<T?> {
  Widget loadingOr(Widget Function(BuildContext context, T value) builder) =>
      RxBuilder(
        stream: this,
        builder: (context, value) {
          if (value == null) {
            return const LoadingWidget();
          } else {
            return builder(context, value);
          }
        },
      );

  Widget nullOr(Widget Function(BuildContext context, T value) builder) =>
      RxBuilder(
        stream: this,
        builder: (context, value) {
          if (value == null) {
            return const NullWidget();
          } else {
            return builder(context, value);
          }
        },
      );
}

extension WidgetRxValWidgetX<T> on IRxVal<Widget> {
  Widget rxWidget() => RxBuilder(
        stream: this,
        builder: (context, value) => value,
      );
}

extension OptWidgetRxValWidgetX<T> on IRxVal<Opt<Widget>> {
  Widget rxWidget() => RxBuilder(
        stream: this,
        builder: (context, value) => value.when(
          here: Functions.identity,
          gone: () => const NullWidget(),
        ),
      );

  Widget rxOrNull() => rxBuilderOrNull(
        (context, value) => value,
      );
}

class RxList<T, I extends Iterable<T>> extends StatelessWidget {
  final IRxVal<I> list;
  final ValueBuilder<T> builder;

  const RxList({Key? key, required this.list, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      stream: list,
      builder: (context, items) {
        return ListView(
          children: items
              .map(
                (item) => builder(context, item),
              )
              .toList(),
        );
      },
    );
  }
}

class RxColumn<T, I extends Iterable<T>> extends StatelessWidget {
  final IRxVal<I> list;
  final ValueBuilder<T> builder;

  const RxColumn({Key? key, required this.list, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      stream: list,
      builder: (context, items) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: items
              .map(
                (item) => builder(context, item),
              )
              .toList(),
        );
      },
    );
  }
}

// extension IterableRxValX<T, I extends Iterable<T>> on RxVal<I> {
//   RxList<T, I> rxList(ValueBuilder<T> builder) =>
//       RxList(list: this, builder: builder);
// }

extension BuiltListRxValX<T> on IRxVal<BuiltList<T>> {
  RxList<T, BuiltList<T>> rxList(ValueBuilder<T> builder) =>
      RxList(list: this, builder: builder);

  RxColumn<T, BuiltList<T>> rxColumn(ValueBuilder<T> builder) =>
      RxColumn(list: this, builder: builder);
}

extension WidgetRxValX<T> on IRxVal<T> {
  RxBuilder<T> rxBuilder(ValueBuilder<T> builder) =>
      RxBuilder(stream: this, builder: builder);
}

extension WidgetOptRxValX<T> on IRxVal<Opt<T>> {
  Widget rxBuilderOrNull(ValueBuilder<T> builder) => rxBuilder(
        (context, value) => value.when(
          here: (v) => builder(context, v),
          gone: const NullWidget().asConstant(),
        ),
      );
}

extension WidgetBoolRxValX on IRxVal<bool> {
  Widget rxWhen(Widget child) => map((value) {
        if (value) {
          return child;
        } else {
          return const NullWidget();
        }
      }).rxWidget();

  IRxVal<bool> not() => map((b) => !b);

  Widget rxWhenNot(Widget child) => not().rxWhen(child);
}

extension StateTypeRxValX<T> on IRxVal<StateType> {
  Widget rxState() => map((value) => StateWidget(state: value)).rxWidget();
}

extension WidgetStreamX<T> on Stream<T> {
  Widget rxWidget(T initial, ValueBuilder<T> builder) => StreamBuilder(
        initialData: initial,
        stream: this,
        builder: (context, snapshot) {
          return builder(context, snapshot.data as T);
        },
      );
}

extension BuiltListStreamlX<T> on Stream<BuiltList<T>> {
  Widget rxColumn(ValueBuilder<T> builder) => rxWidget(
        BuiltList(),
        (context, items) {
          return Column(
            children: items
                .map(
                  (item) => builder(context, item),
                )
                .toList(),
          );
        },
      );
}
