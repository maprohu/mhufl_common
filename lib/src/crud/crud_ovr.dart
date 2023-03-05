import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';

import 'crud.dart';
import 'crud_field.dart';
part 'crud_ovr.g.dart';
typedef CrudFieldTileCustomizer = Widget Function<T>(
    CrdFld fld, IPrxBase<T> prx);


typedef MessageStringDisplay = String Function<T>(
    CrdFld fld, T msg);

typedef IdxOvr<T> = T? Function(int globalIndex)?;

typedef ForeignKey<K, V> = IPrxCollectionBase<Map<K, V>> Function(CrdFld fld, IPrxBase<K> prx);

@Impl.data()
abstract class CrudOverrides {
  IdxOvr<FldOverrides> get field;
}

@Impl.data()
abstract class FldOverrides {
  CrudFieldTileCustomizer? get tile;
}

@Impl.data()
abstract class MsgOverrides {
  MessageStringDisplay? get stringDisplay;
}

@Impl.data()
abstract class MapKeyFldOverrides implements FldOverrides {
  ForeignKey? get foreignKey;
}