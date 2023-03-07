
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:protobuf/protobuf.dart';

part 'crdt.g.dart';

@Impl.data()
abstract class CrdtFld<M extends GeneratedMessage, F> {
  CrdFld get crd;

  late final fld = crd.fld;
  late final crud = crd.crud;
  late final label = crd.label;

  static createDefaultCrfn<M extends GeneratedMessage, F>() => mk.CrfnFld.create<M, F>(
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

  Widget tileWidget(IPrxOfType<F> prx) => crfn.tileWidget(this, prx);

  F ensure(M message) => throw [this, message];

  Widget tileWidgetFromVar(IRxVarDefault<M> messageVar) =>
      tileWidget(prx(messageVar));

  IPrxOfType<F> prx(IRxVarDefault<M> messageVar);
}

abstract class CrdtFldRead<M extends GeneratedMessage, F> extends CrdtFld<M, F> {
  PmReadField<M, F> get pmFld;
}

abstract class CrdtFldFull<M extends GeneratedMessage, F> extends CrdtFldRead<M, F> {
  @override
  PmFullField<M, F> get pmFld;

  IPrxOfType<F> prx(IRxVarDefault<M> messageVar) =>
      mk.PrxSingleOfType.fromFieldRebuilder<M, F>(
        rxVar: messageVar,
        field: pmFld,
        rebuild: castProtoRebuilder,
      );
}


@Impl.data()
abstract class CrdtFldMessage<M extends GeneratedMessage,
F extends GeneratedMessage> extends CrdtFldFull<M, F> {
  CrdtMsg<F> get value;

  @override
  late final PmMessageField<M, F> pmFld = crd.pmFld as PmMessageField<M, F>;

  @override
  F ensure(M message) => pmFld.ensure(message);
}

abstract class CrdtFldCollection<M extends GeneratedMessage, F> extends CrdtFldRead<M, F> {
  IPrxOfType<F> prx(IRxVarDefault<M> messageVar) =>
      mk.PrxCollectionOfType.fromFieldRebuilder<M, F>(
        rxVar: messageVar,
        field: pmFld,
        rebuild: castProtoRebuilder,
      );
}

@Impl.data()
abstract class CrdtFldMap<M extends GeneratedMessage, K, V>
    extends CrdtFldCollection<M, Map<K, V>> {
  late final pmFld = crd.pmFld as PmMapField<M, K, V>;

  late final crfnMapKey = crfn.toMapKey<M, K, V>();

  late final IPrxCollectionOfType<Map>? Function(IPrxOfType<K> prx) foreignKey =
      crfnMapKey.foreignKey?.let(
            (fk) => (prx) => fk(this, prx),
      ) ??
          Functions.returnsNull1;
}


@Impl.data()
abstract class CrdtFldStringMap<M extends GeneratedMessage, V>
    extends CrdtFldMap<M, String, V> {}

@Impl.data()
abstract class CrdtFldRepeated<M extends GeneratedMessage, V>
    extends CrdtFldCollection<M, List<V>> {
  late final pmFld = crd.pmFld as PmRepeatedField<M, V>;
}
