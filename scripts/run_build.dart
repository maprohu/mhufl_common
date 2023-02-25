import 'dart:io';
import 'dart:isolate';

import 'package:collection/collection.dart';
import 'package:mhudart_common/mhdart_common.dart';
import 'package:path/path.dart';

import '../.dart_tool/build/entrypoint/build.dart' as build;

void main(
  List<String> args, [
  SendPort? sendPort,
])  {
  try {
    final buildDir = Directory.current.dir('.dart_tool/build');
    buildDir.listSync().whereNot((d) => basename(d.path) == 'entrypoint').forEach((d) => d.deleteSync(recursive: true));
  } catch (_) {}
  build.main([
    'build',
    '--skip-build-script-check',
    '--delete-conflicting-outputs',
  ], sendPort);
}
