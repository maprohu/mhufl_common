import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:protobuf/protobuf.dart';

import '../../widgets.dart';
import '../crud_control.dart';
import '../crud_field.dart';
import '../crud_widgets.dart';
import 'collection.dart';
import 'crdt.dart';

part 'repeated.g.dart';

@Impl.data()
abstract class CrdtFldRepeated<M extends GeneratedMessage, V>
    extends CrdtFldCollection<M, List<V>, int, V> {
  late final pmFld = crd.pmFld as PmRepeatedField<M, V>;

  @override
  Widget defaultTileWidget(IPrxOfType<List<V>> prx) => repeatedTile(
        prx: prx as IPrxCollectionOfType<List<V>>,
        create: (index) => collectionItem.createNewItem(index),
      );

  Widget repeatedTile({
    required IPrxCollectionOfType<List<V>> prx,
    required V Function(int index) create,
  }) {
    return mk.CrudButton.data(
      label: label,
      subtitle: prx
          .mapOpt((value) => value.length)
          .orDefault(0)
          .map((v) => v.toString()),
      onTap: mk.RxVar.variable((context) {
        ScaffoldPage.show(
          context,
          label,
          CrudListPage(
            control: mk.CrudListPageControl.data<V>(
              items: prx,
              tile: (index, item) {
                final itemPrx = prx.item(index);
                return collectionItem.tileConfig(index, itemPrx);
              },
              create: create,
              onTap: (context, index) {
                final rxVar = prx.item(index);
                collectionItem.onTap(context, rxVar);
              },
            ),
          ),
        );
      }),
    );
  }
}
