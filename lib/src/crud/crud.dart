import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:select_dialog/select_dialog.dart';

import 'crud_field.dart';
import 'crud_props.dart';

part 'crud.g.dart';

class CrdKey<T> extends KeyOf<IRxVar<Opt<T>>> {
  const CrdKey();
}

@Impl.data()
abstract class Crud {
  PmLib get lib;

  CrudOverrides? get overrides;

  late final root = mk.PdRoot.create<CrdMsg, CrdFld, CrdEnum>(
    descriptorSet: FileDescriptorSet.fromJson(lib.descriptor).asConstant(),
    msgPayload: (msg) =>
        mk.CrdMsg.create(crud: asConstant(), msg: msg.asConstant()),
    fldPayload: (fld) => mk.CrdFld(crud: asConstant(), fld: fld.asConstant()),
    enumPayload: (enm) => mk.CrdEnum(crud: asConstant(), enm: enm.asConstant()),
  );

  late final resolveMessage = Cache((HasMessagePath message) =>
      root.resolveMessageIndex(message.path$).payload);

  late final resolveField = Cache((HasFieldPath field) =>
      resolveMessage(field.message).msg.fields[field.index].payload);

  CrxSingleField$Impl<T> crxSingle<T>(IPrxSingleOfType<T, dynamic> prx) =>
      mk.CrxSingleField.fromPrxSingleBase(
        prxSingleBase: prx,
        crd: resolveField.get(prx.field()).asConstant(),
      );

  CrxCollectionField$Impl<T> crxCollection<T>(IPrxCollection<T, dynamic> prx) =>
      mk.CrxCollectionField.fromPrxCollectionBase(
        prxCollectionBase: prx,
        crd: resolveField.get(prx.field()).asConstant(),
      );
}

extension ICrudX on ICrud {
  Crud$Impl override(CrudOverrides overrides) => data$
      .overrideWith(data$.copyWith(overrides: overrides))
      .asCrud();
}

abstract class CrdItem {
  Crud get crud;
}

@Impl()
abstract class CrdMsg extends CrdItem
    implements HasPdMsg<CrdMsg, CrdFld, CrdEnum> {
  late final path = msg.path.toList(growable: false);
  late final PmMessage pmMsg = msg.messageLevel.when(
    top: (r) => crud.lib.messages[msg.index],
    nested: (p) => p.payload.pmMsg.nestedMessages$[msg.index],
  );

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
      top: (top) => <T>(rxVar) => top.payload.crudTileFromVar(rxVar),
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
            return whichField(which).crudTileFromVar(rxVar);
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

@Impl()
abstract class CrdEnum extends CrdItem
    implements HasPdEnum<CrdMsg, CrdFld, CrdEnum> {
  late final PmEnum pmEnum = enm.parent.when(
    root: (root) => crud.lib.enums[enm.index],
    msg: (msg) => msg.payload.pmMsg.nestedEnums$[enm.index],
  );
}
