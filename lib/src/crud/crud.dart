import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:mhufl_common/src/crud/crud_control.dart';
import 'package:protobuf/protobuf.dart';
import 'package:select_dialog/select_dialog.dart';

part 'crud.g.dart';

class ShowDetails {
  final String title;
  final Iterable<Widget> actions;
  final Iterable<Widget> items;

  Future<void> show<T>(BuildContext context) async {
    return ScaffoldPage.show(
      context,
      title,
      Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                if (actions.isNotEmpty) ActionsBar(children: actions.toList()),
                ...items
              ],
            ),
          );
        },
      ),
    );
  }

  const ShowDetails({
    required this.title,
    required this.actions,
    required this.items,
  });
}

class StringViewProperty extends StatelessWidget {
  final String label;
  final RxVal<String> view;
  final void Function(BuildContext, String)? edit;

  const StringViewProperty(
      {Key? key, required this.label, required this.view, this.edit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return view.rxBuilder((context, value) {
      return ListTile(
        title: Text(label),
        subtitle: view.rxText(),
        onTap: edit?.let((e) => () => e(context, value)),
      );
    });
  }

  static StringViewProperty rx({
    required String label,
    required RxVar<String> rx,
  }) {
    final editor = StringDialogEditor(
      title: label,
      setter: rx.set,
    );

    return StringViewProperty(
      label: label,
      view: rx,
      edit: editor.show,
    );
  }

  static StringViewProperty scalar(
    CrxSingleField<String> prop,
  ) =>
      rx(
        label: prop.name.camelCaseToLabel,
        rx: prop.orEmptyVar(),
      );
}

class StringDialogEditor {
  final String title;
  final void Function(String) setter;

  Future<void> show(BuildContext context, String initial) async {
    final value = await showTextInputDialog(
      context,
      title: title,
      initial: initial,
    );
    if (value != null) {
      setter(value);
    }
  }

  const StringDialogEditor({
    required this.title,
    required this.setter,
  });
}

class TileDefaults {}

typedef CrudFieldTileCustomizer = Widget Function<T>(
    CrdFld fld, PrxBase<T> prx, TileDefaults defaults);

typedef CrudFieldTileOverrides = CrudFieldTileCustomizer? Function(
    FieldIndex index);

class Crud {
  final PmLib lib;
  final CrudFieldTileOverrides? tileOverrides;

  Crud(
    this.lib, {
    this.tileOverrides,
  });

  late final root = mk.PdRoot.create<CrdMsg, CrdFld, CrdEnum>(
    descriptorSet: FileDescriptorSet.fromJson(lib.descriptor).asConstant(),
    msgPayload: (msg) =>
        mk.CrdMsg.create(crud: asConstant(), msg: msg.asConstant()),
    fldPayload: (fld) => mk.CrdFld(crud: asConstant(), fld: fld.asConstant()),
    enumPayload: (enm) => mk.CrdEnum(crud: asConstant(), enm: enm.asConstant()),
  );

  late final resolveMessage = Cache((HasMessagePath message) =>
      root.resolveMessageIndex(message.path$).payload);

  late final resolveField = Cache((HasFieldPath field) =>
      resolveMessage(field.message).msg.fields[field.index].payload);

  CrxSingleField<T> crxSingle<T>(PrxSingleOfType<T, dynamic> prx) =>
      mk.CrxSingleField.fromPrxSingleBase(
        prxSingleBase: prx,
        crd: resolveField.get(prx.field()).asConstant(),
      );

  CrxCollectionField<T> crxCollection<T>(PrxCollectionOfType<T, dynamic> prx) =>
      mk.CrxCollectionField.fromPrxCollectionBase(
        prxCollectionBase: prx,
        crd: resolveField.get(prx.field()).asConstant(),
      );
}

abstract class CrdItem {
  Crud get crud;
}

@Impl()
abstract class CrdMsg extends CrdItem
    implements HasPdMsg<CrdMsg, CrdFld, CrdEnum> {
  late final path = msg.path.toList(growable: false);
  late final PmMessage pmMsg = msg.messageLevel.when(
    top: (r) => crud.lib.messages[msg.index],
    nested: (p) => p.payload.pmMsg.nestedMessages$[msg.index],
  );

  late final pmMsgOfType = pmMsg as PmMessageOfType<dynamic, dynamic>;

  late final emptyMessage = pmMsgOfType.emptyMessage$;

  late final name = msg.name;
  late final label = name.camelCaseToLabel;

  Iterable<Widget> fieldTilesFor<T>(RxVarOpt<T> rxVar) =>
      fieldTiles.map((e) => e(rxVar));

  late final Iterable<Widget Function<T>(RxVarOpt<T> rxVar)> fieldTiles =
      msg.pdxs.map(
    (e) => e.when(
      top: (top) =>
          <T>(RxVarOpt<T> rxVar) => top.payload.crudTileFromVar(rxVar),
      oneof: (oneof) {
        final of =
            pmMsgOfType.oneofs$[oneof.index] as PmTypedOneOf<dynamic, Enum>;
        final label = oneof.name.camelCaseToLabel;
        final values = of.values();
        final caseLabels =
            values.map((e) => e.name.camelCaseToLabel).toList(growable: false);

        final notSet = values.last;

        final fields = oneof.fields.payloads.toList(growable: false);

        CrdFld whichField(Enum which) => fields[which.index];

        void onChange<T>(RxVarOpt<T> rxVar, Enum which) {
          rxVar.rebuildCastProto(
            updates: (value) {
              if (which == notSet) {
                of.clear(value);
              } else {
                whichField(which).ensure(value);
              }
            },
          );
        }

        Widget whichWidget<T>(RxVarOpt<T> rxVar, Enum which) {
          if (which == notSet) {
            return const NullWidget();
          } else {
            return whichField(which).crudTileFromVar(rxVar);
          }
        }

        return <T>(RxVarOpt<T> rxVar) => rxVar
                .mapOpt((value) => of.which(value))
                .rxBuilderOrNull((context, which) {
              return Column(
                children: [
                  ListTile(
                    title: Text(label),
                    subtitle: Text(caseLabels[which.index]),
                    onTap: () {
                      SelectDialog.showModal<Enum>(
                        context,
                        selectedValue: which,
                        items: values,
                        onChange: (which) => onChange(rxVar, which),
                        showSearchBox: false,
                        itemBuilder: (context, item, isSelected) => ListTile(
                          title: Text(caseLabels[item.index]),
                          selected: isSelected,
                        ),
                      );
                    },
                  ),
                  whichWidget(rxVar, which),
                ],
              );
            });
      },
    ),
  );

  void showCrudPage<T>({
    required BuildContext context,
    required RxVarOpt<T> rxVar,
    required Widget actionsBar,
  }) {
    ScaffoldPage.show(
      context,
      label,
      Column(
        children: [
          actionsBar,
          SingleChildScrollView(
            child: Column(
              children: fieldTilesFor(rxVar).toList(),
            ),
          )
        ],
      ),
    );
  }
}

// @Impl()
// abstract class Modifier<T> {
//   PrxCollectionBase<T> get collection;
//
//   PrxSingleBase<T> get single;
// }
//
// extension ModifierX<T> on Modifier<T> {}

@Impl()
abstract class CrdFld extends CrdItem
    implements HasPdFld<CrdMsg, CrdFld, CrdEnum> {
  late final pmFld = fld.msg.payload.pmMsgOfType.fields$[fld.index];
  late final name = fld.name;
  late final label = name.camelCaseToLabel;

  late final pmFldRead = pmFld as PmFieldRead;
  late final pmFldFull = pmFld as PmFieldFull;
  late final pmFldMessage = pmFld as PmFieldMessage;

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

  late final PrxBase Function<T>(RxVarOpt<T> messageVar) prx = access.when(
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
    message: (message) =>
        <T>(messageVar) => mk.PrxSingleBase.fromMessageFieldRebuilder(
              rxVar: messageVar,
              field: message,
              rebuild: castProtoRebuilder,
              defaultMessage: defaultSingleValue,
            ),
  );

  late final dynamic Function() defaultSingleValue = fld.singleValueType.when(
    messageType: (messageType) => () => messageType.payload.emptyMessage,
  );

  late final dynamic Function(dynamic value) ensure = access.when(
    message: (message) => (value) => message.ensure(value),
  );

  Widget crudTileFromVar<T>(RxVarOpt<T> rxVar) => crudTile(prx(rxVar));

  late final Widget Function<T>(PrxBase<T> prx) crudTile = crud.tileOverrides
          ?.call(fld.fieldIndex)
          ?.let((fn) => <T>(prx) => fn(this, prx, TileDefaults())) ??
      defaultCrudTile;

  late final Widget Function<T>(PrxBase<T> prx) defaultCrudTile =
      fld.cardinality.when(
    single: () => <T>(prx) {
      prx as PrxSingleBase<T>;
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
          (prx as PrxCollectionBase<T>).castPrx<Map<int, dynamic>>(),
          mapOf.value.payload,
        ),
    repeated: () => <T>(prx) => _listButton(
          prx: (prx as PrxCollectionBase<T>).castPrx<List<dynamic>>(),
          create: defaultSingleValue,
        ),
  );

  Widget _messageTile<T>(CrdMsg msg, RxVarOpt<T> prx) {
    return Column(
      children: msg.fieldTilesFor(prx).toList(),
    );
  }

  Widget _enumTile<T>(CrdEnum msg, RxVarOpt<ProtobufEnum> prx) {
    final rx = prx.mapOpt((v) => v.name).orDefault('<not set>');
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
          onChange: (value) {},

        );
      }),
      label: label,
    );
  }

  Widget _boolTile(RxVarOpt<bool> prx) {
    return mk.CrudSwitch.data(
      rxVar: prx.orDefaultVar(false),
      label: label,
    );
  }

  Widget _stringTile(RxVarOpt<String> prx) {
    final rx = prx.orDefaultVar('');
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

  Widget _intTile(RxVarOpt<int> prx) {
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
    PrxCollectionBase<Map<int, V>> prxMap,
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
    PrxCollectionBase<Map<int, V>> prx,
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
    PrxCollectionBase<Map<int, V>> prx,
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
    required PrxCollectionBase<List<V>> prx,
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

  late final void Function<V>(BuildContext context, RxVarOpt<V> rxVar)
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
abstract class CrdEnum extends CrdItem
    implements HasPdEnum<CrdMsg, CrdFld, CrdEnum> {
  late final PmEnum pmEnum = enm.parent.when(
    root: (root) => crud.lib.enums[enm.index],
    msg: (msg) => msg.payload.pmMsg.nestedEnums$[enm.index],
  );

}

abstract class CrxField<T> implements RxValOpt<T> {
  CrdFld get crd;

  Widget crudTile();
}

@Impl([PrxCollectionBase])
abstract class CrxCollectionField<T>
    implements CrxField<T>, PrxCollectionBase<T> {
  @override
  Widget crudTile() => crd.crudTile(this);
}

@Impl([PrxSingleBase])
abstract class CrxSingleField<T> implements CrxField<T>, PrxSingleBase<T> {
  @override
  Widget crudTile() => crd.crudTile(this);
}

extension CrxFieldX<T> on CrxField<T> {
  String get name => crd.name;
}

extension CrxFieldStringX on CrxSingleField<String> {
  Widget stringView() => StringViewProperty.scalar(this);
}

extension CrxSingleFieldBoolX on CrxSingleField<bool> {
  CrudSwitch crudSwitch() =>
      orDefaultVar(false).crudSwitch(name.camelCaseToLabel);
}
