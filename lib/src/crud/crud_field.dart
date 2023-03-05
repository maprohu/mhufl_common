import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:mhufl_common/src/crud/crud_control.dart';
import 'package:protobuf/protobuf.dart';
import 'package:select_dialog/select_dialog.dart';

import 'crud_props.dart';

part 'crud_field.g.dart';

@Impl()
abstract class CrdFld extends CrdItem
    implements HasPdFld<CrdMsg, CrdFld, CrdEnum> {
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

  Widget crudTileFromVar<T>(IRxVarDefault<T> rxVar) => crudTile(prx(rxVar));

  late final fieldOverride = crud.overrides?.field?.call(fld.globalIndex);

  late final tileOverride = fieldOverride?.tile;

  late final mapKeyOverride = fieldOverride?.takeIfType<MapKeyFldOverrides>();

  // late final foreignKeyOverride =

  late final Widget Function<T>(IPrxBase<T> prx) crudTile = tileOverride?.let(
        (fn) => <T>(prx) => fn(this, prx),
  ) ??
      defaultCrudTile;

  late final Widget Function<T>(IPrxBase<T> prx) defaultCrudTile =
  fld.cardinality.when(
    single: () => <T>(prx) {
      prx as IPrxSingleBase<T>;

      void mapKeyType() {

      }

      return fld.valueType.when(
        boolType: () => _boolTile(prx.castOptVar<bool>()),
        stringType: () => _stringTile(prx.castOptVar<String>()),
        intType: () => _intTile(prx.castOptVar<int>()),
        enumType: (enumType) => _enumTile(
          enumType.payload,
          prx.castOptVar<ProtobufEnum>(),
        ),
        messageType: (messageType) => _messageTile(messageType.payload, prx),
      );
    },
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
    final rx = prx.orDefaultVar('<not set>');
    return mk.CrudButton.data(
      subtitle: rx,
      onTap: mk.RxVar.variable((context) {
        StringDialogEditor(
          title: label,
          setter: rx.set,
        ).show(
          context,
          rx.value,
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
          prx,
              (context, e) {
            final rxVar = prx.item(e.id);
            msg.payload.showCrudPage(
              context: context,
              rxVar: rxVar,
              actionsBar: NullWidget(),
            );
          },
              (key) => msg.payload.emptyMessage,
        );
      },
    );
  }

  Widget _intMapPage2<V>(
      IPrxCollectionBase<Map<int, V>> prx,
      void Function(BuildContext context, IntId<V> e) onTap,
      V Function(int key) create,
      ) {
    return mk.CrudMapPage.data(
      items: prx.mapOpt(
            (value) => value
            .withIds()
            .map(
              (e) => Builder(builder: (context) {
            return ListTile(
              title: Text(e.id.toString()),
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
              tile: (index, item) => mk.TileConfig.data(
                title: Text(index.toString()),
              ),
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
  Widget crudTile() => crd.crudTile(this);
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
