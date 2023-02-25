import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import '../rx.dart';
part 'crud_widgets.g.dart';
class CrudSwitch extends StatelessWidget {
  final RxVar<bool> rxVar;
  final String label;

  const CrudSwitch({
    Key? key,
    required this.rxVar,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: rxVar.rxBuilder(
        (context, value) => Switch(
          value: value,
          onChanged: rxVar.set,
        ),
      ),
    );
  }
}

extension RxVarBoolXCrudSwitch on RxVar<bool> {
  CrudSwitch crudSwitch(String label) => CrudSwitch(rxVar: this, label: label);
}

extension RxVarOptBoolXCrudSwitch on RxVar<Opt<bool>> {
  CrudSwitch crudSwitch(String label) => orDefaultVar(false).crudSwitch(label);
}

@Impl()
abstract class CrudButton extends StatelessWidget {
  String get label;

  RxVar<String> get subtitle;

  RxVar<VoidCallback?> get onTap;

  const CrudButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onTap.rxBuilder((context, onTap) {
      return ListTile(
        title: Text(label),
        subtitle: subtitle.rxText(),
        onTap: onTap,
      );
    });
  }
}
