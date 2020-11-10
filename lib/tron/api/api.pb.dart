///
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../core/Tron.pb.dart' as $0;
import '../core/Contract.pb.dart' as $1;

import 'api.pbenum.dart';

export 'api.pbenum.dart';

class Return extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Return', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOB(1, 'result')
    ..e<Return_response_code>(2, 'code', $pb.PbFieldType.OE, defaultOrMaker: Return_response_code.SUCCESS, valueOf: Return_response_code.valueOf, enumValues: Return_response_code.values)
    ..a<$core.List<$core.int>>(3, 'message', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Return._() : super();
  factory Return() => create();
  factory Return.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Return.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Return clone() => Return()..mergeFromMessage(this);
  Return copyWith(void Function(Return) updates) => super.copyWith((message) => updates(message as Return));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Return create() => Return._();
  Return createEmptyInstance() => create();
  static $pb.PbList<Return> createRepeated() => $pb.PbList<Return>();
  @$core.pragma('dart2js:noInline')
  static Return getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Return>(create);
  static Return _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  Return_response_code get code => $_getN(1);
  @$pb.TagNumber(2)
  set code(Return_response_code v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get message => $_getN(2);
  @$pb.TagNumber(3)
  set message($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
}

class BlockReference extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockReference', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'blockNum')
    ..a<$core.List<$core.int>>(2, 'blockHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BlockReference._() : super();
  factory BlockReference() => create();
  factory BlockReference.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockReference.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockReference clone() => BlockReference()..mergeFromMessage(this);
  BlockReference copyWith(void Function(BlockReference) updates) => super.copyWith((message) => updates(message as BlockReference));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockReference create() => BlockReference._();
  BlockReference createEmptyInstance() => create();
  static $pb.PbList<BlockReference> createRepeated() => $pb.PbList<BlockReference>();
  @$core.pragma('dart2js:noInline')
  static BlockReference getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockReference>(create);
  static BlockReference _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get blockNum => $_getI64(0);
  @$pb.TagNumber(1)
  set blockNum($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get blockHash => $_getN(1);
  @$pb.TagNumber(2)
  set blockHash($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockHash() => clearField(2);
}

class WitnessList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WitnessList', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<$0.Witness>(1, 'witnesses', $pb.PbFieldType.PM, subBuilder: $0.Witness.create)
    ..hasRequiredFields = false
  ;

  WitnessList._() : super();
  factory WitnessList() => create();
  factory WitnessList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WitnessList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WitnessList clone() => WitnessList()..mergeFromMessage(this);
  WitnessList copyWith(void Function(WitnessList) updates) => super.copyWith((message) => updates(message as WitnessList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WitnessList create() => WitnessList._();
  WitnessList createEmptyInstance() => create();
  static $pb.PbList<WitnessList> createRepeated() => $pb.PbList<WitnessList>();
  @$core.pragma('dart2js:noInline')
  static WitnessList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WitnessList>(create);
  static WitnessList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Witness> get witnesses => $_getList(0);
}

class ProposalList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ProposalList', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<$0.Proposal>(1, 'proposals', $pb.PbFieldType.PM, subBuilder: $0.Proposal.create)
    ..hasRequiredFields = false
  ;

  ProposalList._() : super();
  factory ProposalList() => create();
  factory ProposalList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProposalList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ProposalList clone() => ProposalList()..mergeFromMessage(this);
  ProposalList copyWith(void Function(ProposalList) updates) => super.copyWith((message) => updates(message as ProposalList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProposalList create() => ProposalList._();
  ProposalList createEmptyInstance() => create();
  static $pb.PbList<ProposalList> createRepeated() => $pb.PbList<ProposalList>();
  @$core.pragma('dart2js:noInline')
  static ProposalList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProposalList>(create);
  static ProposalList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Proposal> get proposals => $_getList(0);
}

class ExchangeList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExchangeList', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<$0.Exchange>(1, 'exchanges', $pb.PbFieldType.PM, subBuilder: $0.Exchange.create)
    ..hasRequiredFields = false
  ;

  ExchangeList._() : super();
  factory ExchangeList() => create();
  factory ExchangeList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExchangeList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ExchangeList clone() => ExchangeList()..mergeFromMessage(this);
  ExchangeList copyWith(void Function(ExchangeList) updates) => super.copyWith((message) => updates(message as ExchangeList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExchangeList create() => ExchangeList._();
  ExchangeList createEmptyInstance() => create();
  static $pb.PbList<ExchangeList> createRepeated() => $pb.PbList<ExchangeList>();
  @$core.pragma('dart2js:noInline')
  static ExchangeList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeList>(create);
  static ExchangeList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Exchange> get exchanges => $_getList(0);
}

class AssetIssueList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AssetIssueList', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<$1.AssetIssueContract>(1, 'assetIssue', $pb.PbFieldType.PM, protoName: 'assetIssue', subBuilder: $1.AssetIssueContract.create)
    ..hasRequiredFields = false
  ;

  AssetIssueList._() : super();
  factory AssetIssueList() => create();
  factory AssetIssueList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetIssueList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AssetIssueList clone() => AssetIssueList()..mergeFromMessage(this);
  AssetIssueList copyWith(void Function(AssetIssueList) updates) => super.copyWith((message) => updates(message as AssetIssueList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AssetIssueList create() => AssetIssueList._();
  AssetIssueList createEmptyInstance() => create();
  static $pb.PbList<AssetIssueList> createRepeated() => $pb.PbList<AssetIssueList>();
  @$core.pragma('dart2js:noInline')
  static AssetIssueList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetIssueList>(create);
  static AssetIssueList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.AssetIssueContract> get assetIssue => $_getList(0);
}

class BlockList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockList', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<$0.Block>(1, 'block', $pb.PbFieldType.PM, subBuilder: $0.Block.create)
    ..hasRequiredFields = false
  ;

  BlockList._() : super();
  factory BlockList() => create();
  factory BlockList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockList clone() => BlockList()..mergeFromMessage(this);
  BlockList copyWith(void Function(BlockList) updates) => super.copyWith((message) => updates(message as BlockList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockList create() => BlockList._();
  BlockList createEmptyInstance() => create();
  static $pb.PbList<BlockList> createRepeated() => $pb.PbList<BlockList>();
  @$core.pragma('dart2js:noInline')
  static BlockList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockList>(create);
  static BlockList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Block> get block => $_getList(0);
}

class TransactionList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionList', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<$0.Transaction>(1, 'transaction', $pb.PbFieldType.PM, subBuilder: $0.Transaction.create)
    ..hasRequiredFields = false
  ;

  TransactionList._() : super();
  factory TransactionList() => create();
  factory TransactionList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionList clone() => TransactionList()..mergeFromMessage(this);
  TransactionList copyWith(void Function(TransactionList) updates) => super.copyWith((message) => updates(message as TransactionList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionList create() => TransactionList._();
  TransactionList createEmptyInstance() => create();
  static $pb.PbList<TransactionList> createRepeated() => $pb.PbList<TransactionList>();
  @$core.pragma('dart2js:noInline')
  static TransactionList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionList>(create);
  static TransactionList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Transaction> get transaction => $_getList(0);
}

class DelegatedResourceMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DelegatedResourceMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'fromAddress', $pb.PbFieldType.OY, protoName: 'fromAddress')
    ..a<$core.List<$core.int>>(2, 'toAddress', $pb.PbFieldType.OY, protoName: 'toAddress')
    ..hasRequiredFields = false
  ;

  DelegatedResourceMessage._() : super();
  factory DelegatedResourceMessage() => create();
  factory DelegatedResourceMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelegatedResourceMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DelegatedResourceMessage clone() => DelegatedResourceMessage()..mergeFromMessage(this);
  DelegatedResourceMessage copyWith(void Function(DelegatedResourceMessage) updates) => super.copyWith((message) => updates(message as DelegatedResourceMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelegatedResourceMessage create() => DelegatedResourceMessage._();
  DelegatedResourceMessage createEmptyInstance() => create();
  static $pb.PbList<DelegatedResourceMessage> createRepeated() => $pb.PbList<DelegatedResourceMessage>();
  @$core.pragma('dart2js:noInline')
  static DelegatedResourceMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelegatedResourceMessage>(create);
  static DelegatedResourceMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get fromAddress => $_getN(0);
  @$pb.TagNumber(1)
  set fromAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFromAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get toAddress => $_getN(1);
  @$pb.TagNumber(2)
  set toAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => clearField(2);
}

class DelegatedResourceList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DelegatedResourceList', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<$0.DelegatedResource>(1, 'delegatedResource', $pb.PbFieldType.PM, protoName: 'delegatedResource', subBuilder: $0.DelegatedResource.create)
    ..hasRequiredFields = false
  ;

  DelegatedResourceList._() : super();
  factory DelegatedResourceList() => create();
  factory DelegatedResourceList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelegatedResourceList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DelegatedResourceList clone() => DelegatedResourceList()..mergeFromMessage(this);
  DelegatedResourceList copyWith(void Function(DelegatedResourceList) updates) => super.copyWith((message) => updates(message as DelegatedResourceList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelegatedResourceList create() => DelegatedResourceList._();
  DelegatedResourceList createEmptyInstance() => create();
  static $pb.PbList<DelegatedResourceList> createRepeated() => $pb.PbList<DelegatedResourceList>();
  @$core.pragma('dart2js:noInline')
  static DelegatedResourceList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelegatedResourceList>(create);
  static DelegatedResourceList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.DelegatedResource> get delegatedResource => $_getList(0);
}

class NodeList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NodeList', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<Node>(1, 'nodes', $pb.PbFieldType.PM, subBuilder: Node.create)
    ..hasRequiredFields = false
  ;

  NodeList._() : super();
  factory NodeList() => create();
  factory NodeList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NodeList clone() => NodeList()..mergeFromMessage(this);
  NodeList copyWith(void Function(NodeList) updates) => super.copyWith((message) => updates(message as NodeList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NodeList create() => NodeList._();
  NodeList createEmptyInstance() => create();
  static $pb.PbList<NodeList> createRepeated() => $pb.PbList<NodeList>();
  @$core.pragma('dart2js:noInline')
  static NodeList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeList>(create);
  static NodeList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Node> get nodes => $_getList(0);
}

class Node extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Node', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<Address>(1, 'address', subBuilder: Address.create)
    ..hasRequiredFields = false
  ;

  Node._() : super();
  factory Node() => create();
  factory Node.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Node.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Node clone() => Node()..mergeFromMessage(this);
  Node copyWith(void Function(Node) updates) => super.copyWith((message) => updates(message as Node));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Node create() => Node._();
  Node createEmptyInstance() => create();
  static $pb.PbList<Node> createRepeated() => $pb.PbList<Node>();
  @$core.pragma('dart2js:noInline')
  static Node getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Node>(create);
  static Node _defaultInstance;

  @$pb.TagNumber(1)
  Address get address => $_getN(0);
  @$pb.TagNumber(1)
  set address(Address v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
  @$pb.TagNumber(1)
  Address ensureAddress() => $_ensure(0);
}

class Address extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Address', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'host', $pb.PbFieldType.OY)
    ..a<$core.int>(2, 'port', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Address._() : super();
  factory Address() => create();
  factory Address.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Address.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Address clone() => Address()..mergeFromMessage(this);
  Address copyWith(void Function(Address) updates) => super.copyWith((message) => updates(message as Address));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Address create() => Address._();
  Address createEmptyInstance() => create();
  static $pb.PbList<Address> createRepeated() => $pb.PbList<Address>();
  @$core.pragma('dart2js:noInline')
  static Address getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Address>(create);
  static Address _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get host => $_getN(0);
  @$pb.TagNumber(1)
  set host($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => clearField(2);
}

class EmptyMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EmptyMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  EmptyMessage._() : super();
  factory EmptyMessage() => create();
  factory EmptyMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmptyMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EmptyMessage clone() => EmptyMessage()..mergeFromMessage(this);
  EmptyMessage copyWith(void Function(EmptyMessage) updates) => super.copyWith((message) => updates(message as EmptyMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmptyMessage create() => EmptyMessage._();
  EmptyMessage createEmptyInstance() => create();
  static $pb.PbList<EmptyMessage> createRepeated() => $pb.PbList<EmptyMessage>();
  @$core.pragma('dart2js:noInline')
  static EmptyMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmptyMessage>(create);
  static EmptyMessage _defaultInstance;
}

class NumberMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NumberMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'num')
    ..hasRequiredFields = false
  ;

  NumberMessage._() : super();
  factory NumberMessage() => create();
  factory NumberMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NumberMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NumberMessage clone() => NumberMessage()..mergeFromMessage(this);
  NumberMessage copyWith(void Function(NumberMessage) updates) => super.copyWith((message) => updates(message as NumberMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NumberMessage create() => NumberMessage._();
  NumberMessage createEmptyInstance() => create();
  static $pb.PbList<NumberMessage> createRepeated() => $pb.PbList<NumberMessage>();
  @$core.pragma('dart2js:noInline')
  static NumberMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NumberMessage>(create);
  static NumberMessage _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get num => $_getI64(0);
  @$pb.TagNumber(1)
  set num($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => clearField(1);
}

class BytesMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BytesMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BytesMessage._() : super();
  factory BytesMessage() => create();
  factory BytesMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BytesMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BytesMessage clone() => BytesMessage()..mergeFromMessage(this);
  BytesMessage copyWith(void Function(BytesMessage) updates) => super.copyWith((message) => updates(message as BytesMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BytesMessage create() => BytesMessage._();
  BytesMessage createEmptyInstance() => create();
  static $pb.PbList<BytesMessage> createRepeated() => $pb.PbList<BytesMessage>();
  @$core.pragma('dart2js:noInline')
  static BytesMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BytesMessage>(create);
  static BytesMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class TimeMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TimeMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'beginInMilliseconds', protoName: 'beginInMilliseconds')
    ..aInt64(2, 'endInMilliseconds', protoName: 'endInMilliseconds')
    ..hasRequiredFields = false
  ;

  TimeMessage._() : super();
  factory TimeMessage() => create();
  factory TimeMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimeMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TimeMessage clone() => TimeMessage()..mergeFromMessage(this);
  TimeMessage copyWith(void Function(TimeMessage) updates) => super.copyWith((message) => updates(message as TimeMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimeMessage create() => TimeMessage._();
  TimeMessage createEmptyInstance() => create();
  static $pb.PbList<TimeMessage> createRepeated() => $pb.PbList<TimeMessage>();
  @$core.pragma('dart2js:noInline')
  static TimeMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeMessage>(create);
  static TimeMessage _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get beginInMilliseconds => $_getI64(0);
  @$pb.TagNumber(1)
  set beginInMilliseconds($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBeginInMilliseconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeginInMilliseconds() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endInMilliseconds => $_getI64(1);
  @$pb.TagNumber(2)
  set endInMilliseconds($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndInMilliseconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndInMilliseconds() => clearField(2);
}

class BlockLimit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockLimit', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'startNum', protoName: 'startNum')
    ..aInt64(2, 'endNum', protoName: 'endNum')
    ..hasRequiredFields = false
  ;

  BlockLimit._() : super();
  factory BlockLimit() => create();
  factory BlockLimit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockLimit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockLimit clone() => BlockLimit()..mergeFromMessage(this);
  BlockLimit copyWith(void Function(BlockLimit) updates) => super.copyWith((message) => updates(message as BlockLimit));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockLimit create() => BlockLimit._();
  BlockLimit createEmptyInstance() => create();
  static $pb.PbList<BlockLimit> createRepeated() => $pb.PbList<BlockLimit>();
  @$core.pragma('dart2js:noInline')
  static BlockLimit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockLimit>(create);
  static BlockLimit _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startNum => $_getI64(0);
  @$pb.TagNumber(1)
  set startNum($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartNum() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endNum => $_getI64(1);
  @$pb.TagNumber(2)
  set endNum($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndNum() => clearField(2);
}

class TransactionLimit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionLimit', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'transactionId', $pb.PbFieldType.OY, protoName: 'transactionId')
    ..aInt64(2, 'limitNum', protoName: 'limitNum')
    ..hasRequiredFields = false
  ;

  TransactionLimit._() : super();
  factory TransactionLimit() => create();
  factory TransactionLimit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionLimit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionLimit clone() => TransactionLimit()..mergeFromMessage(this);
  TransactionLimit copyWith(void Function(TransactionLimit) updates) => super.copyWith((message) => updates(message as TransactionLimit));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionLimit create() => TransactionLimit._();
  TransactionLimit createEmptyInstance() => create();
  static $pb.PbList<TransactionLimit> createRepeated() => $pb.PbList<TransactionLimit>();
  @$core.pragma('dart2js:noInline')
  static TransactionLimit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionLimit>(create);
  static TransactionLimit _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get transactionId => $_getN(0);
  @$pb.TagNumber(1)
  set transactionId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get limitNum => $_getI64(1);
  @$pb.TagNumber(2)
  set limitNum($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimitNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimitNum() => clearField(2);
}

class AccountPaginated extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountPaginated', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<$0.Account>(1, 'account', subBuilder: $0.Account.create)
    ..aInt64(2, 'offset')
    ..aInt64(3, 'limit')
    ..hasRequiredFields = false
  ;

  AccountPaginated._() : super();
  factory AccountPaginated() => create();
  factory AccountPaginated.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountPaginated.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AccountPaginated clone() => AccountPaginated()..mergeFromMessage(this);
  AccountPaginated copyWith(void Function(AccountPaginated) updates) => super.copyWith((message) => updates(message as AccountPaginated));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountPaginated create() => AccountPaginated._();
  AccountPaginated createEmptyInstance() => create();
  static $pb.PbList<AccountPaginated> createRepeated() => $pb.PbList<AccountPaginated>();
  @$core.pragma('dart2js:noInline')
  static AccountPaginated getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountPaginated>(create);
  static AccountPaginated _defaultInstance;

  @$pb.TagNumber(1)
  $0.Account get account => $_getN(0);
  @$pb.TagNumber(1)
  set account($0.Account v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
  @$pb.TagNumber(1)
  $0.Account ensureAccount() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);
}

class TimePaginatedMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TimePaginatedMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<TimeMessage>(1, 'timeMessage', protoName: 'timeMessage', subBuilder: TimeMessage.create)
    ..aInt64(2, 'offset')
    ..aInt64(3, 'limit')
    ..hasRequiredFields = false
  ;

  TimePaginatedMessage._() : super();
  factory TimePaginatedMessage() => create();
  factory TimePaginatedMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimePaginatedMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TimePaginatedMessage clone() => TimePaginatedMessage()..mergeFromMessage(this);
  TimePaginatedMessage copyWith(void Function(TimePaginatedMessage) updates) => super.copyWith((message) => updates(message as TimePaginatedMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimePaginatedMessage create() => TimePaginatedMessage._();
  TimePaginatedMessage createEmptyInstance() => create();
  static $pb.PbList<TimePaginatedMessage> createRepeated() => $pb.PbList<TimePaginatedMessage>();
  @$core.pragma('dart2js:noInline')
  static TimePaginatedMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimePaginatedMessage>(create);
  static TimePaginatedMessage _defaultInstance;

  @$pb.TagNumber(1)
  TimeMessage get timeMessage => $_getN(0);
  @$pb.TagNumber(1)
  set timeMessage(TimeMessage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimeMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimeMessage() => clearField(1);
  @$pb.TagNumber(1)
  TimeMessage ensureTimeMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);
}

class AccountNetMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountNetMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'freeNetUsed', protoName: 'freeNetUsed')
    ..aInt64(2, 'freeNetLimit', protoName: 'freeNetLimit')
    ..aInt64(3, 'NetUsed', protoName: 'NetUsed')
    ..aInt64(4, 'NetLimit', protoName: 'NetLimit')
    ..m<$core.String, $fixnum.Int64>(5, 'assetNetUsed', protoName: 'assetNetUsed', entryClassName: 'AccountNetMessage.AssetNetUsedEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..m<$core.String, $fixnum.Int64>(6, 'assetNetLimit', protoName: 'assetNetLimit', entryClassName: 'AccountNetMessage.AssetNetLimitEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..aInt64(7, 'TotalNetLimit', protoName: 'TotalNetLimit')
    ..aInt64(8, 'TotalNetWeight', protoName: 'TotalNetWeight')
    ..hasRequiredFields = false
  ;

  AccountNetMessage._() : super();
  factory AccountNetMessage() => create();
  factory AccountNetMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountNetMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AccountNetMessage clone() => AccountNetMessage()..mergeFromMessage(this);
  AccountNetMessage copyWith(void Function(AccountNetMessage) updates) => super.copyWith((message) => updates(message as AccountNetMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountNetMessage create() => AccountNetMessage._();
  AccountNetMessage createEmptyInstance() => create();
  static $pb.PbList<AccountNetMessage> createRepeated() => $pb.PbList<AccountNetMessage>();
  @$core.pragma('dart2js:noInline')
  static AccountNetMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountNetMessage>(create);
  static AccountNetMessage _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get freeNetUsed => $_getI64(0);
  @$pb.TagNumber(1)
  set freeNetUsed($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFreeNetUsed() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreeNetUsed() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get freeNetLimit => $_getI64(1);
  @$pb.TagNumber(2)
  set freeNetLimit($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFreeNetLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearFreeNetLimit() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get netUsed => $_getI64(2);
  @$pb.TagNumber(3)
  set netUsed($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNetUsed() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetUsed() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get netLimit => $_getI64(3);
  @$pb.TagNumber(4)
  set netLimit($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNetLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetLimit() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $fixnum.Int64> get assetNetUsed => $_getMap(4);

  @$pb.TagNumber(6)
  $core.Map<$core.String, $fixnum.Int64> get assetNetLimit => $_getMap(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get totalNetLimit => $_getI64(6);
  @$pb.TagNumber(7)
  set totalNetLimit($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalNetLimit() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalNetLimit() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get totalNetWeight => $_getI64(7);
  @$pb.TagNumber(8)
  set totalNetWeight($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTotalNetWeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalNetWeight() => clearField(8);
}

class AccountResourceMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountResourceMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'freeNetUsed', protoName: 'freeNetUsed')
    ..aInt64(2, 'freeNetLimit', protoName: 'freeNetLimit')
    ..aInt64(3, 'NetUsed', protoName: 'NetUsed')
    ..aInt64(4, 'NetLimit', protoName: 'NetLimit')
    ..m<$core.String, $fixnum.Int64>(5, 'assetNetUsed', protoName: 'assetNetUsed', entryClassName: 'AccountResourceMessage.AssetNetUsedEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..m<$core.String, $fixnum.Int64>(6, 'assetNetLimit', protoName: 'assetNetLimit', entryClassName: 'AccountResourceMessage.AssetNetLimitEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..aInt64(7, 'TotalNetLimit', protoName: 'TotalNetLimit')
    ..aInt64(8, 'TotalNetWeight', protoName: 'TotalNetWeight')
    ..aInt64(13, 'EnergyUsed', protoName: 'EnergyUsed')
    ..aInt64(14, 'EnergyLimit', protoName: 'EnergyLimit')
    ..aInt64(15, 'TotalEnergyLimit', protoName: 'TotalEnergyLimit')
    ..aInt64(16, 'TotalEnergyWeight', protoName: 'TotalEnergyWeight')
    ..aInt64(21, 'storageUsed', protoName: 'storageUsed')
    ..aInt64(22, 'storageLimit', protoName: 'storageLimit')
    ..hasRequiredFields = false
  ;

  AccountResourceMessage._() : super();
  factory AccountResourceMessage() => create();
  factory AccountResourceMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountResourceMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AccountResourceMessage clone() => AccountResourceMessage()..mergeFromMessage(this);
  AccountResourceMessage copyWith(void Function(AccountResourceMessage) updates) => super.copyWith((message) => updates(message as AccountResourceMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountResourceMessage create() => AccountResourceMessage._();
  AccountResourceMessage createEmptyInstance() => create();
  static $pb.PbList<AccountResourceMessage> createRepeated() => $pb.PbList<AccountResourceMessage>();
  @$core.pragma('dart2js:noInline')
  static AccountResourceMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountResourceMessage>(create);
  static AccountResourceMessage _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get freeNetUsed => $_getI64(0);
  @$pb.TagNumber(1)
  set freeNetUsed($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFreeNetUsed() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreeNetUsed() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get freeNetLimit => $_getI64(1);
  @$pb.TagNumber(2)
  set freeNetLimit($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFreeNetLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearFreeNetLimit() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get netUsed => $_getI64(2);
  @$pb.TagNumber(3)
  set netUsed($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNetUsed() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetUsed() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get netLimit => $_getI64(3);
  @$pb.TagNumber(4)
  set netLimit($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNetLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetLimit() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $fixnum.Int64> get assetNetUsed => $_getMap(4);

  @$pb.TagNumber(6)
  $core.Map<$core.String, $fixnum.Int64> get assetNetLimit => $_getMap(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get totalNetLimit => $_getI64(6);
  @$pb.TagNumber(7)
  set totalNetLimit($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalNetLimit() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalNetLimit() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get totalNetWeight => $_getI64(7);
  @$pb.TagNumber(8)
  set totalNetWeight($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTotalNetWeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalNetWeight() => clearField(8);

  @$pb.TagNumber(13)
  $fixnum.Int64 get energyUsed => $_getI64(8);
  @$pb.TagNumber(13)
  set energyUsed($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(13)
  $core.bool hasEnergyUsed() => $_has(8);
  @$pb.TagNumber(13)
  void clearEnergyUsed() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get energyLimit => $_getI64(9);
  @$pb.TagNumber(14)
  set energyLimit($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(14)
  $core.bool hasEnergyLimit() => $_has(9);
  @$pb.TagNumber(14)
  void clearEnergyLimit() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get totalEnergyLimit => $_getI64(10);
  @$pb.TagNumber(15)
  set totalEnergyLimit($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(15)
  $core.bool hasTotalEnergyLimit() => $_has(10);
  @$pb.TagNumber(15)
  void clearTotalEnergyLimit() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get totalEnergyWeight => $_getI64(11);
  @$pb.TagNumber(16)
  set totalEnergyWeight($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(16)
  $core.bool hasTotalEnergyWeight() => $_has(11);
  @$pb.TagNumber(16)
  void clearTotalEnergyWeight() => clearField(16);

  @$pb.TagNumber(21)
  $fixnum.Int64 get storageUsed => $_getI64(12);
  @$pb.TagNumber(21)
  set storageUsed($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(21)
  $core.bool hasStorageUsed() => $_has(12);
  @$pb.TagNumber(21)
  void clearStorageUsed() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get storageLimit => $_getI64(13);
  @$pb.TagNumber(22)
  set storageLimit($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(22)
  $core.bool hasStorageLimit() => $_has(13);
  @$pb.TagNumber(22)
  void clearStorageLimit() => clearField(22);
}

class PaginatedMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PaginatedMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'offset')
    ..aInt64(2, 'limit')
    ..hasRequiredFields = false
  ;

  PaginatedMessage._() : super();
  factory PaginatedMessage() => create();
  factory PaginatedMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaginatedMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PaginatedMessage clone() => PaginatedMessage()..mergeFromMessage(this);
  PaginatedMessage copyWith(void Function(PaginatedMessage) updates) => super.copyWith((message) => updates(message as PaginatedMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PaginatedMessage create() => PaginatedMessage._();
  PaginatedMessage createEmptyInstance() => create();
  static $pb.PbList<PaginatedMessage> createRepeated() => $pb.PbList<PaginatedMessage>();
  @$core.pragma('dart2js:noInline')
  static PaginatedMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaginatedMessage>(create);
  static PaginatedMessage _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get offset => $_getI64(0);
  @$pb.TagNumber(1)
  set offset($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearOffset() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get limit => $_getI64(1);
  @$pb.TagNumber(2)
  set limit($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class EasyTransferMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EasyTransferMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'passPhrase', $pb.PbFieldType.OY, protoName: 'passPhrase')
    ..a<$core.List<$core.int>>(2, 'toAddress', $pb.PbFieldType.OY, protoName: 'toAddress')
    ..aInt64(3, 'amount')
    ..hasRequiredFields = false
  ;

  EasyTransferMessage._() : super();
  factory EasyTransferMessage() => create();
  factory EasyTransferMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EasyTransferMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EasyTransferMessage clone() => EasyTransferMessage()..mergeFromMessage(this);
  EasyTransferMessage copyWith(void Function(EasyTransferMessage) updates) => super.copyWith((message) => updates(message as EasyTransferMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EasyTransferMessage create() => EasyTransferMessage._();
  EasyTransferMessage createEmptyInstance() => create();
  static $pb.PbList<EasyTransferMessage> createRepeated() => $pb.PbList<EasyTransferMessage>();
  @$core.pragma('dart2js:noInline')
  static EasyTransferMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EasyTransferMessage>(create);
  static EasyTransferMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get passPhrase => $_getN(0);
  @$pb.TagNumber(1)
  set passPhrase($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassPhrase() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassPhrase() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get toAddress => $_getN(1);
  @$pb.TagNumber(2)
  set toAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
}

class EasyTransferAssetMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EasyTransferAssetMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'passPhrase', $pb.PbFieldType.OY, protoName: 'passPhrase')
    ..a<$core.List<$core.int>>(2, 'toAddress', $pb.PbFieldType.OY, protoName: 'toAddress')
    ..aOS(3, 'assetId', protoName: 'assetId')
    ..aInt64(4, 'amount')
    ..hasRequiredFields = false
  ;

  EasyTransferAssetMessage._() : super();
  factory EasyTransferAssetMessage() => create();
  factory EasyTransferAssetMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EasyTransferAssetMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EasyTransferAssetMessage clone() => EasyTransferAssetMessage()..mergeFromMessage(this);
  EasyTransferAssetMessage copyWith(void Function(EasyTransferAssetMessage) updates) => super.copyWith((message) => updates(message as EasyTransferAssetMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EasyTransferAssetMessage create() => EasyTransferAssetMessage._();
  EasyTransferAssetMessage createEmptyInstance() => create();
  static $pb.PbList<EasyTransferAssetMessage> createRepeated() => $pb.PbList<EasyTransferAssetMessage>();
  @$core.pragma('dart2js:noInline')
  static EasyTransferAssetMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EasyTransferAssetMessage>(create);
  static EasyTransferAssetMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get passPhrase => $_getN(0);
  @$pb.TagNumber(1)
  set passPhrase($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassPhrase() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassPhrase() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get toAddress => $_getN(1);
  @$pb.TagNumber(2)
  set toAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get assetId => $_getSZ(2);
  @$pb.TagNumber(3)
  set assetId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get amount => $_getI64(3);
  @$pb.TagNumber(4)
  set amount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);
}

class EasyTransferByPrivateMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EasyTransferByPrivateMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'privateKey', $pb.PbFieldType.OY, protoName: 'privateKey')
    ..a<$core.List<$core.int>>(2, 'toAddress', $pb.PbFieldType.OY, protoName: 'toAddress')
    ..aInt64(3, 'amount')
    ..hasRequiredFields = false
  ;

  EasyTransferByPrivateMessage._() : super();
  factory EasyTransferByPrivateMessage() => create();
  factory EasyTransferByPrivateMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EasyTransferByPrivateMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EasyTransferByPrivateMessage clone() => EasyTransferByPrivateMessage()..mergeFromMessage(this);
  EasyTransferByPrivateMessage copyWith(void Function(EasyTransferByPrivateMessage) updates) => super.copyWith((message) => updates(message as EasyTransferByPrivateMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EasyTransferByPrivateMessage create() => EasyTransferByPrivateMessage._();
  EasyTransferByPrivateMessage createEmptyInstance() => create();
  static $pb.PbList<EasyTransferByPrivateMessage> createRepeated() => $pb.PbList<EasyTransferByPrivateMessage>();
  @$core.pragma('dart2js:noInline')
  static EasyTransferByPrivateMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EasyTransferByPrivateMessage>(create);
  static EasyTransferByPrivateMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get toAddress => $_getN(1);
  @$pb.TagNumber(2)
  set toAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
}

class EasyTransferAssetByPrivateMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EasyTransferAssetByPrivateMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'privateKey', $pb.PbFieldType.OY, protoName: 'privateKey')
    ..a<$core.List<$core.int>>(2, 'toAddress', $pb.PbFieldType.OY, protoName: 'toAddress')
    ..aOS(3, 'assetId', protoName: 'assetId')
    ..aInt64(4, 'amount')
    ..hasRequiredFields = false
  ;

  EasyTransferAssetByPrivateMessage._() : super();
  factory EasyTransferAssetByPrivateMessage() => create();
  factory EasyTransferAssetByPrivateMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EasyTransferAssetByPrivateMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EasyTransferAssetByPrivateMessage clone() => EasyTransferAssetByPrivateMessage()..mergeFromMessage(this);
  EasyTransferAssetByPrivateMessage copyWith(void Function(EasyTransferAssetByPrivateMessage) updates) => super.copyWith((message) => updates(message as EasyTransferAssetByPrivateMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EasyTransferAssetByPrivateMessage create() => EasyTransferAssetByPrivateMessage._();
  EasyTransferAssetByPrivateMessage createEmptyInstance() => create();
  static $pb.PbList<EasyTransferAssetByPrivateMessage> createRepeated() => $pb.PbList<EasyTransferAssetByPrivateMessage>();
  @$core.pragma('dart2js:noInline')
  static EasyTransferAssetByPrivateMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EasyTransferAssetByPrivateMessage>(create);
  static EasyTransferAssetByPrivateMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get privateKey => $_getN(0);
  @$pb.TagNumber(1)
  set privateKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrivateKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivateKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get toAddress => $_getN(1);
  @$pb.TagNumber(2)
  set toAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get assetId => $_getSZ(2);
  @$pb.TagNumber(3)
  set assetId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get amount => $_getI64(3);
  @$pb.TagNumber(4)
  set amount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);
}

class EasyTransferResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EasyTransferResponse', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<$0.Transaction>(1, 'transaction', subBuilder: $0.Transaction.create)
    ..aOM<Return>(2, 'result', subBuilder: Return.create)
    ..a<$core.List<$core.int>>(3, 'txid', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  EasyTransferResponse._() : super();
  factory EasyTransferResponse() => create();
  factory EasyTransferResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EasyTransferResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EasyTransferResponse clone() => EasyTransferResponse()..mergeFromMessage(this);
  EasyTransferResponse copyWith(void Function(EasyTransferResponse) updates) => super.copyWith((message) => updates(message as EasyTransferResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EasyTransferResponse create() => EasyTransferResponse._();
  EasyTransferResponse createEmptyInstance() => create();
  static $pb.PbList<EasyTransferResponse> createRepeated() => $pb.PbList<EasyTransferResponse>();
  @$core.pragma('dart2js:noInline')
  static EasyTransferResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EasyTransferResponse>(create);
  static EasyTransferResponse _defaultInstance;

  @$pb.TagNumber(1)
  $0.Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction($0.Transaction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => clearField(1);
  @$pb.TagNumber(1)
  $0.Transaction ensureTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  Return get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(Return v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => clearField(2);
  @$pb.TagNumber(2)
  Return ensureResult() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get txid => $_getN(2);
  @$pb.TagNumber(3)
  set txid($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTxid() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxid() => clearField(3);
}

class AddressPrKeyPairMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddressPrKeyPairMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..aOS(2, 'privateKey', protoName: 'privateKey')
    ..hasRequiredFields = false
  ;

  AddressPrKeyPairMessage._() : super();
  factory AddressPrKeyPairMessage() => create();
  factory AddressPrKeyPairMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddressPrKeyPairMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddressPrKeyPairMessage clone() => AddressPrKeyPairMessage()..mergeFromMessage(this);
  AddressPrKeyPairMessage copyWith(void Function(AddressPrKeyPairMessage) updates) => super.copyWith((message) => updates(message as AddressPrKeyPairMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddressPrKeyPairMessage create() => AddressPrKeyPairMessage._();
  AddressPrKeyPairMessage createEmptyInstance() => create();
  static $pb.PbList<AddressPrKeyPairMessage> createRepeated() => $pb.PbList<AddressPrKeyPairMessage>();
  @$core.pragma('dart2js:noInline')
  static AddressPrKeyPairMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddressPrKeyPairMessage>(create);
  static AddressPrKeyPairMessage _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get privateKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set privateKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivateKey() => clearField(2);
}

class TransactionExtention extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionExtention', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<$0.Transaction>(1, 'transaction', subBuilder: $0.Transaction.create)
    ..a<$core.List<$core.int>>(2, 'txid', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(3, 'constantResult', $pb.PbFieldType.PY)
    ..aOM<Return>(4, 'result', subBuilder: Return.create)
    ..hasRequiredFields = false
  ;

  TransactionExtention._() : super();
  factory TransactionExtention() => create();
  factory TransactionExtention.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionExtention.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionExtention clone() => TransactionExtention()..mergeFromMessage(this);
  TransactionExtention copyWith(void Function(TransactionExtention) updates) => super.copyWith((message) => updates(message as TransactionExtention));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionExtention create() => TransactionExtention._();
  TransactionExtention createEmptyInstance() => create();
  static $pb.PbList<TransactionExtention> createRepeated() => $pb.PbList<TransactionExtention>();
  @$core.pragma('dart2js:noInline')
  static TransactionExtention getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionExtention>(create);
  static TransactionExtention _defaultInstance;

  @$pb.TagNumber(1)
  $0.Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction($0.Transaction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => clearField(1);
  @$pb.TagNumber(1)
  $0.Transaction ensureTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get txid => $_getN(1);
  @$pb.TagNumber(2)
  set txid($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxid() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get constantResult => $_getList(2);

  @$pb.TagNumber(4)
  Return get result => $_getN(3);
  @$pb.TagNumber(4)
  set result(Return v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasResult() => $_has(3);
  @$pb.TagNumber(4)
  void clearResult() => clearField(4);
  @$pb.TagNumber(4)
  Return ensureResult() => $_ensure(3);
}

class BlockExtention extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockExtention', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<TransactionExtention>(1, 'transactions', $pb.PbFieldType.PM, subBuilder: TransactionExtention.create)
    ..aOM<$0.BlockHeader>(2, 'blockHeader', subBuilder: $0.BlockHeader.create)
    ..a<$core.List<$core.int>>(3, 'blockid', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BlockExtention._() : super();
  factory BlockExtention() => create();
  factory BlockExtention.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockExtention.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockExtention clone() => BlockExtention()..mergeFromMessage(this);
  BlockExtention copyWith(void Function(BlockExtention) updates) => super.copyWith((message) => updates(message as BlockExtention));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockExtention create() => BlockExtention._();
  BlockExtention createEmptyInstance() => create();
  static $pb.PbList<BlockExtention> createRepeated() => $pb.PbList<BlockExtention>();
  @$core.pragma('dart2js:noInline')
  static BlockExtention getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockExtention>(create);
  static BlockExtention _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TransactionExtention> get transactions => $_getList(0);

  @$pb.TagNumber(2)
  $0.BlockHeader get blockHeader => $_getN(1);
  @$pb.TagNumber(2)
  set blockHeader($0.BlockHeader v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockHeader() => clearField(2);
  @$pb.TagNumber(2)
  $0.BlockHeader ensureBlockHeader() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get blockid => $_getN(2);
  @$pb.TagNumber(3)
  set blockid($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlockid() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockid() => clearField(3);
}

class BlockListExtention extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockListExtention', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<BlockExtention>(1, 'block', $pb.PbFieldType.PM, subBuilder: BlockExtention.create)
    ..hasRequiredFields = false
  ;

  BlockListExtention._() : super();
  factory BlockListExtention() => create();
  factory BlockListExtention.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockListExtention.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockListExtention clone() => BlockListExtention()..mergeFromMessage(this);
  BlockListExtention copyWith(void Function(BlockListExtention) updates) => super.copyWith((message) => updates(message as BlockListExtention));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockListExtention create() => BlockListExtention._();
  BlockListExtention createEmptyInstance() => create();
  static $pb.PbList<BlockListExtention> createRepeated() => $pb.PbList<BlockListExtention>();
  @$core.pragma('dart2js:noInline')
  static BlockListExtention getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockListExtention>(create);
  static BlockListExtention _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BlockExtention> get block => $_getList(0);
}

class TransactionListExtention extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionListExtention', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<TransactionExtention>(1, 'transaction', $pb.PbFieldType.PM, subBuilder: TransactionExtention.create)
    ..hasRequiredFields = false
  ;

  TransactionListExtention._() : super();
  factory TransactionListExtention() => create();
  factory TransactionListExtention.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionListExtention.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionListExtention clone() => TransactionListExtention()..mergeFromMessage(this);
  TransactionListExtention copyWith(void Function(TransactionListExtention) updates) => super.copyWith((message) => updates(message as TransactionListExtention));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionListExtention create() => TransactionListExtention._();
  TransactionListExtention createEmptyInstance() => create();
  static $pb.PbList<TransactionListExtention> createRepeated() => $pb.PbList<TransactionListExtention>();
  @$core.pragma('dart2js:noInline')
  static TransactionListExtention getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionListExtention>(create);
  static TransactionListExtention _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TransactionExtention> get transaction => $_getList(0);
}

class TransactionSignWeight_Result extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionSignWeight.Result', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..e<TransactionSignWeight_Result_response_code>(1, 'code', $pb.PbFieldType.OE, defaultOrMaker: TransactionSignWeight_Result_response_code.ENOUGH_PERMISSION, valueOf: TransactionSignWeight_Result_response_code.valueOf, enumValues: TransactionSignWeight_Result_response_code.values)
    ..aOS(2, 'message')
    ..hasRequiredFields = false
  ;

  TransactionSignWeight_Result._() : super();
  factory TransactionSignWeight_Result() => create();
  factory TransactionSignWeight_Result.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionSignWeight_Result.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionSignWeight_Result clone() => TransactionSignWeight_Result()..mergeFromMessage(this);
  TransactionSignWeight_Result copyWith(void Function(TransactionSignWeight_Result) updates) => super.copyWith((message) => updates(message as TransactionSignWeight_Result));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionSignWeight_Result create() => TransactionSignWeight_Result._();
  TransactionSignWeight_Result createEmptyInstance() => create();
  static $pb.PbList<TransactionSignWeight_Result> createRepeated() => $pb.PbList<TransactionSignWeight_Result>();
  @$core.pragma('dart2js:noInline')
  static TransactionSignWeight_Result getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionSignWeight_Result>(create);
  static TransactionSignWeight_Result _defaultInstance;

  @$pb.TagNumber(1)
  TransactionSignWeight_Result_response_code get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(TransactionSignWeight_Result_response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class TransactionSignWeight extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionSignWeight', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<$0.Permission>(1, 'permission', subBuilder: $0.Permission.create)
    ..p<$core.List<$core.int>>(2, 'approvedList', $pb.PbFieldType.PY)
    ..aInt64(3, 'currentWeight')
    ..aOM<TransactionSignWeight_Result>(4, 'result', subBuilder: TransactionSignWeight_Result.create)
    ..aOM<TransactionExtention>(5, 'transaction', subBuilder: TransactionExtention.create)
    ..hasRequiredFields = false
  ;

  TransactionSignWeight._() : super();
  factory TransactionSignWeight() => create();
  factory TransactionSignWeight.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionSignWeight.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionSignWeight clone() => TransactionSignWeight()..mergeFromMessage(this);
  TransactionSignWeight copyWith(void Function(TransactionSignWeight) updates) => super.copyWith((message) => updates(message as TransactionSignWeight));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionSignWeight create() => TransactionSignWeight._();
  TransactionSignWeight createEmptyInstance() => create();
  static $pb.PbList<TransactionSignWeight> createRepeated() => $pb.PbList<TransactionSignWeight>();
  @$core.pragma('dart2js:noInline')
  static TransactionSignWeight getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionSignWeight>(create);
  static TransactionSignWeight _defaultInstance;

  @$pb.TagNumber(1)
  $0.Permission get permission => $_getN(0);
  @$pb.TagNumber(1)
  set permission($0.Permission v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermission() => clearField(1);
  @$pb.TagNumber(1)
  $0.Permission ensurePermission() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get approvedList => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get currentWeight => $_getI64(2);
  @$pb.TagNumber(3)
  set currentWeight($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentWeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentWeight() => clearField(3);

  @$pb.TagNumber(4)
  TransactionSignWeight_Result get result => $_getN(3);
  @$pb.TagNumber(4)
  set result(TransactionSignWeight_Result v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasResult() => $_has(3);
  @$pb.TagNumber(4)
  void clearResult() => clearField(4);
  @$pb.TagNumber(4)
  TransactionSignWeight_Result ensureResult() => $_ensure(3);

  @$pb.TagNumber(5)
  TransactionExtention get transaction => $_getN(4);
  @$pb.TagNumber(5)
  set transaction(TransactionExtention v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTransaction() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransaction() => clearField(5);
  @$pb.TagNumber(5)
  TransactionExtention ensureTransaction() => $_ensure(4);
}

class TransactionApprovedList_Result extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionApprovedList.Result', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..e<TransactionApprovedList_Result_response_code>(1, 'code', $pb.PbFieldType.OE, defaultOrMaker: TransactionApprovedList_Result_response_code.SUCCESS, valueOf: TransactionApprovedList_Result_response_code.valueOf, enumValues: TransactionApprovedList_Result_response_code.values)
    ..aOS(2, 'message')
    ..hasRequiredFields = false
  ;

  TransactionApprovedList_Result._() : super();
  factory TransactionApprovedList_Result() => create();
  factory TransactionApprovedList_Result.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionApprovedList_Result.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionApprovedList_Result clone() => TransactionApprovedList_Result()..mergeFromMessage(this);
  TransactionApprovedList_Result copyWith(void Function(TransactionApprovedList_Result) updates) => super.copyWith((message) => updates(message as TransactionApprovedList_Result));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionApprovedList_Result create() => TransactionApprovedList_Result._();
  TransactionApprovedList_Result createEmptyInstance() => create();
  static $pb.PbList<TransactionApprovedList_Result> createRepeated() => $pb.PbList<TransactionApprovedList_Result>();
  @$core.pragma('dart2js:noInline')
  static TransactionApprovedList_Result getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionApprovedList_Result>(create);
  static TransactionApprovedList_Result _defaultInstance;

  @$pb.TagNumber(1)
  TransactionApprovedList_Result_response_code get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(TransactionApprovedList_Result_response_code v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class TransactionApprovedList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionApprovedList', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(2, 'approvedList', $pb.PbFieldType.PY)
    ..aOM<TransactionApprovedList_Result>(4, 'result', subBuilder: TransactionApprovedList_Result.create)
    ..aOM<TransactionExtention>(5, 'transaction', subBuilder: TransactionExtention.create)
    ..hasRequiredFields = false
  ;

  TransactionApprovedList._() : super();
  factory TransactionApprovedList() => create();
  factory TransactionApprovedList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionApprovedList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionApprovedList clone() => TransactionApprovedList()..mergeFromMessage(this);
  TransactionApprovedList copyWith(void Function(TransactionApprovedList) updates) => super.copyWith((message) => updates(message as TransactionApprovedList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionApprovedList create() => TransactionApprovedList._();
  TransactionApprovedList createEmptyInstance() => create();
  static $pb.PbList<TransactionApprovedList> createRepeated() => $pb.PbList<TransactionApprovedList>();
  @$core.pragma('dart2js:noInline')
  static TransactionApprovedList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionApprovedList>(create);
  static TransactionApprovedList _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get approvedList => $_getList(0);

  @$pb.TagNumber(4)
  TransactionApprovedList_Result get result => $_getN(1);
  @$pb.TagNumber(4)
  set result(TransactionApprovedList_Result v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(4)
  void clearResult() => clearField(4);
  @$pb.TagNumber(4)
  TransactionApprovedList_Result ensureResult() => $_ensure(1);

  @$pb.TagNumber(5)
  TransactionExtention get transaction => $_getN(2);
  @$pb.TagNumber(5)
  set transaction(TransactionExtention v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTransaction() => $_has(2);
  @$pb.TagNumber(5)
  void clearTransaction() => clearField(5);
  @$pb.TagNumber(5)
  TransactionExtention ensureTransaction() => $_ensure(2);
}

