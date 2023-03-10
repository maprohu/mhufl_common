import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:protobuf/protobuf.dart';

import '../crud_field.dart';
import '../crud_ovr.dart';
import '../crud_control.dart';
import 'collection.dart';
import 'crdt.dart';

part 'map.g.dart';

@Impl.data()
abstract class CrdtFldMap<M extends GeneratedMessage, K, V>
    extends CrdtFldCollection<M, Map<K, V>, K, V> {
  @override
  late final pmFld = crd.pmFld as PmMapField<M, K, V>;

  @override
  PrxSingleOfType$Impl<V> item(
    PrxCollectionFieldOfMessageOfType<M, Map<K, V>> collectionVar,
    K key,
  ) =>
      collectionVar.item(key);
}

@Impl.data()
abstract class CrdtFldStringMap<M extends GeneratedMessage, V>
    extends CrdtFldMap<M, String, V> {}
