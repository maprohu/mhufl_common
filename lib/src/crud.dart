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
    RxProtoScalar<String> prop,
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

extension RxProtoScalarBoolX on RxProtoScalar<bool> {
  Widget boolEditor() {
    return ListTile(
      key: ValueKey(name),
      title: Text(name.camelCaseToLabel),
      trailing: orDefault(false).rxBuilder(
        (context, value) => Switch(
          value: value,
          onChanged: (bool value) {
            this.value = value.here();
          },
        ),
      ),
    );
  }
}

class Crud<L extends PmLib> {
  final L lib;

  Crud(this.lib);

  late final root = mk.PdRoot(
    descriptorSet: FileDescriptorSet.fromJson(lib.descriptor).asConstant(),
    msgPayload: (msg) =>
        mk.CrdMsg.create(crud: asConstant(), msg: msg.asConstant()),
    fldPayload: (fld) => mk.CrdFld(crud: asConstant(), fld: fld.asConstant()),
    enumPayload: (enm) => mk.CrdEnum(crud: asConstant(), enm: enm.asConstant()),
  );

  late final resolveMessage = Cache(
      (PmTypedMessage<dynamic, L, dynamic> message) =>
          root.resolveMessageIndex(message.path$).payload);

  late final resolveField = Cache(
      (PmTypedField<dynamic, dynamic, L, dynamic> field) =>
          resolveMessage(field.message).msg.fields[field.index].payload);

// Widget crudButton<T, V, M extends PmMessage<L>,
//     F extends PmTypedField<T, V, L, M>>(PrxValue<V, F, L, M> value) {
//   return Builder(builder: (context) {
//     return ListTile(
//       title: Text(info.name.camelCaseToLabel),
//       subtitle: val
//           .getMapField(info)
//           .mapOpt((m) => m.length)
//           .orDefault(0)
//           .map(
//             (v) => v.toString(),
//       )
//           .rxText(),
//       onTap: () {
//         ScaffoldPage.show(
//           context,
//           info.name.camelCaseToLabel,
//           protoMapCrudPage(
//             val,
//             info,
//             rebuild,
//             Navigator.pop,
//           ),
//         );
//       },
//     );
//   });
//
// }
}

abstract class CrdItem<L extends PmLib> {
  Crud<L> get crud;
}

@Impl()
abstract class CrdMsg<L extends PmLib> extends CrdItem<L>
    implements HasPdMsg<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> {
  late final path = msg.path.toList(growable: false);
  late final PmTypedMessage<dynamic, L, dynamic> pmMsg = msg.messageLevel.when(
    top: (r) => crud.lib.messages[msg.index],
    nested: (p) => p.payload.pmMsg.nestedMessages$[msg.index],
  ) as PmTypedMessage<dynamic, L, dynamic>;
}

@Impl()
abstract class CrdFld<L extends PmLib> extends CrdItem<L>
    implements HasPdFld<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> {
  late final PmTypedField<dynamic, dynamic, L, dynamic> pmFld;
}

@Impl()
abstract class CrdEnum<L extends PmLib> extends CrdItem<L>
    implements HasPdEnum<CrdMsg<L>, CrdFld<L>, CrdEnum<L>> {}
