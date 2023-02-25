import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';

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

class Crud<L extends PmLib> {
  final L lib;

  Crud(this.lib);

  late final root = mk.PdRoot.create<CrdMsg<L>, CrdFld<L>, CrdEnum<L>>(
    descriptorSet: FileDescriptorSet.fromJson(lib.descriptor).asConstant(),
    msgPayload: (msg) =>
        mk.CrdMsg.create(crud: asConstant(), msg: msg.asConstant()),
    fldPayload: (fld) => mk.CrdFld(crud: asConstant(), fld: fld.asConstant()),
    enumPayload: (enm) => mk.CrdEnum(crud: asConstant(), enm: enm.asConstant()),
  );

  late final resolveMessage = Cache((PmMessage<L> message) =>
      root.resolveMessageIndex(message.path$).payload);

  late final resolveField = Cache((PmFieldOfLib<L> field) =>
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

abstract class CrdItem<L extends PmLib> {
  Crud<L> get crud;
}

@Impl()
abstract class CrdMsg<L extends PmLib> extends CrdItem<L>
    implements HasPdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> {
  late final path = msg.path.toList(growable: false);
  late final PmMessage<L> pmMsg = msg.messageLevel.when(
    top: (r) => crud.lib.messages[msg.index],
    nested: (p) => p.payload.pmMsg.nestedMessages$[msg.index],
  ) as PmMessage<L>;
}

@Impl([PrxCollectionBase, PrxSingleBase])
abstract class Modifier<T> implements PrxCollectionBase<T>, PrxSingleBase<T> {}

extension ModifierX<T> on Modifier<T> {}

@Impl()
abstract class CrdFld<L extends PmLib> extends CrdItem<L>
    implements HasPdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> {
  late final PmTypedField<dynamic, dynamic, L, dynamic> pmFld;
  late final name = fld.name;
  late final label = name.camelCaseToLabel;

  Widget crudTile<T>(Modifier<T> prx) {
    return fld.cardinality.when(
      single: () => fld.valueType.when(boolType: () {
        return CrudSwitch(
          rxVar: prx.castVar<Opt<bool>>().orDefaultVar(false),
          label: label,
        );
      }),
      mapOf: (mapOf) => mk.CrudButton.data(
        label: label,
        subtitle: mk.RxVar.variable('0'),
        onTap: mk.RxVar.variable(null),
      ),
    );
  }

  Widget crudTileSingle(PrxSingleBase prx) => crudTile(
        mk.Modifier.fromPrxSingleBase(
          prxSingleBase: prx,
          rebuild: Functions.throws1,
        ),
      );

  Widget crudTileCollection(PrxCollectionBase prx) => crudTile(
        mk.Modifier.fromPrxCollectionBase<dynamic>(
          prxCollectionBase: prx,
          set: Functions.throws1,
        ),
      );
}

@Impl()
abstract class CrdEnum<L extends PmLib> extends CrdItem<L>
    implements HasPdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> {}

abstract class CrxField<T> implements RxValOpt<T> {
  CrdFld get crd;

  Widget crudTile();
}

@Impl([PrxCollectionBase])
abstract class CrxCollectionField<T>
    implements CrxField<T>, PrxCollectionBase<T> {
  @override
  Widget crudTile() => crd.crudTileCollection(this);
}

@Impl([PrxSingleBase])
abstract class CrxSingleField<T> implements CrxField<T>, PrxSingleBase<T> {
  @override
  Widget crudTile() => crd.crudTileSingle(this);
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
