// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud_widgets.dart';

// **************************************************************************
// ImplGenerator
// **************************************************************************

class CrudSwitch$Data {
  final RxVar<bool> Function() rxVar;
  final String Function() label;
  CrudSwitch$Data({
    required this.rxVar,
    required this.label,
  });
}

class CrudSwitch$Impl extends CrudSwitch {
  final CrudSwitch$Data _data;
  const CrudSwitch$Impl(
    this._data, {
    super.key,
  });
  RxVar<bool> get rxVar => _data.rxVar();
  String get label => _data.label();
}

class CrudSwitch$Delegate extends CrudSwitch {
  final CrudSwitch Function() _delegate;
  const CrudSwitch$Delegate(
    this._delegate, {
    super.key,
  });
  RxVar<bool> get rxVar => _delegate().rxVar;
  String get label => _delegate().label;
}

class CrudSwitch$Factory {
  const CrudSwitch$Factory();
  CrudSwitch call({
    required RxVar<bool> Function() rxVar,
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
  CrudSwitch create({
    required RxVar<bool> Function() rxVar,
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
  CrudSwitch data({
    required RxVar<bool> rxVar,
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

class CrudButton$Data {
  final String Function() label;
  final RxVal<String> Function() subtitle;
  final RxVal<void Function(BuildContext)?> Function() onTap;
  CrudButton$Data({
    required this.label,
    required this.subtitle,
    required this.onTap,
  });
}

class CrudButton$Impl extends CrudButton {
  final CrudButton$Data _data;
  const CrudButton$Impl(
    this._data, {
    super.key,
  });
  String get label => _data.label();
  RxVal<String> get subtitle => _data.subtitle();
  RxVal<void Function(BuildContext)?> get onTap => _data.onTap();
}

class CrudButton$Delegate extends CrudButton {
  final CrudButton Function() _delegate;
  const CrudButton$Delegate(
    this._delegate, {
    super.key,
  });
  String get label => _delegate().label;
  RxVal<String> get subtitle => _delegate().subtitle;
  RxVal<void Function(BuildContext)?> get onTap => _delegate().onTap;
}

class CrudButton$Factory {
  const CrudButton$Factory();
  CrudButton call({
    required String Function() label,
    required RxVal<String> Function() subtitle,
    required RxVal<void Function(BuildContext)?> Function() onTap,
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
  CrudButton create({
    required String Function() label,
    required RxVal<String> Function() subtitle,
    required RxVal<void Function(BuildContext)?> Function() onTap,
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
  CrudButton data({
    required String label,
    required RxVal<String> subtitle,
    required RxVal<void Function(BuildContext)?> onTap,
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

class CrudMapPage$Data<V> {
  final RxVal<Opt<List<Widget>>> Function() items;
  final void Function(BuildContext) Function() onAdd;
  CrudMapPage$Data({
    required this.items,
    required this.onAdd,
  });
}

class CrudMapPage$Impl<V> extends CrudMapPage<V> {
  final CrudMapPage$Data<V> _data;
  const CrudMapPage$Impl(
    this._data, {
    super.key,
  });
  RxVal<Opt<List<Widget>>> get items => _data.items();
  void Function(BuildContext) get onAdd => _data.onAdd();
}

class CrudMapPage$Delegate<V> extends CrudMapPage<V> {
  final CrudMapPage<V> Function() _delegate;
  const CrudMapPage$Delegate(
    this._delegate, {
    super.key,
  });
  RxVal<Opt<List<Widget>>> get items => _delegate().items;
  void Function(BuildContext) get onAdd => _delegate().onAdd;
}

class CrudMapPage$Factory {
  const CrudMapPage$Factory();
  CrudMapPage<V> call<V>({
    required RxVal<Opt<List<Widget>>> Function() items,
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
  CrudMapPage<V> create<V>({
    required RxVal<Opt<List<Widget>>> Function() items,
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
  CrudMapPage<V> data<V>({
    required RxVal<Opt<List<Widget>>> items,
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
