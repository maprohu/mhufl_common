import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/src/crud/crud_control.dart';

import 'crud.dart';
import 'crud_field.dart';
import 'crud_message.dart';

part 'crud_ovr.g.dart';

typedef FieldTileWidgetProvider = Widget Function<T>(
  CrdFld fld,
  IPrxBase<T> prx,
);

typedef MessageTileConfigProvider = TileConfig Function<I, T>(
  CrdMsg msg,
  I id,
  IRxVar<Opt<T>> prx,
);

typedef FieldTileConfigProvider = TileConfig Function<I, T>(
  CrdFld fld,
  I id,
  IPrxBase<T> prx,
);

typedef MessageStringDisplay = String Function<I, T>(CrdMsg msg, I id, T value);

typedef GlobalIndexLookup<T> = T Function(int globalIndex);

typedef ForeignKey = IPrxCollectionBase<Map<K, V>> Function<K, V>(
    CrdFld fld, IPrxBase<K> prx);

/// [ICrfnCrud]
@Impl.data()
abstract class CrfnCrud {
  GlobalIndexLookup<CrfnFld> get field;

  GlobalIndexLookup<CrfnMsg> get message;

}

/// [ICrfnFld]
@Impl.data()
abstract class CrfnFld {
  FieldTileWidgetProvider get tileWidget;

  FieldTileConfigProvider get tileConfig;
}

@Impl.data()
abstract class CrfnMsg {
  MessageStringDisplay get displayString;

  MessageStringDisplay get displayTitleString;

  MessageStringDisplay? get displaySubtitleString;

  MessageTileConfigProvider get tileConfig;
}

@Impl.data()
abstract class CrfnMapKeyFld implements CrfnFld {
  ForeignKey? get foreignKey;
}

extension CrdOvrStringX on String {
  String orId<I>(I id) => orIfEmpty(() => id.toString().paren);
}
