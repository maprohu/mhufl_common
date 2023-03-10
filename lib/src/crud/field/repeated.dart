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
  @override
  late final PmRepeatedField<M, V> pmFld = crd.pmFld as PmRepeatedField<M, V>;

  @override
  Widget defaultTileWidget(PrxOfType<List<V>> prx) => repeatedTile(
        prx: (prx as IPrxCollectionOfType<List<V>>).toImpl,
        create: (index) => collectionItem.createNewItem(index),
      );

  Widget repeatedTile({
    required PrxCollectionOfType$Impl<List<V>> prx,
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

  @override
  PrxSingleOfType$Impl<V> item(
    PrxCollectionFieldOfMessageOfType<M, List<V>> collectionVar,
    int key,
  ) =>
      collectionVar.item(key);
}
