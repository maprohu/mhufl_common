// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud.dart';

// **************************************************************************
// ImplGenerator
// **************************************************************************

class CrdMsg$Data {
  final Crud Function() crud;
  final PdMsg<CrdMsg, CrdFld, CrdEnum> Function() msg;
  CrdMsg$Data({
    required this.crud,
    required this.msg,
  });
}

class CrdMsg$Impl extends CrdMsg {
  final CrdMsg$Data _data;
  CrdMsg$Impl(this._data);
  Crud get crud => _data.crud();
  PdMsg<CrdMsg, CrdFld, CrdEnum> get msg => _data.msg();
}

class CrdMsg$Delegate extends CrdMsg {
  final CrdMsg Function() _delegate;
  CrdMsg$Delegate(this._delegate);
  Crud get crud => _delegate().crud;
  PdMsg<CrdMsg, CrdFld, CrdEnum> get msg => _delegate().msg;
}

class CrdMsg$Factory {
  const CrdMsg$Factory();
  CrdMsg call({
    required Crud Function() crud,
    required PdMsg<CrdMsg, CrdFld, CrdEnum> Function() msg,
  }) =>
      CrdMsg$Impl(
        CrdMsg$Data(
          crud: crud,
          msg: msg,
        ),
      );
  CrdMsg create({
    required Crud Function() crud,
    required PdMsg<CrdMsg, CrdFld, CrdEnum> Function() msg,
  }) =>
      CrdMsg$Impl(
        CrdMsg$Data(
          crud: crud,
          msg: msg,
        ),
      );
  CrdMsg data({
    required Crud crud,
    required PdMsg<CrdMsg, CrdFld, CrdEnum> msg,
  }) =>
      CrdMsg$Impl(
        CrdMsg$Data(
          crud: crud.asConstant(),
          msg: msg.asConstant(),
        ),
      );
  CrdMsg delegate(
    CrdMsg Function() delegate,
  ) =>
      CrdMsg$Delegate(
        delegate,
      );
}

const crdMsg$Factory = CrdMsg$Factory();

extension CrdMsg$Ext$Mk on Mk {
  CrdMsg$Factory get CrdMsg => crdMsg$Factory;
}

class CrdFld$Data {
  final Crud Function() crud;
  final PdFld<CrdMsg, CrdFld, CrdEnum> Function() fld;
  CrdFld$Data({
    required this.crud,
    required this.fld,
  });
}

class CrdFld$Impl extends CrdFld {
  final CrdFld$Data _data;
  CrdFld$Impl(this._data);
  Crud get crud => _data.crud();
  PdFld<CrdMsg, CrdFld, CrdEnum> get fld => _data.fld();
}

class CrdFld$Delegate extends CrdFld {
  final CrdFld Function() _delegate;
  CrdFld$Delegate(this._delegate);
  Crud get crud => _delegate().crud;
  PdFld<CrdMsg, CrdFld, CrdEnum> get fld => _delegate().fld;
}

class CrdFld$Factory {
  const CrdFld$Factory();
  CrdFld call({
    required Crud Function() crud,
    required PdFld<CrdMsg, CrdFld, CrdEnum> Function() fld,
  }) =>
      CrdFld$Impl(
        CrdFld$Data(
          crud: crud,
          fld: fld,
        ),
      );
  CrdFld create({
    required Crud Function() crud,
    required PdFld<CrdMsg, CrdFld, CrdEnum> Function() fld,
  }) =>
      CrdFld$Impl(
        CrdFld$Data(
          crud: crud,
          fld: fld,
        ),
      );
  CrdFld data({
    required Crud crud,
    required PdFld<CrdMsg, CrdFld, CrdEnum> fld,
  }) =>
      CrdFld$Impl(
        CrdFld$Data(
          crud: crud.asConstant(),
          fld: fld.asConstant(),
        ),
      );
  CrdFld delegate(
    CrdFld Function() delegate,
  ) =>
      CrdFld$Delegate(
        delegate,
      );
}

const crdFld$Factory = CrdFld$Factory();

extension CrdFld$Ext$Mk on Mk {
  CrdFld$Factory get CrdFld => crdFld$Factory;
}

class CrdEnum$Data {
  final Crud Function() crud;
  final PdEnum<CrdMsg, CrdFld, CrdEnum> Function() enm;
  CrdEnum$Data({
    required this.crud,
    required this.enm,
  });
}

class CrdEnum$Impl extends CrdEnum {
  final CrdEnum$Data _data;
  CrdEnum$Impl(this._data);
  Crud get crud => _data.crud();
  PdEnum<CrdMsg, CrdFld, CrdEnum> get enm => _data.enm();
}

class CrdEnum$Delegate extends CrdEnum {
  final CrdEnum Function() _delegate;
  CrdEnum$Delegate(this._delegate);
  Crud get crud => _delegate().crud;
  PdEnum<CrdMsg, CrdFld, CrdEnum> get enm => _delegate().enm;
}

class CrdEnum$Factory {
  const CrdEnum$Factory();
  CrdEnum call({
    required Crud Function() crud,
    required PdEnum<CrdMsg, CrdFld, CrdEnum> Function() enm,
  }) =>
      CrdEnum$Impl(
        CrdEnum$Data(
          crud: crud,
          enm: enm,
        ),
      );
  CrdEnum create({
    required Crud Function() crud,
    required PdEnum<CrdMsg, CrdFld, CrdEnum> Function() enm,
  }) =>
      CrdEnum$Impl(
        CrdEnum$Data(
          crud: crud,
          enm: enm,
        ),
      );
  CrdEnum data({
    required Crud crud,
    required PdEnum<CrdMsg, CrdFld, CrdEnum> enm,
  }) =>
      CrdEnum$Impl(
        CrdEnum$Data(
          crud: crud.asConstant(),
          enm: enm.asConstant(),
        ),
      );
  CrdEnum delegate(
    CrdEnum Function() delegate,
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
  final CrdFld Function() crd;
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
  CrdFld get crd => _data.crd();
}

class CrxCollectionField$Delegate<T> extends CrxCollectionField<T> {
  final CrxCollectionField<T> Function() _delegate;
  CrxCollectionField$Delegate(this._delegate);
  void rebuild(void Function(T) updates) => _delegate().rebuild(updates);
  Stream<Opt<T>> changes() => _delegate().changes();
  Opt<T> get() => _delegate().get();
  CrdFld get crd => _delegate().crd;
}

class CrxCollectionField$Factory {
  const CrxCollectionField$Factory();
  CrxCollectionField<T> call<T>({
    required void Function(void Function(T) updates) rebuild,
    required Stream<Opt<T>> Function() changes,
    required Opt<T> Function() get,
    required CrdFld Function() crd,
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
    required CrdFld Function() crd,
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
    required CrdFld crd,
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
    required CrdFld Function() crd,
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
  final CrdFld Function() crd;
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
  CrdFld get crd => _data.crd();
}

class CrxSingleField$Delegate<T> extends CrxSingleField<T> {
  final CrxSingleField<T> Function() _delegate;
  CrxSingleField$Delegate(this._delegate);
  void set(Opt<T> value) => _delegate().set(value);
  Opt<T> get() => _delegate().get();
  Stream<Opt<T>> changes() => _delegate().changes();
  CrdFld get crd => _delegate().crd;
}

class CrxSingleField$Factory {
  const CrxSingleField$Factory();
  CrxSingleField<T> call<T>({
    required void Function(Opt<T> value) set,
    required Opt<T> Function() get,
    required Stream<Opt<T>> Function() changes,
    required CrdFld Function() crd,
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
    required CrdFld Function() crd,
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
    required CrdFld crd,
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
    required CrdFld Function() crd,
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
