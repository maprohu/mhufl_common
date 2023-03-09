import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:mhufl_common/src/crud/field/foreign_key.dart';
import 'package:protobuf/protobuf.dart';
import 'package:select_dialog/select_dialog.dart';

import '../crud_props.dart';
import 'crdt.dart';

part 'single_value.g.dart';

@Impl.data()
abstract class CrdtFldSingle<M extends GeneratedMessage, F>
    extends CrdtFldFull<M, F> {
  @override
  late final PmSingleField<M, F> pmFld = crd.pmFld as PmSingleField<M, F>;

  // @override
  // Widget defaultTileWidget(IPrxOfType<F> prx) => _defaultTileWidget(prx);
  //
  // late final _defaultTileWidget = defaultSingleCrudTile();

  // Widget Function(IPrxOfType<F> prx) defaultSingleCrudTile() {
  //   Widget Function(IPrxSingleOfType<T> prx) stringOrInt<K>(
  //     Widget Function(IPrxSingleOfType<T> prx) Function() noForeignKey,
  //   ) {
  //     final mapKey = crfn.toForeignKey<M, T, dynamic>();
  //     final fk = foreignKey;
  //     if (fk == null) {
  //       return noForeignKey();
  //     } else {
  //       return foreignKeyTile(foreignKey: fk);
  //     }
  //   }
  //
  //   Widget Function<T>(IPrxSingleOfType<T> prx) single = fld.valueType.when(
  //     boolType: () => <T>(prx) => boolTile(
  //           prx as RxVarImplOpt<bool>,
  //         ),
  //     stringType: () => stringOrInt<String>(
  //       () => (prx) => stringTile(
  //             prx as RxVarImplOpt<String>,
  //           ),
  //     ),
  //     intType: () => stringOrInt(
  //       () => <T>(prx) => intTile(
  //             prx as RxVarImplOpt<int>,
  //           ),
  //     ),
  //     enumType: (enumType) => <T>(prx) => enumTile(
  //           enumType.payload,
  //           prx as RxVarImplOpt<ProtobufEnum>,
  //         ),
  //   );
  //
  //   return <T>(prx) => single(prx as IPrxSingleOfType<T>);
  // }
}

extension CrdtFldSingleFactoryX on CrdtFldSingle$Factory {
  CrdtFldSingle<M, F> from<M extends GeneratedMessage, F>(CrdFld fld) {
    final crfnForeignKey = fld.crfn.toForeignKey();

    final foreignKey = crfnForeignKey.foreignKey;

    if (foreignKey != null) {
      return crfnForeignKey.targetType(
        <T>() => mk.CrdtFldSingleForeignKey.create<M, F, T>(
          foreignKey: foreignKey as ForeignKey<M, F, T>,
          crd: fld,
        ),
      );
    } else {
      final CrdtFldSingle<M, dynamic> crdt = fld.fld.valueType.when(
        boolType: () => mk.CrdtFldSingleBool.create(crd: fld),
        intType: () => mk.CrdtFldSingleInt.create(crd: fld),
        stringType: () => mk.CrdtFldSingleString.create(crd: fld),
        enumType: (enumType) => enumType.payload.pmEnum.type$(
          <TE extends ProtobufEnum>() => mk.CrdtFldSingleEnum.create<M, TE>(
            enm: enumType.payload,
            crd: fld,
          ),
        ),
      );

      return crdt as CrdtFldSingle<M, F>;
    }
  }
}

@Impl.data()
abstract class CrdtFldSingleInt<M extends GeneratedMessage>
    extends CrdtFldSingle<M, int> {
  @override
  Widget defaultTileWidget(IPrxOfType<int> prx) {
    return intTile(prx as RxVarImplOpt<int>);
  }

  Widget intTile(RxVarImplOpt<int> prx) {
    final stringOptRx = prx.mapOpt((v) => v.toString());
    return mk.CrudButton.data(
      subtitle: stringOptRx.orDefault('<not set>'),
      onTap: mk.RxVar.variable((context) {
        StringDialogEditor(
          title: label,
          setter: (str) {
            try {
              prx.set(int.parse(str).here());
            } catch (_) {}
          },
        ).show(
          context,
          stringOptRx.value.orDefault(''),
        );
      }),
      label: label,
    );
  }
}

@Impl.data()
abstract class CrdtFldSingleString<M extends GeneratedMessage>
    extends CrdtFldSingle<M, String> {
  @override
  Widget defaultTileWidget(IPrxOfType<String> prx) {
    return stringTile(prx as RxVarImplOpt<String>);
  }

  Widget stringTile(RxVarImplOpt<String> prx) {
    return mk.CrudButton.data(
      subtitle: prx.orDefault('<not set>'),
      onTap: mk.RxVar.variable((context) {
        StringDialogEditor(
          title: label,
          setter: prx.setHere,
        ).show(
          context,
          prx.value.orDefault(''),
        );
      }),
      label: label,
    );
  }
}

@Impl.data()
abstract class CrdtFldSingleBool<M extends GeneratedMessage>
    extends CrdtFldSingle<M, bool> {
  @override
  Widget defaultTileWidget(IPrxOfType<bool> prx) {
    return boolTile(prx as RxVarImplOpt<bool>);
  }

  Widget boolTile(
    RxVarImplOpt<bool> prx,
  ) {
    return mk.CrudSwitch.data(
      rxVar: prx.orDefaultVar(false),
      label: label,
    );
  }
}

@Impl.data()
abstract class CrdtFldSingleEnum<M extends GeneratedMessage,
    F extends ProtobufEnum> extends CrdtFldSingle<M, F> {
  CrdEnum get enm;

  late final pmEnum = enm.pmEnum as PmEnum<F>;

  late final enumItems = pmEnum.values();

  @override
  Widget defaultTileWidget(IPrxOfType<F> prx) {
    return enumTile(prx as RxVarImplOpt<F>);
  }

  Widget enumTile<T>(RxVarImplOpt<F> prx) {
    final rx = prx.mapOpt((v) => v.label).orDefault('<not set>');
    return mk.CrudButton.data(
      subtitle: rx,
      onTap: mk.RxVar.variable((context) {
        SelectDialog.showModal<F>(
          context,
          items: enumItems,
          itemBuilder: (context, item, isSelected) => ListTile(
            title: Text(item.label),
          ),
          showSearchBox: false,
          onChange: (value) {
            prx.value = value.here();
          },
        );
      }),
      label: label,
    );
  }
}
