import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';

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
      setter: rx.setter,
    );

    return StringViewProperty(
      label: label,
      view: rx,
      edit: editor.show,
    );
  }
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
