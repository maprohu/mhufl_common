import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/src/crud/crud_control.dart';
import 'package:protobuf/protobuf.dart';
import 'package:select_dialog/select_dialog.dart';

import '../rx.dart';
import '../widgets.dart';
import 'crud.dart';
import 'crud_field.dart';
import 'crud_ovr.dart';

part 'crud_message.g.dart';

@Impl()
abstract class CrdMsg extends CrdItem
    implements HasPdMsg<CrdMsg, CrdFld, CrdEnum> {
  late final PmMessage pmMsg = msg.messageLevel.when(
    top: (r) => crud.lib.messages[msg.index],
    nested: (p) => p.payload.pmMsg.nestedMessages$[msg.index],
  );

  late final path = msg.path.toList(growable: false);

  late final CrdtMsg crdt = pmMsg.type$(
    <M extends GeneratedMessage>() => CrdtMsg<M>(this),
  );

  late final defaultCrfn = crdt.defaultCrfn;

  late final name = msg.name;
  late final label = name.camelCaseToLabel;
}

class CrdtMsg<M extends GeneratedMessage> {
  final CrdMsg crd;

  CrdtMsg(this.crd);

  late final CrfnMsg<M> defaultCrfn = mk.CrfnMsg.create<M>(
    displayString: <I>(msg, id, value) => '($id)',
    displayTitleString: <I>(msg, id, value) => msg.displayString(id, value),
    displaySubtitleString: null,
    tileConfig: <I>(msg, id, prx) => mk.TileConfig.fromDisplayStrings<I, M>(
      prx: prx,
      title: (value) => displayTitleString(id, value),
      subtitle: displaySubtitleString?.let(
        (sub) => (value) => sub(id, value),
      ),
    ),
  );

  late final crud = crd.crud;
  late final msg = crd.msg;

  late final crfn = crud.crfn.message.call(msg.globalIndex) as CrfnMsg<M>;

  late final pmMsgOfType = crd.pmMsg as PmMessageOfType<M>;
  late final emptyMessage = pmMsgOfType.emptyMessage$;

  String displayString<I>(I id, M value) => crfn.displayString(this, id, value);

  String displayTitleString<I>(I id, M value) =>
      crfn.displayTitleString(this, id, value);

  Widget tileConfigDisplayStringTitle<I>(I id, IRxVal<Opt<M>> value) => value
      .mapOpt<String>(
        (value) => displayTitleString(id, value),
      )
      .rxTextOrNull();

  late final String Function<I>(I id, M value)? displaySubtitleString =
      crfn.displaySubtitleString?.let(
    (sub) => <I>(I id, M value) => sub(this, id, value),
  );

  Widget messageTileWidget(PrxMessage prx) {
    final rxVar = prx as IRxVar<Opt<M>>;
    final rxDef = mk.RxVarDefault.noDefault(rxVar);
    return Column(
      children: fieldTiles.map((e) => e(rxDef)).toList(),
    );
  }

  late final Iterable<Widget Function(IRxVarDefault<M> rxVar)> fieldTiles =
      msg.pdxs.map(
    (e) => e.when(
      top: (top) => (rxVar) => top.payload.crdt.tileWidgetFromVar(rxVar),
      oneof: (oneof) {
        final of = pmMsgOfType.oneofs$[oneof.index]
            as PmOneofOfMessageOfType<dynamic, Enum>;
        final label = oneof.name.camelCaseToLabel;
        final values = of.values();
        final caseLabels =
            values.map((e) => e.name.camelCaseToLabel).toList(growable: false);

        final notSet = values.last;

        final fields = oneof.fields.payloads.toList(growable: false);

        CrdFld whichField(Enum which) => fields[which.index];

        void onChange(IRxVarDefault<M> rxVar, Enum which) {
          rxVar.rebuildCastProto(
            updates: (value) {
              if (which == notSet) {
                of.clear(value);
              } else {
                whichField(which).crdt.ensure(value);
              }
            },
            defaultValue: rxVar.defaultValue,
          );
        }

        Widget whichWidget(IRxVarDefault<M> rxVar, Enum which) {
          if (which == notSet) {
            return const NullWidget();
          } else {
            return whichField(which).crdt.tileWidgetFromVar(rxVar);
          }
        }

        return (rxVar) => rxVar
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

  Iterable<Widget> tileWidgets({
    required RxVarImplOpt<M> rxVar,
    Opt<M> defaultValue = const Opt.gone(),
  }) =>
      fieldTiles.map(
        (e) => e(rxVar.withDefault(defaultValue)),
      );

  TileConfig tileConfig<I>(I id, IPrxOfType<M> prx) =>
      crfn.tileConfig(this, id, prx);

  void showCrudPage({
    required BuildContext context,
    required RxVarImplOpt<M> rxVar,
    Widget actionsBar = const NullWidget(),
  }) {
    ScaffoldPage.show(
      context,
      crd.label,
      Column(
        children: [
          actionsBar,
          SingleChildScrollView(
            child: Column(
              children: tileWidgets(
                rxVar: rxVar,
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
