import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/src/crud/crud_control.dart';
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
  static final defaultCrfn = mk.CrfnMsg.create(
    displayString: <I, T>(msg, id, value) => '($id)',
    displayTitleString: <I, T>(msg, id, value) => msg.displayString(id, value),
    displaySubtitleString: null,
    tileConfig: <I, T>(msg, id, prx) => mk.TileConfig.fromDisplayStrings(
      prx: prx,
      title: (value) => msg.displayTitleString(id, value),
      subtitle: msg.displaySubtitleString?.let(
        (sub) => (value) => sub(id, value),
      ),
    ),
  );

  late final path = msg.path.toList(growable: false);

  late final PmMessage pmMsg = msg.messageLevel.when(
    top: (r) => crud.lib.messages[msg.index],
    nested: (p) => p.payload.pmMsg.nestedMessages$[msg.index],
  );

  late final crfn = crud.crfn.message.call(msg.globalIndex);

  String displayString<I, T>(I id, T value) =>
      crfn.displayString(this, id, value);

  String displayTitleString<I, T>(I id, T value) =>
      crfn.displayTitleString(this, id, value);

  Widget tileConfigDisplayStringTitle<I, T>(I id, IRxVal<Opt<T>> value) => value
      .mapOpt<String>(
        (value) => displayTitleString(id, value),
  )
      .rxTextOrNull();

  late final String Function<I, T>(I id, T value)? displaySubtitleString =
      crfn.displaySubtitleString?.let(
    (sub) => <I, T>(I id, T value) => sub(this, id, value),
  );

  TileConfig tileConfig<I, T>(I id, IRxVar<Opt<T>> prx) =>
      crfn.tileConfig(this, id, prx);

  late final pmMsgOfType = pmMsg as PmMessageOfType<dynamic>;

  late final emptyMessage = pmMsgOfType.emptyMessage$;

  late final name = msg.name;
  late final label = name.camelCaseToLabel;

  Iterable<Widget> fieldTilesFor<T>({
    required RxVarImplOpt<T> rxVar,
    Opt<T> defaultValue = const Opt.gone(),
  }) =>
      fieldTiles.map(
        (e) => e(rxVar.withDefault(defaultValue)),
      );

  late final Iterable<Widget Function<T>(IRxVarDefault<T> rxVar)> fieldTiles =
      msg.pdxs.map(
    (e) => e.when(
      top: (top) => <T>(rxVar) => top.payload.tileWidgetFromVar(rxVar),
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

        void onChange<T>(IRxVarDefault<T> rxVar, Enum which) {
          rxVar.rebuildCastProto(
            updates: (value) {
              if (which == notSet) {
                of.clear(value);
              } else {
                whichField(which).ensure(value);
              }
            },
            defaultValue: rxVar.defaultValue,
          );
        }

        Widget whichWidget<T>(IRxVarDefault<T> rxVar, Enum which) {
          if (which == notSet) {
            return const NullWidget();
          } else {
            return whichField(which).tileWidgetFromVar(rxVar);
          }
        }

        return <T>(rxVar) => rxVar
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
    required RxVarImplOpt<T> rxVar,
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
              children: fieldTilesFor(
                rxVar: rxVar,
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
