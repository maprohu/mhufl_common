import 'package:flutter/material.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:protobuf/protobuf.dart';

import 'collection.dart';
import 'crdt.dart';
import 'map.dart';

part 'int_map.g.dart';

@Impl.data()
abstract class CrdtFldIntMap<M extends GeneratedMessage, V>
    extends CrdtFldMap<M, int, V> {
  @override
  Widget defaultTileWidget(IPrxOfType<Map<int, V>> prx) =>
      intMapTile(prx as IPrxCollectionOfType<Map<int, V>>);

  Widget intMapTile(
    IPrxCollectionOfType<Map<int, V>> prxMap,
  ) {
    return mk.CrudButton.data(
      label: crd.label,
      subtitle: prxMap
          .mapOpt((value) => value.length)
          .orDefault(0)
          .map((v) => v.toString()),
      onTap: mk.RxVar.variable((context) {
        ScaffoldPage.show(
          context,
          crd.label,
          intMapPage(
            prxMap,
          ),
        );
      }),
    );
  }

  late final Widget Function(
    IPrxCollectionOfType<Map<int, V>> prx,
  ) intMapPage = fld.valueType.when(
    messageType: (msg) => msg.payload.pmMsg.type$(
      <MT extends GeneratedMessage>() => (prx) => intMapOfMessagePage(
            msg.payload.crdt as CrdtMsg<MT>,
            prx as IPrxCollectionOfType<Map<int, MT>>,
          ),
    ),
  );

  Widget intMapOfMessagePage<MT extends GeneratedMessage>(
    CrdtMsg<MT> msg,
    IPrxCollectionOfType<Map<int, MT>> prx,
  ) {
    void onTap(BuildContext context, IntId<MT> e) {
      final rxVar = prx.item(e.id);
      msg.showCrudPage(
        context: context,
        rxVar: rxVar,
        actionsBar: NullWidget(),
      );
    }

    return mk.CrudMapPage.data(
      items: prx.mapOpt(
        (value) => value
            .withIds()
            .map(
              (e) => Builder(builder: (context) {
                return ListTile(
                  title: Text(
                    msg.displayTitleString(
                      e.id,
                      e.value,
                    ),
                  ),
                  onTap: () => onTap(context, e),
                );
              }),
            )
            .toList(),
      ),
      onAdd: (context) {
        prx.rebuild((map) {
          final added = map.addWithId((_) => msg.emptyMessage);
          onTap(context, added);
        });
      },
    );
  }
}
