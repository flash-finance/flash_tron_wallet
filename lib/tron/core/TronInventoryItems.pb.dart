///
//  Generated code. Do not modify.
//  source: core/TronInventoryItems.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class InventoryItems extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('InventoryItems', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.int>(1, 'type', $pb.PbFieldType.O3)
    ..p<$core.List<$core.int>>(2, 'items', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  InventoryItems._() : super();
  factory InventoryItems() => create();
  factory InventoryItems.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InventoryItems.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  InventoryItems clone() => InventoryItems()..mergeFromMessage(this);
  InventoryItems copyWith(void Function(InventoryItems) updates) => super.copyWith((message) => updates(message as InventoryItems));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InventoryItems create() => InventoryItems._();
  InventoryItems createEmptyInstance() => create();
  static $pb.PbList<InventoryItems> createRepeated() => $pb.PbList<InventoryItems>();
  @$core.pragma('dart2js:noInline')
  static InventoryItems getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InventoryItems>(create);
  static InventoryItems _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get items => $_getList(1);
}

