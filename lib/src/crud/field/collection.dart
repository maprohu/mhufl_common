import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:protobuf/protobuf.dart';

import '../crud_control.dart';
import '../crud_field.dart';
import '../crud_message.dart';
import 'crdt.dart';

part 'collection.g.dart';

abstract class CrdtFldCollection<M extends GeneratedMessage, F, I, V>
    extends CrdtFldRead<M, F> {
  CrdtCollectionItem<I, V> get collectionItem;

  IPrxOfType<F> prx(IRxVarDefault<M> messageVar) =>
      mk.PrxCollectionOfType.fromFieldRebuilder<M, F>(
        rxVar: messageVar,
        field: pmFld,
        rebuild: castProtoRebuilder,
      );
}

@Impl()
abstract class CrdtCollectionItem<I, V> {
  TileConfig tileConfig(
    I id,
    IPrxOfType<V> prx,
  );

  void onTap(
    BuildContext context,
    IPrxSingleOfType<V> prx,
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
      onTap: (context, prx) => crd.showCrudPage(
        context: context,
        rxVar: prx,
      ),
      createNewItem: (id) => crd.emptyMessage,
    );
  }

}
