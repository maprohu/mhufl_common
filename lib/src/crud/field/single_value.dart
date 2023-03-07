import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
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

  Widget defaultTileWidget(IPrxOfType<F> prx) => _defaultTileWidget(prx);

  late final _defaultTileWidget = defaultSingleCrudTile();

  Widget Function(IPrxOfType<F> prx) defaultSingleCrudTile() {
    Widget Function<T>(IPrxSingleOfType<T> prx) stringOrInt(
      Widget Function<T>(IPrxSingleOfType<T> prx) Function() noForeignKey,
    ) {
      return noForeignKey();

      // final fk = foreignKey;
      // if (fk == null) {
      //   return noForeignKey();
      // } else {
      //   return foreignKeyTile(foreignKey: fk);
      // }
    }

    Widget Function<T>(IPrxSingleOfType<T> prx) single = fld.valueType.when(
      boolType: () => <T>(prx) => boolTile(
            prx as RxVarImplOpt<bool>,
          ),
      stringType: () => stringOrInt(
        () => <T>(prx) => stringTile(
              prx as RxVarImplOpt<String>,
            ),
      ),
      intType: () => stringOrInt(
        () => <T>(prx) => intTile(
              prx as RxVarImplOpt<int>,
            ),
      ),
      enumType: (enumType) => <T>(prx) => enumTile(
            enumType.payload,
            prx as RxVarImplOpt<ProtobufEnum>,
          ),

    );

    return <T>(prx) => single(prx as IPrxSingleOfType<T>);
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

  Widget boolTile(
      RxVarImplOpt<bool> prx,
      ) {
    return mk.CrudSwitch.data(
      rxVar: prx.orDefaultVar(false),
      label: label,
    );
  }

  Widget enumTile<T>(CrdEnum msg, RxVarImplOpt<ProtobufEnum> prx) {
    final rx = prx.mapOpt((v) => v.label).orDefault('<not set>');
    return mk.CrudButton.data(
      subtitle: rx,
      onTap: mk.RxVar.variable((context) {
        SelectDialog.showModal<ProtobufEnum>(
          context,
          items: msg.pmEnum.values(),
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
