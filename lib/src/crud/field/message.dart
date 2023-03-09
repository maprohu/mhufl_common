import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:protobuf/protobuf.dart';

import '../crud_field.dart';
import '../crud_message.dart';
import 'crdt.dart';

part 'message.g.dart';

@Impl.data()
abstract class CrdtFldMessage<M extends GeneratedMessage,
    F extends GeneratedMessage> extends CrdtFldFull<M, F> {
  CrdtMsg<F> get value;

  @override
  late final PmMessageField<M, F> pmFld = crd.pmFld as PmMessageField<M, F>;

  @override
  F ensure(M message) => pmFld.ensure(message);

  @override
  Widget defaultTileWidget(IPrxOfType<F> prx) {
    final rxVar = prx as IPrxSingleOfType<F>;
    return Column(
      children: value
          .tileWidgets(
            rxVar: rxVar,
          )
          .toList(),
    );
  }

}
