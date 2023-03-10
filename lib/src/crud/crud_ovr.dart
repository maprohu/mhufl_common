import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/src/crud/crud_control.dart';
import 'package:protobuf/protobuf.dart';

import 'crud.dart';
import 'crud_field.dart';
import 'crud_message.dart';
import 'field/crdt.dart';
import 'field/map.dart';

part 'crud_ovr.g.dart';

typedef FieldTileWidgetProvider<M extends GeneratedMessage, F> = Widget
    Function(
  CrdtFld<M, F> fld,
  PrxFieldOfMessageOfType<M, F> prx,
);

typedef MessageTileConfigProvider<M extends GeneratedMessage> = TileConfig
    Function<I>(
  CrdtMsg<M> msg,
  I id,
  RxVal<Opt<M>> prx,
);

typedef MessageWidgetProvider<M extends GeneratedMessage> = Widget Function<I>(
  CrdtMsg<M> msg,
  I id,
  RxVal<Opt<M>> prx,
);

typedef FieldTileConfigProvider<M extends GeneratedMessage, F> = TileConfig
    Function<I>(
  CrdtFld<M, F> fld,
  I id,
  PrxOfType<F> prx,
);

typedef MessageStringDisplay<M extends GeneratedMessage> = String Function<I>(
    CrdtMsg<M> msg, I id, M value);

typedef GlobalIndexLookup<T> = T Function(int globalIndex);

typedef ForeignKey<M extends GeneratedMessage, K, FM extends GeneratedMessage>
    = PrxOfMessage<FM> Function(
  CrdtFld<M, K> fld,
  PrxOfMessage<M> messagePrx,
);

/// [ICrfnCrud]
@Impl.data()
abstract class CrfnCrud {
  GlobalIndexLookup<CrfnFld> get field;

  GlobalIndexLookup<CrfnMsg> get message;
}

@Impl.data()
abstract class CrfnMsg<M extends GeneratedMessage> {
  MessageStringDisplay<M> get displayString;

  MessageStringDisplay<M> get displayTitleString;

  MessageStringDisplay<M>? get displaySubtitleString;

  MessageTileConfigProvider<M> get tileConfig;

  MessageWidgetProvider<M> get singleLabelWidget;
}

/// [ICrfnFld]
@Impl.data()
abstract class CrfnFld<M extends GeneratedMessage, F> {
  FieldTileWidgetProvider<M, F> get tileWidget;

  FieldTileConfigProvider<M, F> get tileConfig;

  CrfnForeignKeyFld<M, F, dynamic, dynamic, dynamic>? get foreignKey;
}

@Impl.data()
abstract class CrfnForeignKeyFld<M extends GeneratedMessage, K,
    FM extends GeneratedMessage, FC, FV> {
  ForeignKey<M, K, FM> get foreignKey;

  PmCollectionFieldOfMessageOfType<FM, FC, FV> get field;

  R types<R>(R Function<TFM extends GeneratedMessage, TFC, TFV>() fn) =>
      fn<FM, FC, FV>();
}

extension CrdOvrStringX on String {
  String orId<I>(I id) => orIfEmpty(() => id.toString().paren);
}

extension CrfnFldX on CrfnFld {
  CrfnFld<M, F> castCrfn<M extends GeneratedMessage, F>() => cast();
}

extension CrfnMsgX on CrfnMsg {
  CrfnMsg<M> castCrfn<M extends GeneratedMessage>() => cast();
}
