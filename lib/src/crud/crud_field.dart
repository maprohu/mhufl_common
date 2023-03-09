import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:mhufl_common/src/crud/field/collection.dart';
import 'package:protobuf/protobuf.dart';

import 'field/crdt.dart';
import 'field/int_map.dart';
import 'field/map.dart';
import 'field/message.dart';
import 'field/repeated.dart';
import 'field/single_value.dart';

part 'crud_field.g.dart';

@Impl()
abstract class CrdFld extends CrdItem
    implements HasPdFld<CrdMsg, CrdFld, CrdEnum> {
  late final msg = fld.msg.payload;

  late final name = fld.name;
  late final label = name.camelCaseToLabel;

  late final pmFld = msg.pmMsg.fields$[fld.index];

  late final CrdtFld crdt = msg.pmMsg.type$(
    <M extends GeneratedMessage>() => fld.cardinality.when(
      single: () => fld.valueType.when(
        messageType: (messageType) => messageType.payload.pmMsg.type$(
          <F extends GeneratedMessage>() => mk.CrdtFldMessage.create<M, F>(
            crd: this,
            value: messageType.payload.crdt as CrdtMsg<F>,
          ),
        ),
        valueType: () => pmFld.type$(
          <F>() => mk.CrdtFldSingle.from<M, F>(this),
        ),
      ),
      mapOf: (mapOf) => pmFld.singleType(
        <V>() => mapOf.key.valueType.when(
          stringType: () => mk.CrdtFldStringMap.create<M, V>(
              crd: this,
              collectionItem: mk.CrdtCollectionItem.from<String, V>(this)),
          intType: () => mk.CrdtFldIntMap.create<M, V>(
              crd: this,
              collectionItem: mk.CrdtCollectionItem.from<int, V>(this)),
        ),
      ),
      repeated: () => pmFld.singleType(
        <V>() => mk.CrdtFldRepeated.create<M, V>(
            crd: this,
            collectionItem: mk.CrdtCollectionItem.from<int, V>(this)),
      ),
    ),
  );

  late final CrfnFld defaultCrfn = pmFld.messageFieldType(
    <M extends GeneratedMessage, F>() => CrdtFld.createDefaultCrfn<M, F>(),
  );

  Widget tileWidget(IPrxOfType prx) => crdt.tileWidget(prx);

  late final crfn = crud.crfn.field(pmFld.globalIndex);
}
