import 'package:flutter/cupertino.dart';
import 'package:mhudart_common/mhdart_common.dart';
part 'crud_control.g.dart';
@Impl()
abstract class TileConfig {
  Widget? get title;

  Widget? get subtitle;
}

@Impl()
abstract class CrudListPageControl<V> {
  PrxCollectionBase<List<V>> get items;

  TileConfig tile(int index, V item);

  void onTap(BuildContext context, int index);

  V create();

  final ordering = mk.RxVar.variable(false);

  int add() {
    late int index;
    items.rebuild((c) {
      index = c.length;
      final item = create();
      c.add(item);
    });
    return index;
  }

}
