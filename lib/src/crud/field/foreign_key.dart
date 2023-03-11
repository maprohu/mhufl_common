import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:protobuf/protobuf.dart';
import 'package:select_dialog/select_dialog.dart';

import '../crud_props.dart';
import 'collection.dart';
import 'crdt.dart';
import 'single_value.dart';

part 'foreign_key.g.dart';

@Impl.data()
abstract class CrdtFldSingleForeignKey<M extends GeneratedMessage, F,
    FM extends GeneratedMessage, FC, FV> extends CrdtFldSingle<M, F> {
  // CrfnForeignKeyFld<M, F, FM, FV> get crfnForeignKey;
  late final crfnForeignKey =
      crd.crfn.foreignKey as CrfnForeignKeyFld<M, F, FM, FC, FV>;

  late final foreignKey = crfnForeignKey.foreignKey;
  late final foreignField = crfnForeignKey.field;

  late final foreignMessageCrdt = crud.resolveCrdtMsg(foreignField.message);
  late final foreignFieldCrdt =
      crud.resolveCrdtFld(foreignField) as CrdtFldCollection<FM, FC, F, FV>;

  int lengthOfField(FM foreignMessage) =>
      foreignField.length(foreignField.get(foreignMessage));

  @override
  Widget defaultTileWidget(PrxFieldOfMessageOfType<M, F> prx) {
    prx as PrxSingleFieldOfMessageOfType<M, F>;
    final parent = prx.parent as PrxParentForFieldValueOfMessageOfType<M, F>;
    final parentMessage = parent.message;

    final foreignMessage = foreignKey(this, parentMessage.toImpl);

    final foreignPrx = foreignFieldCrdt.prx(foreignMessage);

    return Builder(builder: (context) {
      return listTileWithFieldLabelTitle(
        (o) => o.copyWith(
          subtitle: prx.asData().mapOpt((key) {
            final item = foreignFieldCrdt.item(foreignPrx, key);

            return foreignFieldCrdt.singleLabelWidget(key, item).withKey(key);
          }).rxOrNull(),
          onTap: () {
            ScaffoldPage.show(
              context,
              label,
              foreignFieldCrdt.selectPage(
                foreignPrx,
                prx,
              ),
            );
          },
        ),
      );
    });
  }
}
