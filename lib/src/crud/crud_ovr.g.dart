// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud_ovr.dart';

// **************************************************************************
// ImplGenerator
// **************************************************************************

abstract class CrudOverrides$IData {
  FldOverrides? Function(int)? get field;
}

class CrudOverrides$Data implements CrudOverrides$IData {
  CrudOverrides$Data({
    this.field,
  });
  final FldOverrides? Function(int)? field;
}

extension CrudOverrides$Data$Ext on CrudOverrides$Data {
  CrudOverrides$Data copyWith({
    FldOverrides? Function(int)? field,
  }) =>
      CrudOverrides$Data(
        field: field ?? this.field,
      );
  CrudOverrides$Data copyWithOpt({
    Opt<FldOverrides? Function(int)>? field,
  }) =>
      CrudOverrides$Data(
        field: field == null ? this.field : field.orNullLenient,
      );
}

class CrudOverrides$Impl extends CrudOverrides
    implements HasData<CrudOverrides$IData> {
  final CrudOverrides$IData data$;
  CrudOverrides$Impl(this.data$);
  FldOverrides? Function(int)? get field => data$.field;
}

typedef ICrudOverrides = HasData<CrudOverrides$IData>;

extension ICrudOverrides$Ext on ICrudOverrides {
  FldOverrides? Function(int)? get field => data$.field;
}

class CrudOverrides$Delegate extends CrudOverrides {
  final CrudOverrides Function() _delegate;
  CrudOverrides$Delegate(this._delegate);
  FldOverrides? Function(int)? get field => _delegate().field;
}

class CrudOverrides$Factory {
  const CrudOverrides$Factory();
  CrudOverrides$Impl call({
    FldOverrides? Function(int)? field,
  }) =>
      CrudOverrides$Impl(
        CrudOverrides$Data(
          field: field,
        ),
      );
  CrudOverrides$Impl create({
    FldOverrides? Function(int)? field,
  }) =>
      CrudOverrides$Impl(
        CrudOverrides$Data(
          field: field,
        ),
      );
  CrudOverrides$Impl data({
    FldOverrides? Function(int)? field,
  }) =>
      CrudOverrides$Impl(
        CrudOverrides$Data(
          field: field,
        ),
      );
  CrudOverrides delegate(
    CrudOverrides Function() delegate,
  ) =>
      CrudOverrides$Delegate(
        delegate,
      );
}

const crudOverrides$Factory = CrudOverrides$Factory();

extension CrudOverrides$Ext$Mk on Mk {
  CrudOverrides$Factory get CrudOverrides => crudOverrides$Factory;
}

abstract class FldOverrides$IData {
  Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? get tile;
}

class FldOverrides$Data implements FldOverrides$IData {
  FldOverrides$Data({
    this.tile,
  });
  final Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? tile;
}

extension FldOverrides$Data$Ext on FldOverrides$Data {
  FldOverrides$Data copyWith({
    Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? tile,
  }) =>
      FldOverrides$Data(
        tile: tile ?? this.tile,
      );
  FldOverrides$Data copyWithOpt({
    Opt<Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)>? tile,
  }) =>
      FldOverrides$Data(
        tile: tile == null ? this.tile : tile.orNullLenient,
      );
}

class FldOverrides$Impl extends FldOverrides
    implements HasData<FldOverrides$IData> {
  final FldOverrides$IData data$;
  FldOverrides$Impl(this.data$);
  Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? get tile => data$.tile;
}

typedef IFldOverrides = HasData<FldOverrides$IData>;

extension IFldOverrides$Ext on IFldOverrides {
  Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? get tile => data$.tile;
}

class FldOverrides$Delegate extends FldOverrides {
  final FldOverrides Function() _delegate;
  FldOverrides$Delegate(this._delegate);
  Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? get tile =>
      _delegate().tile;
}

class FldOverrides$Factory {
  const FldOverrides$Factory();
  FldOverrides$Impl call({
    Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? tile,
  }) =>
      FldOverrides$Impl(
        FldOverrides$Data(
          tile: tile,
        ),
      );
  FldOverrides$Impl create({
    Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? tile,
  }) =>
      FldOverrides$Impl(
        FldOverrides$Data(
          tile: tile,
        ),
      );
  FldOverrides$Impl data({
    Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? tile,
  }) =>
      FldOverrides$Impl(
        FldOverrides$Data(
          tile: tile,
        ),
      );
  FldOverrides delegate(
    FldOverrides Function() delegate,
  ) =>
      FldOverrides$Delegate(
        delegate,
      );
}

const fldOverrides$Factory = FldOverrides$Factory();

extension FldOverrides$Ext$Mk on Mk {
  FldOverrides$Factory get FldOverrides => fldOverrides$Factory;
}

abstract class MapKeyFldOverrides$IData implements FldOverrides$IData {
  HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
      CrdFld, HasData<PrxBase$IData<dynamic>>)? get foreignKey;
  Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? get tile;
}

class MapKeyFldOverrides$Data implements MapKeyFldOverrides$IData {
  MapKeyFldOverrides$Data({
    this.foreignKey,
    this.tile,
  });
  final HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
      CrdFld, HasData<PrxBase$IData<dynamic>>)? foreignKey;
  final Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? tile;
}

extension MapKeyFldOverrides$Data$Ext on MapKeyFldOverrides$Data {
  MapKeyFldOverrides$Data copyWith({
    HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
            CrdFld, HasData<PrxBase$IData<dynamic>>)?
        foreignKey,
    Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? tile,
  }) =>
      MapKeyFldOverrides$Data(
        foreignKey: foreignKey ?? this.foreignKey,
        tile: tile ?? this.tile,
      );
  MapKeyFldOverrides$Data copyWithOpt({
    Opt<
            HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
                CrdFld, HasData<PrxBase$IData<dynamic>>)>?
        foreignKey,
    Opt<Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)>? tile,
  }) =>
      MapKeyFldOverrides$Data(
        foreignKey:
            foreignKey == null ? this.foreignKey : foreignKey.orNullLenient,
        tile: tile == null ? this.tile : tile.orNullLenient,
      );
}

class MapKeyFldOverrides$Impl extends MapKeyFldOverrides
    implements HasData<MapKeyFldOverrides$IData> {
  final MapKeyFldOverrides$IData data$;
  MapKeyFldOverrides$Impl(this.data$);
  HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
          CrdFld, HasData<PrxBase$IData<dynamic>>)?
      get foreignKey => data$.foreignKey;
  Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? get tile => data$.tile;
}

typedef IMapKeyFldOverrides = HasData<MapKeyFldOverrides$IData>;

extension IMapKeyFldOverrides$Ext on IMapKeyFldOverrides {
  FldOverrides$Impl get asFldOverrides => FldOverrides$Impl(data$);
  HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
          CrdFld, HasData<PrxBase$IData<dynamic>>)?
      get foreignKey => data$.foreignKey;
  Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? get tile => data$.tile;
}

class MapKeyFldOverrides$Delegate extends MapKeyFldOverrides {
  final MapKeyFldOverrides Function() _delegate;
  MapKeyFldOverrides$Delegate(this._delegate);
  HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
          CrdFld, HasData<PrxBase$IData<dynamic>>)?
      get foreignKey => _delegate().foreignKey;
  Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? get tile =>
      _delegate().tile;
}

class MapKeyFldOverrides$Factory {
  const MapKeyFldOverrides$Factory();
  MapKeyFldOverrides$Impl call({
    HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
            CrdFld, HasData<PrxBase$IData<dynamic>>)?
        foreignKey,
    Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? tile,
  }) =>
      MapKeyFldOverrides$Impl(
        MapKeyFldOverrides$Data(
          foreignKey: foreignKey,
          tile: tile,
        ),
      );
  MapKeyFldOverrides$Impl create({
    HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
            CrdFld, HasData<PrxBase$IData<dynamic>>)?
        foreignKey,
    Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? tile,
  }) =>
      MapKeyFldOverrides$Impl(
        MapKeyFldOverrides$Data(
          foreignKey: foreignKey,
          tile: tile,
        ),
      );
  MapKeyFldOverrides$Impl data({
    HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
            CrdFld, HasData<PrxBase$IData<dynamic>>)?
        foreignKey,
    Widget Function<T>(CrdFld, HasData<PrxBase$IData<T>>)? tile,
  }) =>
      MapKeyFldOverrides$Impl(
        MapKeyFldOverrides$Data(
          foreignKey: foreignKey,
          tile: tile,
        ),
      );
  MapKeyFldOverrides delegate(
    MapKeyFldOverrides Function() delegate,
  ) =>
      MapKeyFldOverrides$Delegate(
        delegate,
      );
  MapKeyFldOverrides$Impl fromFldOverrides$Iface({
    required FldOverrides fldOverrides,
    required HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
                CrdFld, HasData<PrxBase$IData<dynamic>>)?
            Function()
        foreignKey,
  }) =>
      create(
        tile: fldOverrides.tile,
        foreignKey: foreignKey,
      );
  MapKeyFldOverrides$Impl fromFldOverrides({
    required IFldOverrides fldOverrides,
    required HasData<PrxCollectionBase$IData<Map<dynamic, dynamic>>> Function(
                CrdFld, HasData<PrxBase$IData<dynamic>>)?
            Function()
        foreignKey,
  }) =>
      create(
        tile: fldOverrides.data$.tile,
        foreignKey: foreignKey,
      );
}

const mapKeyFldOverrides$Factory = MapKeyFldOverrides$Factory();

extension MapKeyFldOverrides$Ext$Mk on Mk {
  MapKeyFldOverrides$Factory get MapKeyFldOverrides =>
      mapKeyFldOverrides$Factory;
}
