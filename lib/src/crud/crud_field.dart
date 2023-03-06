import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:protobuf/protobuf.dart';
import 'package:select_dialog/select_dialog.dart';

import 'crud_props.dart';

part 'crud_field.g.dart';

@Impl()
abstract class CrdFld extends CrdItem
    implements HasPdFld<CrdMsg, CrdFld, CrdEnum> {
  static final defaultCrfn = mk.CrfnFld.create(
    tileWidget: <T>(fld, prx) => fld.defaultCrudTile(prx),
    tileConfig: <I, T>(fld, id, prx) => mk.TileConfig.fromDisplayStrings(
      prx: prx,
      title: (value) => fld.singleItemDisplayString(id, value),
      subtitle: fld.singleItemDisplaySubString?.let(
        (sub) => (value) => sub(fld, value),
      ),
    ),
  );

  late final pmFld = fld.msg.payload.pmMsgOfType.fields$[fld.index];
  late final name = fld.name;
  late final label = name.camelCaseToLabel;

  late final pmFldRead = pmFld as PmReadField;
  late final pmFldFull = pmFld as PmFullField;
  late final pmFldMessage = pmFld as PmMsgField;

  late final PmAccessRead$Base access = () {
    if (fld.isCollection) {
      // ignore: unnecessary_cast
      return mk.PmAccessRead.create(pmFldRead) as PmAccessRead$Base;
    } else if (fld.isTypeMessage) {
      return mk.PmAccessMessage.create(pmFldMessage);
    } else {
      return mk.PmAccessFull.create(pmFldFull);
    }
  }();

  late final IPrxBase Function<T>(
    IRxVarDefault<T> messageVar,
  ) prx = access.when(
    read: (read) => <T>(messageVar) => mk.PrxCollectionBase.fromFieldRebuilder(
          rxVar: messageVar,
          field: read,
          rebuild: castProtoRebuilder,
        ),
    full: (full) => <T>(messageVar) => mk.PrxSingleBase.fromFieldRebuilder(
          rxVar: messageVar,
          field: full,
          rebuild: castProtoRebuilder,
        ),
  );

  late final dynamic Function() defaultSingleValue = fld.singleValueType.when(
    messageType: (messageType) => () => messageType.payload.emptyMessage,
  );

  late final dynamic Function(dynamic value) ensure = access.when(
    message: (message) => (value) => message.ensure(value),
  );

  Widget tileWidgetFromVar<T>(IRxVarDefault<T> rxVar) => tileWidget(prx(rxVar));

  late final crfn = crud.crfn.field.call(fld.globalIndex);

  TileConfig tileConfig<I, T>(I id, IPrxBase<T> prx) =>
      crfn.tileConfig(this, id, prx);

  Widget tileWidget<T>(IPrxBase<T> prx) => crfn.tileWidget(this, prx);

  late final IPrxCollectionBase<Map<K, V>> Function<K, V>(IPrxBase<K> prx)?
      foreignKey = crfnMapKey?.foreignKey?.let(
    (fk) => <K, V>(prx) => fk(this, prx),
  );

  late final crfnMapKey = crfn.takeIfType<CrfnMapKeyFld>();

  Widget Function<T>(IPrxBase<T> prx) _defaultSingleCrudTile() {
    Widget Function<T>(IPrxBase<T> prx) stringOrInt(
      Widget Function<T>(IPrxBase<T> prx) Function() noForeignKey,
    ) {
      final fk = foreignKey;
      if (fk == null) {
        return noForeignKey();
      } else {
        return _foreignKeyTile();
      }
    }

    return fld.valueType.when(
      boolType: () => <T>(prx) => _boolTile(
            prx.cast<IPrxSingleBase<T>>().castOptVar<bool>(),
          ),
      stringType: () => stringOrInt(
        () => <T>(prx) => _stringTile(
              prx.cast<IPrxSingleBase<T>>().castOptVar<String>(),
            ),
      ),
      intType: () => stringOrInt(
        () => <T>(prx) => _intTile(
              prx.cast<IPrxSingleBase<T>>().castOptVar<int>(),
            ),
      ),
      enumType: (enumType) => <T>(prx) => _enumTile(
            enumType.payload,
            prx.cast<IPrxSingleBase<T>>().castOptVar<ProtobufEnum>(),
          ),
      messageType: (messageType) => <T>(prx) => _messageTile(
            messageType.payload,
            prx.cast<IPrxSingleBase<T>>(),
          ),
    );
  }

  late final Widget Function<T>(IPrxBase<T> prx) defaultCrudTile =
      fld.cardinality.when(
    single: _defaultSingleCrudTile,
    mapOf: (mapOf) => <T>(prx) => _intMapButton(
          (prx as IPrxCollectionBase<T>).castPrx<Map<int, dynamic>>(),
          mapOf.value.payload,
        ),
    repeated: () => <T>(prx) => _listButton(
          prx: (prx as IPrxCollectionBase<T>).castPrx<List<dynamic>>(),
          create: defaultSingleValue,
        ),
  );

  Widget _messageTile<T>(CrdMsg msg, RxVarImplOpt<T> prx) {
    return Column(
      children: msg
          .fieldTilesFor(
            rxVar: prx,
            defaultValue: Opt.here(msg.emptyMessage),
          )
          .toList(),
    );
  }

  Widget _enumTile<T>(CrdEnum msg, RxVarImplOpt<ProtobufEnum> prx) {
    final rx = prx.mapOpt((v) => v.label).orDefault('<not set>');
    return mk.CrudButton.data(
      subtitle: rx,
      onTap: mk.RxVar.variable((context) {
        SelectDialog.showModal<ProtobufEnum>(
          context,
          items: msg.pmEnum.values(),
          itemBuilder: (context, item, isSelected) => ListTile(
            title: Text(item.label),
          ),
          showSearchBox: false,
          onChange: (value) {
            prx.value = value.here();
          },
        );
      }),
      label: label,
    );
  }

  Widget _boolTile(RxVarImplOpt<bool> prx) {
    return mk.CrudSwitch.data(
      rxVar: prx.orDefaultVar(false),
      label: label,
    );
  }

  Widget _stringTile(RxVarImplOpt<String> prx) {
    return mk.CrudButton.data(
      subtitle: prx.orDefault('<not set>'),
      onTap: mk.RxVar.variable((context) {
        StringDialogEditor(
          title: label,
          setter: prx.setHere,
        ).show(
          context,
          prx.value.orDefault(''),
        );
      }),
      label: label,
    );
  }

  Widget _intTile(RxVarImplOpt<int> prx) {
    final stringOptRx = prx.mapOpt((v) => v.toString());
    return mk.CrudButton.data(
      subtitle: stringOptRx.orDefault('<not set>'),
      onTap: mk.RxVar.variable((context) {
        StringDialogEditor(
          title: label,
          setter: (str) {
            try {
              prx.set(int.parse(str).here());
            } catch (_) {}
          },
        ).show(
          context,
          stringOptRx.value.orDefault(''),
        );
      }),
      label: label,
    );
  }

  Widget _intMapButton<V>(
    IPrxCollectionBase<Map<int, V>> prxMap,
    CrdFld valueField,
  ) {
    return mk.CrudButton.data(
      label: label,
      subtitle: prxMap
          .mapOpt((value) => value.length)
          .orDefault(0)
          .map((v) => v.toString()),
      onTap: mk.RxVar.variable((context) {
        ScaffoldPage.show(
          context,
          label,
          _intMapPage(
            prxMap,
            valueField,
          ),
        );
      }),
    );
  }

  Widget _intMapPage<V>(
    IPrxCollectionBase<Map<int, V>> prx,
    CrdFld valueField,
  ) {
    return valueField.fld.valueType.when(
      messageType: (msg) {
        return _intMapPage2(
          msg: msg.payload,
          prx: prx,
          onTap: (context, e) {
            final rxVar = prx.item(e.id);
            msg.payload.showCrudPage(
              context: context,
              rxVar: rxVar,
              actionsBar: NullWidget(),
            );
          },
          create: (key) => msg.payload.emptyMessage,
        );
      },
    );
  }

  Widget _intMapPage2<V>({
    required CrdMsg msg,
    required IPrxCollectionBase<Map<int, V>> prx,
    required void Function(BuildContext context, IntId<V> e) onTap,
    required V Function(int key) create,
  }) {
    return mk.CrudMapPage.data(
      items: prx.mapOpt(
        (value) => value
            .withIds()
            .map(
              (e) => Builder(builder: (context) {
                return ListTile(
                  title: Text(
                    msg.displayTitleString(
                      e.id,
                      e.value,
                    ),
                  ),
                  onTap: () => onTap(context, e),
                );
              }),
            )
            .toList(),
      ),
      onAdd: (context) {
        prx.rebuild((map) {
          final added = map.addWithId(create);
          onTap(context, added);
        });
      },
    );
  }

  Widget _listButton<V>({
    required IPrxCollectionBase<List<V>> prx,
    required V Function() create,
  }) {
    return mk.CrudButton.data(
      label: label,
      subtitle: prx
          .mapOpt((value) => value.length)
          .orDefault(0)
          .map((v) => v.toString()),
      onTap: mk.RxVar.variable((context) {
        ScaffoldPage.show(
          context,
          label,
          CrudListPage(
            control: mk.CrudListPageControl.data(
              items: prx,
              tile: (index, item) {
                final itemPrx = prx.item(index);
                return singleItemTileConfig(index, itemPrx);
              },
              create: create,
              onTap: (context, index) {
                final rxVar = prx.item(index);
                singleItemTap(context, rxVar);
              },
            ),
          ),
        );
      }),
    );
  }

  late final TileConfig Function<I, T>(I id, IRxVar<Opt<T>> prx)
      singleItemTileConfig = fld.singleValueType.when(
    messageType: (msg) =>
        <I, T>(id, value) => msg.payload.tileConfig(id, value),
  );

  late final String Function<I, T>(I id, T value) singleItemDisplayString =
      fld.singleValueType.when(
    messageType: (msg) =>
        <I, T>(id, value) => msg.payload.displayTitleString(id, value),
  );

  late final String Function<I, T>(I id, T value)? singleItemDisplaySubString =
      fld.singleValueType.when(
    messageType: (msg) => msg.payload.crfn.displaySubtitleString?.let(
      (sub) => <I, T>(id, value) => sub(msg.payload, id, value),
    ),
    valueType: () => null,
  );

  late final void Function<V>(BuildContext context, RxVarImplOpt<V> rxVar)
      singleItemTap = fld.singleValueType.when(
    messageType: (messageType) =>
        <V>(context, rxVar) => messageType.payload.showCrudPage(
              context: context,
              rxVar: rxVar,
              actionsBar: NullWidget(),
            ),
  );
}

@Impl()
abstract class CrxField<T> implements RxVal<Opt<T>>, PrxBase<T> {
  CrdFld get crd;
}

extension ICrxFieldX<T> on ICrxField<T> {
  Widget crudTile() => crd.tileWidget(this);
}

@Impl()
abstract class CrxCollectionField<T>
    implements CrxField<T>, PrxCollectionBase<T> {}

@Impl()
abstract class CrxSingleField<T> implements CrxField<T>, PrxSingleBase<T> {}

extension CrxFieldX<T> on ICrxField<T> {
  String get name => crd.name;
}

extension CrxFieldStringX on ICrxSingleField<String> {
  Widget stringView() => StringViewProperty.scalar(this);
}

extension CrxSingleFieldBoolX on ICrxSingleField<bool> {
  CrudSwitch crudSwitch() =>
      orDefaultVar(false).crudSwitch(name.camelCaseToLabel);
}
