import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';

abstract class CrdListPage<I, V> extends StatelessWidget {
  const CrdListPage({Key? key}) : super(key: key);

  IRxVal<Opt<List<I>>> get ids;

  Widget Function(BuildContext context, I id) get itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ids.rxBuilderOrNull(
      (context, ids) => Column(
        children: ids
            .map(
              (id) => itemBuilder(context, id),
            )
            .toList(growable: false),
      ),
    );
  }
}
