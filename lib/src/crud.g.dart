// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud.dart';

// **************************************************************************
// ImplGenerator
// **************************************************************************

class CrdMsg$Data<L extends PmLib> {
  final Crud<L> Function() crud;
  final PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() msg;
  CrdMsg$Data({
    required this.crud,
    required this.msg,
  });
}

class CrdMsg$Impl<L extends PmLib> extends CrdMsg<L> {
  final CrdMsg$Data<L> _data;
  CrdMsg$Impl(this._data);
  Crud<L> get crud => _data.crud();
  PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get msg => _data.msg();
}

class CrdMsg$Delegate<L extends PmLib> extends CrdMsg<L> {
  final CrdMsg<L> Function() _delegate;
  CrdMsg$Delegate(this._delegate);
  Crud<L> get crud => _delegate().crud;
  PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get msg => _delegate().msg;
}

class CrdMsg$Factory {
  const CrdMsg$Factory();
  CrdMsg<L> call<L extends PmLib>({
    required Crud<L> Function() crud,
    required PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() msg,
  }) =>
      CrdMsg$Impl(CrdMsg$Data(
        crud: crud,
        msg: msg,
      ));
  CrdMsg<L> create<L extends PmLib>({
    required Crud<L> Function() crud,
    required PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() msg,
  }) =>
      CrdMsg$Impl(CrdMsg$Data(
        crud: crud,
        msg: msg,
      ));
  CrdMsg<L> delegate<L extends PmLib>(CrdMsg<L> Function() delegate) =>
      CrdMsg$Delegate(delegate);
}

const crdMsg$Factory = CrdMsg$Factory();

extension CrdMsg$Ext$Mk on Mk {
  CrdMsg$Factory get CrdMsg => crdMsg$Factory;
}

class CrdFld$Data<L extends PmLib> {
  final Crud<L> Function() crud;
  final PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() fld;
  CrdFld$Data({
    required this.crud,
    required this.fld,
  });
}

class CrdFld$Impl<L extends PmLib> extends CrdFld<L> {
  final CrdFld$Data<L> _data;
  CrdFld$Impl(this._data);
  Crud<L> get crud => _data.crud();
  PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get fld => _data.fld();
}

class CrdFld$Delegate<L extends PmLib> extends CrdFld<L> {
  final CrdFld<L> Function() _delegate;
  CrdFld$Delegate(this._delegate);
  Crud<L> get crud => _delegate().crud;
  PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get fld => _delegate().fld;
}

class CrdFld$Factory {
  const CrdFld$Factory();
  CrdFld<L> call<L extends PmLib>({
    required Crud<L> Function() crud,
    required PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() fld,
  }) =>
      CrdFld$Impl(CrdFld$Data(
        crud: crud,
        fld: fld,
      ));
  CrdFld<L> create<L extends PmLib>({
    required Crud<L> Function() crud,
    required PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() fld,
  }) =>
      CrdFld$Impl(CrdFld$Data(
        crud: crud,
        fld: fld,
      ));
  CrdFld<L> delegate<L extends PmLib>(CrdFld<L> Function() delegate) =>
      CrdFld$Delegate(delegate);
}

const crdFld$Factory = CrdFld$Factory();

extension CrdFld$Ext$Mk on Mk {
  CrdFld$Factory get CrdFld => crdFld$Factory;
}

class CrdEnum$Data<L extends PmLib> {
  final Crud<L> Function() crud;
  final PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() enm;
  CrdEnum$Data({
    required this.crud,
    required this.enm,
  });
}

class CrdEnum$Impl<L extends PmLib> extends CrdEnum<L> {
  final CrdEnum$Data<L> _data;
  CrdEnum$Impl(this._data);
  Crud<L> get crud => _data.crud();
  PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get enm => _data.enm();
}

class CrdEnum$Delegate<L extends PmLib> extends CrdEnum<L> {
  final CrdEnum<L> Function() _delegate;
  CrdEnum$Delegate(this._delegate);
  Crud<L> get crud => _delegate().crud;
  PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get enm => _delegate().enm;
}

class CrdEnum$Factory {
  const CrdEnum$Factory();
  CrdEnum<L> call<L extends PmLib>({
    required Crud<L> Function() crud,
    required PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() enm,
  }) =>
      CrdEnum$Impl(CrdEnum$Data(
        crud: crud,
        enm: enm,
      ));
  CrdEnum<L> create<L extends PmLib>({
    required Crud<L> Function() crud,
    required PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() enm,
  }) =>
      CrdEnum$Impl(CrdEnum$Data(
        crud: crud,
        enm: enm,
      ));
  CrdEnum<L> delegate<L extends PmLib>(CrdEnum<L> Function() delegate) =>
      CrdEnum$Delegate(delegate);
}

const crdEnum$Factory = CrdEnum$Factory();

extension CrdEnum$Ext$Mk on Mk {
  CrdEnum$Factory get CrdEnum => crdEnum$Factory;
}
