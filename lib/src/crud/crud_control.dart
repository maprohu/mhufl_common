import 'package:flutter/cupertino.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';

part 'crud_control.g.dart';

@Impl.data()
abstract class TileConfig {
  Widget? get title;

  Widget? get subtitle;

}

extension TileConfigFactorX on TileConfig$Factory {
  TileConfig$Impl fromDisplayStrings<I, T>({
    required IRxVal<Opt<T>> prx,
    required String Function(T value) title,
    required String Function(T value)? subtitle,
  }) =>
      create(
        title: prx.rxBuilderOrNull(
          (context, value) => Text(
            title(value),
          ),
        ),
        subtitle: subtitle?.let(
          (subtitle) => prx.mapOpt<Widget>(
            (value) => Text(subtitle(value)),
          ).rxOrNull(),
        ),
      );
}

@Impl()
abstract class CrudListPageControl<V> {
  IPrxCollectionOfType<List<V>> get items;

  TileConfig tile(int index, V item);

  void onTap(BuildContext context, int index);

  V create(int index);

  final ordering = mk.RxVar.variable(false);

  int add() {
    late int index;
    items.rebuild((c) {
      index = c.length;
      final item = create(index);
      c.add(item);
    });
    return index;
  }
}
