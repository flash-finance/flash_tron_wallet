///
//  Generated code. Do not modify.
//  source: core/Contract.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Tron.pb.dart' as $2;

import 'Tron.pbenum.dart' as $2;
import 'Contract.pbenum.dart';

export 'Contract.pbenum.dart';

class AccountCreateContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountCreateContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'accountAddress', $pb.PbFieldType.OY)
    ..e<$2.AccountType>(3, 'type', $pb.PbFieldType.OE, defaultOrMaker: $2.AccountType.Normal, valueOf: $2.AccountType.valueOf, enumValues: $2.AccountType.values)
    ..hasRequiredFields = false
  ;

  AccountCreateContract._() : super();
  factory AccountCreateContract() => create();
  factory AccountCreateContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountCreateContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AccountCreateContract clone() => AccountCreateContract()..mergeFromMessage(this);
  AccountCreateContract copyWith(void Function(AccountCreateContract) updates) => super.copyWith((message) => updates(message as AccountCreateContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountCreateContract create() => AccountCreateContract._();
  AccountCreateContract createEmptyInstance() => create();
  static $pb.PbList<AccountCreateContract> createRepeated() => $pb.PbList<AccountCreateContract>();
  @$core.pragma('dart2js:noInline')
  static AccountCreateContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountCreateContract>(create);
  static AccountCreateContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get accountAddress => $_getN(1);
  @$pb.TagNumber(2)
  set accountAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountAddress() => clearField(2);

  @$pb.TagNumber(3)
  $2.AccountType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type($2.AccountType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class AccountUpdateContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountUpdateContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'accountName', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'ownerAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AccountUpdateContract._() : super();
  factory AccountUpdateContract() => create();
  factory AccountUpdateContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountUpdateContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AccountUpdateContract clone() => AccountUpdateContract()..mergeFromMessage(this);
  AccountUpdateContract copyWith(void Function(AccountUpdateContract) updates) => super.copyWith((message) => updates(message as AccountUpdateContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountUpdateContract create() => AccountUpdateContract._();
  AccountUpdateContract createEmptyInstance() => create();
  static $pb.PbList<AccountUpdateContract> createRepeated() => $pb.PbList<AccountUpdateContract>();
  @$core.pragma('dart2js:noInline')
  static AccountUpdateContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountUpdateContract>(create);
  static AccountUpdateContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get accountName => $_getN(0);
  @$pb.TagNumber(1)
  set accountName($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerAddress => $_getN(1);
  @$pb.TagNumber(2)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwnerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerAddress() => clearField(2);
}

class SetAccountIdContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SetAccountIdContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'accountId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'ownerAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SetAccountIdContract._() : super();
  factory SetAccountIdContract() => create();
  factory SetAccountIdContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetAccountIdContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SetAccountIdContract clone() => SetAccountIdContract()..mergeFromMessage(this);
  SetAccountIdContract copyWith(void Function(SetAccountIdContract) updates) => super.copyWith((message) => updates(message as SetAccountIdContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetAccountIdContract create() => SetAccountIdContract._();
  SetAccountIdContract createEmptyInstance() => create();
  static $pb.PbList<SetAccountIdContract> createRepeated() => $pb.PbList<SetAccountIdContract>();
  @$core.pragma('dart2js:noInline')
  static SetAccountIdContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetAccountIdContract>(create);
  static SetAccountIdContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get accountId => $_getN(0);
  @$pb.TagNumber(1)
  set accountId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerAddress => $_getN(1);
  @$pb.TagNumber(2)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwnerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerAddress() => clearField(2);
}

class TransferContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransferContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'toAddress', $pb.PbFieldType.OY)
    ..aInt64(3, 'amount')
    ..hasRequiredFields = false
  ;

  TransferContract._() : super();
  factory TransferContract() => create();
  factory TransferContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransferContract clone() => TransferContract()..mergeFromMessage(this);
  TransferContract copyWith(void Function(TransferContract) updates) => super.copyWith((message) => updates(message as TransferContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransferContract create() => TransferContract._();
  TransferContract createEmptyInstance() => create();
  static $pb.PbList<TransferContract> createRepeated() => $pb.PbList<TransferContract>();
  @$core.pragma('dart2js:noInline')
  static TransferContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferContract>(create);
  static TransferContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

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

class TransferAssetContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransferAssetContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'assetName', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'toAddress', $pb.PbFieldType.OY)
    ..aInt64(4, 'amount')
    ..hasRequiredFields = false
  ;

  TransferAssetContract._() : super();
  factory TransferAssetContract() => create();
  factory TransferAssetContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferAssetContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransferAssetContract clone() => TransferAssetContract()..mergeFromMessage(this);
  TransferAssetContract copyWith(void Function(TransferAssetContract) updates) => super.copyWith((message) => updates(message as TransferAssetContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransferAssetContract create() => TransferAssetContract._();
  TransferAssetContract createEmptyInstance() => create();
  static $pb.PbList<TransferAssetContract> createRepeated() => $pb.PbList<TransferAssetContract>();
  @$core.pragma('dart2js:noInline')
  static TransferAssetContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferAssetContract>(create);
  static TransferAssetContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get assetName => $_getN(0);
  @$pb.TagNumber(1)
  set assetName($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssetName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get ownerAddress => $_getN(1);
  @$pb.TagNumber(2)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwnerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get toAddress => $_getN(2);
  @$pb.TagNumber(3)
  set toAddress($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearToAddress() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get amount => $_getI64(3);
  @$pb.TagNumber(4)
  set amount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);
}

class VoteAssetContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('VoteAssetContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, 'voteAddress', $pb.PbFieldType.PY)
    ..aOB(3, 'support')
    ..a<$core.int>(5, 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  VoteAssetContract._() : super();
  factory VoteAssetContract() => create();
  factory VoteAssetContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoteAssetContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  VoteAssetContract clone() => VoteAssetContract()..mergeFromMessage(this);
  VoteAssetContract copyWith(void Function(VoteAssetContract) updates) => super.copyWith((message) => updates(message as VoteAssetContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteAssetContract create() => VoteAssetContract._();
  VoteAssetContract createEmptyInstance() => create();
  static $pb.PbList<VoteAssetContract> createRepeated() => $pb.PbList<VoteAssetContract>();
  @$core.pragma('dart2js:noInline')
  static VoteAssetContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteAssetContract>(create);
  static VoteAssetContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get voteAddress => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get support => $_getBF(2);
  @$pb.TagNumber(3)
  set support($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSupport() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupport() => clearField(3);

  @$pb.TagNumber(5)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(5)
  set count($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(5)
  void clearCount() => clearField(5);
}

class VoteWitnessContract_Vote extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('VoteWitnessContract.Vote', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'voteAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'voteCount')
    ..hasRequiredFields = false
  ;

  VoteWitnessContract_Vote._() : super();
  factory VoteWitnessContract_Vote() => create();
  factory VoteWitnessContract_Vote.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoteWitnessContract_Vote.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  VoteWitnessContract_Vote clone() => VoteWitnessContract_Vote()..mergeFromMessage(this);
  VoteWitnessContract_Vote copyWith(void Function(VoteWitnessContract_Vote) updates) => super.copyWith((message) => updates(message as VoteWitnessContract_Vote));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract_Vote create() => VoteWitnessContract_Vote._();
  VoteWitnessContract_Vote createEmptyInstance() => create();
  static $pb.PbList<VoteWitnessContract_Vote> createRepeated() => $pb.PbList<VoteWitnessContract_Vote>();
  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract_Vote getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteWitnessContract_Vote>(create);
  static VoteWitnessContract_Vote _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get voteAddress => $_getN(0);
  @$pb.TagNumber(1)
  set voteAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoteAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoteAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get voteCount => $_getI64(1);
  @$pb.TagNumber(2)
  set voteCount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoteCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoteCount() => clearField(2);
}

class VoteWitnessContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('VoteWitnessContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..pc<VoteWitnessContract_Vote>(2, 'votes', $pb.PbFieldType.PM, subBuilder: VoteWitnessContract_Vote.create)
    ..aOB(3, 'support')
    ..hasRequiredFields = false
  ;

  VoteWitnessContract._() : super();
  factory VoteWitnessContract() => create();
  factory VoteWitnessContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoteWitnessContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  VoteWitnessContract clone() => VoteWitnessContract()..mergeFromMessage(this);
  VoteWitnessContract copyWith(void Function(VoteWitnessContract) updates) => super.copyWith((message) => updates(message as VoteWitnessContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract create() => VoteWitnessContract._();
  VoteWitnessContract createEmptyInstance() => create();
  static $pb.PbList<VoteWitnessContract> createRepeated() => $pb.PbList<VoteWitnessContract>();
  @$core.pragma('dart2js:noInline')
  static VoteWitnessContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteWitnessContract>(create);
  static VoteWitnessContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<VoteWitnessContract_Vote> get votes => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get support => $_getBF(2);
  @$pb.TagNumber(3)
  set support($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSupport() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupport() => clearField(3);
}

class UpdateSettingContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateSettingContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'contractAddress', $pb.PbFieldType.OY)
    ..aInt64(3, 'consumeUserResourcePercent')
    ..hasRequiredFields = false
  ;

  UpdateSettingContract._() : super();
  factory UpdateSettingContract() => create();
  factory UpdateSettingContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSettingContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateSettingContract clone() => UpdateSettingContract()..mergeFromMessage(this);
  UpdateSettingContract copyWith(void Function(UpdateSettingContract) updates) => super.copyWith((message) => updates(message as UpdateSettingContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSettingContract create() => UpdateSettingContract._();
  UpdateSettingContract createEmptyInstance() => create();
  static $pb.PbList<UpdateSettingContract> createRepeated() => $pb.PbList<UpdateSettingContract>();
  @$core.pragma('dart2js:noInline')
  static UpdateSettingContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSettingContract>(create);
  static UpdateSettingContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get contractAddress => $_getN(1);
  @$pb.TagNumber(2)
  set contractAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get consumeUserResourcePercent => $_getI64(2);
  @$pb.TagNumber(3)
  set consumeUserResourcePercent($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConsumeUserResourcePercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearConsumeUserResourcePercent() => clearField(3);
}

class UpdateEnergyLimitContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateEnergyLimitContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'contractAddress', $pb.PbFieldType.OY)
    ..aInt64(3, 'originEnergyLimit')
    ..hasRequiredFields = false
  ;

  UpdateEnergyLimitContract._() : super();
  factory UpdateEnergyLimitContract() => create();
  factory UpdateEnergyLimitContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEnergyLimitContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateEnergyLimitContract clone() => UpdateEnergyLimitContract()..mergeFromMessage(this);
  UpdateEnergyLimitContract copyWith(void Function(UpdateEnergyLimitContract) updates) => super.copyWith((message) => updates(message as UpdateEnergyLimitContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateEnergyLimitContract create() => UpdateEnergyLimitContract._();
  UpdateEnergyLimitContract createEmptyInstance() => create();
  static $pb.PbList<UpdateEnergyLimitContract> createRepeated() => $pb.PbList<UpdateEnergyLimitContract>();
  @$core.pragma('dart2js:noInline')
  static UpdateEnergyLimitContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEnergyLimitContract>(create);
  static UpdateEnergyLimitContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get contractAddress => $_getN(1);
  @$pb.TagNumber(2)
  set contractAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get originEnergyLimit => $_getI64(2);
  @$pb.TagNumber(3)
  set originEnergyLimit($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOriginEnergyLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearOriginEnergyLimit() => clearField(3);
}

class ClearABIContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ClearABIContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'contractAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ClearABIContract._() : super();
  factory ClearABIContract() => create();
  factory ClearABIContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClearABIContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ClearABIContract clone() => ClearABIContract()..mergeFromMessage(this);
  ClearABIContract copyWith(void Function(ClearABIContract) updates) => super.copyWith((message) => updates(message as ClearABIContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClearABIContract create() => ClearABIContract._();
  ClearABIContract createEmptyInstance() => create();
  static $pb.PbList<ClearABIContract> createRepeated() => $pb.PbList<ClearABIContract>();
  @$core.pragma('dart2js:noInline')
  static ClearABIContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClearABIContract>(create);
  static ClearABIContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get contractAddress => $_getN(1);
  @$pb.TagNumber(2)
  set contractAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);
}

class WitnessCreateContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WitnessCreateContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'url', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WitnessCreateContract._() : super();
  factory WitnessCreateContract() => create();
  factory WitnessCreateContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WitnessCreateContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WitnessCreateContract clone() => WitnessCreateContract()..mergeFromMessage(this);
  WitnessCreateContract copyWith(void Function(WitnessCreateContract) updates) => super.copyWith((message) => updates(message as WitnessCreateContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WitnessCreateContract create() => WitnessCreateContract._();
  WitnessCreateContract createEmptyInstance() => create();
  static $pb.PbList<WitnessCreateContract> createRepeated() => $pb.PbList<WitnessCreateContract>();
  @$core.pragma('dart2js:noInline')
  static WitnessCreateContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WitnessCreateContract>(create);
  static WitnessCreateContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get url => $_getN(1);
  @$pb.TagNumber(2)
  set url($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

class WitnessUpdateContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WitnessUpdateContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(12, 'updateUrl', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WitnessUpdateContract._() : super();
  factory WitnessUpdateContract() => create();
  factory WitnessUpdateContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WitnessUpdateContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WitnessUpdateContract clone() => WitnessUpdateContract()..mergeFromMessage(this);
  WitnessUpdateContract copyWith(void Function(WitnessUpdateContract) updates) => super.copyWith((message) => updates(message as WitnessUpdateContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WitnessUpdateContract create() => WitnessUpdateContract._();
  WitnessUpdateContract createEmptyInstance() => create();
  static $pb.PbList<WitnessUpdateContract> createRepeated() => $pb.PbList<WitnessUpdateContract>();
  @$core.pragma('dart2js:noInline')
  static WitnessUpdateContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WitnessUpdateContract>(create);
  static WitnessUpdateContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(12)
  $core.List<$core.int> get updateUrl => $_getN(1);
  @$pb.TagNumber(12)
  set updateUrl($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(12)
  $core.bool hasUpdateUrl() => $_has(1);
  @$pb.TagNumber(12)
  void clearUpdateUrl() => clearField(12);
}

class AssetIssueContract_FrozenSupply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AssetIssueContract.FrozenSupply', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'frozenAmount')
    ..aInt64(2, 'frozenDays')
    ..hasRequiredFields = false
  ;

  AssetIssueContract_FrozenSupply._() : super();
  factory AssetIssueContract_FrozenSupply() => create();
  factory AssetIssueContract_FrozenSupply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetIssueContract_FrozenSupply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AssetIssueContract_FrozenSupply clone() => AssetIssueContract_FrozenSupply()..mergeFromMessage(this);
  AssetIssueContract_FrozenSupply copyWith(void Function(AssetIssueContract_FrozenSupply) updates) => super.copyWith((message) => updates(message as AssetIssueContract_FrozenSupply));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AssetIssueContract_FrozenSupply create() => AssetIssueContract_FrozenSupply._();
  AssetIssueContract_FrozenSupply createEmptyInstance() => create();
  static $pb.PbList<AssetIssueContract_FrozenSupply> createRepeated() => $pb.PbList<AssetIssueContract_FrozenSupply>();
  @$core.pragma('dart2js:noInline')
  static AssetIssueContract_FrozenSupply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetIssueContract_FrozenSupply>(create);
  static AssetIssueContract_FrozenSupply _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get frozenAmount => $_getI64(0);
  @$pb.TagNumber(1)
  set frozenAmount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrozenAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrozenAmount() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get frozenDays => $_getI64(1);
  @$pb.TagNumber(2)
  set frozenDays($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrozenDays() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrozenDays() => clearField(2);
}

class AssetIssueContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AssetIssueContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'name', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'abbr', $pb.PbFieldType.OY)
    ..aInt64(4, 'totalSupply')
    ..pc<AssetIssueContract_FrozenSupply>(5, 'frozenSupply', $pb.PbFieldType.PM, subBuilder: AssetIssueContract_FrozenSupply.create)
    ..a<$core.int>(6, 'trxNum', $pb.PbFieldType.O3)
    ..a<$core.int>(7, 'precision', $pb.PbFieldType.O3)
    ..a<$core.int>(8, 'num', $pb.PbFieldType.O3)
    ..aInt64(9, 'startTime')
    ..aInt64(10, 'endTime')
    ..aInt64(11, 'order')
    ..a<$core.int>(16, 'voteScore', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(20, 'description', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(21, 'url', $pb.PbFieldType.OY)
    ..aInt64(22, 'freeAssetNetLimit')
    ..aInt64(23, 'publicFreeAssetNetLimit')
    ..aInt64(24, 'publicFreeAssetNetUsage')
    ..aInt64(25, 'publicLatestFreeNetTime')
    ..aOS(41, 'id')
    ..hasRequiredFields = false
  ;

  AssetIssueContract._() : super();
  factory AssetIssueContract() => create();
  factory AssetIssueContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetIssueContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AssetIssueContract clone() => AssetIssueContract()..mergeFromMessage(this);
  AssetIssueContract copyWith(void Function(AssetIssueContract) updates) => super.copyWith((message) => updates(message as AssetIssueContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AssetIssueContract create() => AssetIssueContract._();
  AssetIssueContract createEmptyInstance() => create();
  static $pb.PbList<AssetIssueContract> createRepeated() => $pb.PbList<AssetIssueContract>();
  @$core.pragma('dart2js:noInline')
  static AssetIssueContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetIssueContract>(create);
  static AssetIssueContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get name => $_getN(1);
  @$pb.TagNumber(2)
  set name($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get abbr => $_getN(2);
  @$pb.TagNumber(3)
  set abbr($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAbbr() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbbr() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalSupply => $_getI64(3);
  @$pb.TagNumber(4)
  set totalSupply($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalSupply() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalSupply() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<AssetIssueContract_FrozenSupply> get frozenSupply => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get trxNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set trxNum($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTrxNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearTrxNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get precision => $_getIZ(6);
  @$pb.TagNumber(7)
  set precision($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPrecision() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrecision() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get num => $_getIZ(7);
  @$pb.TagNumber(8)
  set num($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearNum() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get startTime => $_getI64(8);
  @$pb.TagNumber(9)
  set startTime($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasStartTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearStartTime() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get endTime => $_getI64(9);
  @$pb.TagNumber(10)
  set endTime($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasEndTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearEndTime() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get order => $_getI64(10);
  @$pb.TagNumber(11)
  set order($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasOrder() => $_has(10);
  @$pb.TagNumber(11)
  void clearOrder() => clearField(11);

  @$pb.TagNumber(16)
  $core.int get voteScore => $_getIZ(11);
  @$pb.TagNumber(16)
  set voteScore($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(16)
  $core.bool hasVoteScore() => $_has(11);
  @$pb.TagNumber(16)
  void clearVoteScore() => clearField(16);

  @$pb.TagNumber(20)
  $core.List<$core.int> get description => $_getN(12);
  @$pb.TagNumber(20)
  set description($core.List<$core.int> v) { $_setBytes(12, v); }
  @$pb.TagNumber(20)
  $core.bool hasDescription() => $_has(12);
  @$pb.TagNumber(20)
  void clearDescription() => clearField(20);

  @$pb.TagNumber(21)
  $core.List<$core.int> get url => $_getN(13);
  @$pb.TagNumber(21)
  set url($core.List<$core.int> v) { $_setBytes(13, v); }
  @$pb.TagNumber(21)
  $core.bool hasUrl() => $_has(13);
  @$pb.TagNumber(21)
  void clearUrl() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get freeAssetNetLimit => $_getI64(14);
  @$pb.TagNumber(22)
  set freeAssetNetLimit($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(22)
  $core.bool hasFreeAssetNetLimit() => $_has(14);
  @$pb.TagNumber(22)
  void clearFreeAssetNetLimit() => clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get publicFreeAssetNetLimit => $_getI64(15);
  @$pb.TagNumber(23)
  set publicFreeAssetNetLimit($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(23)
  $core.bool hasPublicFreeAssetNetLimit() => $_has(15);
  @$pb.TagNumber(23)
  void clearPublicFreeAssetNetLimit() => clearField(23);

  @$pb.TagNumber(24)
  $fixnum.Int64 get publicFreeAssetNetUsage => $_getI64(16);
  @$pb.TagNumber(24)
  set publicFreeAssetNetUsage($fixnum.Int64 v) { $_setInt64(16, v); }
  @$pb.TagNumber(24)
  $core.bool hasPublicFreeAssetNetUsage() => $_has(16);
  @$pb.TagNumber(24)
  void clearPublicFreeAssetNetUsage() => clearField(24);

  @$pb.TagNumber(25)
  $fixnum.Int64 get publicLatestFreeNetTime => $_getI64(17);
  @$pb.TagNumber(25)
  set publicLatestFreeNetTime($fixnum.Int64 v) { $_setInt64(17, v); }
  @$pb.TagNumber(25)
  $core.bool hasPublicLatestFreeNetTime() => $_has(17);
  @$pb.TagNumber(25)
  void clearPublicLatestFreeNetTime() => clearField(25);

  @$pb.TagNumber(41)
  $core.String get id => $_getSZ(18);
  @$pb.TagNumber(41)
  set id($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(41)
  $core.bool hasId() => $_has(18);
  @$pb.TagNumber(41)
  void clearId() => clearField(41);
}

class ParticipateAssetIssueContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ParticipateAssetIssueContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'toAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'assetName', $pb.PbFieldType.OY)
    ..aInt64(4, 'amount')
    ..hasRequiredFields = false
  ;

  ParticipateAssetIssueContract._() : super();
  factory ParticipateAssetIssueContract() => create();
  factory ParticipateAssetIssueContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ParticipateAssetIssueContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ParticipateAssetIssueContract clone() => ParticipateAssetIssueContract()..mergeFromMessage(this);
  ParticipateAssetIssueContract copyWith(void Function(ParticipateAssetIssueContract) updates) => super.copyWith((message) => updates(message as ParticipateAssetIssueContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParticipateAssetIssueContract create() => ParticipateAssetIssueContract._();
  ParticipateAssetIssueContract createEmptyInstance() => create();
  static $pb.PbList<ParticipateAssetIssueContract> createRepeated() => $pb.PbList<ParticipateAssetIssueContract>();
  @$core.pragma('dart2js:noInline')
  static ParticipateAssetIssueContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ParticipateAssetIssueContract>(create);
  static ParticipateAssetIssueContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get toAddress => $_getN(1);
  @$pb.TagNumber(2)
  set toAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get assetName => $_getN(2);
  @$pb.TagNumber(3)
  set assetName($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAssetName() => $_has(2);
  @$pb.TagNumber(3)
  void clearAssetName() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get amount => $_getI64(3);
  @$pb.TagNumber(4)
  set amount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);
}

class FreezeBalanceContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FreezeBalanceContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'frozenBalance')
    ..aInt64(3, 'frozenDuration')
    ..e<ResourceCode>(10, 'resource', $pb.PbFieldType.OE, defaultOrMaker: ResourceCode.BANDWIDTH, valueOf: ResourceCode.valueOf, enumValues: ResourceCode.values)
    ..a<$core.List<$core.int>>(15, 'receiverAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  FreezeBalanceContract._() : super();
  factory FreezeBalanceContract() => create();
  factory FreezeBalanceContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FreezeBalanceContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FreezeBalanceContract clone() => FreezeBalanceContract()..mergeFromMessage(this);
  FreezeBalanceContract copyWith(void Function(FreezeBalanceContract) updates) => super.copyWith((message) => updates(message as FreezeBalanceContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FreezeBalanceContract create() => FreezeBalanceContract._();
  FreezeBalanceContract createEmptyInstance() => create();
  static $pb.PbList<FreezeBalanceContract> createRepeated() => $pb.PbList<FreezeBalanceContract>();
  @$core.pragma('dart2js:noInline')
  static FreezeBalanceContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FreezeBalanceContract>(create);
  static FreezeBalanceContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get frozenBalance => $_getI64(1);
  @$pb.TagNumber(2)
  set frozenBalance($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrozenBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrozenBalance() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get frozenDuration => $_getI64(2);
  @$pb.TagNumber(3)
  set frozenDuration($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrozenDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrozenDuration() => clearField(3);

  @$pb.TagNumber(10)
  ResourceCode get resource => $_getN(3);
  @$pb.TagNumber(10)
  set resource(ResourceCode v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasResource() => $_has(3);
  @$pb.TagNumber(10)
  void clearResource() => clearField(10);

  @$pb.TagNumber(15)
  $core.List<$core.int> get receiverAddress => $_getN(4);
  @$pb.TagNumber(15)
  set receiverAddress($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(15)
  $core.bool hasReceiverAddress() => $_has(4);
  @$pb.TagNumber(15)
  void clearReceiverAddress() => clearField(15);
}

class UnfreezeBalanceContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UnfreezeBalanceContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..e<ResourceCode>(10, 'resource', $pb.PbFieldType.OE, defaultOrMaker: ResourceCode.BANDWIDTH, valueOf: ResourceCode.valueOf, enumValues: ResourceCode.values)
    ..a<$core.List<$core.int>>(15, 'receiverAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  UnfreezeBalanceContract._() : super();
  factory UnfreezeBalanceContract() => create();
  factory UnfreezeBalanceContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnfreezeBalanceContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UnfreezeBalanceContract clone() => UnfreezeBalanceContract()..mergeFromMessage(this);
  UnfreezeBalanceContract copyWith(void Function(UnfreezeBalanceContract) updates) => super.copyWith((message) => updates(message as UnfreezeBalanceContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnfreezeBalanceContract create() => UnfreezeBalanceContract._();
  UnfreezeBalanceContract createEmptyInstance() => create();
  static $pb.PbList<UnfreezeBalanceContract> createRepeated() => $pb.PbList<UnfreezeBalanceContract>();
  @$core.pragma('dart2js:noInline')
  static UnfreezeBalanceContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnfreezeBalanceContract>(create);
  static UnfreezeBalanceContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(10)
  ResourceCode get resource => $_getN(1);
  @$pb.TagNumber(10)
  set resource(ResourceCode v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasResource() => $_has(1);
  @$pb.TagNumber(10)
  void clearResource() => clearField(10);

  @$pb.TagNumber(15)
  $core.List<$core.int> get receiverAddress => $_getN(2);
  @$pb.TagNumber(15)
  set receiverAddress($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(15)
  $core.bool hasReceiverAddress() => $_has(2);
  @$pb.TagNumber(15)
  void clearReceiverAddress() => clearField(15);
}

class UnfreezeAssetContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UnfreezeAssetContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  UnfreezeAssetContract._() : super();
  factory UnfreezeAssetContract() => create();
  factory UnfreezeAssetContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnfreezeAssetContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UnfreezeAssetContract clone() => UnfreezeAssetContract()..mergeFromMessage(this);
  UnfreezeAssetContract copyWith(void Function(UnfreezeAssetContract) updates) => super.copyWith((message) => updates(message as UnfreezeAssetContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnfreezeAssetContract create() => UnfreezeAssetContract._();
  UnfreezeAssetContract createEmptyInstance() => create();
  static $pb.PbList<UnfreezeAssetContract> createRepeated() => $pb.PbList<UnfreezeAssetContract>();
  @$core.pragma('dart2js:noInline')
  static UnfreezeAssetContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnfreezeAssetContract>(create);
  static UnfreezeAssetContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);
}

class WithdrawBalanceContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WithdrawBalanceContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WithdrawBalanceContract._() : super();
  factory WithdrawBalanceContract() => create();
  factory WithdrawBalanceContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WithdrawBalanceContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WithdrawBalanceContract clone() => WithdrawBalanceContract()..mergeFromMessage(this);
  WithdrawBalanceContract copyWith(void Function(WithdrawBalanceContract) updates) => super.copyWith((message) => updates(message as WithdrawBalanceContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WithdrawBalanceContract create() => WithdrawBalanceContract._();
  WithdrawBalanceContract createEmptyInstance() => create();
  static $pb.PbList<WithdrawBalanceContract> createRepeated() => $pb.PbList<WithdrawBalanceContract>();
  @$core.pragma('dart2js:noInline')
  static WithdrawBalanceContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WithdrawBalanceContract>(create);
  static WithdrawBalanceContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);
}

class UpdateAssetContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateAssetContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'description', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'url', $pb.PbFieldType.OY)
    ..aInt64(4, 'newLimit')
    ..aInt64(5, 'newPublicLimit')
    ..hasRequiredFields = false
  ;

  UpdateAssetContract._() : super();
  factory UpdateAssetContract() => create();
  factory UpdateAssetContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAssetContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateAssetContract clone() => UpdateAssetContract()..mergeFromMessage(this);
  UpdateAssetContract copyWith(void Function(UpdateAssetContract) updates) => super.copyWith((message) => updates(message as UpdateAssetContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateAssetContract create() => UpdateAssetContract._();
  UpdateAssetContract createEmptyInstance() => create();
  static $pb.PbList<UpdateAssetContract> createRepeated() => $pb.PbList<UpdateAssetContract>();
  @$core.pragma('dart2js:noInline')
  static UpdateAssetContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAssetContract>(create);
  static UpdateAssetContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get description => $_getN(1);
  @$pb.TagNumber(2)
  set description($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get url => $_getN(2);
  @$pb.TagNumber(3)
  set url($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get newLimit => $_getI64(3);
  @$pb.TagNumber(4)
  set newLimit($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNewLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearNewLimit() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get newPublicLimit => $_getI64(4);
  @$pb.TagNumber(5)
  set newPublicLimit($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNewPublicLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearNewPublicLimit() => clearField(5);
}

class ProposalCreateContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ProposalCreateContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..m<$fixnum.Int64, $fixnum.Int64>(2, 'parameters', entryClassName: 'ProposalCreateContract.ParametersEntry', keyFieldType: $pb.PbFieldType.O6, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..hasRequiredFields = false
  ;

  ProposalCreateContract._() : super();
  factory ProposalCreateContract() => create();
  factory ProposalCreateContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProposalCreateContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ProposalCreateContract clone() => ProposalCreateContract()..mergeFromMessage(this);
  ProposalCreateContract copyWith(void Function(ProposalCreateContract) updates) => super.copyWith((message) => updates(message as ProposalCreateContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProposalCreateContract create() => ProposalCreateContract._();
  ProposalCreateContract createEmptyInstance() => create();
  static $pb.PbList<ProposalCreateContract> createRepeated() => $pb.PbList<ProposalCreateContract>();
  @$core.pragma('dart2js:noInline')
  static ProposalCreateContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProposalCreateContract>(create);
  static ProposalCreateContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$fixnum.Int64, $fixnum.Int64> get parameters => $_getMap(1);
}

class ProposalApproveContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ProposalApproveContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'proposalId')
    ..aOB(3, 'isAddApproval')
    ..hasRequiredFields = false
  ;

  ProposalApproveContract._() : super();
  factory ProposalApproveContract() => create();
  factory ProposalApproveContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProposalApproveContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ProposalApproveContract clone() => ProposalApproveContract()..mergeFromMessage(this);
  ProposalApproveContract copyWith(void Function(ProposalApproveContract) updates) => super.copyWith((message) => updates(message as ProposalApproveContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProposalApproveContract create() => ProposalApproveContract._();
  ProposalApproveContract createEmptyInstance() => create();
  static $pb.PbList<ProposalApproveContract> createRepeated() => $pb.PbList<ProposalApproveContract>();
  @$core.pragma('dart2js:noInline')
  static ProposalApproveContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProposalApproveContract>(create);
  static ProposalApproveContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get proposalId => $_getI64(1);
  @$pb.TagNumber(2)
  set proposalId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProposalId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProposalId() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isAddApproval => $_getBF(2);
  @$pb.TagNumber(3)
  set isAddApproval($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAddApproval() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAddApproval() => clearField(3);
}

class ProposalDeleteContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ProposalDeleteContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'proposalId')
    ..hasRequiredFields = false
  ;

  ProposalDeleteContract._() : super();
  factory ProposalDeleteContract() => create();
  factory ProposalDeleteContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProposalDeleteContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ProposalDeleteContract clone() => ProposalDeleteContract()..mergeFromMessage(this);
  ProposalDeleteContract copyWith(void Function(ProposalDeleteContract) updates) => super.copyWith((message) => updates(message as ProposalDeleteContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProposalDeleteContract create() => ProposalDeleteContract._();
  ProposalDeleteContract createEmptyInstance() => create();
  static $pb.PbList<ProposalDeleteContract> createRepeated() => $pb.PbList<ProposalDeleteContract>();
  @$core.pragma('dart2js:noInline')
  static ProposalDeleteContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProposalDeleteContract>(create);
  static ProposalDeleteContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get proposalId => $_getI64(1);
  @$pb.TagNumber(2)
  set proposalId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProposalId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProposalId() => clearField(2);
}

class CreateSmartContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateSmartContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aOM<$2.SmartContract>(2, 'newContract', subBuilder: $2.SmartContract.create)
    ..aInt64(3, 'callTokenValue')
    ..aInt64(4, 'tokenId')
    ..hasRequiredFields = false
  ;

  CreateSmartContract._() : super();
  factory CreateSmartContract() => create();
  factory CreateSmartContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSmartContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateSmartContract clone() => CreateSmartContract()..mergeFromMessage(this);
  CreateSmartContract copyWith(void Function(CreateSmartContract) updates) => super.copyWith((message) => updates(message as CreateSmartContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateSmartContract create() => CreateSmartContract._();
  CreateSmartContract createEmptyInstance() => create();
  static $pb.PbList<CreateSmartContract> createRepeated() => $pb.PbList<CreateSmartContract>();
  @$core.pragma('dart2js:noInline')
  static CreateSmartContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSmartContract>(create);
  static CreateSmartContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $2.SmartContract get newContract => $_getN(1);
  @$pb.TagNumber(2)
  set newContract($2.SmartContract v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewContract() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewContract() => clearField(2);
  @$pb.TagNumber(2)
  $2.SmartContract ensureNewContract() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get callTokenValue => $_getI64(2);
  @$pb.TagNumber(3)
  set callTokenValue($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCallTokenValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearCallTokenValue() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get tokenId => $_getI64(3);
  @$pb.TagNumber(4)
  set tokenId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTokenId() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokenId() => clearField(4);
}

class TriggerSmartContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TriggerSmartContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'contractAddress', $pb.PbFieldType.OY)
    ..aInt64(3, 'callValue')
    ..a<$core.List<$core.int>>(4, 'data', $pb.PbFieldType.OY)
    ..aInt64(5, 'callTokenValue')
    ..aInt64(6, 'tokenId')
    ..hasRequiredFields = false
  ;

  TriggerSmartContract._() : super();
  factory TriggerSmartContract() => create();
  factory TriggerSmartContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TriggerSmartContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TriggerSmartContract clone() => TriggerSmartContract()..mergeFromMessage(this);
  TriggerSmartContract copyWith(void Function(TriggerSmartContract) updates) => super.copyWith((message) => updates(message as TriggerSmartContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TriggerSmartContract create() => TriggerSmartContract._();
  TriggerSmartContract createEmptyInstance() => create();
  static $pb.PbList<TriggerSmartContract> createRepeated() => $pb.PbList<TriggerSmartContract>();
  @$core.pragma('dart2js:noInline')
  static TriggerSmartContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TriggerSmartContract>(create);
  static TriggerSmartContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get contractAddress => $_getN(1);
  @$pb.TagNumber(2)
  set contractAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get callValue => $_getI64(2);
  @$pb.TagNumber(3)
  set callValue($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCallValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearCallValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get callTokenValue => $_getI64(4);
  @$pb.TagNumber(5)
  set callTokenValue($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCallTokenValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearCallTokenValue() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get tokenId => $_getI64(5);
  @$pb.TagNumber(6)
  set tokenId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTokenId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTokenId() => clearField(6);
}

class BuyStorageContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BuyStorageContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'quant')
    ..hasRequiredFields = false
  ;

  BuyStorageContract._() : super();
  factory BuyStorageContract() => create();
  factory BuyStorageContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BuyStorageContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BuyStorageContract clone() => BuyStorageContract()..mergeFromMessage(this);
  BuyStorageContract copyWith(void Function(BuyStorageContract) updates) => super.copyWith((message) => updates(message as BuyStorageContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BuyStorageContract create() => BuyStorageContract._();
  BuyStorageContract createEmptyInstance() => create();
  static $pb.PbList<BuyStorageContract> createRepeated() => $pb.PbList<BuyStorageContract>();
  @$core.pragma('dart2js:noInline')
  static BuyStorageContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BuyStorageContract>(create);
  static BuyStorageContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get quant => $_getI64(1);
  @$pb.TagNumber(2)
  set quant($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuant() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuant() => clearField(2);
}

class BuyStorageBytesContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BuyStorageBytesContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'bytes')
    ..hasRequiredFields = false
  ;

  BuyStorageBytesContract._() : super();
  factory BuyStorageBytesContract() => create();
  factory BuyStorageBytesContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BuyStorageBytesContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BuyStorageBytesContract clone() => BuyStorageBytesContract()..mergeFromMessage(this);
  BuyStorageBytesContract copyWith(void Function(BuyStorageBytesContract) updates) => super.copyWith((message) => updates(message as BuyStorageBytesContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BuyStorageBytesContract create() => BuyStorageBytesContract._();
  BuyStorageBytesContract createEmptyInstance() => create();
  static $pb.PbList<BuyStorageBytesContract> createRepeated() => $pb.PbList<BuyStorageBytesContract>();
  @$core.pragma('dart2js:noInline')
  static BuyStorageBytesContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BuyStorageBytesContract>(create);
  static BuyStorageBytesContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bytes => $_getI64(1);
  @$pb.TagNumber(2)
  set bytes($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBytes() => $_has(1);
  @$pb.TagNumber(2)
  void clearBytes() => clearField(2);
}

class SellStorageContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SellStorageContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'storageBytes')
    ..hasRequiredFields = false
  ;

  SellStorageContract._() : super();
  factory SellStorageContract() => create();
  factory SellStorageContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SellStorageContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SellStorageContract clone() => SellStorageContract()..mergeFromMessage(this);
  SellStorageContract copyWith(void Function(SellStorageContract) updates) => super.copyWith((message) => updates(message as SellStorageContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SellStorageContract create() => SellStorageContract._();
  SellStorageContract createEmptyInstance() => create();
  static $pb.PbList<SellStorageContract> createRepeated() => $pb.PbList<SellStorageContract>();
  @$core.pragma('dart2js:noInline')
  static SellStorageContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SellStorageContract>(create);
  static SellStorageContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get storageBytes => $_getI64(1);
  @$pb.TagNumber(2)
  set storageBytes($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStorageBytes() => $_has(1);
  @$pb.TagNumber(2)
  void clearStorageBytes() => clearField(2);
}

class ExchangeCreateContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExchangeCreateContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'firstTokenId', $pb.PbFieldType.OY)
    ..aInt64(3, 'firstTokenBalance')
    ..a<$core.List<$core.int>>(4, 'secondTokenId', $pb.PbFieldType.OY)
    ..aInt64(5, 'secondTokenBalance')
    ..hasRequiredFields = false
  ;

  ExchangeCreateContract._() : super();
  factory ExchangeCreateContract() => create();
  factory ExchangeCreateContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExchangeCreateContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ExchangeCreateContract clone() => ExchangeCreateContract()..mergeFromMessage(this);
  ExchangeCreateContract copyWith(void Function(ExchangeCreateContract) updates) => super.copyWith((message) => updates(message as ExchangeCreateContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExchangeCreateContract create() => ExchangeCreateContract._();
  ExchangeCreateContract createEmptyInstance() => create();
  static $pb.PbList<ExchangeCreateContract> createRepeated() => $pb.PbList<ExchangeCreateContract>();
  @$core.pragma('dart2js:noInline')
  static ExchangeCreateContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeCreateContract>(create);
  static ExchangeCreateContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get firstTokenId => $_getN(1);
  @$pb.TagNumber(2)
  set firstTokenId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstTokenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstTokenId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get firstTokenBalance => $_getI64(2);
  @$pb.TagNumber(3)
  set firstTokenBalance($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirstTokenBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstTokenBalance() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get secondTokenId => $_getN(3);
  @$pb.TagNumber(4)
  set secondTokenId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecondTokenId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecondTokenId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get secondTokenBalance => $_getI64(4);
  @$pb.TagNumber(5)
  set secondTokenBalance($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSecondTokenBalance() => $_has(4);
  @$pb.TagNumber(5)
  void clearSecondTokenBalance() => clearField(5);
}

class ExchangeInjectContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExchangeInjectContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'exchangeId')
    ..a<$core.List<$core.int>>(3, 'tokenId', $pb.PbFieldType.OY)
    ..aInt64(4, 'quant')
    ..hasRequiredFields = false
  ;

  ExchangeInjectContract._() : super();
  factory ExchangeInjectContract() => create();
  factory ExchangeInjectContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExchangeInjectContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ExchangeInjectContract clone() => ExchangeInjectContract()..mergeFromMessage(this);
  ExchangeInjectContract copyWith(void Function(ExchangeInjectContract) updates) => super.copyWith((message) => updates(message as ExchangeInjectContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExchangeInjectContract create() => ExchangeInjectContract._();
  ExchangeInjectContract createEmptyInstance() => create();
  static $pb.PbList<ExchangeInjectContract> createRepeated() => $pb.PbList<ExchangeInjectContract>();
  @$core.pragma('dart2js:noInline')
  static ExchangeInjectContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeInjectContract>(create);
  static ExchangeInjectContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get exchangeId => $_getI64(1);
  @$pb.TagNumber(2)
  set exchangeId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExchangeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExchangeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenId => $_getN(2);
  @$pb.TagNumber(3)
  set tokenId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTokenId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get quant => $_getI64(3);
  @$pb.TagNumber(4)
  set quant($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQuant() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuant() => clearField(4);
}

class ExchangeWithdrawContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExchangeWithdrawContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'exchangeId')
    ..a<$core.List<$core.int>>(3, 'tokenId', $pb.PbFieldType.OY)
    ..aInt64(4, 'quant')
    ..hasRequiredFields = false
  ;

  ExchangeWithdrawContract._() : super();
  factory ExchangeWithdrawContract() => create();
  factory ExchangeWithdrawContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExchangeWithdrawContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ExchangeWithdrawContract clone() => ExchangeWithdrawContract()..mergeFromMessage(this);
  ExchangeWithdrawContract copyWith(void Function(ExchangeWithdrawContract) updates) => super.copyWith((message) => updates(message as ExchangeWithdrawContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExchangeWithdrawContract create() => ExchangeWithdrawContract._();
  ExchangeWithdrawContract createEmptyInstance() => create();
  static $pb.PbList<ExchangeWithdrawContract> createRepeated() => $pb.PbList<ExchangeWithdrawContract>();
  @$core.pragma('dart2js:noInline')
  static ExchangeWithdrawContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeWithdrawContract>(create);
  static ExchangeWithdrawContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get exchangeId => $_getI64(1);
  @$pb.TagNumber(2)
  set exchangeId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExchangeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExchangeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenId => $_getN(2);
  @$pb.TagNumber(3)
  set tokenId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTokenId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get quant => $_getI64(3);
  @$pb.TagNumber(4)
  set quant($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQuant() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuant() => clearField(4);
}

class ExchangeTransactionContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExchangeTransactionContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'exchangeId')
    ..a<$core.List<$core.int>>(3, 'tokenId', $pb.PbFieldType.OY)
    ..aInt64(4, 'quant')
    ..aInt64(5, 'expected')
    ..hasRequiredFields = false
  ;

  ExchangeTransactionContract._() : super();
  factory ExchangeTransactionContract() => create();
  factory ExchangeTransactionContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExchangeTransactionContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ExchangeTransactionContract clone() => ExchangeTransactionContract()..mergeFromMessage(this);
  ExchangeTransactionContract copyWith(void Function(ExchangeTransactionContract) updates) => super.copyWith((message) => updates(message as ExchangeTransactionContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExchangeTransactionContract create() => ExchangeTransactionContract._();
  ExchangeTransactionContract createEmptyInstance() => create();
  static $pb.PbList<ExchangeTransactionContract> createRepeated() => $pb.PbList<ExchangeTransactionContract>();
  @$core.pragma('dart2js:noInline')
  static ExchangeTransactionContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExchangeTransactionContract>(create);
  static ExchangeTransactionContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get exchangeId => $_getI64(1);
  @$pb.TagNumber(2)
  set exchangeId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExchangeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExchangeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get tokenId => $_getN(2);
  @$pb.TagNumber(3)
  set tokenId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTokenId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTokenId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get quant => $_getI64(3);
  @$pb.TagNumber(4)
  set quant($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQuant() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuant() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expected => $_getI64(4);
  @$pb.TagNumber(5)
  set expected($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpected() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpected() => clearField(5);
}

class AccountPermissionUpdateContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountPermissionUpdateContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..aOM<$2.Permission>(2, 'owner', subBuilder: $2.Permission.create)
    ..aOM<$2.Permission>(3, 'witness', subBuilder: $2.Permission.create)
    ..pc<$2.Permission>(4, 'actives', $pb.PbFieldType.PM, subBuilder: $2.Permission.create)
    ..hasRequiredFields = false
  ;

  AccountPermissionUpdateContract._() : super();
  factory AccountPermissionUpdateContract() => create();
  factory AccountPermissionUpdateContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountPermissionUpdateContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AccountPermissionUpdateContract clone() => AccountPermissionUpdateContract()..mergeFromMessage(this);
  AccountPermissionUpdateContract copyWith(void Function(AccountPermissionUpdateContract) updates) => super.copyWith((message) => updates(message as AccountPermissionUpdateContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountPermissionUpdateContract create() => AccountPermissionUpdateContract._();
  AccountPermissionUpdateContract createEmptyInstance() => create();
  static $pb.PbList<AccountPermissionUpdateContract> createRepeated() => $pb.PbList<AccountPermissionUpdateContract>();
  @$core.pragma('dart2js:noInline')
  static AccountPermissionUpdateContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountPermissionUpdateContract>(create);
  static AccountPermissionUpdateContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $2.Permission get owner => $_getN(1);
  @$pb.TagNumber(2)
  set owner($2.Permission v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwner() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwner() => clearField(2);
  @$pb.TagNumber(2)
  $2.Permission ensureOwner() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Permission get witness => $_getN(2);
  @$pb.TagNumber(3)
  set witness($2.Permission v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasWitness() => $_has(2);
  @$pb.TagNumber(3)
  void clearWitness() => clearField(3);
  @$pb.TagNumber(3)
  $2.Permission ensureWitness() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$2.Permission> get actives => $_getList(3);
}

class UpdateBrokerageContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateBrokerageContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'ownerAddress', $pb.PbFieldType.OY)
    ..a<$core.int>(2, 'brokerage', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  UpdateBrokerageContract._() : super();
  factory UpdateBrokerageContract() => create();
  factory UpdateBrokerageContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBrokerageContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateBrokerageContract clone() => UpdateBrokerageContract()..mergeFromMessage(this);
  UpdateBrokerageContract copyWith(void Function(UpdateBrokerageContract) updates) => super.copyWith((message) => updates(message as UpdateBrokerageContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateBrokerageContract create() => UpdateBrokerageContract._();
  UpdateBrokerageContract createEmptyInstance() => create();
  static $pb.PbList<UpdateBrokerageContract> createRepeated() => $pb.PbList<UpdateBrokerageContract>();
  @$core.pragma('dart2js:noInline')
  static UpdateBrokerageContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBrokerageContract>(create);
  static UpdateBrokerageContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get ownerAddress => $_getN(0);
  @$pb.TagNumber(1)
  set ownerAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwnerAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get brokerage => $_getIZ(1);
  @$pb.TagNumber(2)
  set brokerage($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBrokerage() => $_has(1);
  @$pb.TagNumber(2)
  void clearBrokerage() => clearField(2);
}

