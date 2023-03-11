import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:protobuf/protobuf.dart';

import 'collection.dart';

part 'crdt.g.dart';

@Impl.data()
abstract class CrdtFld<M extends GeneratedMessage, F> {
  CrdFld get crd;

  late final fld = crd.fld;
  late final crud = crd.crud;
  late final label = crd.label;
  late final name = crd.name;

  static createDefaultCrfn<M extends GeneratedMessage, F>() =>
      mk.CrfnFld.create<M, F>(
        tileWidget: (fld, prx) => fld.defaultTileWidget(prx),
        tileConfig: <I>(fld, id, prx) => fld.defaultTileConfig(id, prx),
      );

  late final crfn = crud.crfn.field.call(fld.globalIndex) as CrfnFld<M, F>;

  Widget defaultTileWidget(PrxFieldOfMessageOfType<M, F> prx) => throw this;

  TileConfig defaultTileConfig<I>(
    I id,
    PrxOfType<F> prx,
  ) =>
      mk.TileConfig.create(
        title: defaultTileConfigTitle(id, prx),
        subtitle: defaultTileConfigSubtitle(id, prx),
      );

  Widget defaultTileConfigTitle<I>(
    I id,
    PrxOfType<F> prx,
  ) =>
      throw this;

  Widget? defaultTileConfigSubtitle<I>(
    I id,
    PrxOfType<F> prx,
  ) =>
      throw this;



  Widget fieldTileWidget(PrxField prx) => tileWidget(prx as PrxFieldOfMessageOfType<M, F> );

  Widget tileWidget(PrxFieldOfMessageOfType<M, F> prx) => crfn.tileWidget(this, prx);

  F ensure(M message) => throw [this, message];

  Widget tileWidgetFromMessageVar(PrxOfMessage<M> messageVar) =>
      tileWidget(prx(messageVar));

  PrxFieldOfMessageOfType<M, F> prx(PrxOfMessage<M> messageVar);

  ListTile listTileWithFieldLabelTitle(Override<ListTile$Conf> ovr) =>
      ListTile$Conf(
        title: Text(label),
      ).let(ovr).create$();

}

abstract class CrdtFldRead<M extends GeneratedMessage, F>
    extends CrdtFld<M, F> {
  PmReadField<M, F> get pmFld;
}

abstract class CrdtFldFull<M extends GeneratedMessage, F>
    extends CrdtFldRead<M, F> {
  @override
  PmFullFieldOfMessageOfType<M, F> get pmFld;

  @override
  PrxSingleFieldOfMessageOfType<M, F> prx(PrxOfMessage<M> messageVar) =>
      mk.PrxSingleFieldOfMessageOfType.fromPrxVarOfType(
        prxVarOfType: mk.PrxVarOfType.prxSingleFromField<M, F>(
          rxVar: messageVar.toImpl,
          field: pmFld,
          defaultValue: messageVar.asImpl().defaultValue.asConstant(),
        ),
        parent: mk.PrxParentForFieldValueOfMessageOfType.create<M, F>(
          message: messageVar.toImpl,
          field: pmFld,
        ).asConstant(),
        field: pmFld.asConstant(),
      );
}
