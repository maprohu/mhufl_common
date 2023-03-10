import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:protobuf/protobuf.dart';
import 'package:select_dialog/select_dialog.dart';

import 'crud_field.dart';
import 'crud_message.dart';
import 'crud_props.dart';
import 'field/crdt.dart';

part 'crud.g.dart';

class CrdKey<T extends GeneratedMessage> extends KeyOf<IPrxMessageOfType<T>> {
  const CrdKey();
}

/// [ICrud]
@Impl.data()
abstract class Crud {
  PmLib get lib;

  CrfnCrud Function(Crud self) get crfnProvider;

  late final root = mk.PdRoot.create<CrdMsg, CrdFld, CrdEnum>(
    descriptorSet: FileDescriptorSet.fromJson(lib.descriptor).asConstant(),
    msgPayload: (msg) =>
        mk.CrdMsg.create(crud: asConstant(), msg: msg.asConstant()),
    fldPayload: (fld) => mk.CrdFld(crud: asConstant(), fld: fld.asConstant()),
    enumPayload: (enm) => mk.CrdEnum(crud: asConstant(), enm: enm.asConstant()),
  );

  late final Cache<HasMessagePath, CrdMsg> resolveMessage = Cache(
    (message) => root.resolveMessageIndex(message.path$).payload,
  );

  CrdtMsg<M> resolveCrdtMsg<M extends GeneratedMessage>(
    PmMessageOfType<M> message,
  ) =>
      resolveMessage(message).crdt as CrdtMsg<M>;

  CrdtFld<M, F> resolveCrdtFld<M extends GeneratedMessage, F>(
    PmFieldOfMessageOfType<M, F> message,
  ) =>
      resolveField(message).crdt as CrdtFld<M, F>;

  late final allMessages = lib.allMessages.toList(growable: false);
  late final allFields = lib.allFields.toList(growable: false);

  late final Cache<int, CrdMsg> messageByGlobalIndex = Cache(
    (index) => resolveMessage(allMessages[index]),
  );

  late final Cache<int, CrdFld> fieldByGlobalIndex = Cache(
    (index) => resolveField(allFields[index]),
  );

  late final Cache<HasFieldPath, CrdFld> resolveField = Cache(
    (field) => resolveMessage(field.message).msg.fields[field.index].payload,
  );

  late final CrfnCrud defaultCrfn = mk.CrfnCrud.create(
    message: (idx) => messageByGlobalIndex(idx).defaultCrfn,
    field: (idx) => fieldByGlobalIndex(idx).defaultCrfn,
  );

  late final crfn = crfnProvider(this);

  //
  // CrxMessage$Impl<M> crxMessage<M extends GeneratedMessage>(
  //         IPrxMessageOfType<M> prx) =>
  //     mk.CrxMessage.fromRxVar(
  //       rxVar: prx,
  //       crd: resolveCrdtMsg(prx.message()).asConstant(),
  //     );
  //
  // CrxSingleField$Impl<T> crxSingle<T>(IPrxSingleFieldOfType<T> prx) =>
  //     mk.CrxSingleField.fromPrxSingleOfType(
  //       prxSingleOfType: prx,
  //       crd: resolveField
  //           .get(prx.field())
  //           .crdt
  //           .cast<CrdtFld<dynamic, T>>()
  //           .asConstant(),
  //     );
  //
  // CrxCollectionField$Impl<T> crxCollection<T>(
  //         IPrxCollectionFieldOfType<T> prx) =>
  //     mk.CrxCollectionField.fromPrxCollectionOfType(
  //       prxCollectionOfType: prx,
  //       crd: resolveField
  //           .get(prx.field())
  //           .crdt
  //           .cast<CrdtFld<dynamic, T>>()
  //           .asConstant(),
  //     );

  Widget tileWidgetFor(Prx prx) => prx.whenPrx(
    prxMessage: (prxMessage) =>
            resolveMessage(prxMessage.message()).crdt.messageTileWidget(prxMessage),
        prxField: (prxField) =>
            resolveField(prxField.field()).crdt.fieldTileWidget(prxField),
      );
}

extension CrudX on Crud {
  Crud$Impl override(Override<CrfnCrud> ovr) => copyWith(
        crfnProvider: (crud) => ovr(crfn),
      );
}

extension CrudFactoryX on Crud$Factory {
  Crud fromLib(PmLib lib, [Override<CrfnCrud>? crfn]) => create(
        lib: lib,
        crfnProvider: (crud) => crud.defaultCrfn,
      ).let(
        (c) =>
            crfn?.let(
              (o) => c.override(crfn),
            ) ??
            c,
      );
}

abstract class CrdItem {
  Crud get crud;
}

@Impl()
abstract class CrdEnum extends CrdItem
    implements HasPdEnum<CrdMsg, CrdFld, CrdEnum> {
  late final PmEnum pmEnum = enm.parent.when(
    root: (root) => crud.lib.enums[enm.index],
    msg: (msg) => msg.payload.pmMsg.nestedEnums$[enm.index],
  );
}

extension MapFieldsX on MapFields<CrdMsg, CrdFld, CrdEnum> {
  R keyValueType<R>(R Function<K, V>() fn) => key.payload.pmFld.type$(
        <KT>() => value.payload.pmFld.type$(
          <VT>() => fn<KT, VT>(),
        ),
      );
}
