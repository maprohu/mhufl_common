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
abstract class CrdtFldSingleForeignKey<M extends GeneratedMessage, F, T>
    extends CrdtFldSingle<M, F> {
  ForeignKey<M, F, T> get foreignKey;

  @override
  Widget defaultTileWidget(IPrxOfType<F> prx) {
    final source = foreignKey(this, prx);

    return Builder(
      builder: (context) {
        return NullWidget();
      },
    );
  }
}

extension CrdtFldSingleForeignKeyFactoryX on CrdtFldSingleForeignKey$Factory {}
