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

  late final CrfnMsg defaultCrfn = pmMsg.type$(
    <M extends GeneratedMessage>() => CrdtMsg.createDefaultCrfn<M>(),
  );

  late final name = msg.name;
  late final label = name.camelCaseToLabel;
}

class CrdtMsg<M extends GeneratedMessage> {
  final CrdMsg crd;

  CrdtMsg(this.crd);

  static CrfnMsg<M> createDefaultCrfn<M extends GeneratedMessage>() =>
      mk.CrfnMsg.create<M>(
        displayString: <I>(msg, id, value) => '($id)',
        displayTitleString: <I>(msg, id, value) => msg.displayString(id, value),
        displaySubtitleString: null,
        tileConfig: <I>(msg, id, prx) => mk.TileConfig.fromDisplayStrings<I, M>(
          prx: prx,
          title: (value) => msg.displayTitleString(id, value),
          subtitle: msg.displaySubtitleString?.let(
            (sub) => (value) => sub(id, value),
          ),
        ),
        singleLabelWidget: <I>(msg, id, prx) => prx
            .asImpl()
            .mapOpt((value) => msg.displayString(id, value))
            .rxTextOrNull(),
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
    final rxVar = prx as PrxMessageOfType<M>;
    return Column(
      children: fieldTiles
          .map(
            (widgetFn) => widgetFn(rxVar.toImpl),
          )
          .toList(),
    );
  }

  late final Iterable<Widget Function(PrxOfMessage<M> rxVar)> fieldTiles =
      msg.pdxs.map(
    (e) => e.when(
      top: (top) => (rxVar) => top.payload.crdt.tileWidgetFromMessageVar(rxVar),
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

        void onChange(PrxOfMessage<M> rxVar, Enum which) {
          rxVar.asImpl().rebuildCastProto(
                updates: (value) {
                  if (which == notSet) {
                    of.clear(value);
                  } else {
                    whichField(which).crdt.ensure(value);
                  }
                },
                defaultValue: rxVar.asImpl().defaultValue.asConstant(),
              );
        }

        Widget whichWidget(PrxOfMessage<M> rxVar, Enum which) {
          if (which == notSet) {
            return const NullWidget();
          } else {
            return whichField(which).crdt.tileWidgetFromMessageVar(rxVar);
          }
        }

        return (rxVar) => rxVar
                .asImpl()
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
    required PrxOfMessage<M> rxVar,
  }) =>
      fieldTiles.map(
        (e) => e(rxVar),
      );

  TileConfig tileConfig<I>(I id, PrxOfType<M> prx) =>
      crfn.tileConfig(this, id, prx);

  Widget singleLabelWidget<I>(I id, PrxOfType<M> prx) =>
      crfn.singleLabelWidget(this, id, prx);

  void showCrudPage({
    required BuildContext context,
    required PrxOfMessage<M> rxVar,
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
