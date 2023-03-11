import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:protobuf/protobuf.dart';

import '../crud_field.dart';
import '../crud_ovr.dart';
import '../crud_control.dart';
import 'collection.dart';
import 'crdt.dart';

part 'map.g.dart';

@Impl.data()
abstract class CrdtFldMap<M extends GeneratedMessage, K extends Object, V>
    extends CrdtFldCollection<M, Map<K, V>, K, V> {
  @override
  late final pmFld = crd.pmFld as PmMapField<M, K, V>;

  @override
  PrxSingleOfType$Impl<V> item(
    PrxCollectionFieldOfMessageOfType<M, Map<K, V>> collectionVar,
    K key,
  ) =>
      collectionVar.item(key);

  @override
  Widget selectPage(
    PrxCollectionFieldOfMessageOfType<M, Map<K, V>> collectionVar,
    RxVar<Opt<K>> keyVar,
  ) {
    final collectionData = collectionVar.asData();
    final keyData = keyVar.asData();

    return collectionData
        .mapOpt((map) => map.keys.toBuiltList())
        .rxBuilderOrNull(
          (context, ids) => Column(
            children: ids.map(
              (id) {
                final itemVar = collectionVar.item(id);
                final tileConfig = collectionItem.tileConfig(id, itemVar);

                return itemVar.rxBuilderOrNull(
                  (context, item) {
                    return keyData.rxBuilder(
                      (context, keyOpt) => RadioListTile$Conf(
                        key: ValueKey(id),
                        value: id,
                        groupValue: keyOpt.orNull,
                        onChanged: (value) {
                          keyData.value = id.here();
                        },
                        title: tileConfig.title,
                        subtitle: tileConfig.subtitle,
                      ).create$(),
                    );
                  },
                );
              },
            ).toList(growable: false),
          ),
        );
  }
}

@Impl.data()
abstract class CrdtFldStringMap<M extends GeneratedMessage, V>
    extends CrdtFldMap<M, String, V> {}
