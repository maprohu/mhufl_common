import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:mhufl_common/src/crud/crud_control.dart';
import 'package:protobuf/protobuf.dart';
import 'package:select_dialog/select_dialog.dart';


class StringViewProperty extends StatelessWidget {
  final String label;
  final IRxVal<String> view;
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
    required IRxVar<String> rx,
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
      ICrxSingleField<String> prop,
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
