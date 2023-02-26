import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:mhufl_common/src/crud/crud_control.dart';
import 'package:protobuf/protobuf.dart';

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

class Crud<L extends PmLib<L>> {
  final L lib;

  Crud(this.lib);

  late final root = mk.PdRoot.create<CrdMsg<L>, CrdFld<L>, CrdEnum<L>>(
    descriptorSet: FileDescriptorSet.fromJson(lib.descriptor).asConstant(),
    msgPayload: (msg) =>
        mk.CrdMsg.create(crud: asConstant(), msg: msg.asConstant()),
    fldPayload: (fld) => mk.CrdFld(crud: asConstant(), fld: fld.asConstant()),
    enumPayload: (enm) => mk.CrdEnum(crud: asConstant(), enm: enm.asConstant()),
  );

  late final resolveMessage = Cache((HasMessagePath<L> message) =>
      root.resolveMessageIndex(message.path$).payload);

  late final resolveField = Cache((HasFieldPath<L> field) =>
      resolveMessage(field.message).msg.fields[field.index].payload);

  CrxSingleField<T> crxSingle<T>(PrxSingleOfType<T, L> prx) =>
      mk.CrxSingleField.fromPrxSingleBase(
        prxSingleBase: prx,
        crd: resolveField.get(prx.field()).asConstant(),
      );

  CrxCollectionField<T> crxCollection<T>(PrxCollectionOfType<T, L> prx) =>
      mk.CrxCollectionField.fromPrxCollectionBase(
        prxCollectionBase: prx,
        crd: resolveField.get(prx.field()).asConstant(),
      );
}

abstract class CrdItem<L extends PmLib<L>> {
  Crud<L> get crud;
}

@Impl()
abstract class CrdMsg<L extends PmLib<L>> extends CrdItem<L>
    implements HasPdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> {
  late final path = msg.path.toList(growable: false);
  late final PmMessage<L> pmMsg = msg.messageLevel.when(
    top: (r) => crud.lib.messages[msg.index],
    nested: (p) => p.payload.pmMsg.nestedMessages$[msg.index],
  );

  late final pmMsgOfType = pmMsg as PmMessageOfType<dynamic, L>;

  late final emptyMessage = pmMsgOfType.emptyMessage$;

  late final name = msg.name;
  late final label = name.camelCaseToLabel;

  Iterable<Widget> fieldTiles<T>(RxVarOpt<T> rxVar) {
    return msg.pdxs.map((e) => e.when(
          top: (top) => top.payload.crudTileFromVar(rxVar),
          oneof: (oneof) {
            final of =
                pmMsgOfType.oneofs$[oneof.index] as PmTypedOneOf<T, Enum>;
            return rxVar
                .mapOpt((value) => of.which(value))
                .rxBuilderOrNull((context, which) {
              return Column(
                children: [
                  ListTile(
                    title: Text(oneof.name.camelCaseToLabel),
                    subtitle: Text(which.name.camelCaseToLabel),
                  )
                ],
              );
            });
          },
        ));
  }

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
              children: fieldTiles(rxVar).toList(),
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
abstract class CrdFld<L extends PmLib<L>> extends CrdItem<L>
    implements HasPdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> {
  late final pmFld = fld.msg.payload.pmMsgOfType.fields$[fld.index]
      as PmTypedField<dynamic, dynamic, L>;
  late final name = fld.name;
  late final label = name.camelCaseToLabel;

  late final pmSingleFld = pmFld as PmSingleField<dynamic, dynamic, L>;

  late final access = (fld.isCollection
      ? mk.PmAccessRead.create(pmFld) as PmAccessBase<dynamic, dynamic>
      : mk.PmAccessFull.create(pmSingleFld));

  PrxBase prx<T>(RxVarOpt<T> messageVar) {
    return access.when(
      read: (read) => mk.PrxCollectionBase.fromFieldRebuilder(
        rxVar: messageVar,
        field: read,
        rebuild: castProtoRebuilder,
      ),
      full: (full) => mk.PrxSingleBase.fromFieldRebuilder(
        rxVar: messageVar,
        field: full,
        rebuild: castProtoRebuilder,
      ),
    );
  }

  late final defaultSingleValue = fld.singleValueType.when(
    messageType: (messageType) => messageType.payload.emptyMessage,
  );

  Widget crudTileFromVar<T>(RxVarOpt<T> rxVar) => crudTile(prx(rxVar));

  late final Widget Function<T>(PrxBase<T> prx) crudTile = fld.cardinality.when(
    single: () => <T>(prx) {
      prx as PrxSingleBase<T>;
      return fld.valueType.when(
        boolType: () => _boolTile(prx.castOptVar<bool>()),
        stringType: () => _stringTile(prx.castOptVar<String>()),
      );
    },
    mapOf: (mapOf) => <T>(prx) => _intMapButton(
          (prx as PrxCollectionBase<T>).castPrx<Map<int, dynamic>>(),
          mapOf.value.payload,
        ),
    repeated: () => <T>(prx) => _listButton(
          prx: (prx as PrxCollectionBase<T>).castPrx<List<dynamic>>(),
          create: () => defaultSingleValue,
        ),
  );

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

  Widget _intMapButton<V>(
    PrxCollectionBase<Map<int, V>> prxMap,
    CrdFld<L> valueField,
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
    CrdFld<L> valueField,
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
abstract class CrdEnum<L extends PmLib<L>> extends CrdItem<L>
    implements HasPdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> {}

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
