import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:select_dialog/select_dialog.dart';

import 'crud_field.dart';
import 'crud_message.dart';
import 'crud_props.dart';

part 'crud.g.dart';

class CrdKey<T> extends KeyOf<IRxVar<Opt<T>>> {
  const CrdKey();
}

/// [ICrud]
@Impl.data()
abstract class Crud {
  PmLib get lib;

  CrfnCrud get crfn;

  static final defaultCrfn = mk.CrfnCrud.create(
    message: CrdMsg.defaultCrfn.asConstant1(),
    field: CrdFld.defaultCrfn.asConstant1(),
  );

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

  late final Cache<HasFieldPath, CrdFld> resolveField = Cache(
    (field) => resolveMessage(field.message).msg.fields[field.index].payload,
  );

  CrxSingleField$Impl<T> crxSingle<T>(IPrxSingleOfType<T, dynamic> prx) =>
      mk.CrxSingleField.fromPrxSingleBase(
        prxSingleBase: prx,
        crd: resolveField.get(prx.field()).asConstant(),
      );

  CrxCollectionField$Impl<T> crxCollection<T>(IPrxCollection<T, dynamic> prx) =>
      mk.CrxCollectionField.fromPrxCollectionBase(
        prxCollectionBase: prx,
        crd: resolveField.get(prx.field()).asConstant(),
      );
}

extension ICrudX on ICrud {
  Crud$Impl override(CrfnCrud Function(CrfnCrud crfn) ovr) => copyWith(
        crfn: ovr(crfn),
      );
}

extension CrudFactoryX on Crud$Factory {
  Crud fromLib(PmLib lib, [Override<CrfnCrud>? crfn]) => create(
        lib: lib,
        crfn: Crud.defaultCrfn,
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
