import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';

abstract class CrdSelectRadioTile<I extends Object, V> extends StatelessWidget {
  const CrdSelectRadioTile({Key? key}) : super(key: key);

  I get id;

  IRxVar<Opt<V>> get item;

  IRxVar<Opt<I>> get selected;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      selected.rxBuilder(
        (context, selectedId) => Radio<I>(
          value: id,
          groupValue: selectedId.orNull,
          onChanged: (value) {
            selected.value = value.nullableAsOpt();
          },
        ),
      ),
    ]);
  }
}


