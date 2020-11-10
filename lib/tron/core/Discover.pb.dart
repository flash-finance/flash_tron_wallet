///
//  Generated code. Do not modify.
//  source: core/Discover.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Endpoint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Endpoint', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..a<$core.int>(2, 'port', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(3, 'nodeId', $pb.PbFieldType.OY, protoName: 'nodeId')
    ..hasRequiredFields = false
  ;

  Endpoint._() : super();
  factory Endpoint() => create();
  factory Endpoint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Endpoint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Endpoint clone() => Endpoint()..mergeFromMessage(this);
  Endpoint copyWith(void Function(Endpoint) updates) => super.copyWith((message) => updates(message as Endpoint));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Endpoint create() => Endpoint._();
  Endpoint createEmptyInstance() => create();
  static $pb.PbList<Endpoint> createRepeated() => $pb.PbList<Endpoint>();
  @$core.pragma('dart2js:noInline')
  static Endpoint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Endpoint>(create);
  static Endpoint _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get nodeId => $_getN(2);
  @$pb.TagNumber(3)
  set nodeId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNodeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearNodeId() => clearField(3);
}

class PingMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PingMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<Endpoint>(1, 'from', subBuilder: Endpoint.create)
    ..aOM<Endpoint>(2, 'to', subBuilder: Endpoint.create)
    ..a<$core.int>(3, 'version', $pb.PbFieldType.O3)
    ..aInt64(4, 'timestamp')
    ..hasRequiredFields = false
  ;

  PingMessage._() : super();
  factory PingMessage() => create();
  factory PingMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PingMessage clone() => PingMessage()..mergeFromMessage(this);
  PingMessage copyWith(void Function(PingMessage) updates) => super.copyWith((message) => updates(message as PingMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PingMessage create() => PingMessage._();
  PingMessage createEmptyInstance() => create();
  static $pb.PbList<PingMessage> createRepeated() => $pb.PbList<PingMessage>();
  @$core.pragma('dart2js:noInline')
  static PingMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingMessage>(create);
  static PingMessage _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  Endpoint get to => $_getN(1);
  @$pb.TagNumber(2)
  set to(Endpoint v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);
  @$pb.TagNumber(2)
  Endpoint ensureTo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get timestamp => $_getI64(3);
  @$pb.TagNumber(4)
  set timestamp($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);
}

class PongMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PongMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<Endpoint>(1, 'from', subBuilder: Endpoint.create)
    ..a<$core.int>(2, 'echo', $pb.PbFieldType.O3)
    ..aInt64(3, 'timestamp')
    ..hasRequiredFields = false
  ;

  PongMessage._() : super();
  factory PongMessage() => create();
  factory PongMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PongMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PongMessage clone() => PongMessage()..mergeFromMessage(this);
  PongMessage copyWith(void Function(PongMessage) updates) => super.copyWith((message) => updates(message as PongMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PongMessage create() => PongMessage._();
  PongMessage createEmptyInstance() => create();
  static $pb.PbList<PongMessage> createRepeated() => $pb.PbList<PongMessage>();
  @$core.pragma('dart2js:noInline')
  static PongMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PongMessage>(create);
  static PongMessage _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get echo => $_getIZ(1);
  @$pb.TagNumber(2)
  set echo($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEcho() => $_has(1);
  @$pb.TagNumber(2)
  void clearEcho() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => clearField(3);
}

class FindNeighbours extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FindNeighbours', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<Endpoint>(1, 'from', subBuilder: Endpoint.create)
    ..a<$core.List<$core.int>>(2, 'targetId', $pb.PbFieldType.OY, protoName: 'targetId')
    ..aInt64(3, 'timestamp')
    ..hasRequiredFields = false
  ;

  FindNeighbours._() : super();
  factory FindNeighbours() => create();
  factory FindNeighbours.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindNeighbours.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FindNeighbours clone() => FindNeighbours()..mergeFromMessage(this);
  FindNeighbours copyWith(void Function(FindNeighbours) updates) => super.copyWith((message) => updates(message as FindNeighbours));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FindNeighbours create() => FindNeighbours._();
  FindNeighbours createEmptyInstance() => create();
  static $pb.PbList<FindNeighbours> createRepeated() => $pb.PbList<FindNeighbours>();
  @$core.pragma('dart2js:noInline')
  static FindNeighbours getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindNeighbours>(create);
  static FindNeighbours _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get targetId => $_getN(1);
  @$pb.TagNumber(2)
  set targetId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => clearField(3);
}

class Neighbours extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Neighbours', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<Endpoint>(1, 'from', subBuilder: Endpoint.create)
    ..pc<Endpoint>(2, 'neighbours', $pb.PbFieldType.PM, subBuilder: Endpoint.create)
    ..aInt64(3, 'timestamp')
    ..hasRequiredFields = false
  ;

  Neighbours._() : super();
  factory Neighbours() => create();
  factory Neighbours.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Neighbours.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Neighbours clone() => Neighbours()..mergeFromMessage(this);
  Neighbours copyWith(void Function(Neighbours) updates) => super.copyWith((message) => updates(message as Neighbours));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Neighbours create() => Neighbours._();
  Neighbours createEmptyInstance() => create();
  static $pb.PbList<Neighbours> createRepeated() => $pb.PbList<Neighbours>();
  @$core.pragma('dart2js:noInline')
  static Neighbours getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Neighbours>(create);
  static Neighbours _defaultInstance;

  @$pb.TagNumber(1)
  Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Endpoint v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<Endpoint> get neighbours => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => clearField(3);
}

class BackupMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BackupMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOB(1, 'flag')
    ..a<$core.int>(2, 'priority', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  BackupMessage._() : super();
  factory BackupMessage() => create();
  factory BackupMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BackupMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BackupMessage clone() => BackupMessage()..mergeFromMessage(this);
  BackupMessage copyWith(void Function(BackupMessage) updates) => super.copyWith((message) => updates(message as BackupMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BackupMessage create() => BackupMessage._();
  BackupMessage createEmptyInstance() => create();
  static $pb.PbList<BackupMessage> createRepeated() => $pb.PbList<BackupMessage>();
  @$core.pragma('dart2js:noInline')
  static BackupMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BackupMessage>(create);
  static BackupMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get flag => $_getBF(0);
  @$pb.TagNumber(1)
  set flag($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFlag() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlag() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get priority => $_getIZ(1);
  @$pb.TagNumber(2)
  set priority($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPriority() => $_has(1);
  @$pb.TagNumber(2)
  void clearPriority() => clearField(2);
}

