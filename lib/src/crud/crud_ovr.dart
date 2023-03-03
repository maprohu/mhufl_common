import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';

import 'crud.dart';
part 'crud_ovr.g.dart';
typedef CrudFieldTileCustomizer = Widget Function<T>(
    CrdFld fld, IPrxBase<T> prx);

typedef FldOvr<T> = T? Function(int globalFieldIndex)?;

typedef ForeignKey<K, V> = IPrxCollectionBase<Map<K, V>> Function(CrdFld fld, IPrxBase<K> prx);

@Impl.data()
abstract class CrudOverrides {
  FldOvr<FldOverrides> get field;
}

@Impl.data()
abstract class FldOverrides {
  CrudFieldTileCustomizer? get tile;
}

@Impl.data()
abstract class MapKeyFldOverrides implements FldOverrides {
  ForeignKey? get foreignKey;
}