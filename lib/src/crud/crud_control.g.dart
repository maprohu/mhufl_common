// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud_control.dart';

// **************************************************************************
// ImplGenerator
// **************************************************************************

abstract class TileConfig$IData {
  Widget? Function() get title;
  Widget? Function() get subtitle;
}

class TileConfig$Data implements TileConfig$IData {
  TileConfig$Data({
    required this.title,
    required this.subtitle,
  });
  final Widget? Function() title;
  final Widget? Function() subtitle;
}

extension TileConfig$Data$Ext on TileConfig$Data {
  TileConfig$Data copyWith({
    Widget? Function()? title,
    Widget? Function()? subtitle,
  }) =>
      TileConfig$Data(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
      );
  TileConfig$Data copyWithOpt({
    Widget? Function()? title,
    Widget? Function()? subtitle,
  }) =>
      TileConfig$Data(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
      );
}

class TileConfig$Impl extends TileConfig implements HasData<TileConfig$IData> {
  final TileConfig$IData data$;
  TileConfig$Impl(this.data$);
  Widget? get title => data$.title();
  Widget? get subtitle => data$.subtitle();
}

typedef ITileConfig = HasData<TileConfig$IData>;

extension ITileConfig$Ext on ITileConfig {
  Widget? get title => data$.title();
  Widget? get subtitle => data$.subtitle();
}

class TileConfig$Delegate extends TileConfig {
  final TileConfig Function() _delegate;
  TileConfig$Delegate(this._delegate);
  Widget? get title => _delegate().title;
  Widget? get subtitle => _delegate().subtitle;
}

class TileConfig$Factory {
  const TileConfig$Factory();
  TileConfig$Impl call({
    required Widget? Function() title,
    required Widget? Function() subtitle,
  }) =>
      TileConfig$Impl(
        TileConfig$Data(
          title: title,
          subtitle: subtitle,
        ),
      );
  TileConfig$Impl create({
    required Widget? Function() title,
    required Widget? Function() subtitle,
  }) =>
      TileConfig$Impl(
        TileConfig$Data(
          title: title,
          subtitle: subtitle,
        ),
      );
  TileConfig$Impl data({
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

abstract class CrudListPageControl$IData<V> {
  TileConfig Function(
    int index,
    V item,
  ) get tile;
  void Function(
    BuildContext context,
    int index,
  ) get onTap;
  V Function() get create;
  HasData<PrxCollectionBase$IData<List<V>>> Function() get items;
}

class CrudListPageControl$Data<V> implements CrudListPageControl$IData<V> {
  CrudListPageControl$Data({
    required this.tile,
    required this.onTap,
    required this.create,
    required this.items,
  });
  final TileConfig Function(
    int index,
    V item,
  ) tile;
  final void Function(
    BuildContext context,
    int index,
  ) onTap;
  final V Function() create;
  final HasData<PrxCollectionBase$IData<List<V>>> Function() items;
}

extension CrudListPageControl$Data$Ext<V> on CrudListPageControl$Data<V> {
  CrudListPageControl$Data<V> copyWith({
    TileConfig Function(
      int index,
      V item,
    )?
        tile,
    void Function(
      BuildContext context,
      int index,
    )?
        onTap,
    V Function()? create,
    HasData<PrxCollectionBase$IData<List<V>>> Function()? items,
  }) =>
      CrudListPageControl$Data(
        tile: tile ?? this.tile,
        onTap: onTap ?? this.onTap,
        create: create ?? this.create,
        items: items ?? this.items,
      );
  CrudListPageControl$Data<V> copyWithOpt({
    TileConfig Function(
      int index,
      V item,
    )?
        tile,
    void Function(
      BuildContext context,
      int index,
    )?
        onTap,
    V Function()? create,
    HasData<PrxCollectionBase$IData<List<V>>> Function()? items,
  }) =>
      CrudListPageControl$Data(
        tile: tile ?? this.tile,
        onTap: onTap ?? this.onTap,
        create: create ?? this.create,
        items: items ?? this.items,
      );
}

class CrudListPageControl$Impl<V> extends CrudListPageControl<V>
    implements HasData<CrudListPageControl$IData<V>> {
  final CrudListPageControl$IData<V> data$;
  CrudListPageControl$Impl(this.data$);
  TileConfig tile(
    int index,
    V item,
  ) =>
      data$.tile(index, item);
  void onTap(
    BuildContext context,
    int index,
  ) =>
      data$.onTap(context, index);
  V create() => data$.create();
  HasData<PrxCollectionBase$IData<List<V>>> get items => data$.items();
}

typedef ICrudListPageControl<V> = HasData<CrudListPageControl$IData<V>>;

extension ICrudListPageControl$Ext<V> on ICrudListPageControl<V> {
  TileConfig tile(
    int index,
    V item,
  ) =>
      data$.tile(index, item);
  void onTap(
    BuildContext context,
    int index,
  ) =>
      data$.onTap(context, index);
  V create() => data$.create();
  HasData<PrxCollectionBase$IData<List<V>>> get items => data$.items();
}

class CrudListPageControl$Delegate<V> extends CrudListPageControl<V> {
  final CrudListPageControl<V> Function() _delegate;
  CrudListPageControl$Delegate(this._delegate);
  TileConfig tile(
    int index,
    V item,
  ) =>
      _delegate().tile(index, item);
  void onTap(
    BuildContext context,
    int index,
  ) =>
      _delegate().onTap(context, index);
  V create() => _delegate().create();
  HasData<PrxCollectionBase$IData<List<V>>> get items => _delegate().items;
}

class CrudListPageControl$Factory {
  const CrudListPageControl$Factory();
  CrudListPageControl$Impl<V> call<V>({
    required TileConfig Function(
      int index,
      V item,
    )
        tile,
    required void Function(
      BuildContext context,
      int index,
    )
        onTap,
    required V Function() create,
    required HasData<PrxCollectionBase$IData<List<V>>> Function() items,
  }) =>
      CrudListPageControl$Impl(
        CrudListPageControl$Data(
          tile: tile,
          onTap: onTap,
          create: create,
          items: items,
        ),
      );
  CrudListPageControl$Impl<V> create<V>({
    required TileConfig Function(
      int index,
      V item,
    )
        tile,
    required void Function(
      BuildContext context,
      int index,
    )
        onTap,
    required V Function() create,
    required HasData<PrxCollectionBase$IData<List<V>>> Function() items,
  }) =>
      CrudListPageControl$Impl(
        CrudListPageControl$Data(
          tile: tile,
          onTap: onTap,
          create: create,
          items: items,
        ),
      );
  CrudListPageControl$Impl<V> data<V>({
    required TileConfig Function(
      int index,
      V item,
    )
        tile,
    required void Function(
      BuildContext context,
      int index,
    )
        onTap,
    required V Function() create,
    required HasData<PrxCollectionBase$IData<List<V>>> items,
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
