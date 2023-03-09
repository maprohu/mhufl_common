///
//  Generated code. Do not modify.
//  source: example.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ExampleMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExampleMessage', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stringProp', protoName: 'stringProp')
    ..m<$core.int, SomeItem>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', entryClassName: 'ExampleMessage.ItemsEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OM, valueCreator: SomeItem.create)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defaultItem', $pb.PbFieldType.O3, protoName: 'defaultItem')
    ..hasRequiredFields = false
  ;

  ExampleMessage._() : super();
  factory ExampleMessage({
    $core.String? stringProp,
    $core.Map<$core.int, SomeItem>? items,
    $core.int? defaultItem,
  }) {
    final _result = create();
    if (stringProp != null) {
      _result.stringProp = stringProp;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    if (defaultItem != null) {
      _result.defaultItem = defaultItem;
    }
    return _result;
  }
  factory ExampleMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExampleMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExampleMessage clone() => ExampleMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExampleMessage copyWith(void Function(ExampleMessage) updates) => super.copyWith((message) => updates(message as ExampleMessage)) as ExampleMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExampleMessage create() => ExampleMessage._();
  ExampleMessage createEmptyInstance() => create();
  static $pb.PbList<ExampleMessage> createRepeated() => $pb.PbList<ExampleMessage>();
  @$core.pragma('dart2js:noInline')
  static ExampleMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExampleMessage>(create);
  static ExampleMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get stringProp => $_getSZ(0);
  @$pb.TagNumber(1)
  set stringProp($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStringProp() => $_has(0);
  @$pb.TagNumber(1)
  void clearStringProp() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.int, SomeItem> get items => $_getMap(1);

  @$pb.TagNumber(3)
  $core.int get defaultItem => $_getIZ(2);
  @$pb.TagNumber(3)
  set defaultItem($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDefaultItem() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaultItem() => clearField(3);
}

class SomeItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SomeItem', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stringProp', protoName: 'stringProp')
    ..hasRequiredFields = false
  ;

  SomeItem._() : super();
  factory SomeItem({
    $core.String? stringProp,
  }) {
    final _result = create();
    if (stringProp != null) {
      _result.stringProp = stringProp;
    }
    return _result;
  }
  factory SomeItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SomeItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SomeItem clone() => SomeItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SomeItem copyWith(void Function(SomeItem) updates) => super.copyWith((message) => updates(message as SomeItem)) as SomeItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SomeItem create() => SomeItem._();
  SomeItem createEmptyInstance() => create();
  static $pb.PbList<SomeItem> createRepeated() => $pb.PbList<SomeItem>();
  @$core.pragma('dart2js:noInline')
  static SomeItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SomeItem>(create);
  static SomeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get stringProp => $_getSZ(0);
  @$pb.TagNumber(1)
  set stringProp($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStringProp() => $_has(0);
  @$pb.TagNumber(1)
  void clearStringProp() => clearField(1);
}

