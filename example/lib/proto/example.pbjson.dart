///
//  Generated code. Do not modify.
//  source: example.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use exampleMessageDescriptor instead')
const ExampleMessage$json = const {
  '1': 'ExampleMessage',
  '2': const [
    const {'1': 'stringProp', '3': 1, '4': 1, '5': 9, '10': 'stringProp'},
    const {'1': 'defaultItem', '3': 3, '4': 1, '5': 5, '10': 'defaultItem'},
    const {'1': 'items', '3': 2, '4': 3, '5': 11, '6': '.ExampleMessage.ItemsEntry', '10': 'items'},
  ],
  '3': const [ExampleMessage_ItemsEntry$json],
};

@$core.Deprecated('Use exampleMessageDescriptor instead')
const ExampleMessage_ItemsEntry$json = const {
  '1': 'ItemsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.SomeItem', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ExampleMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exampleMessageDescriptor = $convert.base64Decode('Cg5FeGFtcGxlTWVzc2FnZRIeCgpzdHJpbmdQcm9wGAEgASgJUgpzdHJpbmdQcm9wEiAKC2RlZmF1bHRJdGVtGAMgASgFUgtkZWZhdWx0SXRlbRIwCgVpdGVtcxgCIAMoCzIaLkV4YW1wbGVNZXNzYWdlLkl0ZW1zRW50cnlSBWl0ZW1zGkMKCkl0ZW1zRW50cnkSEAoDa2V5GAEgASgFUgNrZXkSHwoFdmFsdWUYAiABKAsyCS5Tb21lSXRlbVIFdmFsdWU6AjgB');
@$core.Deprecated('Use someItemDescriptor instead')
const SomeItem$json = const {
  '1': 'SomeItem',
  '2': const [
    const {'1': 'stringProp', '3': 1, '4': 1, '5': 9, '10': 'stringProp'},
  ],
};

/// Descriptor for `SomeItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List someItemDescriptor = $convert.base64Decode('CghTb21lSXRlbRIeCgpzdHJpbmdQcm9wGAEgASgJUgpzdHJpbmdQcm9w');
