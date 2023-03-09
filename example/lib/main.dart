import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhufl_common/mhufl_common.dart';
import 'package:mhufl_common_example/generated/example_meta.dart';

import 'proto/example.pb.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  late final lookup = LookupImpl();

  late final exampleMessage = mk.RxVar.variable(
    Opt.here(
      ExampleMessage(
        items: {
          1: SomeItem(
            stringProp: 'hello',
          ),
        },
      )..freeze(),
    ),
    lookup: lookup,
  ).also((o) => lookup.put(exampleRootKey, o)).prx;

  late final stringProp = exampleMessage.stringProp$;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mhufl Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mhufl Example'),
        ),
        body: Column(
          children: [
            // exampleMessage.stringProp$.crx.crudTile(),
            stringProp.crd,
            exampleMessage.crd,
          ],
        ),
      ),
    );
  }
}

final messageFields = ExampleLib$MessageFieldOverrides<Override<CrfnFld>>(
  exampleMessage$$defaultItem: (o) =>
      o.castCrfn<ExampleMessage, int>().copyWith(
            foreignKey: mk.CrfnForeignKeyFld.create<ExampleMessage, int, SomeItem>(
              foreignKey: (fld, prx) => prx.lookup.get(exampleRootKey).items$,
            ),
          ),
).get;
final messages = ExampleLib$MessageOverrides<Override<CrfnMsg>>(
  someItem: (o) => o.castCrfn<SomeItem>().copyWith(
        displayString: <I>(msg, id, value) => value.stringProp,
      ),
).get;

const exampleRootKey = CrdKey<ExampleMessage>();

final exampleLibCrud = mk.Crud.fromLib(
  ExampleLib$.instance$,
  (fn) => fn.copyWith(
    field: fn.field.overrideFunction1(messageFields),
    message: fn.message.overrideFunction1(messages),
  ),
);

extension PrxX on Prx {
  Widget get crd => exampleLibCrud.tileWidgetFor(this);
}
