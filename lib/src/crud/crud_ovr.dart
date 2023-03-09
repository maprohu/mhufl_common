import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/src/crud/crud_control.dart';
import 'package:protobuf/protobuf.dart';

import 'crud.dart';
import 'crud_field.dart';
import 'crud_message.dart';
import 'field/crdt.dart';
import 'field/map.dart';

part 'crud_ovr.g.dart';

typedef FieldTileWidgetProvider<M extends GeneratedMessage, F> = Widget
    Function(
  CrdtFld<M, F> fld,
  IPrxOfType<F> prx,
);

typedef MessageTileConfigProvider<M extends GeneratedMessage> = TileConfig
    Function<I>(
  CrdtMsg<M> msg,
  I id,
  IRxVal<Opt<M>> prx,
);

typedef FieldTileConfigProvider<M extends GeneratedMessage, F> = TileConfig
    Function<I>(
  CrdtFld<M, F> fld,
  I id,
  IPrxOfType<F> prx,
);

typedef MessageStringDisplay<M extends GeneratedMessage> = String Function<I>(
    CrdtMsg<M> msg, I id, M value);

typedef GlobalIndexLookup<T> = T Function(int globalIndex);

typedef ForeignKey<M extends GeneratedMessage, K, V>
    = IPrxCollectionFieldOfType<Map<K, V>> Function(
  CrdtFld<M, K> fld,
  IPrxOfType<K> prx,
);

/// [ICrfnCrud]
@Impl.data()
abstract class CrfnCrud {
  GlobalIndexLookup<CrfnFld> get field;

  GlobalIndexLookup<CrfnMsg> get message;
}

@Impl.data()
abstract class CrfnMsg<M extends GeneratedMessage> {
  MessageStringDisplay<M> get displayString;

  MessageStringDisplay<M> get displayTitleString;

  MessageStringDisplay<M>? get displaySubtitleString;

  MessageTileConfigProvider<M> get tileConfig;
}

/// [ICrfnFld]
@Impl.data()
abstract class CrfnFld<M extends GeneratedMessage, F> {
  FieldTileWidgetProvider<M, F> get tileWidget;

  FieldTileConfigProvider<M, F> get tileConfig;

  CrfnForeignKeyFld<M, F, dynamic>? get foreignKey;
}

@Impl.data()
abstract class CrfnForeignKeyFld<M extends GeneratedMessage, K, V extends GeneratedMessage>  {

  ForeignKey<M, K, V> get foreignKey;

  PmCollectionFieldOfMessageOfType<M, V> get field;

  R targetType<R>(R Function<T>() fn) => fn<V>();
}

extension CrdOvrStringX on String {
  String orId<I>(I id) => orIfEmpty(() => id.toString().paren);
}

// extension CrfnMapKeyFldFactoryX on CrfnForeignKeyFld$Factory {
//   CrfnForeignKeyFld$Impl<M, K, V>
//       castOrCreateFromFld<M extends GeneratedMessage, K, V>(CrfnFld base) =>
//           base.castOrCreate<CrfnForeignKeyFld$Impl<M, K, V>>(
//             () {
//               final baseTyped = base as CrfnFld<M, K>;
//               final tw = baseTyped.tileWidget;
//               final baseImpl = baseTyped.toImpl;
//               final tileWidget = baseImpl.tileWidget;
//               final result = fromCrfnFld<M, K, V>(
//                 crfnFld: baseImpl,
//               );
//               return result;
//             },
//           );
// }

extension CrfnFldX on CrfnFld {
  // CrfnForeignKeyFld<M, K, V> toForeignKey<M extends GeneratedMessage, K, V>() =>
  //     mk.CrfnForeignKeyFld.castOrCreateFromFld<M, K, V>(this);

  CrfnFld<M, F> castCrfn<M extends GeneratedMessage, F>() => cast();
}

extension CrfnMsgX on CrfnMsg {
  CrfnMsg<M> castCrfn<M extends GeneratedMessage>() => cast();
}
