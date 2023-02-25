// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud_widgets.dart';

// **************************************************************************
// ImplGenerator
// **************************************************************************

class CrudButton$Data {
  final String Function() label;
  final RxVar<String> Function() subtitle;
  final RxVar<void Function()?> Function() onTap;
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
  RxVar<String> get subtitle => _data.subtitle();
  RxVar<void Function()?> get onTap => _data.onTap();
}

class CrudButton$Delegate extends CrudButton {
  final CrudButton Function() _delegate;
  const CrudButton$Delegate(
    this._delegate, {
    super.key,
  });
  String get label => _delegate().label;
  RxVar<String> get subtitle => _delegate().subtitle;
  RxVar<void Function()?> get onTap => _delegate().onTap;
}

class CrudButton$Factory {
  const CrudButton$Factory();
  CrudButton call({
    required String Function() label,
    required RxVar<String> Function() subtitle,
    required RxVar<void Function()?> Function() onTap,
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
    required RxVar<String> Function() subtitle,
    required RxVar<void Function()?> Function() onTap,
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
    required RxVar<String> subtitle,
    required RxVar<void Function()?> onTap,
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
