import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/src/crud/crud_control.dart';
import '../rx.dart';
import '../widgets.dart';

part 'crud_widgets.g.dart';

@Impl()
abstract class CrudSwitch extends StatelessWidget {
  RxVar<bool> get rxVar;

  String get label;

  const CrudSwitch({
    Key? key,
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
  CrudSwitch crudSwitch(String label) =>
      mk.CrudSwitch.data(rxVar: this, label: label);
}

extension RxVarOptBoolXCrudSwitch on RxVar<Opt<bool>> {
  CrudSwitch crudSwitch(String label) => orDefaultVar(false).crudSwitch(label);
}

@Impl()
abstract class CrudButton extends StatelessWidget {
  String get label;

  RxVal<String> get subtitle;

  RxVal<void Function(BuildContext context)?> get onTap;

  const CrudButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onTap.rxBuilder((context, onTap) {
      return ListTile(
        title: Text(label),
        subtitle: subtitle.rxText(),
        onTap: onTap?.let((fn) => () => fn(context)),
      );
    });
  }
}

@Impl()
abstract class CrudMapPage<V> extends StatelessWidget {
  RxValOpt<List<Widget>> get items;

  void Function(BuildContext context) get onAdd;

  const CrudMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActionsBar(
          children: [
            ActionButton(
              label: 'Add',
              onPressed: () => onAdd(context),
            ),
          ],
        ),
        SingleChildScrollView(
          child: items.rxBuilderOrNull((context, items) {
            return Column(
              children: items,
            );
          }),
        )
      ],
    );
  }
}





class CrudListPage extends StatelessWidget {
  final CrudListPageControl control;

  const CrudListPage({Key? key, required this.control}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActionsBar(
          children: [
            ActionButton(
              label: 'Add',
              onPressed: () {
                control.onTap(context, control.add());
              },
            ),
          ],
        ),
        SingleChildScrollView(
          child: control.items.rxBuilderOrNull(
            (context, items) => Column(
              children: items
                  .mapIndexed(control.tile)
                  .mapIndexed(
                    (index, e) => ListTile(
                      title: e.title,
                      subtitle: e.subtitle,
                      onTap: () => control.onTap(context, index),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
