import 'dart:io';

import 'package:mhudart_common/mhdart_common.dart';
import 'package:mhudart_generator/proto_meta_generator.dart';
import 'package:mhudart_generator_base/source_gen/source_generator.dart';
import 'run_protoc_example.dart' as protoc;

Future main() async {
  await protoc.main();

  final target = DotGeneration("example_meta");
  target.writer.line(
    generateProtoMeta(
      'ExampleLib',
      Directory.current.file('proto/generated/descriptor').readAsBytesSync(),
    ),
  );

  target.writeGeneratedFile();
}
