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

  late final defaultCrfn = createDefaultCrfn<M, F>();

  late final crfn = crud.crfn.field.call(fld.globalIndex) as CrfnFld<M, F>;

  Widget defaultTileWidget(IPrxOfType<F> prx) => throw this;

  TileConfig defaultTileConfig<I>(
    I id,
    IPrxOfType<F> prx,
  ) =>
      mk.TileConfig.create(
        title: defaultTileConfigTitle(id, prx),
        subtitle: defaultTileConfigSubtitle(id, prx),
      );

  Widget? defaultTileConfigTitle<I>(
    I id,
    IPrxOfType<F> prx,
  ) =>
      throw this;

  Widget? defaultTileConfigSubtitle<I>(
    I id,
    IPrxOfType<F> prx,
  ) =>
      throw this;

  Widget fieldTileWidget(PrxField prx) => tileWidget(prx as IPrxOfType<F>);

  Widget tileWidget(IPrxOfType<F> prx) => crfn.tileWidget(this, prx);

  F ensure(M message) => throw [this, message];

  Widget tileWidgetFromVar(IRxVarDefault<M> messageVar) =>
      tileWidget(prx(messageVar));

  IPrxOfType<F> prx(IRxVarDefault<M> messageVar);

  ListTile listTileWithFieldLabelTitle(Override<ListTile$Conf> ovr) =>
      ListTile$Conf().let(ovr).create();

}

abstract class CrdtFldRead<M extends GeneratedMessage, F>
    extends CrdtFld<M, F> {
  PmReadField<M, F> get pmFld;
}

abstract class CrdtFldFull<M extends GeneratedMessage, F>
    extends CrdtFldRead<M, F> {
  @override
  PmFullField<M, F> get pmFld;

  PrxSingleOfType$Impl<F> prx(IRxVarDefault<M> messageVar) =>
      mk.PrxSingleOfType.fromFieldRebuilder<M, F>(
        rxVar: messageVar,
        field: pmFld,
        rebuild: castProtoRebuilder,
      );
}

