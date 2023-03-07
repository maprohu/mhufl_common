// import 'package:flutter/material.dart';
// import 'package:mhudart_common/mhdart_common.dart';
// import 'package:mhufl_common/mhufl_common.dart';
// import 'package:protobuf/protobuf.dart';
// import 'package:select_dialog/select_dialog.dart';
//
// import 'crud_props.dart';
//
// extension CdfFldXDefaults<M, F> on CrdtFld<M, F> {
//
//
//   Widget messageTile<T>(CrdMsg msg, RxVarImplOpt<T> prx) {
//     return Column(
//       children: msg
//           .fieldTilesFor(
//             rxVar: prx,
//             defaultValue: Opt.here(msg.emptyMessage),
//           )
//           .toList(),
//     );
//   }
//
//   Widget repeatedTile<V>({
//     required IPrxCollectionOfType<List<V>> prx,
//     required V Function() create,
//   }) {
//     return mk.CrudButton.data(
//       label: label,
//       subtitle: prx
//           .mapOpt((value) => value.length)
//           .orDefault(0)
//           .map((v) => v.toString()),
//       onTap: mk.RxVar.variable((context) {
//         ScaffoldPage.show(
//           context,
//           label,
//           CrudListPage(
//             control: mk.CrudListPageControl.data(
//               items: prx,
//               tile: (index, item) {
//                 final itemPrx = prx.item(index);
//                 return singleItemTileConfig(index, itemPrx);
//               },
//               create: create,
//               onTap: (context, index) {
//                 final rxVar = prx.item(index);
//                 singleItemTap(context, rxVar);
//               },
//             ),
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget Function<T>(IPrxOfType<T> prx) foreignKeyTile({
//     required IPrxCollectionOfType<Map<K, V>> Function<K, V>(IPrxOfType<K> prx)
//         foreignKey,
//   }) {
//     return <T>(prx) {
//       prx as IPrxSingleOfType;
//       final source = foreignKey(prx);
//       // final sourceMsg = crud.resolveMessage(source)
//
//       return Builder(
//         builder: (context) {
//           return NullWidget();
//         },
//       );
//     };
//   }
//
//
// }
