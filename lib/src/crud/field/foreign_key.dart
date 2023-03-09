import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:protobuf/protobuf.dart';
import 'package:select_dialog/select_dialog.dart';

import '../crud_props.dart';
import 'crdt.dart';
import 'single_value.dart';

part 'foreign_key.g.dart';

@Impl.data()
abstract class CrdtFldSingleForeignKey<M extends GeneratedMessage, F, T extends GeneratedMessage>
    extends CrdtFldSingle<M, F> {
  ForeignKey<M, F, T> get foreignKey;
  PmMessageOfType<T> get message;

  late final messageCrdt = crud.resolveCrdtMsg(message);

  @override
  Widget defaultTileWidget(IPrxOfType<F> prx) {
    final source = foreignKey(this, prx);
    final field = source.field();

    final length = source.mapOpt(field.length).orDefault(0);

    return Builder(
      builder: (context) {
        return listTileWithFieldLabelTitle(
          (o) => o.copyWith(
            subtitle: length.rxText((v) => v.toString()),
            onTap: () {
              ScaffoldPage.show(context, title, body);

            },
          ),
        );
      }
    );
  }
}

