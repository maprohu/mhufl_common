// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crud.dart';

// **************************************************************************
// ImplGenerator
// **************************************************************************

abstract class CrdMsg$IData {
  Crud Function() get crud;
  PdMsg<CrdMsg, CrdFld, CrdEnum> Function() get msg;
}

class CrdMsg$Data implements CrdMsg$IData {
  CrdMsg$Data({
    required this.crud,
    required this.msg,
  });
  final Crud Function() crud;
  final PdMsg<CrdMsg, CrdFld, CrdEnum> Function() msg;
  CrdMsg$Data copyWith({
    Crud Function()? crud,
    PdMsg<CrdMsg, CrdFld, CrdEnum> Function()? msg,
  }) =>
      CrdMsg$Data(
        crud: crud ?? this.crud,
        msg: msg ?? this.msg,
      );
  CrdMsg$Data copyWithOpt({
    Crud Function()? crud,
    PdMsg<CrdMsg, CrdFld, CrdEnum> Function()? msg,
  }) =>
      CrdMsg$Data(
        crud: crud ?? this.crud,
        msg: msg ?? this.msg,
      );
}

class CrdMsg$Impl extends CrdMsg implements HasData<CrdMsg$IData> {
  final CrdMsg$IData data$;
  CrdMsg$Impl(this.data$);
  Crud get crud => data$.crud();
  PdMsg<CrdMsg, CrdFld, CrdEnum> get msg => data$.msg();
}

typedef ICrdMsg = HasData<CrdMsg$IData>;

extension ICrdMsg$Ext on ICrdMsg {
  Crud get crud => data$.crud();
  PdMsg<CrdMsg, CrdFld, CrdEnum> get msg => data$.msg();
}

class CrdMsg$Delegate extends CrdMsg {
  final CrdMsg Function() _delegate;
  CrdMsg$Delegate(this._delegate);
  Crud get crud => _delegate().crud;
  PdMsg<CrdMsg, CrdFld, CrdEnum> get msg => _delegate().msg;
}

class CrdMsg$Factory {
  const CrdMsg$Factory();
  CrdMsg$Impl call({
    required Crud Function() crud,
    required PdMsg<CrdMsg, CrdFld, CrdEnum> Function() msg,
  }) =>
      CrdMsg$Impl(
        CrdMsg$Data(
          crud: crud,
          msg: msg,
        ),
      );
  CrdMsg$Impl create({
    required Crud Function() crud,
    required PdMsg<CrdMsg, CrdFld, CrdEnum> Function() msg,
  }) =>
      CrdMsg$Impl(
        CrdMsg$Data(
          crud: crud,
          msg: msg,
        ),
      );
  CrdMsg$Impl data({
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

abstract class CrdFld$IData {
  Crud Function() get crud;
  PdFld<CrdMsg, CrdFld, CrdEnum> Function() get fld;
}

class CrdFld$Data implements CrdFld$IData {
  CrdFld$Data({
    required this.crud,
    required this.fld,
  });
  final Crud Function() crud;
  final PdFld<CrdMsg, CrdFld, CrdEnum> Function() fld;
  CrdFld$Data copyWith({
    Crud Function()? crud,
    PdFld<CrdMsg, CrdFld, CrdEnum> Function()? fld,
  }) =>
      CrdFld$Data(
        crud: crud ?? this.crud,
        fld: fld ?? this.fld,
      );
  CrdFld$Data copyWithOpt({
    Crud Function()? crud,
    PdFld<CrdMsg, CrdFld, CrdEnum> Function()? fld,
  }) =>
      CrdFld$Data(
        crud: crud ?? this.crud,
        fld: fld ?? this.fld,
      );
}

class CrdFld$Impl extends CrdFld implements HasData<CrdFld$IData> {
  final CrdFld$IData data$;
  CrdFld$Impl(this.data$);
  Crud get crud => data$.crud();
  PdFld<CrdMsg, CrdFld, CrdEnum> get fld => data$.fld();
}

typedef ICrdFld = HasData<CrdFld$IData>;

extension ICrdFld$Ext on ICrdFld {
  Crud get crud => data$.crud();
  PdFld<CrdMsg, CrdFld, CrdEnum> get fld => data$.fld();
}

class CrdFld$Delegate extends CrdFld {
  final CrdFld Function() _delegate;
  CrdFld$Delegate(this._delegate);
  Crud get crud => _delegate().crud;
  PdFld<CrdMsg, CrdFld, CrdEnum> get fld => _delegate().fld;
}

class CrdFld$Factory {
  const CrdFld$Factory();
  CrdFld$Impl call({
    required Crud Function() crud,
    required PdFld<CrdMsg, CrdFld, CrdEnum> Function() fld,
  }) =>
      CrdFld$Impl(
        CrdFld$Data(
          crud: crud,
          fld: fld,
        ),
      );
  CrdFld$Impl create({
    required Crud Function() crud,
    required PdFld<CrdMsg, CrdFld, CrdEnum> Function() fld,
  }) =>
      CrdFld$Impl(
        CrdFld$Data(
          crud: crud,
          fld: fld,
        ),
      );
  CrdFld$Impl data({
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

abstract class CrdEnum$IData {
  Crud Function() get crud;
  PdEnum<CrdMsg, CrdFld, CrdEnum> Function() get enm;
}

class CrdEnum$Data implements CrdEnum$IData {
  CrdEnum$Data({
    required this.crud,
    required this.enm,
  });
  final Crud Function() crud;
  final PdEnum<CrdMsg, CrdFld, CrdEnum> Function() enm;
  CrdEnum$Data copyWith({
    Crud Function()? crud,
    PdEnum<CrdMsg, CrdFld, CrdEnum> Function()? enm,
  }) =>
      CrdEnum$Data(
        crud: crud ?? this.crud,
        enm: enm ?? this.enm,
      );
  CrdEnum$Data copyWithOpt({
    Crud Function()? crud,
    PdEnum<CrdMsg, CrdFld, CrdEnum> Function()? enm,
  }) =>
      CrdEnum$Data(
        crud: crud ?? this.crud,
        enm: enm ?? this.enm,
      );
}

class CrdEnum$Impl extends CrdEnum implements HasData<CrdEnum$IData> {
  final CrdEnum$IData data$;
  CrdEnum$Impl(this.data$);
  Crud get crud => data$.crud();
  PdEnum<CrdMsg, CrdFld, CrdEnum> get enm => data$.enm();
}

typedef ICrdEnum = HasData<CrdEnum$IData>;

extension ICrdEnum$Ext on ICrdEnum {
  Crud get crud => data$.crud();
  PdEnum<CrdMsg, CrdFld, CrdEnum> get enm => data$.enm();
}

class CrdEnum$Delegate extends CrdEnum {
  final CrdEnum Function() _delegate;
  CrdEnum$Delegate(this._delegate);
  Crud get crud => _delegate().crud;
  PdEnum<CrdMsg, CrdFld, CrdEnum> get enm => _delegate().enm;
}

class CrdEnum$Factory {
  const CrdEnum$Factory();
  CrdEnum$Impl call({
    required Crud Function() crud,
    required PdEnum<CrdMsg, CrdFld, CrdEnum> Function() enm,
  }) =>
      CrdEnum$Impl(
        CrdEnum$Data(
          crud: crud,
          enm: enm,
        ),
      );
  CrdEnum$Impl create({
    required Crud Function() crud,
    required PdEnum<CrdMsg, CrdFld, CrdEnum> Function() enm,
  }) =>
      CrdEnum$Impl(
        CrdEnum$Data(
          crud: crud,
          enm: enm,
        ),
      );
  CrdEnum$Impl data({
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

abstract class CrxField$IData<T>
    implements RxVal$IData<Opt<T>>, PrxBase$IData<T> {
  Opt<T> Function() get get;
  CrdFld Function() get crd;
  Stream<Opt<T>> Function() get changes;
  Lookup Function() get lookup;
}

class CrxField$Data<T> implements CrxField$IData<T> {
  CrxField$Data({
    required this.get,
    required this.crd,
    required this.changes,
    required this.lookup,
  });
  final Opt<T> Function() get;
  final CrdFld Function() crd;
  final Stream<Opt<T>> Function() changes;
  final Lookup Function() lookup;
  CrxField$Data<T> copyWith({
    Opt<T> Function()? get,
    CrdFld Function()? crd,
    Stream<Opt<T>> Function()? changes,
    Lookup Function()? lookup,
  }) =>
      CrxField$Data(
        get: get ?? this.get,
        crd: crd ?? this.crd,
        changes: changes ?? this.changes,
        lookup: lookup ?? this.lookup,
      );
  CrxField$Data<T> copyWithOpt({
    Opt<T> Function()? get,
    CrdFld Function()? crd,
    Stream<Opt<T>> Function()? changes,
    Lookup Function()? lookup,
  }) =>
      CrxField$Data(
        get: get ?? this.get,
        crd: crd ?? this.crd,
        changes: changes ?? this.changes,
        lookup: lookup ?? this.lookup,
      );
}

class CrxField$Impl<T> extends CrxField<T>
    implements HasData<CrxField$IData<T>> {
  final CrxField$IData<T> data$;
  CrxField$Impl(this.data$);
  Opt<T> get() => data$.get();
  CrdFld get crd => data$.crd();
  Stream<Opt<T>> get changes => data$.changes();
  Lookup get lookup => data$.lookup();
}

typedef ICrxField<T> = HasData<CrxField$IData<T>>;

extension ICrxField$Ext<T> on ICrxField<T> {
  RxVal$Impl<Opt<T>> get asRxVal => RxVal$Impl(data$);
  PrxBase$Impl<T> get asPrxBase => PrxBase$Impl(data$);
  Opt<T> get() => data$.get();
  CrdFld get crd => data$.crd();
  Stream<Opt<T>> get changes => data$.changes();
  Lookup get lookup => data$.lookup();
}

class CrxField$Delegate<T> extends CrxField<T> {
  final CrxField<T> Function() _delegate;
  CrxField$Delegate(this._delegate);
  Opt<T> get() => _delegate().get();
  CrdFld get crd => _delegate().crd;
  Stream<Opt<T>> get changes => _delegate().changes;
  Lookup get lookup => _delegate().lookup;
}

class CrxField$Factory {
  const CrxField$Factory();
  CrxField$Impl<T> call<T>({
    required Opt<T> Function() get,
    required CrdFld Function() crd,
    required Stream<Opt<T>> Function() changes,
    required Lookup Function() lookup,
  }) =>
      CrxField$Impl(
        CrxField$Data(
          get: get,
          crd: crd,
          changes: changes,
          lookup: lookup,
        ),
      );
  CrxField$Impl<T> create<T>({
    required Opt<T> Function() get,
    required CrdFld Function() crd,
    required Stream<Opt<T>> Function() changes,
    required Lookup Function() lookup,
  }) =>
      CrxField$Impl(
        CrxField$Data(
          get: get,
          crd: crd,
          changes: changes,
          lookup: lookup,
        ),
      );
  CrxField$Impl<T> data<T>({
    required Opt<T> Function() get,
    required CrdFld crd,
    required Stream<Opt<T>> changes,
    required Lookup lookup,
  }) =>
      CrxField$Impl(
        CrxField$Data(
          get: get,
          crd: crd.asConstant(),
          changes: changes.asConstant(),
          lookup: lookup.asConstant(),
        ),
      );
  CrxField<T> delegate<T>(
    CrxField<T> Function() delegate,
  ) =>
      CrxField$Delegate(
        delegate,
      );
  CrxField$Impl<T> fromRxVal$Iface<T>({
    required RxVal<Opt<T>> rxVal,
    required CrdFld Function() crd,
  }) =>
      create(
        get: rxVal.get,
        changes: () => rxVal.changes,
        lookup: () => rxVal.lookup,
        crd: crd,
      );
  CrxField$Impl<T> fromRxVal<T>({
    required IRxVal<Opt<T>> rxVal,
    required CrdFld Function() crd,
  }) =>
      create(
        get: rxVal.data$.get,
        changes: rxVal.data$.changes,
        lookup: rxVal.data$.lookup,
        crd: crd,
      );
  CrxField$Impl<T> fromPrxBase$Iface<T>({
    required PrxBase<T> prxBase,
    required CrdFld Function() crd,
  }) =>
      create(
        get: prxBase.get,
        changes: () => prxBase.changes,
        lookup: () => prxBase.lookup,
        crd: crd,
      );
  CrxField$Impl<T> fromPrxBase<T>({
    required IPrxBase<T> prxBase,
    required CrdFld Function() crd,
  }) =>
      create(
        get: prxBase.data$.get,
        changes: prxBase.data$.changes,
        lookup: prxBase.data$.lookup,
        crd: crd,
      );
}

const crxField$Factory = CrxField$Factory();

extension CrxField$Ext$Mk on Mk {
  CrxField$Factory get CrxField => crxField$Factory;
}

abstract class CrxCollectionField$IData<T>
    implements PrxCollectionBase$IData<T>, CrxField$IData<T> {
  void Function(
    void Function(T) updates,
  ) get rebuild;
  Opt<T> Function() get get;
  Stream<Opt<T>> Function() get changes;
  Lookup Function() get lookup;
  CrdFld Function() get crd;
}

class CrxCollectionField$Data<T> implements CrxCollectionField$IData<T> {
  CrxCollectionField$Data({
    required this.rebuild,
    required this.get,
    required this.changes,
    required this.lookup,
    required this.crd,
  });
  final void Function(
    void Function(T) updates,
  ) rebuild;
  final Opt<T> Function() get;
  final Stream<Opt<T>> Function() changes;
  final Lookup Function() lookup;
  final CrdFld Function() crd;
  CrxCollectionField$Data<T> copyWith({
    void Function(
      void Function(T) updates,
    )?
        rebuild,
    Opt<T> Function()? get,
    Stream<Opt<T>> Function()? changes,
    Lookup Function()? lookup,
    CrdFld Function()? crd,
  }) =>
      CrxCollectionField$Data(
        rebuild: rebuild ?? this.rebuild,
        get: get ?? this.get,
        changes: changes ?? this.changes,
        lookup: lookup ?? this.lookup,
        crd: crd ?? this.crd,
      );
  CrxCollectionField$Data<T> copyWithOpt({
    void Function(
      void Function(T) updates,
    )?
        rebuild,
    Opt<T> Function()? get,
    Stream<Opt<T>> Function()? changes,
    Lookup Function()? lookup,
    CrdFld Function()? crd,
  }) =>
      CrxCollectionField$Data(
        rebuild: rebuild ?? this.rebuild,
        get: get ?? this.get,
        changes: changes ?? this.changes,
        lookup: lookup ?? this.lookup,
        crd: crd ?? this.crd,
      );
}

class CrxCollectionField$Impl<T> extends CrxCollectionField<T>
    implements HasData<CrxCollectionField$IData<T>> {
  final CrxCollectionField$IData<T> data$;
  CrxCollectionField$Impl(this.data$);
  void rebuild(
    void Function(T) updates,
  ) =>
      data$.rebuild(updates);
  Opt<T> get() => data$.get();
  Stream<Opt<T>> get changes => data$.changes();
  Lookup get lookup => data$.lookup();
  CrdFld get crd => data$.crd();
}

typedef ICrxCollectionField<T> = HasData<CrxCollectionField$IData<T>>;

extension ICrxCollectionField$Ext<T> on ICrxCollectionField<T> {
  PrxCollectionBase$Impl<T> get asPrxCollectionBase =>
      PrxCollectionBase$Impl(data$);
  CrxField$Impl<T> get asCrxField => CrxField$Impl(data$);
  void rebuild(
    void Function(T) updates,
  ) =>
      data$.rebuild(updates);
  Opt<T> get() => data$.get();
  Stream<Opt<T>> get changes => data$.changes();
  Lookup get lookup => data$.lookup();
  CrdFld get crd => data$.crd();
}

class CrxCollectionField$Delegate<T> extends CrxCollectionField<T> {
  final CrxCollectionField<T> Function() _delegate;
  CrxCollectionField$Delegate(this._delegate);
  void rebuild(
    void Function(T) updates,
  ) =>
      _delegate().rebuild(updates);
  Opt<T> get() => _delegate().get();
  Stream<Opt<T>> get changes => _delegate().changes;
  Lookup get lookup => _delegate().lookup;
  CrdFld get crd => _delegate().crd;
}

class CrxCollectionField$Factory {
  const CrxCollectionField$Factory();
  CrxCollectionField$Impl<T> call<T>({
    required void Function(
      void Function(T) updates,
    )
        rebuild,
    required Opt<T> Function() get,
    required Stream<Opt<T>> Function() changes,
    required Lookup Function() lookup,
    required CrdFld Function() crd,
  }) =>
      CrxCollectionField$Impl(
        CrxCollectionField$Data(
          rebuild: rebuild,
          get: get,
          changes: changes,
          lookup: lookup,
          crd: crd,
        ),
      );
  CrxCollectionField$Impl<T> create<T>({
    required void Function(
      void Function(T) updates,
    )
        rebuild,
    required Opt<T> Function() get,
    required Stream<Opt<T>> Function() changes,
    required Lookup Function() lookup,
    required CrdFld Function() crd,
  }) =>
      CrxCollectionField$Impl(
        CrxCollectionField$Data(
          rebuild: rebuild,
          get: get,
          changes: changes,
          lookup: lookup,
          crd: crd,
        ),
      );
  CrxCollectionField$Impl<T> data<T>({
    required void Function(
      void Function(T) updates,
    )
        rebuild,
    required Opt<T> Function() get,
    required Stream<Opt<T>> changes,
    required Lookup lookup,
    required CrdFld crd,
  }) =>
      CrxCollectionField$Impl(
        CrxCollectionField$Data(
          rebuild: rebuild,
          get: get,
          changes: changes.asConstant(),
          lookup: lookup.asConstant(),
          crd: crd.asConstant(),
        ),
      );
  CrxCollectionField<T> delegate<T>(
    CrxCollectionField<T> Function() delegate,
  ) =>
      CrxCollectionField$Delegate(
        delegate,
      );
  CrxCollectionField$Impl<T> fromPrxCollectionBase$Iface<T>({
    required PrxCollectionBase<T> prxCollectionBase,
    required CrdFld Function() crd,
  }) =>
      create(
        rebuild: prxCollectionBase.rebuild,
        get: prxCollectionBase.get,
        changes: () => prxCollectionBase.changes,
        lookup: () => prxCollectionBase.lookup,
        crd: crd,
      );
  CrxCollectionField$Impl<T> fromPrxCollectionBase<T>({
    required IPrxCollectionBase<T> prxCollectionBase,
    required CrdFld Function() crd,
  }) =>
      create(
        rebuild: prxCollectionBase.data$.rebuild,
        get: prxCollectionBase.data$.get,
        changes: prxCollectionBase.data$.changes,
        lookup: prxCollectionBase.data$.lookup,
        crd: crd,
      );
  CrxCollectionField$Impl<T> fromCrxField$Iface<T>({
    required CrxField<T> crxField,
    required void Function(
      void Function(T) updates,
    )
        rebuild,
  }) =>
      create(
        get: crxField.get,
        changes: () => crxField.changes,
        lookup: () => crxField.lookup,
        crd: () => crxField.crd,
        rebuild: rebuild,
      );
  CrxCollectionField$Impl<T> fromCrxField<T>({
    required ICrxField<T> crxField,
    required void Function(
      void Function(T) updates,
    )
        rebuild,
  }) =>
      create(
        get: crxField.data$.get,
        changes: crxField.data$.changes,
        lookup: crxField.data$.lookup,
        crd: crxField.data$.crd,
        rebuild: rebuild,
      );
}

const crxCollectionField$Factory = CrxCollectionField$Factory();

extension CrxCollectionField$Ext$Mk on Mk {
  CrxCollectionField$Factory get CrxCollectionField =>
      crxCollectionField$Factory;
}

abstract class CrxSingleField$IData<T>
    implements PrxSingleBase$IData<T>, CrxField$IData<T> {
  void Function(
    Opt<T> value,
  ) get set;
  Opt<T> Function() get get;
  Stream<Opt<T>> Function() get changes;
  Lookup Function() get lookup;
  CrdFld Function() get crd;
}

class CrxSingleField$Data<T> implements CrxSingleField$IData<T> {
  CrxSingleField$Data({
    required this.set,
    required this.get,
    required this.changes,
    required this.lookup,
    required this.crd,
  });
  final void Function(
    Opt<T> value,
  ) set;
  final Opt<T> Function() get;
  final Stream<Opt<T>> Function() changes;
  final Lookup Function() lookup;
  final CrdFld Function() crd;
  CrxSingleField$Data<T> copyWith({
    void Function(
      Opt<T> value,
    )?
        set,
    Opt<T> Function()? get,
    Stream<Opt<T>> Function()? changes,
    Lookup Function()? lookup,
    CrdFld Function()? crd,
  }) =>
      CrxSingleField$Data(
        set: set ?? this.set,
        get: get ?? this.get,
        changes: changes ?? this.changes,
        lookup: lookup ?? this.lookup,
        crd: crd ?? this.crd,
      );
  CrxSingleField$Data<T> copyWithOpt({
    void Function(
      Opt<T> value,
    )?
        set,
    Opt<T> Function()? get,
    Stream<Opt<T>> Function()? changes,
    Lookup Function()? lookup,
    CrdFld Function()? crd,
  }) =>
      CrxSingleField$Data(
        set: set ?? this.set,
        get: get ?? this.get,
        changes: changes ?? this.changes,
        lookup: lookup ?? this.lookup,
        crd: crd ?? this.crd,
      );
}

class CrxSingleField$Impl<T> extends CrxSingleField<T>
    implements HasData<CrxSingleField$IData<T>> {
  final CrxSingleField$IData<T> data$;
  CrxSingleField$Impl(this.data$);
  void set(
    Opt<T> value,
  ) =>
      data$.set(value);
  Opt<T> get() => data$.get();
  Stream<Opt<T>> get changes => data$.changes();
  Lookup get lookup => data$.lookup();
  CrdFld get crd => data$.crd();
}

typedef ICrxSingleField<T> = HasData<CrxSingleField$IData<T>>;

extension ICrxSingleField$Ext<T> on ICrxSingleField<T> {
  PrxSingleBase$Impl<T> get asPrxSingleBase => PrxSingleBase$Impl(data$);
  CrxField$Impl<T> get asCrxField => CrxField$Impl(data$);
  void set(
    Opt<T> value,
  ) =>
      data$.set(value);
  Opt<T> get() => data$.get();
  Stream<Opt<T>> get changes => data$.changes();
  Lookup get lookup => data$.lookup();
  CrdFld get crd => data$.crd();
}

class CrxSingleField$Delegate<T> extends CrxSingleField<T> {
  final CrxSingleField<T> Function() _delegate;
  CrxSingleField$Delegate(this._delegate);
  void set(
    Opt<T> value,
  ) =>
      _delegate().set(value);
  Opt<T> get() => _delegate().get();
  Stream<Opt<T>> get changes => _delegate().changes;
  Lookup get lookup => _delegate().lookup;
  CrdFld get crd => _delegate().crd;
}

class CrxSingleField$Factory {
  const CrxSingleField$Factory();
  CrxSingleField$Impl<T> call<T>({
    required void Function(
      Opt<T> value,
    )
        set,
    required Opt<T> Function() get,
    required Stream<Opt<T>> Function() changes,
    required Lookup Function() lookup,
    required CrdFld Function() crd,
  }) =>
      CrxSingleField$Impl(
        CrxSingleField$Data(
          set: set,
          get: get,
          changes: changes,
          lookup: lookup,
          crd: crd,
        ),
      );
  CrxSingleField$Impl<T> create<T>({
    required void Function(
      Opt<T> value,
    )
        set,
    required Opt<T> Function() get,
    required Stream<Opt<T>> Function() changes,
    required Lookup Function() lookup,
    required CrdFld Function() crd,
  }) =>
      CrxSingleField$Impl(
        CrxSingleField$Data(
          set: set,
          get: get,
          changes: changes,
          lookup: lookup,
          crd: crd,
        ),
      );
  CrxSingleField$Impl<T> data<T>({
    required void Function(
      Opt<T> value,
    )
        set,
    required Opt<T> Function() get,
    required Stream<Opt<T>> changes,
    required Lookup lookup,
    required CrdFld crd,
  }) =>
      CrxSingleField$Impl(
        CrxSingleField$Data(
          set: set,
          get: get,
          changes: changes.asConstant(),
          lookup: lookup.asConstant(),
          crd: crd.asConstant(),
        ),
      );
  CrxSingleField<T> delegate<T>(
    CrxSingleField<T> Function() delegate,
  ) =>
      CrxSingleField$Delegate(
        delegate,
      );
  CrxSingleField$Impl<T> fromPrxSingleBase$Iface<T>({
    required PrxSingleBase<T> prxSingleBase,
    required CrdFld Function() crd,
  }) =>
      create(
        set: prxSingleBase.set,
        get: prxSingleBase.get,
        changes: () => prxSingleBase.changes,
        lookup: () => prxSingleBase.lookup,
        crd: crd,
      );
  CrxSingleField$Impl<T> fromPrxSingleBase<T>({
    required IPrxSingleBase<T> prxSingleBase,
    required CrdFld Function() crd,
  }) =>
      create(
        set: prxSingleBase.data$.set,
        get: prxSingleBase.data$.get,
        changes: prxSingleBase.data$.changes,
        lookup: prxSingleBase.data$.lookup,
        crd: crd,
      );
  CrxSingleField$Impl<T> fromCrxField$Iface<T>({
    required CrxField<T> crxField,
    required void Function(
      Opt<T> value,
    )
        set,
  }) =>
      create(
        get: crxField.get,
        changes: () => crxField.changes,
        lookup: () => crxField.lookup,
        crd: () => crxField.crd,
        set: set,
      );
  CrxSingleField$Impl<T> fromCrxField<T>({
    required ICrxField<T> crxField,
    required void Function(
      Opt<T> value,
    )
        set,
  }) =>
      create(
        get: crxField.data$.get,
        changes: crxField.data$.changes,
        lookup: crxField.data$.lookup,
        crd: crxField.data$.crd,
        set: set,
      );
}

const crxSingleField$Factory = CrxSingleField$Factory();

extension CrxSingleField$Ext$Mk on Mk {
  CrxSingleField$Factory get CrxSingleField => crxSingleField$Factory;
}
