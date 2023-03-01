// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud_widgets.dart';

// **************************************************************************
// ImplGenerator
// **************************************************************************

abstract class CrudSwitch$IData {
  HasData<RxVar$IData<bool>> Function() get rxVar;
  String Function() get label;
}

class CrudSwitch$Data implements CrudSwitch$IData {
  CrudSwitch$Data({
    required this.rxVar,
    required this.label,
  });
  final HasData<RxVar$IData<bool>> Function() rxVar;
  final String Function() label;
  CrudSwitch$Data copyWith({
    HasData<RxVar$IData<bool>> Function()? rxVar,
    String Function()? label,
  }) =>
      CrudSwitch$Data(
        rxVar: rxVar ?? this.rxVar,
        label: label ?? this.label,
      );
  CrudSwitch$Data copyWithOpt({
    HasData<RxVar$IData<bool>> Function()? rxVar,
    String Function()? label,
  }) =>
      CrudSwitch$Data(
        rxVar: rxVar ?? this.rxVar,
        label: label ?? this.label,
      );
}

class CrudSwitch$Impl extends CrudSwitch implements HasData<CrudSwitch$IData> {
  final CrudSwitch$IData data$;
  const CrudSwitch$Impl(
    this.data$, {
    super.key,
  });
  HasData<RxVar$IData<bool>> get rxVar => data$.rxVar();
  String get label => data$.label();
}

typedef ICrudSwitch = HasData<CrudSwitch$IData>;

extension ICrudSwitch$Ext on ICrudSwitch {
  HasData<RxVar$IData<bool>> get rxVar => data$.rxVar();
  String get label => data$.label();
}

class CrudSwitch$Delegate extends CrudSwitch {
  final CrudSwitch Function() _delegate;
  const CrudSwitch$Delegate(
    this._delegate, {
    super.key,
  });
  HasData<RxVar$IData<bool>> get rxVar => _delegate().rxVar;
  String get label => _delegate().label;
}

class CrudSwitch$Factory {
  const CrudSwitch$Factory();
  CrudSwitch$Impl call({
    required HasData<RxVar$IData<bool>> Function() rxVar,
    required String Function() label,
    Key? key,
  }) =>
      CrudSwitch$Impl(
        CrudSwitch$Data(
          rxVar: rxVar,
          label: label,
        ),
        key: key,
      );
  CrudSwitch$Impl create({
    required HasData<RxVar$IData<bool>> Function() rxVar,
    required String Function() label,
    Key? key,
  }) =>
      CrudSwitch$Impl(
        CrudSwitch$Data(
          rxVar: rxVar,
          label: label,
        ),
        key: key,
      );
  CrudSwitch$Impl data({
    required HasData<RxVar$IData<bool>> rxVar,
    required String label,
    Key? key,
  }) =>
      CrudSwitch$Impl(
        CrudSwitch$Data(
          rxVar: rxVar.asConstant(),
          label: label.asConstant(),
        ),
        key: key,
      );
  CrudSwitch delegate(
    CrudSwitch Function() delegate, {
    Key? key,
  }) =>
      CrudSwitch$Delegate(
        delegate,
        key: key,
      );
}

const crudSwitch$Factory = CrudSwitch$Factory();

extension CrudSwitch$Ext$Mk on Mk {
  CrudSwitch$Factory get CrudSwitch => crudSwitch$Factory;
}

abstract class CrudButton$IData {
  String Function() get label;
  HasData<RxVal$IData<String>> Function() get subtitle;
  HasData<RxVal$IData<void Function(BuildContext)?>> Function() get onTap;
}

class CrudButton$Data implements CrudButton$IData {
  CrudButton$Data({
    required this.label,
    required this.subtitle,
    required this.onTap,
  });
  final String Function() label;
  final HasData<RxVal$IData<String>> Function() subtitle;
  final HasData<RxVal$IData<void Function(BuildContext)?>> Function() onTap;
  CrudButton$Data copyWith({
    String Function()? label,
    HasData<RxVal$IData<String>> Function()? subtitle,
    HasData<RxVal$IData<void Function(BuildContext)?>> Function()? onTap,
  }) =>
      CrudButton$Data(
        label: label ?? this.label,
        subtitle: subtitle ?? this.subtitle,
        onTap: onTap ?? this.onTap,
      );
  CrudButton$Data copyWithOpt({
    String Function()? label,
    HasData<RxVal$IData<String>> Function()? subtitle,
    HasData<RxVal$IData<void Function(BuildContext)?>> Function()? onTap,
  }) =>
      CrudButton$Data(
        label: label ?? this.label,
        subtitle: subtitle ?? this.subtitle,
        onTap: onTap ?? this.onTap,
      );
}

class CrudButton$Impl extends CrudButton implements HasData<CrudButton$IData> {
  final CrudButton$IData data$;
  const CrudButton$Impl(
    this.data$, {
    super.key,
  });
  String get label => data$.label();
  HasData<RxVal$IData<String>> get subtitle => data$.subtitle();
  HasData<RxVal$IData<void Function(BuildContext)?>> get onTap => data$.onTap();
}

typedef ICrudButton = HasData<CrudButton$IData>;

extension ICrudButton$Ext on ICrudButton {
  String get label => data$.label();
  HasData<RxVal$IData<String>> get subtitle => data$.subtitle();
  HasData<RxVal$IData<void Function(BuildContext)?>> get onTap => data$.onTap();
}

class CrudButton$Delegate extends CrudButton {
  final CrudButton Function() _delegate;
  const CrudButton$Delegate(
    this._delegate, {
    super.key,
  });
  String get label => _delegate().label;
  HasData<RxVal$IData<String>> get subtitle => _delegate().subtitle;
  HasData<RxVal$IData<void Function(BuildContext)?>> get onTap =>
      _delegate().onTap;
}

class CrudButton$Factory {
  const CrudButton$Factory();
  CrudButton$Impl call({
    required String Function() label,
    required HasData<RxVal$IData<String>> Function() subtitle,
    required HasData<RxVal$IData<void Function(BuildContext)?>> Function()
        onTap,
    Key? key,
  }) =>
      CrudButton$Impl(
        CrudButton$Data(
          label: label,
          subtitle: subtitle,
          onTap: onTap,
        ),
        key: key,
      );
  CrudButton$Impl create({
    required String Function() label,
    required HasData<RxVal$IData<String>> Function() subtitle,
    required HasData<RxVal$IData<void Function(BuildContext)?>> Function()
        onTap,
    Key? key,
  }) =>
      CrudButton$Impl(
        CrudButton$Data(
          label: label,
          subtitle: subtitle,
          onTap: onTap,
        ),
        key: key,
      );
  CrudButton$Impl data({
    required String label,
    required HasData<RxVal$IData<String>> subtitle,
    required HasData<RxVal$IData<void Function(BuildContext)?>> onTap,
    Key? key,
  }) =>
      CrudButton$Impl(
        CrudButton$Data(
          label: label.asConstant(),
          subtitle: subtitle.asConstant(),
          onTap: onTap.asConstant(),
        ),
        key: key,
      );
  CrudButton delegate(
    CrudButton Function() delegate, {
    Key? key,
  }) =>
      CrudButton$Delegate(
        delegate,
        key: key,
      );
}

const crudButton$Factory = CrudButton$Factory();

extension CrudButton$Ext$Mk on Mk {
  CrudButton$Factory get CrudButton => crudButton$Factory;
}

abstract class CrudMapPage$IData<V> {
  HasData<RxVal$IData<Opt<List<Widget>>>> Function() get items;
  void Function(BuildContext) Function() get onAdd;
}

class CrudMapPage$Data<V> implements CrudMapPage$IData<V> {
  CrudMapPage$Data({
    required this.items,
    required this.onAdd,
  });
  final HasData<RxVal$IData<Opt<List<Widget>>>> Function() items;
  final void Function(BuildContext) Function() onAdd;
  CrudMapPage$Data<V> copyWith({
    HasData<RxVal$IData<Opt<List<Widget>>>> Function()? items,
    void Function(BuildContext) Function()? onAdd,
  }) =>
      CrudMapPage$Data(
        items: items ?? this.items,
        onAdd: onAdd ?? this.onAdd,
      );
  CrudMapPage$Data<V> copyWithOpt({
    HasData<RxVal$IData<Opt<List<Widget>>>> Function()? items,
    void Function(BuildContext) Function()? onAdd,
  }) =>
      CrudMapPage$Data(
        items: items ?? this.items,
        onAdd: onAdd ?? this.onAdd,
      );
}

class CrudMapPage$Impl<V> extends CrudMapPage<V>
    implements HasData<CrudMapPage$IData<V>> {
  final CrudMapPage$IData<V> data$;
  const CrudMapPage$Impl(
    this.data$, {
    super.key,
  });
  HasData<RxVal$IData<Opt<List<Widget>>>> get items => data$.items();
  void Function(BuildContext) get onAdd => data$.onAdd();
}

typedef ICrudMapPage<V> = HasData<CrudMapPage$IData<V>>;

extension ICrudMapPage$Ext<V> on ICrudMapPage<V> {
  HasData<RxVal$IData<Opt<List<Widget>>>> get items => data$.items();
  void Function(BuildContext) get onAdd => data$.onAdd();
}

class CrudMapPage$Delegate<V> extends CrudMapPage<V> {
  final CrudMapPage<V> Function() _delegate;
  const CrudMapPage$Delegate(
    this._delegate, {
    super.key,
  });
  HasData<RxVal$IData<Opt<List<Widget>>>> get items => _delegate().items;
  void Function(BuildContext) get onAdd => _delegate().onAdd;
}

class CrudMapPage$Factory {
  const CrudMapPage$Factory();
  CrudMapPage$Impl<V> call<V>({
    required HasData<RxVal$IData<Opt<List<Widget>>>> Function() items,
    required void Function(BuildContext) Function() onAdd,
    Key? key,
  }) =>
      CrudMapPage$Impl(
        CrudMapPage$Data(
          items: items,
          onAdd: onAdd,
        ),
        key: key,
      );
  CrudMapPage$Impl<V> create<V>({
    required HasData<RxVal$IData<Opt<List<Widget>>>> Function() items,
    required void Function(BuildContext) Function() onAdd,
    Key? key,
  }) =>
      CrudMapPage$Impl(
        CrudMapPage$Data(
          items: items,
          onAdd: onAdd,
        ),
        key: key,
      );
  CrudMapPage$Impl<V> data<V>({
    required HasData<RxVal$IData<Opt<List<Widget>>>> items,
    required void Function(BuildContext) onAdd,
    Key? key,
  }) =>
      CrudMapPage$Impl(
        CrudMapPage$Data(
          items: items.asConstant(),
          onAdd: onAdd.asConstant(),
        ),
        key: key,
      );
  CrudMapPage<V> delegate<V>(
    CrudMapPage<V> Function() delegate, {
    Key? key,
  }) =>
      CrudMapPage$Delegate(
        delegate,
        key: key,
      );
}

const crudMapPage$Factory = CrudMapPage$Factory();

extension CrudMapPage$Ext$Mk on Mk {
  CrudMapPage$Factory get CrudMapPage => crudMapPage$Factory;
}
