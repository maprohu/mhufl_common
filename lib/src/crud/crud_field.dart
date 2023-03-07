import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:protobuf/protobuf.dart';

import 'crud_props.dart';
import 'crud_field_defaults.dart';
import 'field/crdt.dart';
import 'field/int_map.dart';
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
        messageType: (messageType) => pmFld.typeGeneratedMessage$(
          <F extends GeneratedMessage>() => mk.CrdtFldMessage.create<M, F>(
            crd: this,
            value: messageType.payload.crdt as CrdtMsg<F>,
          ),
        ),
        valueType: () => pmFld.type$(
          <F>() => mk.CrdtFldSingle.create<M, F>(crd: this),
        ),
      ),
      mapOf: (mapOf) => pmFld.singleType(
        <V>() => mapOf.key.valueType.when(
          stringType: () => mk.CrdtFldStringMap.create<M, V>(crd: this),
          intType: () => mk.CrdtFldIntMap.create<M, V>(crd: this),
        ),
      ),
      repeated: () => pmFld.singleType(
        <V>() => mk.CrdtFldRepeated.create<M, V>(crd: this),
      ),
    ),
  );

  late final defaultCrfn = crdt.defaultCrfn;

  Widget tileWidget(IPrxOfType prx) => crdt.tileWidget(prx);

// dynamic ensure(dynamic message) => crdt.ensure(message);

// TileConfig tileConfig<I, T>(I id, IPrxOfType<T> prx) =>
//     crfn.tileConfig(this, id, prx);

// late final String Function<I, T>(I id, T value) singleItemDisplayString =
//     fld.singleValueType.when(
//   messageType: (msg) =>
//       <I, T>(id, value) => msg.payload.displayTitleString(id, value),
// );
//
// late final String Function<I, T>(I id, T value)? singleItemDisplaySubString =
//     fld.singleValueType.when(
//   messageType: (msg) => msg.payload.crfn.displaySubtitleString?.let(
//     (sub) => <I, T>(id, value) => sub(msg.payload, id, value),
//   ),
//   valueType: () => null,
// );
//
// late final void Function<V>(BuildContext context, RxVarImplOpt<V> rxVar)
//     singleItemTap = fld.singleValueType.when(
//   messageType: (messageType) =>
//       <V>(context, rxVar) => messageType.payload.showCrudPage(
//             context: context,
//             rxVar: rxVar,
//             actionsBar: NullWidget(),
//           ),
// );
}

@Impl()
abstract class CrxField<T> implements RxVal<Opt<T>>, PrxOfType<T> {
  CrdFld get crd;
}

extension ICrxFieldX<T> on ICrxField<T> {
  Widget crudTile() => crd.tileWidget(this);
}

@Impl()
abstract class CrxCollectionField<T>
    implements CrxField<T>, PrxCollectionOfType<T> {}

@Impl()
abstract class CrxSingleField<T> implements CrxField<T>, PrxSingleOfType<T> {}

extension CrxFieldX<T> on ICrxField<T> {
  String get name => crd.name;
}

extension CrxFieldStringX on ICrxSingleField<String> {
  Widget stringView() => StringViewProperty.scalar(this);
}

extension CrxSingleFieldBoolX on ICrxSingleField<bool> {
  CrudSwitch crudSwitch() =>
      orDefaultVar(false).crudSwitch(name.camelCaseToLabel);
}
