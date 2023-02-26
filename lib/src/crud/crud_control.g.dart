// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud_control.dart';

// **************************************************************************
// ImplGenerator
// **************************************************************************

class TileConfig$Data {
  final Widget? Function() title;
  final Widget? Function() subtitle;
  TileConfig$Data({
    required this.title,
    required this.subtitle,
  });
}

class TileConfig$Impl extends TileConfig {
  final TileConfig$Data _data;
  TileConfig$Impl(this._data);
  Widget? get title => _data.title();
  Widget? get subtitle => _data.subtitle();
}

class TileConfig$Delegate extends TileConfig {
  final TileConfig Function() _delegate;
  TileConfig$Delegate(this._delegate);
  Widget? get title => _delegate().title;
  Widget? get subtitle => _delegate().subtitle;
}

class TileConfig$Factory {
  const TileConfig$Factory();
  TileConfig call({
    required Widget? Function() title,
    required Widget? Function() subtitle,
  }) =>
      TileConfig$Impl(
        TileConfig$Data(
          title: title,
          subtitle: subtitle,
        ),
      );
  TileConfig create({
    required Widget? Function() title,
    required Widget? Function() subtitle,
  }) =>
      TileConfig$Impl(
        TileConfig$Data(
          title: title,
          subtitle: subtitle,
        ),
      );
  TileConfig data({
    Widget? title,
    Widget? subtitle,
  }) =>
      TileConfig$Impl(
        TileConfig$Data(
          title: title.asConstant(),
          subtitle: subtitle.asConstant(),
        ),
      );
  TileConfig delegate(
    TileConfig Function() delegate,
  ) =>
      TileConfig$Delegate(
        delegate,
      );
}

const tileConfig$Factory = TileConfig$Factory();

extension TileConfig$Ext$Mk on Mk {
  TileConfig$Factory get TileConfig => tileConfig$Factory;
}

class CrudListPageControl$Data<V> {
  final TileConfig Function(int index, V item) tile;
  final void Function(BuildContext context, int index) onTap;
  final V Function() create;
  final PrxCollectionBase<List<V>> Function() items;
  CrudListPageControl$Data({
    required this.tile,
    required this.onTap,
    required this.create,
    required this.items,
  });
}

class CrudListPageControl$Impl<V> extends CrudListPageControl<V> {
  final CrudListPageControl$Data<V> _data;
  CrudListPageControl$Impl(this._data);
  TileConfig tile(int index, V item) => _data.tile(index, item);
  void onTap(BuildContext context, int index) => _data.onTap(context, index);
  V create() => _data.create();
  PrxCollectionBase<List<V>> get items => _data.items();
}

class CrudListPageControl$Delegate<V> extends CrudListPageControl<V> {
  final CrudListPageControl<V> Function() _delegate;
  CrudListPageControl$Delegate(this._delegate);
  TileConfig tile(int index, V item) => _delegate().tile(index, item);
  void onTap(BuildContext context, int index) =>
      _delegate().onTap(context, index);
  V create() => _delegate().create();
  PrxCollectionBase<List<V>> get items => _delegate().items;
}

class CrudListPageControl$Factory {
  const CrudListPageControl$Factory();
  CrudListPageControl<V> call<V>({
    required TileConfig Function(int index, V item) tile,
    required void Function(BuildContext context, int index) onTap,
    required V Function() create,
    required PrxCollectionBase<List<V>> Function() items,
  }) =>
      CrudListPageControl$Impl(
        CrudListPageControl$Data(
          tile: tile,
          onTap: onTap,
          create: create,
          items: items,
        ),
      );
  CrudListPageControl<V> create<V>({
    required TileConfig Function(int index, V item) tile,
    required void Function(BuildContext context, int index) onTap,
    required V Function() create,
    required PrxCollectionBase<List<V>> Function() items,
  }) =>
      CrudListPageControl$Impl(
        CrudListPageControl$Data(
          tile: tile,
          onTap: onTap,
          create: create,
          items: items,
        ),
      );
  CrudListPageControl<V> data<V>({
    required TileConfig Function(int index, V item) tile,
    required void Function(BuildContext context, int index) onTap,
    required V Function() create,
    required PrxCollectionBase<List<V>> items,
  }) =>
      CrudListPageControl$Impl(
        CrudListPageControl$Data(
          tile: tile,
          onTap: onTap,
          create: create,
          items: items.asConstant(),
        ),
      );
  CrudListPageControl<V> delegate<V>(
    CrudListPageControl<V> Function() delegate,
  ) =>
      CrudListPageControl$Delegate(
        delegate,
      );
}

const crudListPageControl$Factory = CrudListPageControl$Factory();

extension CrudListPageControl$Ext$Mk on Mk {
  CrudListPageControl$Factory get CrudListPageControl =>
      crudListPageControl$Factory;
}
