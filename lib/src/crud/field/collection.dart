import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:protobuf/protobuf.dart';

import '../crud_control.dart';
import '../crud_field.dart';
import '../crud_message.dart';
import 'crdt.dart';

part 'collection.g.dart';

abstract class CrdtFldCollection<M extends GeneratedMessage, F, K, V>
    extends CrdtFldRead<M, F> {
  CrdtCollectionItem<K, V> get collectionItem;

  @override
  PmCollectionFieldOfMessageOfType<M, F, V> get pmFld;

  @override
  PrxCollectionFieldOfMessageOfType<M, F> prx(PrxOfMessage<M> messageVar) =>
      mk.PrxCollectionFieldOfMessageOfType.fromPrxCollectionFieldOfType(
        prxCollectionFieldOfType:
            mk.PrxCollectionFieldOfType.fromField<M, F, V>(
          rxVar: messageVar.toImpl,
          field: pmFld,
        ),
      );

  PrxSingleOfType$Impl<V> item(
    PrxCollectionFieldOfMessageOfType<M, F> collectionVar,
    K key,
  );

  Widget singleLabelWidget(
    K id,
    PrxOfType<V> prx,
  ) =>
      collectionItem.singleLabelWidget(id, prx);
}

@Impl()
abstract class CrdtCollectionItem<I, V> {
  TileConfig tileConfig(
    I id,
    PrxOfType<V> prx,
  );

  Widget singleLabelWidget(
    I id,
    PrxOfType<V> prx,
  );

  void onTap(
    BuildContext context,
    PrxSingleOfType<V> prx,
  );

  V createNewItem(I id);
}

extension CrdtCollectionItemX on CrdtCollectionItem$Factory {
  CrdtCollectionItem$Impl<I, V> from<I, V>(CrdFld crd) =>
      crd.fld.valueType.when(
        messageType: (messageType) => messageType.payload.pmMsg.type$(
          <TM extends GeneratedMessage>() {
            final pmMsg = messageType.payload.pmMsg as PmMessageOfType<TM>;
            final crdtMsg = crd.crud.resolveCrdtMsg(pmMsg);

            return fromMessage<I, TM>(crdtMsg).cast();
          },
        ),
      );

  CrdtCollectionItem$Impl<I, V> fromMessage<I, V extends GeneratedMessage>(
    CrdtMsg<V> crd,
  ) {
    return create(
      tileConfig: crd.tileConfig,
      singleLabelWidget: crd.singleLabelWidget,
      onTap: (context, prx) => crd.showCrudPage(
        context: context,
        rxVar: prx as PrxOfMessage<V>,
      ),
      createNewItem: (id) => crd.emptyMessage,
    );
  }
}
