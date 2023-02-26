// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud.dart';

// **************************************************************************
// ImplGenerator
// **************************************************************************

class CrdMsg$Data<L extends PmLib<L>> {
  final Crud<L> Function() crud;
  final PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() msg;
  CrdMsg$Data({
    required this.crud,
    required this.msg,
  });
}

class CrdMsg$Impl<L extends PmLib<L>> extends CrdMsg<L> {
  final CrdMsg$Data<L> _data;
  CrdMsg$Impl(this._data);
  Crud<L> get crud => _data.crud();
  PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get msg => _data.msg();
}

class CrdMsg$Delegate<L extends PmLib<L>> extends CrdMsg<L> {
  final CrdMsg<L> Function() _delegate;
  CrdMsg$Delegate(this._delegate);
  Crud<L> get crud => _delegate().crud;
  PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get msg => _delegate().msg;
}

class CrdMsg$Factory {
  const CrdMsg$Factory();
  CrdMsg<L> call<L extends PmLib<L>>({
    required Crud<L> Function() crud,
    required PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() msg,
  }) =>
      CrdMsg$Impl(
        CrdMsg$Data(
          crud: crud,
          msg: msg,
        ),
      );
  CrdMsg<L> create<L extends PmLib<L>>({
    required Crud<L> Function() crud,
    required PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() msg,
  }) =>
      CrdMsg$Impl(
        CrdMsg$Data(
          crud: crud,
          msg: msg,
        ),
      );
  CrdMsg<L> data<L extends PmLib<L>>({
    required Crud<L> crud,
    required PdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> msg,
  }) =>
      CrdMsg$Impl(
        CrdMsg$Data(
          crud: crud.asConstant(),
          msg: msg.asConstant(),
        ),
      );
  CrdMsg<L> delegate<L extends PmLib<L>>(
    CrdMsg<L> Function() delegate,
  ) =>
      CrdMsg$Delegate(
        delegate,
      );
}

const crdMsg$Factory = CrdMsg$Factory();

extension CrdMsg$Ext$Mk on Mk {
  CrdMsg$Factory get CrdMsg => crdMsg$Factory;
}

class CrdFld$Data<L extends PmLib<L>> {
  final Crud<L> Function() crud;
  final PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() fld;
  CrdFld$Data({
    required this.crud,
    required this.fld,
  });
}

class CrdFld$Impl<L extends PmLib<L>> extends CrdFld<L> {
  final CrdFld$Data<L> _data;
  CrdFld$Impl(this._data);
  Crud<L> get crud => _data.crud();
  PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get fld => _data.fld();
}

class CrdFld$Delegate<L extends PmLib<L>> extends CrdFld<L> {
  final CrdFld<L> Function() _delegate;
  CrdFld$Delegate(this._delegate);
  Crud<L> get crud => _delegate().crud;
  PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get fld => _delegate().fld;
}

class CrdFld$Factory {
  const CrdFld$Factory();
  CrdFld<L> call<L extends PmLib<L>>({
    required Crud<L> Function() crud,
    required PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() fld,
  }) =>
      CrdFld$Impl(
        CrdFld$Data(
          crud: crud,
          fld: fld,
        ),
      );
  CrdFld<L> create<L extends PmLib<L>>({
    required Crud<L> Function() crud,
    required PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() fld,
  }) =>
      CrdFld$Impl(
        CrdFld$Data(
          crud: crud,
          fld: fld,
        ),
      );
  CrdFld<L> data<L extends PmLib<L>>({
    required Crud<L> crud,
    required PdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> fld,
  }) =>
      CrdFld$Impl(
        CrdFld$Data(
          crud: crud.asConstant(),
          fld: fld.asConstant(),
        ),
      );
  CrdFld<L> delegate<L extends PmLib<L>>(
    CrdFld<L> Function() delegate,
  ) =>
      CrdFld$Delegate(
        delegate,
      );
}

const crdFld$Factory = CrdFld$Factory();

extension CrdFld$Ext$Mk on Mk {
  CrdFld$Factory get CrdFld => crdFld$Factory;
}

class CrdEnum$Data<L extends PmLib<L>> {
  final Crud<L> Function() crud;
  final PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() enm;
  CrdEnum$Data({
    required this.crud,
    required this.enm,
  });
}

class CrdEnum$Impl<L extends PmLib<L>> extends CrdEnum<L> {
  final CrdEnum$Data<L> _data;
  CrdEnum$Impl(this._data);
  Crud<L> get crud => _data.crud();
  PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get enm => _data.enm();
}

class CrdEnum$Delegate<L extends PmLib<L>> extends CrdEnum<L> {
  final CrdEnum<L> Function() _delegate;
  CrdEnum$Delegate(this._delegate);
  Crud<L> get crud => _delegate().crud;
  PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> get enm => _delegate().enm;
}

class CrdEnum$Factory {
  const CrdEnum$Factory();
  CrdEnum<L> call<L extends PmLib<L>>({
    required Crud<L> Function() crud,
    required PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() enm,
  }) =>
      CrdEnum$Impl(
        CrdEnum$Data(
          crud: crud,
          enm: enm,
        ),
      );
  CrdEnum<L> create<L extends PmLib<L>>({
    required Crud<L> Function() crud,
    required PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> Function() enm,
  }) =>
      CrdEnum$Impl(
        CrdEnum$Data(
          crud: crud,
          enm: enm,
        ),
      );
  CrdEnum<L> data<L extends PmLib<L>>({
    required Crud<L> crud,
    required PdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> enm,
  }) =>
      CrdEnum$Impl(
        CrdEnum$Data(
          crud: crud.asConstant(),
          enm: enm.asConstant(),
        ),
      );
  CrdEnum<L> delegate<L extends PmLib<L>>(
    CrdEnum<L> Function() delegate,
  ) =>
      CrdEnum$Delegate(
        delegate,
      );
}

const crdEnum$Factory = CrdEnum$Factory();

extension CrdEnum$Ext$Mk on Mk {
  CrdEnum$Factory get CrdEnum => crdEnum$Factory;
}

class CrxCollectionField$Data<T> {
  final void Function(void Function(T) updates) rebuild;
  final Stream<Opt<T>> Function() changes;
  final Opt<T> Function() get;
  final CrdFld<PmLib<dynamic>> Function() crd;
  CrxCollectionField$Data({
    required this.rebuild,
    required this.changes,
    required this.get,
    required this.crd,
  });
}

class CrxCollectionField$Impl<T> extends CrxCollectionField<T> {
  final CrxCollectionField$Data<T> _data;
  CrxCollectionField$Impl(this._data);
  void rebuild(void Function(T) updates) => _data.rebuild(updates);
  Stream<Opt<T>> changes() => _data.changes();
  Opt<T> get() => _data.get();
  CrdFld<PmLib<dynamic>> get crd => _data.crd();
}

class CrxCollectionField$Delegate<T> extends CrxCollectionField<T> {
  final CrxCollectionField<T> Function() _delegate;
  CrxCollectionField$Delegate(this._delegate);
  void rebuild(void Function(T) updates) => _delegate().rebuild(updates);
  Stream<Opt<T>> changes() => _delegate().changes();
  Opt<T> get() => _delegate().get();
  CrdFld<PmLib<dynamic>> get crd => _delegate().crd;
}

class CrxCollectionField$Factory {
  const CrxCollectionField$Factory();
  CrxCollectionField<T> call<T>({
    required void Function(void Function(T) updates) rebuild,
    required Stream<Opt<T>> Function() changes,
    required Opt<T> Function() get,
    required CrdFld<PmLib<dynamic>> Function() crd,
  }) =>
      CrxCollectionField$Impl(
        CrxCollectionField$Data(
          rebuild: rebuild,
          changes: changes,
          get: get,
          crd: crd,
        ),
      );
  CrxCollectionField<T> create<T>({
    required void Function(void Function(T) updates) rebuild,
    required Stream<Opt<T>> Function() changes,
    required Opt<T> Function() get,
    required CrdFld<PmLib<dynamic>> Function() crd,
  }) =>
      CrxCollectionField$Impl(
        CrxCollectionField$Data(
          rebuild: rebuild,
          changes: changes,
          get: get,
          crd: crd,
        ),
      );
  CrxCollectionField<T> data<T>({
    required void Function(void Function(T) updates) rebuild,
    required Stream<Opt<T>> Function() changes,
    required Opt<T> Function() get,
    required CrdFld<PmLib<dynamic>> crd,
  }) =>
      CrxCollectionField$Impl(
        CrxCollectionField$Data(
          rebuild: rebuild,
          changes: changes,
          get: get,
          crd: crd.asConstant(),
        ),
      );
  CrxCollectionField<T> delegate<T>(
    CrxCollectionField<T> Function() delegate,
  ) =>
      CrxCollectionField$Delegate(
        delegate,
      );
  CrxCollectionField<T> fromPrxCollectionBase<T>({
    required PrxCollectionBase<T> prxCollectionBase,
    required CrdFld<PmLib<dynamic>> Function() crd,
  }) =>
      create(
        rebuild: prxCollectionBase.rebuild,
        changes: prxCollectionBase.changes,
        get: prxCollectionBase.get,
        crd: crd,
      );
}

const crxCollectionField$Factory = CrxCollectionField$Factory();

extension CrxCollectionField$Ext$Mk on Mk {
  CrxCollectionField$Factory get CrxCollectionField =>
      crxCollectionField$Factory;
}

class CrxSingleField$Data<T> {
  final void Function(Opt<T> value) set;
  final Opt<T> Function() get;
  final Stream<Opt<T>> Function() changes;
  final CrdFld<PmLib<dynamic>> Function() crd;
  CrxSingleField$Data({
    required this.set,
    required this.get,
    required this.changes,
    required this.crd,
  });
}

class CrxSingleField$Impl<T> extends CrxSingleField<T> {
  final CrxSingleField$Data<T> _data;
  CrxSingleField$Impl(this._data);
  void set(Opt<T> value) => _data.set(value);
  Opt<T> get() => _data.get();
  Stream<Opt<T>> changes() => _data.changes();
  CrdFld<PmLib<dynamic>> get crd => _data.crd();
}

class CrxSingleField$Delegate<T> extends CrxSingleField<T> {
  final CrxSingleField<T> Function() _delegate;
  CrxSingleField$Delegate(this._delegate);
  void set(Opt<T> value) => _delegate().set(value);
  Opt<T> get() => _delegate().get();
  Stream<Opt<T>> changes() => _delegate().changes();
  CrdFld<PmLib<dynamic>> get crd => _delegate().crd;
}

class CrxSingleField$Factory {
  const CrxSingleField$Factory();
  CrxSingleField<T> call<T>({
    required void Function(Opt<T> value) set,
    required Opt<T> Function() get,
    required Stream<Opt<T>> Function() changes,
    required CrdFld<PmLib<dynamic>> Function() crd,
  }) =>
      CrxSingleField$Impl(
        CrxSingleField$Data(
          set: set,
          get: get,
          changes: changes,
          crd: crd,
        ),
      );
  CrxSingleField<T> create<T>({
    required void Function(Opt<T> value) set,
    required Opt<T> Function() get,
    required Stream<Opt<T>> Function() changes,
    required CrdFld<PmLib<dynamic>> Function() crd,
  }) =>
      CrxSingleField$Impl(
        CrxSingleField$Data(
          set: set,
          get: get,
          changes: changes,
          crd: crd,
        ),
      );
  CrxSingleField<T> data<T>({
    required void Function(Opt<T> value) set,
    required Opt<T> Function() get,
    required Stream<Opt<T>> Function() changes,
    required CrdFld<PmLib<dynamic>> crd,
  }) =>
      CrxSingleField$Impl(
        CrxSingleField$Data(
          set: set,
          get: get,
          changes: changes,
          crd: crd.asConstant(),
        ),
      );
  CrxSingleField<T> delegate<T>(
    CrxSingleField<T> Function() delegate,
  ) =>
      CrxSingleField$Delegate(
        delegate,
      );
  CrxSingleField<T> fromPrxSingleBase<T>({
    required PrxSingleBase<T> prxSingleBase,
    required CrdFld<PmLib<dynamic>> Function() crd,
  }) =>
      create(
        set: prxSingleBase.set,
        get: prxSingleBase.get,
        changes: prxSingleBase.changes,
        crd: crd,
      );
}

const crxSingleField$Factory = CrxSingleField$Factory();

extension CrxSingleField$Ext$Mk on Mk {
  CrxSingleField$Factory get CrxSingleField => crxSingleField$Factory;
}
