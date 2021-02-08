
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/any.pb.dart' as $0;
import 'Discover.pb.dart' as $1;
import 'Tron.pbenum.dart';

export 'Tron.pbenum.dart';

class AccountId extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountId', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'name', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'address', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AccountId._() : super();
  factory AccountId() => create();
  factory AccountId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AccountId clone() => AccountId()..mergeFromMessage(this);
  AccountId copyWith(void Function(AccountId) updates) => super.copyWith((message) => updates(message as AccountId));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountId create() => AccountId._();
  AccountId createEmptyInstance() => create();
  static $pb.PbList<AccountId> createRepeated() => $pb.PbList<AccountId>();
  @$core.pragma('dart2js:noInline')
  static AccountId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountId>(create);
  static AccountId _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get name => $_getN(0);
  @$pb.TagNumber(1)
  set name($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get address => $_getN(1);
  @$pb.TagNumber(2)
  set address($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
}

class Vote extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Vote', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'voteAddress', $pb.PbFieldType.OY)
    ..aInt64(2, 'voteCount')
    ..hasRequiredFields = false
  ;

  Vote._() : super();
  factory Vote() => create();
  factory Vote.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Vote.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Vote clone() => Vote()..mergeFromMessage(this);
  Vote copyWith(void Function(Vote) updates) => super.copyWith((message) => updates(message as Vote));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Vote create() => Vote._();
  Vote createEmptyInstance() => create();
  static $pb.PbList<Vote> createRepeated() => $pb.PbList<Vote>();
  @$core.pragma('dart2js:noInline')
  static Vote getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Vote>(create);
  static Vote _defaultInstance;

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

class Proposal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Proposal', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'proposalId')
    ..a<$core.List<$core.int>>(2, 'proposerAddress', $pb.PbFieldType.OY)
    ..m<$fixnum.Int64, $fixnum.Int64>(3, 'parameters', entryClassName: 'Proposal.ParametersEntry', keyFieldType: $pb.PbFieldType.O6, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..aInt64(4, 'expirationTime')
    ..aInt64(5, 'createTime')
    ..p<$core.List<$core.int>>(6, 'approvals', $pb.PbFieldType.PY)
    ..e<Proposal_State>(7, 'state', $pb.PbFieldType.OE, defaultOrMaker: Proposal_State.PENDING, valueOf: Proposal_State.valueOf, enumValues: Proposal_State.values)
    ..hasRequiredFields = false
  ;

  Proposal._() : super();
  factory Proposal() => create();
  factory Proposal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Proposal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Proposal clone() => Proposal()..mergeFromMessage(this);
  Proposal copyWith(void Function(Proposal) updates) => super.copyWith((message) => updates(message as Proposal));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Proposal create() => Proposal._();
  Proposal createEmptyInstance() => create();
  static $pb.PbList<Proposal> createRepeated() => $pb.PbList<Proposal>();
  @$core.pragma('dart2js:noInline')
  static Proposal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Proposal>(create);
  static Proposal _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get proposerAddress => $_getN(1);
  @$pb.TagNumber(2)
  set proposerAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProposerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearProposerAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$fixnum.Int64, $fixnum.Int64> get parameters => $_getMap(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expirationTime => $_getI64(3);
  @$pb.TagNumber(4)
  set expirationTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpirationTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpirationTime() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createTime => $_getI64(4);
  @$pb.TagNumber(5)
  set createTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.List<$core.int>> get approvals => $_getList(5);

  @$pb.TagNumber(7)
  Proposal_State get state => $_getN(6);
  @$pb.TagNumber(7)
  set state(Proposal_State v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasState() => $_has(6);
  @$pb.TagNumber(7)
  void clearState() => clearField(7);
}

class Exchange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Exchange', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'exchangeId')
    ..a<$core.List<$core.int>>(2, 'creatorAddress', $pb.PbFieldType.OY)
    ..aInt64(3, 'createTime')
    ..a<$core.List<$core.int>>(6, 'firstTokenId', $pb.PbFieldType.OY)
    ..aInt64(7, 'firstTokenBalance')
    ..a<$core.List<$core.int>>(8, 'secondTokenId', $pb.PbFieldType.OY)
    ..aInt64(9, 'secondTokenBalance')
    ..hasRequiredFields = false
  ;

  Exchange._() : super();
  factory Exchange() => create();
  factory Exchange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Exchange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Exchange clone() => Exchange()..mergeFromMessage(this);
  Exchange copyWith(void Function(Exchange) updates) => super.copyWith((message) => updates(message as Exchange));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Exchange create() => Exchange._();
  Exchange createEmptyInstance() => create();
  static $pb.PbList<Exchange> createRepeated() => $pb.PbList<Exchange>();
  @$core.pragma('dart2js:noInline')
  static Exchange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Exchange>(create);
  static Exchange _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get exchangeId => $_getI64(0);
  @$pb.TagNumber(1)
  set exchangeId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExchangeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearExchangeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get creatorAddress => $_getN(1);
  @$pb.TagNumber(2)
  set creatorAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatorAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatorAddress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get createTime => $_getI64(2);
  @$pb.TagNumber(3)
  set createTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateTime() => clearField(3);

  @$pb.TagNumber(6)
  $core.List<$core.int> get firstTokenId => $_getN(3);
  @$pb.TagNumber(6)
  set firstTokenId($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasFirstTokenId() => $_has(3);
  @$pb.TagNumber(6)
  void clearFirstTokenId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get firstTokenBalance => $_getI64(4);
  @$pb.TagNumber(7)
  set firstTokenBalance($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(7)
  $core.bool hasFirstTokenBalance() => $_has(4);
  @$pb.TagNumber(7)
  void clearFirstTokenBalance() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get secondTokenId => $_getN(5);
  @$pb.TagNumber(8)
  set secondTokenId($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(8)
  $core.bool hasSecondTokenId() => $_has(5);
  @$pb.TagNumber(8)
  void clearSecondTokenId() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get secondTokenBalance => $_getI64(6);
  @$pb.TagNumber(9)
  set secondTokenBalance($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(9)
  $core.bool hasSecondTokenBalance() => $_has(6);
  @$pb.TagNumber(9)
  void clearSecondTokenBalance() => clearField(9);
}

class ChainParameters_ChainParameter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChainParameters.ChainParameter', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOS(1, 'key')
    ..aInt64(2, 'value')
    ..hasRequiredFields = false
  ;

  ChainParameters_ChainParameter._() : super();
  factory ChainParameters_ChainParameter() => create();
  factory ChainParameters_ChainParameter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainParameters_ChainParameter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChainParameters_ChainParameter clone() => ChainParameters_ChainParameter()..mergeFromMessage(this);
  ChainParameters_ChainParameter copyWith(void Function(ChainParameters_ChainParameter) updates) => super.copyWith((message) => updates(message as ChainParameters_ChainParameter));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChainParameters_ChainParameter create() => ChainParameters_ChainParameter._();
  ChainParameters_ChainParameter createEmptyInstance() => create();
  static $pb.PbList<ChainParameters_ChainParameter> createRepeated() => $pb.PbList<ChainParameters_ChainParameter>();
  @$core.pragma('dart2js:noInline')
  static ChainParameters_ChainParameter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainParameters_ChainParameter>(create);
  static ChainParameters_ChainParameter _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class ChainParameters extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChainParameters', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<ChainParameters_ChainParameter>(1, 'chainParameter', $pb.PbFieldType.PM, protoName: 'chainParameter', subBuilder: ChainParameters_ChainParameter.create)
    ..hasRequiredFields = false
  ;

  ChainParameters._() : super();
  factory ChainParameters() => create();
  factory ChainParameters.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainParameters.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChainParameters clone() => ChainParameters()..mergeFromMessage(this);
  ChainParameters copyWith(void Function(ChainParameters) updates) => super.copyWith((message) => updates(message as ChainParameters));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChainParameters create() => ChainParameters._();
  ChainParameters createEmptyInstance() => create();
  static $pb.PbList<ChainParameters> createRepeated() => $pb.PbList<ChainParameters>();
  @$core.pragma('dart2js:noInline')
  static ChainParameters getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainParameters>(create);
  static ChainParameters _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChainParameters_ChainParameter> get chainParameter => $_getList(0);
}

class Account_Frozen extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Account.Frozen', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'frozenBalance')
    ..aInt64(2, 'expireTime')
    ..hasRequiredFields = false
  ;

  Account_Frozen._() : super();
  factory Account_Frozen() => create();
  factory Account_Frozen.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account_Frozen.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Account_Frozen clone() => Account_Frozen()..mergeFromMessage(this);
  Account_Frozen copyWith(void Function(Account_Frozen) updates) => super.copyWith((message) => updates(message as Account_Frozen));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Account_Frozen create() => Account_Frozen._();
  Account_Frozen createEmptyInstance() => create();
  static $pb.PbList<Account_Frozen> createRepeated() => $pb.PbList<Account_Frozen>();
  @$core.pragma('dart2js:noInline')
  static Account_Frozen getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account_Frozen>(create);
  static Account_Frozen _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get frozenBalance => $_getI64(0);
  @$pb.TagNumber(1)
  set frozenBalance($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrozenBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrozenBalance() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get expireTime => $_getI64(1);
  @$pb.TagNumber(2)
  set expireTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpireTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpireTime() => clearField(2);
}

class Account_AccountResource extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Account.AccountResource', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'energyUsage')
    ..aOM<Account_Frozen>(2, 'frozenBalanceForEnergy', subBuilder: Account_Frozen.create)
    ..aInt64(3, 'latestConsumeTimeForEnergy')
    ..aInt64(4, 'acquiredDelegatedFrozenBalanceForEnergy')
    ..aInt64(5, 'delegatedFrozenBalanceForEnergy')
    ..aInt64(6, 'storageLimit')
    ..aInt64(7, 'storageUsage')
    ..aInt64(8, 'latestExchangeStorageTime')
    ..hasRequiredFields = false
  ;

  Account_AccountResource._() : super();
  factory Account_AccountResource() => create();
  factory Account_AccountResource.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account_AccountResource.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Account_AccountResource clone() => Account_AccountResource()..mergeFromMessage(this);
  Account_AccountResource copyWith(void Function(Account_AccountResource) updates) => super.copyWith((message) => updates(message as Account_AccountResource));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Account_AccountResource create() => Account_AccountResource._();
  Account_AccountResource createEmptyInstance() => create();
  static $pb.PbList<Account_AccountResource> createRepeated() => $pb.PbList<Account_AccountResource>();
  @$core.pragma('dart2js:noInline')
  static Account_AccountResource getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account_AccountResource>(create);
  static Account_AccountResource _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get energyUsage => $_getI64(0);
  @$pb.TagNumber(1)
  set energyUsage($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnergyUsage() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnergyUsage() => clearField(1);

  @$pb.TagNumber(2)
  Account_Frozen get frozenBalanceForEnergy => $_getN(1);
  @$pb.TagNumber(2)
  set frozenBalanceForEnergy(Account_Frozen v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrozenBalanceForEnergy() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrozenBalanceForEnergy() => clearField(2);
  @$pb.TagNumber(2)
  Account_Frozen ensureFrozenBalanceForEnergy() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get latestConsumeTimeForEnergy => $_getI64(2);
  @$pb.TagNumber(3)
  set latestConsumeTimeForEnergy($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLatestConsumeTimeForEnergy() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatestConsumeTimeForEnergy() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get acquiredDelegatedFrozenBalanceForEnergy => $_getI64(3);
  @$pb.TagNumber(4)
  set acquiredDelegatedFrozenBalanceForEnergy($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAcquiredDelegatedFrozenBalanceForEnergy() => $_has(3);
  @$pb.TagNumber(4)
  void clearAcquiredDelegatedFrozenBalanceForEnergy() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get delegatedFrozenBalanceForEnergy => $_getI64(4);
  @$pb.TagNumber(5)
  set delegatedFrozenBalanceForEnergy($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDelegatedFrozenBalanceForEnergy() => $_has(4);
  @$pb.TagNumber(5)
  void clearDelegatedFrozenBalanceForEnergy() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get storageLimit => $_getI64(5);
  @$pb.TagNumber(6)
  set storageLimit($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStorageLimit() => $_has(5);
  @$pb.TagNumber(6)
  void clearStorageLimit() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get storageUsage => $_getI64(6);
  @$pb.TagNumber(7)
  set storageUsage($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStorageUsage() => $_has(6);
  @$pb.TagNumber(7)
  void clearStorageUsage() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get latestExchangeStorageTime => $_getI64(7);
  @$pb.TagNumber(8)
  set latestExchangeStorageTime($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLatestExchangeStorageTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearLatestExchangeStorageTime() => clearField(8);
}

class Account extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Account', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'accountName', $pb.PbFieldType.OY)
    ..e<AccountType>(2, 'type', $pb.PbFieldType.OE, defaultOrMaker: AccountType.Normal, valueOf: AccountType.valueOf, enumValues: AccountType.values)
    ..a<$core.List<$core.int>>(3, 'address', $pb.PbFieldType.OY)
    ..aInt64(4, 'balance')
    ..pc<Vote>(5, 'votes', $pb.PbFieldType.PM, subBuilder: Vote.create)
    ..m<$core.String, $fixnum.Int64>(6, 'asset', entryClassName: 'Account.AssetEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..pc<Account_Frozen>(7, 'frozen', $pb.PbFieldType.PM, subBuilder: Account_Frozen.create)
    ..aInt64(8, 'netUsage')
    ..aInt64(9, 'createTime')
    ..aInt64(10, 'latestOprationTime')
    ..aInt64(11, 'allowance')
    ..aInt64(12, 'latestWithdrawTime')
    ..a<$core.List<$core.int>>(13, 'code', $pb.PbFieldType.OY)
    ..aOB(14, 'isWitness')
    ..aOB(15, 'isCommittee')
    ..pc<Account_Frozen>(16, 'frozenSupply', $pb.PbFieldType.PM, subBuilder: Account_Frozen.create)
    ..a<$core.List<$core.int>>(17, 'assetIssuedName', $pb.PbFieldType.OY)
    ..m<$core.String, $fixnum.Int64>(18, 'latestAssetOperationTime', entryClassName: 'Account.LatestAssetOperationTimeEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..aInt64(19, 'freeNetUsage')
    ..m<$core.String, $fixnum.Int64>(20, 'freeAssetNetUsage', entryClassName: 'Account.FreeAssetNetUsageEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..aInt64(21, 'latestConsumeTime')
    ..aInt64(22, 'latestConsumeFreeTime')
    ..a<$core.List<$core.int>>(23, 'accountId', $pb.PbFieldType.OY)
    ..aOM<Account_AccountResource>(26, 'accountResource', subBuilder: Account_AccountResource.create)
    ..a<$core.List<$core.int>>(30, 'codeHash', $pb.PbFieldType.OY, protoName: 'codeHash')
    ..aOM<Permission>(31, 'ownerPermission', subBuilder: Permission.create)
    ..aOM<Permission>(32, 'witnessPermission', subBuilder: Permission.create)
    ..pc<Permission>(33, 'activePermission', $pb.PbFieldType.PM, subBuilder: Permission.create)
    ..aInt64(41, 'acquiredDelegatedFrozenBalanceForBandwidth')
    ..aInt64(42, 'delegatedFrozenBalanceForBandwidth')
    ..m<$core.String, $fixnum.Int64>(56, 'assetV2', protoName: 'assetV2', entryClassName: 'Account.AssetV2Entry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..a<$core.List<$core.int>>(57, 'assetIssuedID', $pb.PbFieldType.OY, protoName: 'asset_issued_ID')
    ..m<$core.String, $fixnum.Int64>(58, 'latestAssetOperationTimeV2', protoName: 'latest_asset_operation_timeV2', entryClassName: 'Account.LatestAssetOperationTimeV2Entry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..m<$core.String, $fixnum.Int64>(59, 'freeAssetNetUsageV2', protoName: 'free_asset_net_usageV2', entryClassName: 'Account.FreeAssetNetUsageV2Entry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.O6, packageName: const $pb.PackageName('protocol'))
    ..hasRequiredFields = false
  ;

  Account._() : super();
  factory Account() => create();
  factory Account.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Account clone() => Account()..mergeFromMessage(this);
  Account copyWith(void Function(Account) updates) => super.copyWith((message) => updates(message as Account));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Account create() => Account._();
  Account createEmptyInstance() => create();
  static $pb.PbList<Account> createRepeated() => $pb.PbList<Account>();
  @$core.pragma('dart2js:noInline')
  static Account getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account>(create);
  static Account _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get accountName => $_getN(0);
  @$pb.TagNumber(1)
  set accountName($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountName() => clearField(1);

  @$pb.TagNumber(2)
  AccountType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(AccountType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get address => $_getN(2);
  @$pb.TagNumber(3)
  set address($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get balance => $_getI64(3);
  @$pb.TagNumber(4)
  set balance($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBalance() => $_has(3);
  @$pb.TagNumber(4)
  void clearBalance() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<Vote> get votes => $_getList(4);

  @$pb.TagNumber(6)
  $core.Map<$core.String, $fixnum.Int64> get asset => $_getMap(5);

  @$pb.TagNumber(7)
  $core.List<Account_Frozen> get frozen => $_getList(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get netUsage => $_getI64(7);
  @$pb.TagNumber(8)
  set netUsage($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNetUsage() => $_has(7);
  @$pb.TagNumber(8)
  void clearNetUsage() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get createTime => $_getI64(8);
  @$pb.TagNumber(9)
  set createTime($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreateTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreateTime() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get latestOprationTime => $_getI64(9);
  @$pb.TagNumber(10)
  set latestOprationTime($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLatestOprationTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearLatestOprationTime() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get allowance => $_getI64(10);
  @$pb.TagNumber(11)
  set allowance($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAllowance() => $_has(10);
  @$pb.TagNumber(11)
  void clearAllowance() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get latestWithdrawTime => $_getI64(11);
  @$pb.TagNumber(12)
  set latestWithdrawTime($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLatestWithdrawTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearLatestWithdrawTime() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.int> get code => $_getN(12);
  @$pb.TagNumber(13)
  set code($core.List<$core.int> v) { $_setBytes(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCode() => $_has(12);
  @$pb.TagNumber(13)
  void clearCode() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get isWitness => $_getBF(13);
  @$pb.TagNumber(14)
  set isWitness($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasIsWitness() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsWitness() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get isCommittee => $_getBF(14);
  @$pb.TagNumber(15)
  set isCommittee($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasIsCommittee() => $_has(14);
  @$pb.TagNumber(15)
  void clearIsCommittee() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<Account_Frozen> get frozenSupply => $_getList(15);

  @$pb.TagNumber(17)
  $core.List<$core.int> get assetIssuedName => $_getN(16);
  @$pb.TagNumber(17)
  set assetIssuedName($core.List<$core.int> v) { $_setBytes(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasAssetIssuedName() => $_has(16);
  @$pb.TagNumber(17)
  void clearAssetIssuedName() => clearField(17);

  @$pb.TagNumber(18)
  $core.Map<$core.String, $fixnum.Int64> get latestAssetOperationTime => $_getMap(17);

  @$pb.TagNumber(19)
  $fixnum.Int64 get freeNetUsage => $_getI64(18);
  @$pb.TagNumber(19)
  set freeNetUsage($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasFreeNetUsage() => $_has(18);
  @$pb.TagNumber(19)
  void clearFreeNetUsage() => clearField(19);

  @$pb.TagNumber(20)
  $core.Map<$core.String, $fixnum.Int64> get freeAssetNetUsage => $_getMap(19);

  @$pb.TagNumber(21)
  $fixnum.Int64 get latestConsumeTime => $_getI64(20);
  @$pb.TagNumber(21)
  set latestConsumeTime($fixnum.Int64 v) { $_setInt64(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasLatestConsumeTime() => $_has(20);
  @$pb.TagNumber(21)
  void clearLatestConsumeTime() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get latestConsumeFreeTime => $_getI64(21);
  @$pb.TagNumber(22)
  set latestConsumeFreeTime($fixnum.Int64 v) { $_setInt64(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasLatestConsumeFreeTime() => $_has(21);
  @$pb.TagNumber(22)
  void clearLatestConsumeFreeTime() => clearField(22);

  @$pb.TagNumber(23)
  $core.List<$core.int> get accountId => $_getN(22);
  @$pb.TagNumber(23)
  set accountId($core.List<$core.int> v) { $_setBytes(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasAccountId() => $_has(22);
  @$pb.TagNumber(23)
  void clearAccountId() => clearField(23);

  @$pb.TagNumber(26)
  Account_AccountResource get accountResource => $_getN(23);
  @$pb.TagNumber(26)
  set accountResource(Account_AccountResource v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasAccountResource() => $_has(23);
  @$pb.TagNumber(26)
  void clearAccountResource() => clearField(26);
  @$pb.TagNumber(26)
  Account_AccountResource ensureAccountResource() => $_ensure(23);

  @$pb.TagNumber(30)
  $core.List<$core.int> get codeHash => $_getN(24);
  @$pb.TagNumber(30)
  set codeHash($core.List<$core.int> v) { $_setBytes(24, v); }
  @$pb.TagNumber(30)
  $core.bool hasCodeHash() => $_has(24);
  @$pb.TagNumber(30)
  void clearCodeHash() => clearField(30);

  @$pb.TagNumber(31)
  Permission get ownerPermission => $_getN(25);
  @$pb.TagNumber(31)
  set ownerPermission(Permission v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasOwnerPermission() => $_has(25);
  @$pb.TagNumber(31)
  void clearOwnerPermission() => clearField(31);
  @$pb.TagNumber(31)
  Permission ensureOwnerPermission() => $_ensure(25);

  @$pb.TagNumber(32)
  Permission get witnessPermission => $_getN(26);
  @$pb.TagNumber(32)
  set witnessPermission(Permission v) { setField(32, v); }
  @$pb.TagNumber(32)
  $core.bool hasWitnessPermission() => $_has(26);
  @$pb.TagNumber(32)
  void clearWitnessPermission() => clearField(32);
  @$pb.TagNumber(32)
  Permission ensureWitnessPermission() => $_ensure(26);

  @$pb.TagNumber(33)
  $core.List<Permission> get activePermission => $_getList(27);

  @$pb.TagNumber(41)
  $fixnum.Int64 get acquiredDelegatedFrozenBalanceForBandwidth => $_getI64(28);
  @$pb.TagNumber(41)
  set acquiredDelegatedFrozenBalanceForBandwidth($fixnum.Int64 v) { $_setInt64(28, v); }
  @$pb.TagNumber(41)
  $core.bool hasAcquiredDelegatedFrozenBalanceForBandwidth() => $_has(28);
  @$pb.TagNumber(41)
  void clearAcquiredDelegatedFrozenBalanceForBandwidth() => clearField(41);

  @$pb.TagNumber(42)
  $fixnum.Int64 get delegatedFrozenBalanceForBandwidth => $_getI64(29);
  @$pb.TagNumber(42)
  set delegatedFrozenBalanceForBandwidth($fixnum.Int64 v) { $_setInt64(29, v); }
  @$pb.TagNumber(42)
  $core.bool hasDelegatedFrozenBalanceForBandwidth() => $_has(29);
  @$pb.TagNumber(42)
  void clearDelegatedFrozenBalanceForBandwidth() => clearField(42);

  @$pb.TagNumber(56)
  $core.Map<$core.String, $fixnum.Int64> get assetV2 => $_getMap(30);

  @$pb.TagNumber(57)
  $core.List<$core.int> get assetIssuedID => $_getN(31);
  @$pb.TagNumber(57)
  set assetIssuedID($core.List<$core.int> v) { $_setBytes(31, v); }
  @$pb.TagNumber(57)
  $core.bool hasAssetIssuedID() => $_has(31);
  @$pb.TagNumber(57)
  void clearAssetIssuedID() => clearField(57);

  @$pb.TagNumber(58)
  $core.Map<$core.String, $fixnum.Int64> get latestAssetOperationTimeV2 => $_getMap(32);

  @$pb.TagNumber(59)
  $core.Map<$core.String, $fixnum.Int64> get freeAssetNetUsageV2 => $_getMap(33);
}

class Key extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Key', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..aInt64(2, 'weight')
    ..hasRequiredFields = false
  ;

  Key._() : super();
  factory Key() => create();
  factory Key.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Key.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Key clone() => Key()..mergeFromMessage(this);
  Key copyWith(void Function(Key) updates) => super.copyWith((message) => updates(message as Key));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Key create() => Key._();
  Key createEmptyInstance() => create();
  static $pb.PbList<Key> createRepeated() => $pb.PbList<Key>();
  @$core.pragma('dart2js:noInline')
  static Key getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Key>(create);
  static Key _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get weight => $_getI64(1);
  @$pb.TagNumber(2)
  set weight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeight() => clearField(2);
}

class DelegatedResource extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DelegatedResource', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'from', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'to', $pb.PbFieldType.OY)
    ..aInt64(3, 'frozenBalanceForBandwidth')
    ..aInt64(4, 'frozenBalanceForEnergy')
    ..aInt64(5, 'expireTimeForBandwidth')
    ..aInt64(6, 'expireTimeForEnergy')
    ..hasRequiredFields = false
  ;

  DelegatedResource._() : super();
  factory DelegatedResource() => create();
  factory DelegatedResource.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelegatedResource.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DelegatedResource clone() => DelegatedResource()..mergeFromMessage(this);
  DelegatedResource copyWith(void Function(DelegatedResource) updates) => super.copyWith((message) => updates(message as DelegatedResource));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelegatedResource create() => DelegatedResource._();
  DelegatedResource createEmptyInstance() => create();
  static $pb.PbList<DelegatedResource> createRepeated() => $pb.PbList<DelegatedResource>();
  @$core.pragma('dart2js:noInline')
  static DelegatedResource getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelegatedResource>(create);
  static DelegatedResource _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get to => $_getN(1);
  @$pb.TagNumber(2)
  set to($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get frozenBalanceForBandwidth => $_getI64(2);
  @$pb.TagNumber(3)
  set frozenBalanceForBandwidth($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrozenBalanceForBandwidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrozenBalanceForBandwidth() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get frozenBalanceForEnergy => $_getI64(3);
  @$pb.TagNumber(4)
  set frozenBalanceForEnergy($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrozenBalanceForEnergy() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrozenBalanceForEnergy() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expireTimeForBandwidth => $_getI64(4);
  @$pb.TagNumber(5)
  set expireTimeForBandwidth($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpireTimeForBandwidth() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpireTimeForBandwidth() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get expireTimeForEnergy => $_getI64(5);
  @$pb.TagNumber(6)
  set expireTimeForEnergy($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasExpireTimeForEnergy() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpireTimeForEnergy() => clearField(6);
}

class authority extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('authority', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<AccountId>(1, 'account', subBuilder: AccountId.create)
    ..a<$core.List<$core.int>>(2, 'permissionName', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  authority._() : super();
  factory authority() => create();
  factory authority.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory authority.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  authority clone() => authority()..mergeFromMessage(this);
  authority copyWith(void Function(authority) updates) => super.copyWith((message) => updates(message as authority));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static authority create() => authority._();
  authority createEmptyInstance() => create();
  static $pb.PbList<authority> createRepeated() => $pb.PbList<authority>();
  @$core.pragma('dart2js:noInline')
  static authority getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<authority>(create);
  static authority _defaultInstance;

  @$pb.TagNumber(1)
  AccountId get account => $_getN(0);
  @$pb.TagNumber(1)
  set account(AccountId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
  @$pb.TagNumber(1)
  AccountId ensureAccount() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get permissionName => $_getN(1);
  @$pb.TagNumber(2)
  set permissionName($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissionName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissionName() => clearField(2);
}

class Permission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Permission', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..e<Permission_PermissionType>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: Permission_PermissionType.Owner, valueOf: Permission_PermissionType.valueOf, enumValues: Permission_PermissionType.values)
    ..a<$core.int>(2, 'id', $pb.PbFieldType.O3)
    ..aOS(3, 'permissionName')
    ..aInt64(4, 'threshold')
    ..a<$core.int>(5, 'parentId', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(6, 'operations', $pb.PbFieldType.OY)
    ..pc<Key>(7, 'keys', $pb.PbFieldType.PM, subBuilder: Key.create)
    ..hasRequiredFields = false
  ;

  Permission._() : super();
  factory Permission() => create();
  factory Permission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Permission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Permission clone() => Permission()..mergeFromMessage(this);
  Permission copyWith(void Function(Permission) updates) => super.copyWith((message) => updates(message as Permission));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Permission create() => Permission._();
  Permission createEmptyInstance() => create();
  static $pb.PbList<Permission> createRepeated() => $pb.PbList<Permission>();
  @$core.pragma('dart2js:noInline')
  static Permission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Permission>(create);
  static Permission _defaultInstance;

  @$pb.TagNumber(1)
  Permission_PermissionType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Permission_PermissionType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get permissionName => $_getSZ(2);
  @$pb.TagNumber(3)
  set permissionName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPermissionName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermissionName() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get threshold => $_getI64(3);
  @$pb.TagNumber(4)
  set threshold($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasThreshold() => $_has(3);
  @$pb.TagNumber(4)
  void clearThreshold() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get parentId => $_getIZ(4);
  @$pb.TagNumber(5)
  set parentId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasParentId() => $_has(4);
  @$pb.TagNumber(5)
  void clearParentId() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get operations => $_getN(5);
  @$pb.TagNumber(6)
  set operations($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOperations() => $_has(5);
  @$pb.TagNumber(6)
  void clearOperations() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<Key> get keys => $_getList(6);
}

class Witness extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Witness', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..aInt64(2, 'voteCount', protoName: 'voteCount')
    ..a<$core.List<$core.int>>(3, 'pubKey', $pb.PbFieldType.OY, protoName: 'pubKey')
    ..aOS(4, 'url')
    ..aInt64(5, 'totalProduced', protoName: 'totalProduced')
    ..aInt64(6, 'totalMissed', protoName: 'totalMissed')
    ..aInt64(7, 'latestBlockNum', protoName: 'latestBlockNum')
    ..aInt64(8, 'latestSlotNum', protoName: 'latestSlotNum')
    ..aOB(9, 'isJobs', protoName: 'isJobs')
    ..hasRequiredFields = false
  ;

  Witness._() : super();
  factory Witness() => create();
  factory Witness.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Witness.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Witness clone() => Witness()..mergeFromMessage(this);
  Witness copyWith(void Function(Witness) updates) => super.copyWith((message) => updates(message as Witness));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Witness create() => Witness._();
  Witness createEmptyInstance() => create();
  static $pb.PbList<Witness> createRepeated() => $pb.PbList<Witness>();
  @$core.pragma('dart2js:noInline')
  static Witness getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Witness>(create);
  static Witness _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get voteCount => $_getI64(1);
  @$pb.TagNumber(2)
  set voteCount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoteCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoteCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get pubKey => $_getN(2);
  @$pb.TagNumber(3)
  set pubKey($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPubKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPubKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get totalProduced => $_getI64(4);
  @$pb.TagNumber(5)
  set totalProduced($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalProduced() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalProduced() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalMissed => $_getI64(5);
  @$pb.TagNumber(6)
  set totalMissed($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTotalMissed() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalMissed() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get latestBlockNum => $_getI64(6);
  @$pb.TagNumber(7)
  set latestBlockNum($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLatestBlockNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearLatestBlockNum() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get latestSlotNum => $_getI64(7);
  @$pb.TagNumber(8)
  set latestSlotNum($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLatestSlotNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearLatestSlotNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isJobs => $_getBF(8);
  @$pb.TagNumber(9)
  set isJobs($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsJobs() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsJobs() => clearField(9);
}

class Votes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Votes', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..pc<Vote>(2, 'oldVotes', $pb.PbFieldType.PM, subBuilder: Vote.create)
    ..pc<Vote>(3, 'newVotes', $pb.PbFieldType.PM, subBuilder: Vote.create)
    ..hasRequiredFields = false
  ;

  Votes._() : super();
  factory Votes() => create();
  factory Votes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Votes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Votes clone() => Votes()..mergeFromMessage(this);
  Votes copyWith(void Function(Votes) updates) => super.copyWith((message) => updates(message as Votes));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Votes create() => Votes._();
  Votes createEmptyInstance() => create();
  static $pb.PbList<Votes> createRepeated() => $pb.PbList<Votes>();
  @$core.pragma('dart2js:noInline')
  static Votes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Votes>(create);
  static Votes _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Vote> get oldVotes => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Vote> get newVotes => $_getList(2);
}

class TXOutput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TXOutput', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'value')
    ..a<$core.List<$core.int>>(2, 'pubKeyHash', $pb.PbFieldType.OY, protoName: 'pubKeyHash')
    ..hasRequiredFields = false
  ;

  TXOutput._() : super();
  factory TXOutput() => create();
  factory TXOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TXOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TXOutput clone() => TXOutput()..mergeFromMessage(this);
  TXOutput copyWith(void Function(TXOutput) updates) => super.copyWith((message) => updates(message as TXOutput));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TXOutput create() => TXOutput._();
  TXOutput createEmptyInstance() => create();
  static $pb.PbList<TXOutput> createRepeated() => $pb.PbList<TXOutput>();
  @$core.pragma('dart2js:noInline')
  static TXOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TXOutput>(create);
  static TXOutput _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get pubKeyHash => $_getN(1);
  @$pb.TagNumber(2)
  set pubKeyHash($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPubKeyHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearPubKeyHash() => clearField(2);
}

class TXInput_raw extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TXInput.raw', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'txID', $pb.PbFieldType.OY, protoName: 'txID')
    ..aInt64(2, 'vout')
    ..a<$core.List<$core.int>>(3, 'pubKey', $pb.PbFieldType.OY, protoName: 'pubKey')
    ..hasRequiredFields = false
  ;

  TXInput_raw._() : super();
  factory TXInput_raw() => create();
  factory TXInput_raw.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TXInput_raw.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TXInput_raw clone() => TXInput_raw()..mergeFromMessage(this);
  TXInput_raw copyWith(void Function(TXInput_raw) updates) => super.copyWith((message) => updates(message as TXInput_raw));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TXInput_raw create() => TXInput_raw._();
  TXInput_raw createEmptyInstance() => create();
  static $pb.PbList<TXInput_raw> createRepeated() => $pb.PbList<TXInput_raw>();
  @$core.pragma('dart2js:noInline')
  static TXInput_raw getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TXInput_raw>(create);
  static TXInput_raw _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get txID => $_getN(0);
  @$pb.TagNumber(1)
  set txID($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxID() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxID() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get vout => $_getI64(1);
  @$pb.TagNumber(2)
  set vout($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVout() => $_has(1);
  @$pb.TagNumber(2)
  void clearVout() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get pubKey => $_getN(2);
  @$pb.TagNumber(3)
  set pubKey($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPubKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPubKey() => clearField(3);
}

class TXInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TXInput', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<TXInput_raw>(1, 'rawData', subBuilder: TXInput_raw.create)
    ..a<$core.List<$core.int>>(4, 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  TXInput._() : super();
  factory TXInput() => create();
  factory TXInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TXInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TXInput clone() => TXInput()..mergeFromMessage(this);
  TXInput copyWith(void Function(TXInput) updates) => super.copyWith((message) => updates(message as TXInput));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TXInput create() => TXInput._();
  TXInput createEmptyInstance() => create();
  static $pb.PbList<TXInput> createRepeated() => $pb.PbList<TXInput>();
  @$core.pragma('dart2js:noInline')
  static TXInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TXInput>(create);
  static TXInput _defaultInstance;

  @$pb.TagNumber(1)
  TXInput_raw get rawData => $_getN(0);
  @$pb.TagNumber(1)
  set rawData(TXInput_raw v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRawData() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawData() => clearField(1);
  @$pb.TagNumber(1)
  TXInput_raw ensureRawData() => $_ensure(0);

  @$pb.TagNumber(4)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(4)
  set signature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(4)
  void clearSignature() => clearField(4);
}

class TXOutputs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TXOutputs', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<TXOutput>(1, 'outputs', $pb.PbFieldType.PM, subBuilder: TXOutput.create)
    ..hasRequiredFields = false
  ;

  TXOutputs._() : super();
  factory TXOutputs() => create();
  factory TXOutputs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TXOutputs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TXOutputs clone() => TXOutputs()..mergeFromMessage(this);
  TXOutputs copyWith(void Function(TXOutputs) updates) => super.copyWith((message) => updates(message as TXOutputs));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TXOutputs create() => TXOutputs._();
  TXOutputs createEmptyInstance() => create();
  static $pb.PbList<TXOutputs> createRepeated() => $pb.PbList<TXOutputs>();
  @$core.pragma('dart2js:noInline')
  static TXOutputs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TXOutputs>(create);
  static TXOutputs _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TXOutput> get outputs => $_getList(0);
}

class ResourceReceipt extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResourceReceipt', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'energyUsage')
    ..aInt64(2, 'energyFee')
    ..aInt64(3, 'originEnergyUsage')
    ..aInt64(4, 'energyUsageTotal')
    ..aInt64(5, 'netUsage')
    ..aInt64(6, 'netFee')
    ..e<Transaction_Result_contractResult>(7, 'result', $pb.PbFieldType.OE, defaultOrMaker: Transaction_Result_contractResult.DEFAULT, valueOf: Transaction_Result_contractResult.valueOf, enumValues: Transaction_Result_contractResult.values)
    ..hasRequiredFields = false
  ;

  ResourceReceipt._() : super();
  factory ResourceReceipt() => create();
  factory ResourceReceipt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourceReceipt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResourceReceipt clone() => ResourceReceipt()..mergeFromMessage(this);
  ResourceReceipt copyWith(void Function(ResourceReceipt) updates) => super.copyWith((message) => updates(message as ResourceReceipt));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResourceReceipt create() => ResourceReceipt._();
  ResourceReceipt createEmptyInstance() => create();
  static $pb.PbList<ResourceReceipt> createRepeated() => $pb.PbList<ResourceReceipt>();
  @$core.pragma('dart2js:noInline')
  static ResourceReceipt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourceReceipt>(create);
  static ResourceReceipt _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get energyUsage => $_getI64(0);
  @$pb.TagNumber(1)
  set energyUsage($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnergyUsage() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnergyUsage() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get energyFee => $_getI64(1);
  @$pb.TagNumber(2)
  set energyFee($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnergyFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnergyFee() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get originEnergyUsage => $_getI64(2);
  @$pb.TagNumber(3)
  set originEnergyUsage($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOriginEnergyUsage() => $_has(2);
  @$pb.TagNumber(3)
  void clearOriginEnergyUsage() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get energyUsageTotal => $_getI64(3);
  @$pb.TagNumber(4)
  set energyUsageTotal($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEnergyUsageTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnergyUsageTotal() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get netUsage => $_getI64(4);
  @$pb.TagNumber(5)
  set netUsage($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNetUsage() => $_has(4);
  @$pb.TagNumber(5)
  void clearNetUsage() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get netFee => $_getI64(5);
  @$pb.TagNumber(6)
  set netFee($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNetFee() => $_has(5);
  @$pb.TagNumber(6)
  void clearNetFee() => clearField(6);

  @$pb.TagNumber(7)
  Transaction_Result_contractResult get result => $_getN(6);
  @$pb.TagNumber(7)
  set result(Transaction_Result_contractResult v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasResult() => $_has(6);
  @$pb.TagNumber(7)
  void clearResult() => clearField(7);
}

class Transaction_Contract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transaction.Contract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..e<Transaction_Contract_ContractType>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: Transaction_Contract_ContractType.AccountCreateContract, valueOf: Transaction_Contract_ContractType.valueOf, enumValues: Transaction_Contract_ContractType.values)
    ..aOM<$0.Any>(2, 'parameter', subBuilder: $0.Any.create)
    ..a<$core.List<$core.int>>(3, 'provider', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, 'ContractName', $pb.PbFieldType.OY, protoName: 'ContractName')
    ..a<$core.int>(5, 'PermissionId', $pb.PbFieldType.O3, protoName: 'Permission_id')
    ..hasRequiredFields = false
  ;

  Transaction_Contract._() : super();
  factory Transaction_Contract() => create();
  factory Transaction_Contract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction_Contract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Transaction_Contract clone() => Transaction_Contract()..mergeFromMessage(this);
  Transaction_Contract copyWith(void Function(Transaction_Contract) updates) => super.copyWith((message) => updates(message as Transaction_Contract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transaction_Contract create() => Transaction_Contract._();
  Transaction_Contract createEmptyInstance() => create();
  static $pb.PbList<Transaction_Contract> createRepeated() => $pb.PbList<Transaction_Contract>();
  @$core.pragma('dart2js:noInline')
  static Transaction_Contract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction_Contract>(create);
  static Transaction_Contract _defaultInstance;

  @$pb.TagNumber(1)
  Transaction_Contract_ContractType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Transaction_Contract_ContractType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $0.Any get parameter => $_getN(1);
  @$pb.TagNumber(2)
  set parameter($0.Any v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasParameter() => $_has(1);
  @$pb.TagNumber(2)
  void clearParameter() => clearField(2);
  @$pb.TagNumber(2)
  $0.Any ensureParameter() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get provider => $_getN(2);
  @$pb.TagNumber(3)
  set provider($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProvider() => $_has(2);
  @$pb.TagNumber(3)
  void clearProvider() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get contractName => $_getN(3);
  @$pb.TagNumber(4)
  set contractName($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContractName() => $_has(3);
  @$pb.TagNumber(4)
  void clearContractName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get permissionId => $_getIZ(4);
  @$pb.TagNumber(5)
  set permissionId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPermissionId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPermissionId() => clearField(5);
}

class Transaction_Result extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transaction.Result', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'fee')
    ..e<Transaction_Result_code>(2, 'ret', $pb.PbFieldType.OE, defaultOrMaker: Transaction_Result_code.SUCESS, valueOf: Transaction_Result_code.valueOf, enumValues: Transaction_Result_code.values)
    ..e<Transaction_Result_contractResult>(3, 'contractRet', $pb.PbFieldType.OE, protoName: 'contractRet', defaultOrMaker: Transaction_Result_contractResult.DEFAULT, valueOf: Transaction_Result_contractResult.valueOf, enumValues: Transaction_Result_contractResult.values)
    ..aOS(14, 'assetIssueID', protoName: 'assetIssueID')
    ..aInt64(15, 'withdrawAmount')
    ..aInt64(16, 'unfreezeAmount')
    ..aInt64(18, 'exchangeReceivedAmount')
    ..aInt64(19, 'exchangeInjectAnotherAmount')
    ..aInt64(20, 'exchangeWithdrawAnotherAmount')
    ..aInt64(21, 'exchangeId')
    ..hasRequiredFields = false
  ;

  Transaction_Result._() : super();
  factory Transaction_Result() => create();
  factory Transaction_Result.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction_Result.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Transaction_Result clone() => Transaction_Result()..mergeFromMessage(this);
  Transaction_Result copyWith(void Function(Transaction_Result) updates) => super.copyWith((message) => updates(message as Transaction_Result));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transaction_Result create() => Transaction_Result._();
  Transaction_Result createEmptyInstance() => create();
  static $pb.PbList<Transaction_Result> createRepeated() => $pb.PbList<Transaction_Result>();
  @$core.pragma('dart2js:noInline')
  static Transaction_Result getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction_Result>(create);
  static Transaction_Result _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fee => $_getI64(0);
  @$pb.TagNumber(1)
  set fee($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFee() => $_has(0);
  @$pb.TagNumber(1)
  void clearFee() => clearField(1);

  @$pb.TagNumber(2)
  Transaction_Result_code get ret => $_getN(1);
  @$pb.TagNumber(2)
  set ret(Transaction_Result_code v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRet() => $_has(1);
  @$pb.TagNumber(2)
  void clearRet() => clearField(2);

  @$pb.TagNumber(3)
  Transaction_Result_contractResult get contractRet => $_getN(2);
  @$pb.TagNumber(3)
  set contractRet(Transaction_Result_contractResult v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasContractRet() => $_has(2);
  @$pb.TagNumber(3)
  void clearContractRet() => clearField(3);

  @$pb.TagNumber(14)
  $core.String get assetIssueID => $_getSZ(3);
  @$pb.TagNumber(14)
  set assetIssueID($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(14)
  $core.bool hasAssetIssueID() => $_has(3);
  @$pb.TagNumber(14)
  void clearAssetIssueID() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get withdrawAmount => $_getI64(4);
  @$pb.TagNumber(15)
  set withdrawAmount($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(15)
  $core.bool hasWithdrawAmount() => $_has(4);
  @$pb.TagNumber(15)
  void clearWithdrawAmount() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get unfreezeAmount => $_getI64(5);
  @$pb.TagNumber(16)
  set unfreezeAmount($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(16)
  $core.bool hasUnfreezeAmount() => $_has(5);
  @$pb.TagNumber(16)
  void clearUnfreezeAmount() => clearField(16);

  @$pb.TagNumber(18)
  $fixnum.Int64 get exchangeReceivedAmount => $_getI64(6);
  @$pb.TagNumber(18)
  set exchangeReceivedAmount($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(18)
  $core.bool hasExchangeReceivedAmount() => $_has(6);
  @$pb.TagNumber(18)
  void clearExchangeReceivedAmount() => clearField(18);

  @$pb.TagNumber(19)
  $fixnum.Int64 get exchangeInjectAnotherAmount => $_getI64(7);
  @$pb.TagNumber(19)
  set exchangeInjectAnotherAmount($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(19)
  $core.bool hasExchangeInjectAnotherAmount() => $_has(7);
  @$pb.TagNumber(19)
  void clearExchangeInjectAnotherAmount() => clearField(19);

  @$pb.TagNumber(20)
  $fixnum.Int64 get exchangeWithdrawAnotherAmount => $_getI64(8);
  @$pb.TagNumber(20)
  set exchangeWithdrawAnotherAmount($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(20)
  $core.bool hasExchangeWithdrawAnotherAmount() => $_has(8);
  @$pb.TagNumber(20)
  void clearExchangeWithdrawAnotherAmount() => clearField(20);

  @$pb.TagNumber(21)
  $fixnum.Int64 get exchangeId => $_getI64(9);
  @$pb.TagNumber(21)
  set exchangeId($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(21)
  $core.bool hasExchangeId() => $_has(9);
  @$pb.TagNumber(21)
  void clearExchangeId() => clearField(21);
}

class Transaction_raw extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transaction.raw', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'refBlockBytes', $pb.PbFieldType.OY)
    ..aInt64(3, 'refBlockNum')
    ..a<$core.List<$core.int>>(4, 'refBlockHash', $pb.PbFieldType.OY)
    ..aInt64(8, 'expiration')
    ..pc<authority>(9, 'auths', $pb.PbFieldType.PM, subBuilder: authority.create)
    ..a<$core.List<$core.int>>(10, 'data', $pb.PbFieldType.OY)
    ..pc<Transaction_Contract>(11, 'contract', $pb.PbFieldType.PM, subBuilder: Transaction_Contract.create)
    ..a<$core.List<$core.int>>(12, 'scripts', $pb.PbFieldType.OY)
    ..aInt64(14, 'timestamp')
    ..aInt64(18, 'feeLimit')
    ..hasRequiredFields = false
  ;

  Transaction_raw._() : super();
  factory Transaction_raw() => create();
  factory Transaction_raw.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction_raw.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Transaction_raw clone() => Transaction_raw()..mergeFromMessage(this);
  Transaction_raw copyWith(void Function(Transaction_raw) updates) => super.copyWith((message) => updates(message as Transaction_raw));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transaction_raw create() => Transaction_raw._();
  Transaction_raw createEmptyInstance() => create();
  static $pb.PbList<Transaction_raw> createRepeated() => $pb.PbList<Transaction_raw>();
  @$core.pragma('dart2js:noInline')
  static Transaction_raw getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction_raw>(create);
  static Transaction_raw _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get refBlockBytes => $_getN(0);
  @$pb.TagNumber(1)
  set refBlockBytes($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefBlockBytes() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefBlockBytes() => clearField(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get refBlockNum => $_getI64(1);
  @$pb.TagNumber(3)
  set refBlockNum($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasRefBlockNum() => $_has(1);
  @$pb.TagNumber(3)
  void clearRefBlockNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get refBlockHash => $_getN(2);
  @$pb.TagNumber(4)
  set refBlockHash($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasRefBlockHash() => $_has(2);
  @$pb.TagNumber(4)
  void clearRefBlockHash() => clearField(4);

  @$pb.TagNumber(8)
  $fixnum.Int64 get expiration => $_getI64(3);
  @$pb.TagNumber(8)
  set expiration($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(8)
  $core.bool hasExpiration() => $_has(3);
  @$pb.TagNumber(8)
  void clearExpiration() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<authority> get auths => $_getList(4);

  @$pb.TagNumber(10)
  $core.List<$core.int> get data => $_getN(5);
  @$pb.TagNumber(10)
  set data($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(10)
  $core.bool hasData() => $_has(5);
  @$pb.TagNumber(10)
  void clearData() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<Transaction_Contract> get contract => $_getList(6);

  @$pb.TagNumber(12)
  $core.List<$core.int> get scripts => $_getN(7);
  @$pb.TagNumber(12)
  set scripts($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(12)
  $core.bool hasScripts() => $_has(7);
  @$pb.TagNumber(12)
  void clearScripts() => clearField(12);

  @$pb.TagNumber(14)
  $fixnum.Int64 get timestamp => $_getI64(8);
  @$pb.TagNumber(14)
  set timestamp($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(14)
  $core.bool hasTimestamp() => $_has(8);
  @$pb.TagNumber(14)
  void clearTimestamp() => clearField(14);

  @$pb.TagNumber(18)
  $fixnum.Int64 get feeLimit => $_getI64(9);
  @$pb.TagNumber(18)
  set feeLimit($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(18)
  $core.bool hasFeeLimit() => $_has(9);
  @$pb.TagNumber(18)
  void clearFeeLimit() => clearField(18);
}

class Transaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transaction', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<Transaction_raw>(1, 'rawData', subBuilder: Transaction_raw.create)
    ..p<$core.List<$core.int>>(2, 'signature', $pb.PbFieldType.PY)
    ..pc<Transaction_Result>(5, 'ret', $pb.PbFieldType.PM, subBuilder: Transaction_Result.create)
    ..hasRequiredFields = false
  ;

  Transaction._() : super();
  factory Transaction() => create();
  factory Transaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Transaction clone() => Transaction()..mergeFromMessage(this);
  Transaction copyWith(void Function(Transaction) updates) => super.copyWith((message) => updates(message as Transaction));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  Transaction createEmptyInstance() => create();
  static $pb.PbList<Transaction> createRepeated() => $pb.PbList<Transaction>();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction _defaultInstance;

  @$pb.TagNumber(1)
  Transaction_raw get rawData => $_getN(0);
  @$pb.TagNumber(1)
  set rawData(Transaction_raw v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRawData() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawData() => clearField(1);
  @$pb.TagNumber(1)
  Transaction_raw ensureRawData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get signature => $_getList(1);

  @$pb.TagNumber(5)
  $core.List<Transaction_Result> get ret => $_getList(2);
}

class TransactionInfo_Log extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionInfo.Log', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, 'topics', $pb.PbFieldType.PY)
    ..a<$core.List<$core.int>>(3, 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  TransactionInfo_Log._() : super();
  factory TransactionInfo_Log() => create();
  factory TransactionInfo_Log.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionInfo_Log.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionInfo_Log clone() => TransactionInfo_Log()..mergeFromMessage(this);
  TransactionInfo_Log copyWith(void Function(TransactionInfo_Log) updates) => super.copyWith((message) => updates(message as TransactionInfo_Log));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionInfo_Log create() => TransactionInfo_Log._();
  TransactionInfo_Log createEmptyInstance() => create();
  static $pb.PbList<TransactionInfo_Log> createRepeated() => $pb.PbList<TransactionInfo_Log>();
  @$core.pragma('dart2js:noInline')
  static TransactionInfo_Log getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionInfo_Log>(create);
  static TransactionInfo_Log _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get topics => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class TransactionInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionInfo', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'id', $pb.PbFieldType.OY)
    ..aInt64(2, 'fee')
    ..aInt64(3, 'blockNumber', protoName: 'blockNumber')
    ..aInt64(4, 'blockTimeStamp', protoName: 'blockTimeStamp')
    ..p<$core.List<$core.int>>(5, 'contractResult', $pb.PbFieldType.PY, protoName: 'contractResult')
    ..a<$core.List<$core.int>>(6, 'contractAddress', $pb.PbFieldType.OY)
    ..aOM<ResourceReceipt>(7, 'receipt', subBuilder: ResourceReceipt.create)
    ..pc<TransactionInfo_Log>(8, 'log', $pb.PbFieldType.PM, subBuilder: TransactionInfo_Log.create)
    ..e<TransactionInfo_code>(9, 'result', $pb.PbFieldType.OE, defaultOrMaker: TransactionInfo_code.SUCESS, valueOf: TransactionInfo_code.valueOf, enumValues: TransactionInfo_code.values)
    ..a<$core.List<$core.int>>(10, 'resMessage', $pb.PbFieldType.OY, protoName: 'resMessage')
    ..aOS(14, 'assetIssueID', protoName: 'assetIssueID')
    ..aInt64(15, 'withdrawAmount')
    ..aInt64(16, 'unfreezeAmount')
    ..pc<InternalTransaction>(17, 'internalTransactions', $pb.PbFieldType.PM, subBuilder: InternalTransaction.create)
    ..aInt64(18, 'exchangeReceivedAmount')
    ..aInt64(19, 'exchangeInjectAnotherAmount')
    ..aInt64(20, 'exchangeWithdrawAnotherAmount')
    ..aInt64(21, 'exchangeId')
    ..hasRequiredFields = false
  ;

  TransactionInfo._() : super();
  factory TransactionInfo() => create();
  factory TransactionInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionInfo clone() => TransactionInfo()..mergeFromMessage(this);
  TransactionInfo copyWith(void Function(TransactionInfo) updates) => super.copyWith((message) => updates(message as TransactionInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionInfo create() => TransactionInfo._();
  TransactionInfo createEmptyInstance() => create();
  static $pb.PbList<TransactionInfo> createRepeated() => $pb.PbList<TransactionInfo>();
  @$core.pragma('dart2js:noInline')
  static TransactionInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionInfo>(create);
  static TransactionInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fee => $_getI64(1);
  @$pb.TagNumber(2)
  set fee($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearFee() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get blockNumber => $_getI64(2);
  @$pb.TagNumber(3)
  set blockNumber($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlockNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockNumber() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get blockTimeStamp => $_getI64(3);
  @$pb.TagNumber(4)
  set blockTimeStamp($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBlockTimeStamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlockTimeStamp() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.List<$core.int>> get contractResult => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.int> get contractAddress => $_getN(5);
  @$pb.TagNumber(6)
  set contractAddress($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasContractAddress() => $_has(5);
  @$pb.TagNumber(6)
  void clearContractAddress() => clearField(6);

  @$pb.TagNumber(7)
  ResourceReceipt get receipt => $_getN(6);
  @$pb.TagNumber(7)
  set receipt(ResourceReceipt v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasReceipt() => $_has(6);
  @$pb.TagNumber(7)
  void clearReceipt() => clearField(7);
  @$pb.TagNumber(7)
  ResourceReceipt ensureReceipt() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<TransactionInfo_Log> get log => $_getList(7);

  @$pb.TagNumber(9)
  TransactionInfo_code get result => $_getN(8);
  @$pb.TagNumber(9)
  set result(TransactionInfo_code v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasResult() => $_has(8);
  @$pb.TagNumber(9)
  void clearResult() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.int> get resMessage => $_getN(9);
  @$pb.TagNumber(10)
  set resMessage($core.List<$core.int> v) { $_setBytes(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasResMessage() => $_has(9);
  @$pb.TagNumber(10)
  void clearResMessage() => clearField(10);

  @$pb.TagNumber(14)
  $core.String get assetIssueID => $_getSZ(10);
  @$pb.TagNumber(14)
  set assetIssueID($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(14)
  $core.bool hasAssetIssueID() => $_has(10);
  @$pb.TagNumber(14)
  void clearAssetIssueID() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get withdrawAmount => $_getI64(11);
  @$pb.TagNumber(15)
  set withdrawAmount($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(15)
  $core.bool hasWithdrawAmount() => $_has(11);
  @$pb.TagNumber(15)
  void clearWithdrawAmount() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get unfreezeAmount => $_getI64(12);
  @$pb.TagNumber(16)
  set unfreezeAmount($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(16)
  $core.bool hasUnfreezeAmount() => $_has(12);
  @$pb.TagNumber(16)
  void clearUnfreezeAmount() => clearField(16);

  @$pb.TagNumber(17)
  $core.List<InternalTransaction> get internalTransactions => $_getList(13);

  @$pb.TagNumber(18)
  $fixnum.Int64 get exchangeReceivedAmount => $_getI64(14);
  @$pb.TagNumber(18)
  set exchangeReceivedAmount($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(18)
  $core.bool hasExchangeReceivedAmount() => $_has(14);
  @$pb.TagNumber(18)
  void clearExchangeReceivedAmount() => clearField(18);

  @$pb.TagNumber(19)
  $fixnum.Int64 get exchangeInjectAnotherAmount => $_getI64(15);
  @$pb.TagNumber(19)
  set exchangeInjectAnotherAmount($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(19)
  $core.bool hasExchangeInjectAnotherAmount() => $_has(15);
  @$pb.TagNumber(19)
  void clearExchangeInjectAnotherAmount() => clearField(19);

  @$pb.TagNumber(20)
  $fixnum.Int64 get exchangeWithdrawAnotherAmount => $_getI64(16);
  @$pb.TagNumber(20)
  set exchangeWithdrawAnotherAmount($fixnum.Int64 v) { $_setInt64(16, v); }
  @$pb.TagNumber(20)
  $core.bool hasExchangeWithdrawAnotherAmount() => $_has(16);
  @$pb.TagNumber(20)
  void clearExchangeWithdrawAnotherAmount() => clearField(20);

  @$pb.TagNumber(21)
  $fixnum.Int64 get exchangeId => $_getI64(17);
  @$pb.TagNumber(21)
  set exchangeId($fixnum.Int64 v) { $_setInt64(17, v); }
  @$pb.TagNumber(21)
  $core.bool hasExchangeId() => $_has(17);
  @$pb.TagNumber(21)
  void clearExchangeId() => clearField(21);
}

class Transactions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transactions', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<Transaction>(1, 'transactions', $pb.PbFieldType.PM, subBuilder: Transaction.create)
    ..hasRequiredFields = false
  ;

  Transactions._() : super();
  factory Transactions() => create();
  factory Transactions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transactions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Transactions clone() => Transactions()..mergeFromMessage(this);
  Transactions copyWith(void Function(Transactions) updates) => super.copyWith((message) => updates(message as Transactions));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transactions create() => Transactions._();
  Transactions createEmptyInstance() => create();
  static $pb.PbList<Transactions> createRepeated() => $pb.PbList<Transactions>();
  @$core.pragma('dart2js:noInline')
  static Transactions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transactions>(create);
  static Transactions _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Transaction> get transactions => $_getList(0);
}

class TransactionSign extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionSign', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<Transaction>(1, 'transaction', subBuilder: Transaction.create)
    ..a<$core.List<$core.int>>(2, 'privateKey', $pb.PbFieldType.OY, protoName: 'privateKey')
    ..hasRequiredFields = false
  ;

  TransactionSign._() : super();
  factory TransactionSign() => create();
  factory TransactionSign.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionSign.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionSign clone() => TransactionSign()..mergeFromMessage(this);
  TransactionSign copyWith(void Function(TransactionSign) updates) => super.copyWith((message) => updates(message as TransactionSign));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionSign create() => TransactionSign._();
  TransactionSign createEmptyInstance() => create();
  static $pb.PbList<TransactionSign> createRepeated() => $pb.PbList<TransactionSign>();
  @$core.pragma('dart2js:noInline')
  static TransactionSign getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionSign>(create);
  static TransactionSign _defaultInstance;

  @$pb.TagNumber(1)
  Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction(Transaction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => clearField(1);
  @$pb.TagNumber(1)
  Transaction ensureTransaction() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get privateKey => $_getN(1);
  @$pb.TagNumber(2)
  set privateKey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivateKey() => clearField(2);
}

class BlockHeader_raw extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockHeader.raw', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'timestamp')
    ..a<$core.List<$core.int>>(2, 'txTrieRoot', $pb.PbFieldType.OY, protoName: 'txTrieRoot')
    ..a<$core.List<$core.int>>(3, 'parentHash', $pb.PbFieldType.OY, protoName: 'parentHash')
    ..aInt64(7, 'number')
    ..aInt64(8, 'witnessId')
    ..a<$core.List<$core.int>>(9, 'witnessAddress', $pb.PbFieldType.OY)
    ..a<$core.int>(10, 'version', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(11, 'accountStateRoot', $pb.PbFieldType.OY, protoName: 'accountStateRoot')
    ..hasRequiredFields = false
  ;

  BlockHeader_raw._() : super();
  factory BlockHeader_raw() => create();
  factory BlockHeader_raw.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockHeader_raw.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockHeader_raw clone() => BlockHeader_raw()..mergeFromMessage(this);
  BlockHeader_raw copyWith(void Function(BlockHeader_raw) updates) => super.copyWith((message) => updates(message as BlockHeader_raw));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockHeader_raw create() => BlockHeader_raw._();
  BlockHeader_raw createEmptyInstance() => create();
  static $pb.PbList<BlockHeader_raw> createRepeated() => $pb.PbList<BlockHeader_raw>();
  @$core.pragma('dart2js:noInline')
  static BlockHeader_raw getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockHeader_raw>(create);
  static BlockHeader_raw _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get txTrieRoot => $_getN(1);
  @$pb.TagNumber(2)
  set txTrieRoot($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxTrieRoot() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxTrieRoot() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get parentHash => $_getN(2);
  @$pb.TagNumber(3)
  set parentHash($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasParentHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentHash() => clearField(3);

  @$pb.TagNumber(7)
  $fixnum.Int64 get number => $_getI64(3);
  @$pb.TagNumber(7)
  set number($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(7)
  $core.bool hasNumber() => $_has(3);
  @$pb.TagNumber(7)
  void clearNumber() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get witnessId => $_getI64(4);
  @$pb.TagNumber(8)
  set witnessId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(8)
  $core.bool hasWitnessId() => $_has(4);
  @$pb.TagNumber(8)
  void clearWitnessId() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get witnessAddress => $_getN(5);
  @$pb.TagNumber(9)
  set witnessAddress($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(9)
  $core.bool hasWitnessAddress() => $_has(5);
  @$pb.TagNumber(9)
  void clearWitnessAddress() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get version => $_getIZ(6);
  @$pb.TagNumber(10)
  set version($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(10)
  $core.bool hasVersion() => $_has(6);
  @$pb.TagNumber(10)
  void clearVersion() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.int> get accountStateRoot => $_getN(7);
  @$pb.TagNumber(11)
  set accountStateRoot($core.List<$core.int> v) { $_setBytes(7, v); }
  @$pb.TagNumber(11)
  $core.bool hasAccountStateRoot() => $_has(7);
  @$pb.TagNumber(11)
  void clearAccountStateRoot() => clearField(11);
}

class BlockHeader extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockHeader', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<BlockHeader_raw>(1, 'rawData', subBuilder: BlockHeader_raw.create)
    ..a<$core.List<$core.int>>(2, 'witnessSignature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  BlockHeader._() : super();
  factory BlockHeader() => create();
  factory BlockHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockHeader clone() => BlockHeader()..mergeFromMessage(this);
  BlockHeader copyWith(void Function(BlockHeader) updates) => super.copyWith((message) => updates(message as BlockHeader));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockHeader create() => BlockHeader._();
  BlockHeader createEmptyInstance() => create();
  static $pb.PbList<BlockHeader> createRepeated() => $pb.PbList<BlockHeader>();
  @$core.pragma('dart2js:noInline')
  static BlockHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockHeader>(create);
  static BlockHeader _defaultInstance;

  @$pb.TagNumber(1)
  BlockHeader_raw get rawData => $_getN(0);
  @$pb.TagNumber(1)
  set rawData(BlockHeader_raw v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRawData() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawData() => clearField(1);
  @$pb.TagNumber(1)
  BlockHeader_raw ensureRawData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get witnessSignature => $_getN(1);
  @$pb.TagNumber(2)
  set witnessSignature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWitnessSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearWitnessSignature() => clearField(2);
}

class Block extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Block', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<Transaction>(1, 'transactions', $pb.PbFieldType.PM, subBuilder: Transaction.create)
    ..aOM<BlockHeader>(2, 'blockHeader', subBuilder: BlockHeader.create)
    ..hasRequiredFields = false
  ;

  Block._() : super();
  factory Block() => create();
  factory Block.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Block.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Block clone() => Block()..mergeFromMessage(this);
  Block copyWith(void Function(Block) updates) => super.copyWith((message) => updates(message as Block));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Block create() => Block._();
  Block createEmptyInstance() => create();
  static $pb.PbList<Block> createRepeated() => $pb.PbList<Block>();
  @$core.pragma('dart2js:noInline')
  static Block getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Block>(create);
  static Block _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Transaction> get transactions => $_getList(0);

  @$pb.TagNumber(2)
  BlockHeader get blockHeader => $_getN(1);
  @$pb.TagNumber(2)
  set blockHeader(BlockHeader v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockHeader() => clearField(2);
  @$pb.TagNumber(2)
  BlockHeader ensureBlockHeader() => $_ensure(1);
}

class ChainInventory_BlockId extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChainInventory.BlockId', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'hash', $pb.PbFieldType.OY)
    ..aInt64(2, 'number')
    ..hasRequiredFields = false
  ;

  ChainInventory_BlockId._() : super();
  factory ChainInventory_BlockId() => create();
  factory ChainInventory_BlockId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainInventory_BlockId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChainInventory_BlockId clone() => ChainInventory_BlockId()..mergeFromMessage(this);
  ChainInventory_BlockId copyWith(void Function(ChainInventory_BlockId) updates) => super.copyWith((message) => updates(message as ChainInventory_BlockId));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChainInventory_BlockId create() => ChainInventory_BlockId._();
  ChainInventory_BlockId createEmptyInstance() => create();
  static $pb.PbList<ChainInventory_BlockId> createRepeated() => $pb.PbList<ChainInventory_BlockId>();
  @$core.pragma('dart2js:noInline')
  static ChainInventory_BlockId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainInventory_BlockId>(create);
  static ChainInventory_BlockId _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get number => $_getI64(1);
  @$pb.TagNumber(2)
  set number($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);
}

class ChainInventory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ChainInventory', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<ChainInventory_BlockId>(1, 'ids', $pb.PbFieldType.PM, subBuilder: ChainInventory_BlockId.create)
    ..aInt64(2, 'remainNum')
    ..hasRequiredFields = false
  ;

  ChainInventory._() : super();
  factory ChainInventory() => create();
  factory ChainInventory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChainInventory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ChainInventory clone() => ChainInventory()..mergeFromMessage(this);
  ChainInventory copyWith(void Function(ChainInventory) updates) => super.copyWith((message) => updates(message as ChainInventory));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChainInventory create() => ChainInventory._();
  ChainInventory createEmptyInstance() => create();
  static $pb.PbList<ChainInventory> createRepeated() => $pb.PbList<ChainInventory>();
  @$core.pragma('dart2js:noInline')
  static ChainInventory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChainInventory>(create);
  static ChainInventory _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChainInventory_BlockId> get ids => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get remainNum => $_getI64(1);
  @$pb.TagNumber(2)
  set remainNum($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemainNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemainNum() => clearField(2);
}

class BlockInventory_BlockId extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockInventory.BlockId', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'hash', $pb.PbFieldType.OY)
    ..aInt64(2, 'number')
    ..hasRequiredFields = false
  ;

  BlockInventory_BlockId._() : super();
  factory BlockInventory_BlockId() => create();
  factory BlockInventory_BlockId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockInventory_BlockId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockInventory_BlockId clone() => BlockInventory_BlockId()..mergeFromMessage(this);
  BlockInventory_BlockId copyWith(void Function(BlockInventory_BlockId) updates) => super.copyWith((message) => updates(message as BlockInventory_BlockId));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockInventory_BlockId create() => BlockInventory_BlockId._();
  BlockInventory_BlockId createEmptyInstance() => create();
  static $pb.PbList<BlockInventory_BlockId> createRepeated() => $pb.PbList<BlockInventory_BlockId>();
  @$core.pragma('dart2js:noInline')
  static BlockInventory_BlockId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockInventory_BlockId>(create);
  static BlockInventory_BlockId _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get number => $_getI64(1);
  @$pb.TagNumber(2)
  set number($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);
}

class BlockInventory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockInventory', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<BlockInventory_BlockId>(1, 'ids', $pb.PbFieldType.PM, subBuilder: BlockInventory_BlockId.create)
    ..e<BlockInventory_Type>(2, 'type', $pb.PbFieldType.OE, defaultOrMaker: BlockInventory_Type.SYNC, valueOf: BlockInventory_Type.valueOf, enumValues: BlockInventory_Type.values)
    ..hasRequiredFields = false
  ;

  BlockInventory._() : super();
  factory BlockInventory() => create();
  factory BlockInventory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockInventory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockInventory clone() => BlockInventory()..mergeFromMessage(this);
  BlockInventory copyWith(void Function(BlockInventory) updates) => super.copyWith((message) => updates(message as BlockInventory));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockInventory create() => BlockInventory._();
  BlockInventory createEmptyInstance() => create();
  static $pb.PbList<BlockInventory> createRepeated() => $pb.PbList<BlockInventory>();
  @$core.pragma('dart2js:noInline')
  static BlockInventory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockInventory>(create);
  static BlockInventory _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BlockInventory_BlockId> get ids => $_getList(0);

  @$pb.TagNumber(2)
  BlockInventory_Type get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(BlockInventory_Type v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

class Inventory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Inventory', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..e<Inventory_InventoryType>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: Inventory_InventoryType.TRX, valueOf: Inventory_InventoryType.valueOf, enumValues: Inventory_InventoryType.values)
    ..p<$core.List<$core.int>>(2, 'ids', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  Inventory._() : super();
  factory Inventory() => create();
  factory Inventory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Inventory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Inventory clone() => Inventory()..mergeFromMessage(this);
  Inventory copyWith(void Function(Inventory) updates) => super.copyWith((message) => updates(message as Inventory));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Inventory create() => Inventory._();
  Inventory createEmptyInstance() => create();
  static $pb.PbList<Inventory> createRepeated() => $pb.PbList<Inventory>();
  @$core.pragma('dart2js:noInline')
  static Inventory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Inventory>(create);
  static Inventory _defaultInstance;

  @$pb.TagNumber(1)
  Inventory_InventoryType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Inventory_InventoryType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get ids => $_getList(1);
}

class Items extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Items', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..e<Items_ItemType>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: Items_ItemType.ERR, valueOf: Items_ItemType.valueOf, enumValues: Items_ItemType.values)
    ..pc<Block>(2, 'blocks', $pb.PbFieldType.PM, subBuilder: Block.create)
    ..pc<BlockHeader>(3, 'blockHeaders', $pb.PbFieldType.PM, subBuilder: BlockHeader.create)
    ..pc<Transaction>(4, 'transactions', $pb.PbFieldType.PM, subBuilder: Transaction.create)
    ..hasRequiredFields = false
  ;

  Items._() : super();
  factory Items() => create();
  factory Items.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Items.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Items clone() => Items()..mergeFromMessage(this);
  Items copyWith(void Function(Items) updates) => super.copyWith((message) => updates(message as Items));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Items create() => Items._();
  Items createEmptyInstance() => create();
  static $pb.PbList<Items> createRepeated() => $pb.PbList<Items>();
  @$core.pragma('dart2js:noInline')
  static Items getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Items>(create);
  static Items _defaultInstance;

  @$pb.TagNumber(1)
  Items_ItemType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Items_ItemType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Block> get blocks => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<BlockHeader> get blockHeaders => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<Transaction> get transactions => $_getList(3);
}

class DynamicProperties extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DynamicProperties', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'lastSolidityBlockNum')
    ..hasRequiredFields = false
  ;

  DynamicProperties._() : super();
  factory DynamicProperties() => create();
  factory DynamicProperties.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DynamicProperties.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DynamicProperties clone() => DynamicProperties()..mergeFromMessage(this);
  DynamicProperties copyWith(void Function(DynamicProperties) updates) => super.copyWith((message) => updates(message as DynamicProperties));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DynamicProperties create() => DynamicProperties._();
  DynamicProperties createEmptyInstance() => create();
  static $pb.PbList<DynamicProperties> createRepeated() => $pb.PbList<DynamicProperties>();
  @$core.pragma('dart2js:noInline')
  static DynamicProperties getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DynamicProperties>(create);
  static DynamicProperties _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get lastSolidityBlockNum => $_getI64(0);
  @$pb.TagNumber(1)
  set lastSolidityBlockNum($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastSolidityBlockNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastSolidityBlockNum() => clearField(1);
}

class DisconnectMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DisconnectMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..e<ReasonCode>(1, 'reason', $pb.PbFieldType.OE, defaultOrMaker: ReasonCode.REQUESTED, valueOf: ReasonCode.valueOf, enumValues: ReasonCode.values)
    ..hasRequiredFields = false
  ;

  DisconnectMessage._() : super();
  factory DisconnectMessage() => create();
  factory DisconnectMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DisconnectMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DisconnectMessage clone() => DisconnectMessage()..mergeFromMessage(this);
  DisconnectMessage copyWith(void Function(DisconnectMessage) updates) => super.copyWith((message) => updates(message as DisconnectMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DisconnectMessage create() => DisconnectMessage._();
  DisconnectMessage createEmptyInstance() => create();
  static $pb.PbList<DisconnectMessage> createRepeated() => $pb.PbList<DisconnectMessage>();
  @$core.pragma('dart2js:noInline')
  static DisconnectMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DisconnectMessage>(create);
  static DisconnectMessage _defaultInstance;

  @$pb.TagNumber(1)
  ReasonCode get reason => $_getN(0);
  @$pb.TagNumber(1)
  set reason(ReasonCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => clearField(1);
}

class HelloMessage_BlockId extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HelloMessage.BlockId', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'hash', $pb.PbFieldType.OY)
    ..aInt64(2, 'number')
    ..hasRequiredFields = false
  ;

  HelloMessage_BlockId._() : super();
  factory HelloMessage_BlockId() => create();
  factory HelloMessage_BlockId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloMessage_BlockId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  HelloMessage_BlockId clone() => HelloMessage_BlockId()..mergeFromMessage(this);
  HelloMessage_BlockId copyWith(void Function(HelloMessage_BlockId) updates) => super.copyWith((message) => updates(message as HelloMessage_BlockId));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloMessage_BlockId create() => HelloMessage_BlockId._();
  HelloMessage_BlockId createEmptyInstance() => create();
  static $pb.PbList<HelloMessage_BlockId> createRepeated() => $pb.PbList<HelloMessage_BlockId>();
  @$core.pragma('dart2js:noInline')
  static HelloMessage_BlockId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloMessage_BlockId>(create);
  static HelloMessage_BlockId _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get number => $_getI64(1);
  @$pb.TagNumber(2)
  set number($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);
}

class HelloMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('HelloMessage', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOM<$1.Endpoint>(1, 'from', subBuilder: $1.Endpoint.create)
    ..a<$core.int>(2, 'version', $pb.PbFieldType.O3)
    ..aInt64(3, 'timestamp')
    ..aOM<HelloMessage_BlockId>(4, 'genesisBlockId', protoName: 'genesisBlockId', subBuilder: HelloMessage_BlockId.create)
    ..aOM<HelloMessage_BlockId>(5, 'solidBlockId', protoName: 'solidBlockId', subBuilder: HelloMessage_BlockId.create)
    ..aOM<HelloMessage_BlockId>(6, 'headBlockId', protoName: 'headBlockId', subBuilder: HelloMessage_BlockId.create)
    ..hasRequiredFields = false
  ;

  HelloMessage._() : super();
  factory HelloMessage() => create();
  factory HelloMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  HelloMessage clone() => HelloMessage()..mergeFromMessage(this);
  HelloMessage copyWith(void Function(HelloMessage) updates) => super.copyWith((message) => updates(message as HelloMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloMessage create() => HelloMessage._();
  HelloMessage createEmptyInstance() => create();
  static $pb.PbList<HelloMessage> createRepeated() => $pb.PbList<HelloMessage>();
  @$core.pragma('dart2js:noInline')
  static HelloMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloMessage>(create);
  static HelloMessage _defaultInstance;

  @$pb.TagNumber(1)
  $1.Endpoint get from => $_getN(0);
  @$pb.TagNumber(1)
  set from($1.Endpoint v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  $1.Endpoint ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => clearField(3);

  @$pb.TagNumber(4)
  HelloMessage_BlockId get genesisBlockId => $_getN(3);
  @$pb.TagNumber(4)
  set genesisBlockId(HelloMessage_BlockId v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGenesisBlockId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGenesisBlockId() => clearField(4);
  @$pb.TagNumber(4)
  HelloMessage_BlockId ensureGenesisBlockId() => $_ensure(3);

  @$pb.TagNumber(5)
  HelloMessage_BlockId get solidBlockId => $_getN(4);
  @$pb.TagNumber(5)
  set solidBlockId(HelloMessage_BlockId v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSolidBlockId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSolidBlockId() => clearField(5);
  @$pb.TagNumber(5)
  HelloMessage_BlockId ensureSolidBlockId() => $_ensure(4);

  @$pb.TagNumber(6)
  HelloMessage_BlockId get headBlockId => $_getN(5);
  @$pb.TagNumber(6)
  set headBlockId(HelloMessage_BlockId v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasHeadBlockId() => $_has(5);
  @$pb.TagNumber(6)
  void clearHeadBlockId() => clearField(6);
  @$pb.TagNumber(6)
  HelloMessage_BlockId ensureHeadBlockId() => $_ensure(5);
}

class SmartContract_ABI_Entry_Param extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SmartContract.ABI.Entry.Param', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOB(1, 'indexed')
    ..aOS(2, 'name')
    ..aOS(3, 'type')
    ..hasRequiredFields = false
  ;

  SmartContract_ABI_Entry_Param._() : super();
  factory SmartContract_ABI_Entry_Param() => create();
  factory SmartContract_ABI_Entry_Param.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartContract_ABI_Entry_Param.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SmartContract_ABI_Entry_Param clone() => SmartContract_ABI_Entry_Param()..mergeFromMessage(this);
  SmartContract_ABI_Entry_Param copyWith(void Function(SmartContract_ABI_Entry_Param) updates) => super.copyWith((message) => updates(message as SmartContract_ABI_Entry_Param));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI_Entry_Param create() => SmartContract_ABI_Entry_Param._();
  SmartContract_ABI_Entry_Param createEmptyInstance() => create();
  static $pb.PbList<SmartContract_ABI_Entry_Param> createRepeated() => $pb.PbList<SmartContract_ABI_Entry_Param>();
  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI_Entry_Param getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartContract_ABI_Entry_Param>(create);
  static SmartContract_ABI_Entry_Param _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get indexed => $_getBF(0);
  @$pb.TagNumber(1)
  set indexed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexed() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexed() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class SmartContract_ABI_Entry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SmartContract.ABI.Entry', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOB(1, 'anonymous')
    ..aOB(2, 'constant')
    ..aOS(3, 'name')
    ..pc<SmartContract_ABI_Entry_Param>(4, 'inputs', $pb.PbFieldType.PM, subBuilder: SmartContract_ABI_Entry_Param.create)
    ..pc<SmartContract_ABI_Entry_Param>(5, 'outputs', $pb.PbFieldType.PM, subBuilder: SmartContract_ABI_Entry_Param.create)
    ..e<SmartContract_ABI_Entry_EntryType>(6, 'type', $pb.PbFieldType.OE, defaultOrMaker: SmartContract_ABI_Entry_EntryType.UnknownEntryType, valueOf: SmartContract_ABI_Entry_EntryType.valueOf, enumValues: SmartContract_ABI_Entry_EntryType.values)
    ..aOB(7, 'payable')
    ..e<SmartContract_ABI_Entry_StateMutabilityType>(8, 'stateMutability', $pb.PbFieldType.OE, protoName: 'stateMutability', defaultOrMaker: SmartContract_ABI_Entry_StateMutabilityType.UnknownMutabilityType, valueOf: SmartContract_ABI_Entry_StateMutabilityType.valueOf, enumValues: SmartContract_ABI_Entry_StateMutabilityType.values)
    ..hasRequiredFields = false
  ;

  SmartContract_ABI_Entry._() : super();
  factory SmartContract_ABI_Entry() => create();
  factory SmartContract_ABI_Entry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartContract_ABI_Entry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SmartContract_ABI_Entry clone() => SmartContract_ABI_Entry()..mergeFromMessage(this);
  SmartContract_ABI_Entry copyWith(void Function(SmartContract_ABI_Entry) updates) => super.copyWith((message) => updates(message as SmartContract_ABI_Entry));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI_Entry create() => SmartContract_ABI_Entry._();
  SmartContract_ABI_Entry createEmptyInstance() => create();
  static $pb.PbList<SmartContract_ABI_Entry> createRepeated() => $pb.PbList<SmartContract_ABI_Entry>();
  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI_Entry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartContract_ABI_Entry>(create);
  static SmartContract_ABI_Entry _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get anonymous => $_getBF(0);
  @$pb.TagNumber(1)
  set anonymous($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAnonymous() => $_has(0);
  @$pb.TagNumber(1)
  void clearAnonymous() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get constant => $_getBF(1);
  @$pb.TagNumber(2)
  set constant($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasConstant() => $_has(1);
  @$pb.TagNumber(2)
  void clearConstant() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<SmartContract_ABI_Entry_Param> get inputs => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<SmartContract_ABI_Entry_Param> get outputs => $_getList(4);

  @$pb.TagNumber(6)
  SmartContract_ABI_Entry_EntryType get type => $_getN(5);
  @$pb.TagNumber(6)
  set type(SmartContract_ABI_Entry_EntryType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get payable => $_getBF(6);
  @$pb.TagNumber(7)
  set payable($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPayable() => $_has(6);
  @$pb.TagNumber(7)
  void clearPayable() => clearField(7);

  @$pb.TagNumber(8)
  SmartContract_ABI_Entry_StateMutabilityType get stateMutability => $_getN(7);
  @$pb.TagNumber(8)
  set stateMutability(SmartContract_ABI_Entry_StateMutabilityType v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStateMutability() => $_has(7);
  @$pb.TagNumber(8)
  void clearStateMutability() => clearField(8);
}

class SmartContract_ABI extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SmartContract.ABI', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..pc<SmartContract_ABI_Entry>(1, 'entrys', $pb.PbFieldType.PM, subBuilder: SmartContract_ABI_Entry.create)
    ..hasRequiredFields = false
  ;

  SmartContract_ABI._() : super();
  factory SmartContract_ABI() => create();
  factory SmartContract_ABI.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartContract_ABI.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SmartContract_ABI clone() => SmartContract_ABI()..mergeFromMessage(this);
  SmartContract_ABI copyWith(void Function(SmartContract_ABI) updates) => super.copyWith((message) => updates(message as SmartContract_ABI));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI create() => SmartContract_ABI._();
  SmartContract_ABI createEmptyInstance() => create();
  static $pb.PbList<SmartContract_ABI> createRepeated() => $pb.PbList<SmartContract_ABI>();
  @$core.pragma('dart2js:noInline')
  static SmartContract_ABI getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartContract_ABI>(create);
  static SmartContract_ABI _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SmartContract_ABI_Entry> get entrys => $_getList(0);
}

class SmartContract extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SmartContract', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'originAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'contractAddress', $pb.PbFieldType.OY)
    ..aOM<SmartContract_ABI>(3, 'abi', subBuilder: SmartContract_ABI.create)
    ..a<$core.List<$core.int>>(4, 'bytecode', $pb.PbFieldType.OY)
    ..aInt64(5, 'callValue')
    ..aInt64(6, 'consumeUserResourcePercent')
    ..aOS(7, 'name')
    ..aInt64(8, 'originEnergyLimit')
    ..a<$core.List<$core.int>>(9, 'codeHash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(10, 'trxHash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SmartContract._() : super();
  factory SmartContract() => create();
  factory SmartContract.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartContract.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SmartContract clone() => SmartContract()..mergeFromMessage(this);
  SmartContract copyWith(void Function(SmartContract) updates) => super.copyWith((message) => updates(message as SmartContract));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmartContract create() => SmartContract._();
  SmartContract createEmptyInstance() => create();
  static $pb.PbList<SmartContract> createRepeated() => $pb.PbList<SmartContract>();
  @$core.pragma('dart2js:noInline')
  static SmartContract getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartContract>(create);
  static SmartContract _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get originAddress => $_getN(0);
  @$pb.TagNumber(1)
  set originAddress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOriginAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOriginAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get contractAddress => $_getN(1);
  @$pb.TagNumber(2)
  set contractAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContractAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearContractAddress() => clearField(2);

  @$pb.TagNumber(3)
  SmartContract_ABI get abi => $_getN(2);
  @$pb.TagNumber(3)
  set abi(SmartContract_ABI v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAbi() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbi() => clearField(3);
  @$pb.TagNumber(3)
  SmartContract_ABI ensureAbi() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get bytecode => $_getN(3);
  @$pb.TagNumber(4)
  set bytecode($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBytecode() => $_has(3);
  @$pb.TagNumber(4)
  void clearBytecode() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get callValue => $_getI64(4);
  @$pb.TagNumber(5)
  set callValue($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCallValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearCallValue() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get consumeUserResourcePercent => $_getI64(5);
  @$pb.TagNumber(6)
  set consumeUserResourcePercent($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasConsumeUserResourcePercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearConsumeUserResourcePercent() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get name => $_getSZ(6);
  @$pb.TagNumber(7)
  set name($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasName() => $_has(6);
  @$pb.TagNumber(7)
  void clearName() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get originEnergyLimit => $_getI64(7);
  @$pb.TagNumber(8)
  set originEnergyLimit($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOriginEnergyLimit() => $_has(7);
  @$pb.TagNumber(8)
  void clearOriginEnergyLimit() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get codeHash => $_getN(8);
  @$pb.TagNumber(9)
  set codeHash($core.List<$core.int> v) { $_setBytes(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCodeHash() => $_has(8);
  @$pb.TagNumber(9)
  void clearCodeHash() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.int> get trxHash => $_getN(9);
  @$pb.TagNumber(10)
  set trxHash($core.List<$core.int> v) { $_setBytes(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTrxHash() => $_has(9);
  @$pb.TagNumber(10)
  void clearTrxHash() => clearField(10);
}

class InternalTransaction_CallValueInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('InternalTransaction.CallValueInfo', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'callValue', protoName: 'callValue')
    ..aOS(2, 'tokenId', protoName: 'tokenId')
    ..hasRequiredFields = false
  ;

  InternalTransaction_CallValueInfo._() : super();
  factory InternalTransaction_CallValueInfo() => create();
  factory InternalTransaction_CallValueInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InternalTransaction_CallValueInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  InternalTransaction_CallValueInfo clone() => InternalTransaction_CallValueInfo()..mergeFromMessage(this);
  InternalTransaction_CallValueInfo copyWith(void Function(InternalTransaction_CallValueInfo) updates) => super.copyWith((message) => updates(message as InternalTransaction_CallValueInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InternalTransaction_CallValueInfo create() => InternalTransaction_CallValueInfo._();
  InternalTransaction_CallValueInfo createEmptyInstance() => create();
  static $pb.PbList<InternalTransaction_CallValueInfo> createRepeated() => $pb.PbList<InternalTransaction_CallValueInfo>();
  @$core.pragma('dart2js:noInline')
  static InternalTransaction_CallValueInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InternalTransaction_CallValueInfo>(create);
  static InternalTransaction_CallValueInfo _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get callValue => $_getI64(0);
  @$pb.TagNumber(1)
  set callValue($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCallValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tokenId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokenId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenId() => clearField(2);
}

class InternalTransaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('InternalTransaction', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'hash', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'callerAddress', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'transferToAddress', $pb.PbFieldType.OY, protoName: 'transferTo_address')
    ..pc<InternalTransaction_CallValueInfo>(4, 'callValueInfo', $pb.PbFieldType.PM, protoName: 'callValueInfo', subBuilder: InternalTransaction_CallValueInfo.create)
    ..a<$core.List<$core.int>>(5, 'note', $pb.PbFieldType.OY)
    ..aOB(6, 'rejected')
    ..hasRequiredFields = false
  ;

  InternalTransaction._() : super();
  factory InternalTransaction() => create();
  factory InternalTransaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InternalTransaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  InternalTransaction clone() => InternalTransaction()..mergeFromMessage(this);
  InternalTransaction copyWith(void Function(InternalTransaction) updates) => super.copyWith((message) => updates(message as InternalTransaction));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InternalTransaction create() => InternalTransaction._();
  InternalTransaction createEmptyInstance() => create();
  static $pb.PbList<InternalTransaction> createRepeated() => $pb.PbList<InternalTransaction>();
  @$core.pragma('dart2js:noInline')
  static InternalTransaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InternalTransaction>(create);
  static InternalTransaction _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get callerAddress => $_getN(1);
  @$pb.TagNumber(2)
  set callerAddress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCallerAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearCallerAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get transferToAddress => $_getN(2);
  @$pb.TagNumber(3)
  set transferToAddress($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransferToAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransferToAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<InternalTransaction_CallValueInfo> get callValueInfo => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get note => $_getN(4);
  @$pb.TagNumber(5)
  set note($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNote() => $_has(4);
  @$pb.TagNumber(5)
  void clearNote() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get rejected => $_getBF(5);
  @$pb.TagNumber(6)
  set rejected($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRejected() => $_has(5);
  @$pb.TagNumber(6)
  void clearRejected() => clearField(6);
}

class DelegatedResourceAccountIndex extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DelegatedResourceAccountIndex', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'account', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, 'fromAccounts', $pb.PbFieldType.PY, protoName: 'fromAccounts')
    ..p<$core.List<$core.int>>(3, 'toAccounts', $pb.PbFieldType.PY, protoName: 'toAccounts')
    ..hasRequiredFields = false
  ;

  DelegatedResourceAccountIndex._() : super();
  factory DelegatedResourceAccountIndex() => create();
  factory DelegatedResourceAccountIndex.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelegatedResourceAccountIndex.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DelegatedResourceAccountIndex clone() => DelegatedResourceAccountIndex()..mergeFromMessage(this);
  DelegatedResourceAccountIndex copyWith(void Function(DelegatedResourceAccountIndex) updates) => super.copyWith((message) => updates(message as DelegatedResourceAccountIndex));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelegatedResourceAccountIndex create() => DelegatedResourceAccountIndex._();
  DelegatedResourceAccountIndex createEmptyInstance() => create();
  static $pb.PbList<DelegatedResourceAccountIndex> createRepeated() => $pb.PbList<DelegatedResourceAccountIndex>();
  @$core.pragma('dart2js:noInline')
  static DelegatedResourceAccountIndex getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelegatedResourceAccountIndex>(create);
  static DelegatedResourceAccountIndex _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get account => $_getN(0);
  @$pb.TagNumber(1)
  set account($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get fromAccounts => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get toAccounts => $_getList(2);
}

class NodeInfo_PeerInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NodeInfo.PeerInfo', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOS(1, 'lastSyncBlock', protoName: 'lastSyncBlock')
    ..aInt64(2, 'remainNum', protoName: 'remainNum')
    ..aInt64(3, 'lastBlockUpdateTime', protoName: 'lastBlockUpdateTime')
    ..aOB(4, 'syncFlag', protoName: 'syncFlag')
    ..aInt64(5, 'headBlockTimeWeBothHave', protoName: 'headBlockTimeWeBothHave')
    ..aOB(6, 'needSyncFromPeer', protoName: 'needSyncFromPeer')
    ..aOB(7, 'needSyncFromUs', protoName: 'needSyncFromUs')
    ..aOS(8, 'host')
    ..a<$core.int>(9, 'port', $pb.PbFieldType.O3)
    ..aOS(10, 'nodeId', protoName: 'nodeId')
    ..aInt64(11, 'connectTime', protoName: 'connectTime')
    ..a<$core.double>(12, 'avgLatency', $pb.PbFieldType.OD, protoName: 'avgLatency')
    ..a<$core.int>(13, 'syncToFetchSize', $pb.PbFieldType.O3, protoName: 'syncToFetchSize')
    ..aInt64(14, 'syncToFetchSizePeekNum', protoName: 'syncToFetchSizePeekNum')
    ..a<$core.int>(15, 'syncBlockRequestedSize', $pb.PbFieldType.O3, protoName: 'syncBlockRequestedSize')
    ..aInt64(16, 'unFetchSynNum', protoName: 'unFetchSynNum')
    ..a<$core.int>(17, 'blockInPorcSize', $pb.PbFieldType.O3, protoName: 'blockInPorcSize')
    ..aOS(18, 'headBlockWeBothHave', protoName: 'headBlockWeBothHave')
    ..aOB(19, 'isActive', protoName: 'isActive')
    ..a<$core.int>(20, 'score', $pb.PbFieldType.O3)
    ..a<$core.int>(21, 'nodeCount', $pb.PbFieldType.O3, protoName: 'nodeCount')
    ..aInt64(22, 'inFlow', protoName: 'inFlow')
    ..a<$core.int>(23, 'disconnectTimes', $pb.PbFieldType.O3, protoName: 'disconnectTimes')
    ..aOS(24, 'localDisconnectReason', protoName: 'localDisconnectReason')
    ..aOS(25, 'remoteDisconnectReason', protoName: 'remoteDisconnectReason')
    ..hasRequiredFields = false
  ;

  NodeInfo_PeerInfo._() : super();
  factory NodeInfo_PeerInfo() => create();
  factory NodeInfo_PeerInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo_PeerInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NodeInfo_PeerInfo clone() => NodeInfo_PeerInfo()..mergeFromMessage(this);
  NodeInfo_PeerInfo copyWith(void Function(NodeInfo_PeerInfo) updates) => super.copyWith((message) => updates(message as NodeInfo_PeerInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NodeInfo_PeerInfo create() => NodeInfo_PeerInfo._();
  NodeInfo_PeerInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo_PeerInfo> createRepeated() => $pb.PbList<NodeInfo_PeerInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo_PeerInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo_PeerInfo>(create);
  static NodeInfo_PeerInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lastSyncBlock => $_getSZ(0);
  @$pb.TagNumber(1)
  set lastSyncBlock($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastSyncBlock() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastSyncBlock() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get remainNum => $_getI64(1);
  @$pb.TagNumber(2)
  set remainNum($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemainNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemainNum() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastBlockUpdateTime => $_getI64(2);
  @$pb.TagNumber(3)
  set lastBlockUpdateTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastBlockUpdateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastBlockUpdateTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get syncFlag => $_getBF(3);
  @$pb.TagNumber(4)
  set syncFlag($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSyncFlag() => $_has(3);
  @$pb.TagNumber(4)
  void clearSyncFlag() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get headBlockTimeWeBothHave => $_getI64(4);
  @$pb.TagNumber(5)
  set headBlockTimeWeBothHave($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeadBlockTimeWeBothHave() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeadBlockTimeWeBothHave() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get needSyncFromPeer => $_getBF(5);
  @$pb.TagNumber(6)
  set needSyncFromPeer($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNeedSyncFromPeer() => $_has(5);
  @$pb.TagNumber(6)
  void clearNeedSyncFromPeer() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get needSyncFromUs => $_getBF(6);
  @$pb.TagNumber(7)
  set needSyncFromUs($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasNeedSyncFromUs() => $_has(6);
  @$pb.TagNumber(7)
  void clearNeedSyncFromUs() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get host => $_getSZ(7);
  @$pb.TagNumber(8)
  set host($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHost() => $_has(7);
  @$pb.TagNumber(8)
  void clearHost() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get port => $_getIZ(8);
  @$pb.TagNumber(9)
  set port($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPort() => $_has(8);
  @$pb.TagNumber(9)
  void clearPort() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get nodeId => $_getSZ(9);
  @$pb.TagNumber(10)
  set nodeId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNodeId() => $_has(9);
  @$pb.TagNumber(10)
  void clearNodeId() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get connectTime => $_getI64(10);
  @$pb.TagNumber(11)
  set connectTime($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasConnectTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearConnectTime() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get avgLatency => $_getN(11);
  @$pb.TagNumber(12)
  set avgLatency($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAvgLatency() => $_has(11);
  @$pb.TagNumber(12)
  void clearAvgLatency() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get syncToFetchSize => $_getIZ(12);
  @$pb.TagNumber(13)
  set syncToFetchSize($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSyncToFetchSize() => $_has(12);
  @$pb.TagNumber(13)
  void clearSyncToFetchSize() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get syncToFetchSizePeekNum => $_getI64(13);
  @$pb.TagNumber(14)
  set syncToFetchSizePeekNum($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSyncToFetchSizePeekNum() => $_has(13);
  @$pb.TagNumber(14)
  void clearSyncToFetchSizePeekNum() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get syncBlockRequestedSize => $_getIZ(14);
  @$pb.TagNumber(15)
  set syncBlockRequestedSize($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSyncBlockRequestedSize() => $_has(14);
  @$pb.TagNumber(15)
  void clearSyncBlockRequestedSize() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get unFetchSynNum => $_getI64(15);
  @$pb.TagNumber(16)
  set unFetchSynNum($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasUnFetchSynNum() => $_has(15);
  @$pb.TagNumber(16)
  void clearUnFetchSynNum() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get blockInPorcSize => $_getIZ(16);
  @$pb.TagNumber(17)
  set blockInPorcSize($core.int v) { $_setSignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasBlockInPorcSize() => $_has(16);
  @$pb.TagNumber(17)
  void clearBlockInPorcSize() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get headBlockWeBothHave => $_getSZ(17);
  @$pb.TagNumber(18)
  set headBlockWeBothHave($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasHeadBlockWeBothHave() => $_has(17);
  @$pb.TagNumber(18)
  void clearHeadBlockWeBothHave() => clearField(18);

  @$pb.TagNumber(19)
  $core.bool get isActive => $_getBF(18);
  @$pb.TagNumber(19)
  set isActive($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasIsActive() => $_has(18);
  @$pb.TagNumber(19)
  void clearIsActive() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get score => $_getIZ(19);
  @$pb.TagNumber(20)
  set score($core.int v) { $_setSignedInt32(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasScore() => $_has(19);
  @$pb.TagNumber(20)
  void clearScore() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get nodeCount => $_getIZ(20);
  @$pb.TagNumber(21)
  set nodeCount($core.int v) { $_setSignedInt32(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasNodeCount() => $_has(20);
  @$pb.TagNumber(21)
  void clearNodeCount() => clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get inFlow => $_getI64(21);
  @$pb.TagNumber(22)
  set inFlow($fixnum.Int64 v) { $_setInt64(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasInFlow() => $_has(21);
  @$pb.TagNumber(22)
  void clearInFlow() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get disconnectTimes => $_getIZ(22);
  @$pb.TagNumber(23)
  set disconnectTimes($core.int v) { $_setSignedInt32(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasDisconnectTimes() => $_has(22);
  @$pb.TagNumber(23)
  void clearDisconnectTimes() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get localDisconnectReason => $_getSZ(23);
  @$pb.TagNumber(24)
  set localDisconnectReason($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasLocalDisconnectReason() => $_has(23);
  @$pb.TagNumber(24)
  void clearLocalDisconnectReason() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get remoteDisconnectReason => $_getSZ(24);
  @$pb.TagNumber(25)
  set remoteDisconnectReason($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasRemoteDisconnectReason() => $_has(24);
  @$pb.TagNumber(25)
  void clearRemoteDisconnectReason() => clearField(25);
}

class NodeInfo_ConfigNodeInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NodeInfo.ConfigNodeInfo', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOS(1, 'codeVersion', protoName: 'codeVersion')
    ..aOS(2, 'p2pVersion', protoName: 'p2pVersion')
    ..a<$core.int>(3, 'listenPort', $pb.PbFieldType.O3, protoName: 'listenPort')
    ..aOB(4, 'discoverEnable', protoName: 'discoverEnable')
    ..a<$core.int>(5, 'activeNodeSize', $pb.PbFieldType.O3, protoName: 'activeNodeSize')
    ..a<$core.int>(6, 'passiveNodeSize', $pb.PbFieldType.O3, protoName: 'passiveNodeSize')
    ..a<$core.int>(7, 'sendNodeSize', $pb.PbFieldType.O3, protoName: 'sendNodeSize')
    ..a<$core.int>(8, 'maxConnectCount', $pb.PbFieldType.O3, protoName: 'maxConnectCount')
    ..a<$core.int>(9, 'sameIpMaxConnectCount', $pb.PbFieldType.O3, protoName: 'sameIpMaxConnectCount')
    ..a<$core.int>(10, 'backupListenPort', $pb.PbFieldType.O3, protoName: 'backupListenPort')
    ..a<$core.int>(11, 'backupMemberSize', $pb.PbFieldType.O3, protoName: 'backupMemberSize')
    ..a<$core.int>(12, 'backupPriority', $pb.PbFieldType.O3, protoName: 'backupPriority')
    ..a<$core.int>(13, 'dbVersion', $pb.PbFieldType.O3, protoName: 'dbVersion')
    ..a<$core.int>(14, 'minParticipationRate', $pb.PbFieldType.O3, protoName: 'minParticipationRate')
    ..aOB(15, 'supportConstant', protoName: 'supportConstant')
    ..a<$core.double>(16, 'minTimeRatio', $pb.PbFieldType.OD, protoName: 'minTimeRatio')
    ..a<$core.double>(17, 'maxTimeRatio', $pb.PbFieldType.OD, protoName: 'maxTimeRatio')
    ..aInt64(18, 'allowCreationOfContracts', protoName: 'allowCreationOfContracts')
    ..aInt64(19, 'allowAdaptiveEnergy', protoName: 'allowAdaptiveEnergy')
    ..hasRequiredFields = false
  ;

  NodeInfo_ConfigNodeInfo._() : super();
  factory NodeInfo_ConfigNodeInfo() => create();
  factory NodeInfo_ConfigNodeInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo_ConfigNodeInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NodeInfo_ConfigNodeInfo clone() => NodeInfo_ConfigNodeInfo()..mergeFromMessage(this);
  NodeInfo_ConfigNodeInfo copyWith(void Function(NodeInfo_ConfigNodeInfo) updates) => super.copyWith((message) => updates(message as NodeInfo_ConfigNodeInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NodeInfo_ConfigNodeInfo create() => NodeInfo_ConfigNodeInfo._();
  NodeInfo_ConfigNodeInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo_ConfigNodeInfo> createRepeated() => $pb.PbList<NodeInfo_ConfigNodeInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo_ConfigNodeInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo_ConfigNodeInfo>(create);
  static NodeInfo_ConfigNodeInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get codeVersion => $_getSZ(0);
  @$pb.TagNumber(1)
  set codeVersion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCodeVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearCodeVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get p2pVersion => $_getSZ(1);
  @$pb.TagNumber(2)
  set p2pVersion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasP2pVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearP2pVersion() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get listenPort => $_getIZ(2);
  @$pb.TagNumber(3)
  set listenPort($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasListenPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearListenPort() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get discoverEnable => $_getBF(3);
  @$pb.TagNumber(4)
  set discoverEnable($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDiscoverEnable() => $_has(3);
  @$pb.TagNumber(4)
  void clearDiscoverEnable() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get activeNodeSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set activeNodeSize($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActiveNodeSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearActiveNodeSize() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get passiveNodeSize => $_getIZ(5);
  @$pb.TagNumber(6)
  set passiveNodeSize($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPassiveNodeSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassiveNodeSize() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get sendNodeSize => $_getIZ(6);
  @$pb.TagNumber(7)
  set sendNodeSize($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSendNodeSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearSendNodeSize() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxConnectCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set maxConnectCount($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMaxConnectCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxConnectCount() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get sameIpMaxConnectCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set sameIpMaxConnectCount($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSameIpMaxConnectCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearSameIpMaxConnectCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get backupListenPort => $_getIZ(9);
  @$pb.TagNumber(10)
  set backupListenPort($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBackupListenPort() => $_has(9);
  @$pb.TagNumber(10)
  void clearBackupListenPort() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get backupMemberSize => $_getIZ(10);
  @$pb.TagNumber(11)
  set backupMemberSize($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasBackupMemberSize() => $_has(10);
  @$pb.TagNumber(11)
  void clearBackupMemberSize() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get backupPriority => $_getIZ(11);
  @$pb.TagNumber(12)
  set backupPriority($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasBackupPriority() => $_has(11);
  @$pb.TagNumber(12)
  void clearBackupPriority() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get dbVersion => $_getIZ(12);
  @$pb.TagNumber(13)
  set dbVersion($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasDbVersion() => $_has(12);
  @$pb.TagNumber(13)
  void clearDbVersion() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get minParticipationRate => $_getIZ(13);
  @$pb.TagNumber(14)
  set minParticipationRate($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasMinParticipationRate() => $_has(13);
  @$pb.TagNumber(14)
  void clearMinParticipationRate() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get supportConstant => $_getBF(14);
  @$pb.TagNumber(15)
  set supportConstant($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSupportConstant() => $_has(14);
  @$pb.TagNumber(15)
  void clearSupportConstant() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get minTimeRatio => $_getN(15);
  @$pb.TagNumber(16)
  set minTimeRatio($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasMinTimeRatio() => $_has(15);
  @$pb.TagNumber(16)
  void clearMinTimeRatio() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get maxTimeRatio => $_getN(16);
  @$pb.TagNumber(17)
  set maxTimeRatio($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasMaxTimeRatio() => $_has(16);
  @$pb.TagNumber(17)
  void clearMaxTimeRatio() => clearField(17);

  @$pb.TagNumber(18)
  $fixnum.Int64 get allowCreationOfContracts => $_getI64(17);
  @$pb.TagNumber(18)
  set allowCreationOfContracts($fixnum.Int64 v) { $_setInt64(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasAllowCreationOfContracts() => $_has(17);
  @$pb.TagNumber(18)
  void clearAllowCreationOfContracts() => clearField(18);

  @$pb.TagNumber(19)
  $fixnum.Int64 get allowAdaptiveEnergy => $_getI64(18);
  @$pb.TagNumber(19)
  set allowAdaptiveEnergy($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasAllowAdaptiveEnergy() => $_has(18);
  @$pb.TagNumber(19)
  void clearAllowAdaptiveEnergy() => clearField(19);
}

class NodeInfo_MachineInfo_MemoryDescInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NodeInfo.MachineInfo.MemoryDescInfo', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aInt64(2, 'initSize', protoName: 'initSize')
    ..aInt64(3, 'useSize', protoName: 'useSize')
    ..aInt64(4, 'maxSize', protoName: 'maxSize')
    ..a<$core.double>(5, 'useRate', $pb.PbFieldType.OD, protoName: 'useRate')
    ..hasRequiredFields = false
  ;

  NodeInfo_MachineInfo_MemoryDescInfo._() : super();
  factory NodeInfo_MachineInfo_MemoryDescInfo() => create();
  factory NodeInfo_MachineInfo_MemoryDescInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo_MachineInfo_MemoryDescInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NodeInfo_MachineInfo_MemoryDescInfo clone() => NodeInfo_MachineInfo_MemoryDescInfo()..mergeFromMessage(this);
  NodeInfo_MachineInfo_MemoryDescInfo copyWith(void Function(NodeInfo_MachineInfo_MemoryDescInfo) updates) => super.copyWith((message) => updates(message as NodeInfo_MachineInfo_MemoryDescInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo_MemoryDescInfo create() => NodeInfo_MachineInfo_MemoryDescInfo._();
  NodeInfo_MachineInfo_MemoryDescInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo_MachineInfo_MemoryDescInfo> createRepeated() => $pb.PbList<NodeInfo_MachineInfo_MemoryDescInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo_MemoryDescInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo_MachineInfo_MemoryDescInfo>(create);
  static NodeInfo_MachineInfo_MemoryDescInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get initSize => $_getI64(1);
  @$pb.TagNumber(2)
  set initSize($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInitSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearInitSize() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get useSize => $_getI64(2);
  @$pb.TagNumber(3)
  set useSize($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUseSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearUseSize() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get maxSize => $_getI64(3);
  @$pb.TagNumber(4)
  set maxSize($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get useRate => $_getN(4);
  @$pb.TagNumber(5)
  set useRate($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUseRate() => $_has(4);
  @$pb.TagNumber(5)
  void clearUseRate() => clearField(5);
}

class NodeInfo_MachineInfo_DeadLockThreadInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NodeInfo.MachineInfo.DeadLockThreadInfo', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'lockName', protoName: 'lockName')
    ..aOS(3, 'lockOwner', protoName: 'lockOwner')
    ..aOS(4, 'state')
    ..aInt64(5, 'blockTime', protoName: 'blockTime')
    ..aInt64(6, 'waitTime', protoName: 'waitTime')
    ..aOS(7, 'stackTrace', protoName: 'stackTrace')
    ..hasRequiredFields = false
  ;

  NodeInfo_MachineInfo_DeadLockThreadInfo._() : super();
  factory NodeInfo_MachineInfo_DeadLockThreadInfo() => create();
  factory NodeInfo_MachineInfo_DeadLockThreadInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo_MachineInfo_DeadLockThreadInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NodeInfo_MachineInfo_DeadLockThreadInfo clone() => NodeInfo_MachineInfo_DeadLockThreadInfo()..mergeFromMessage(this);
  NodeInfo_MachineInfo_DeadLockThreadInfo copyWith(void Function(NodeInfo_MachineInfo_DeadLockThreadInfo) updates) => super.copyWith((message) => updates(message as NodeInfo_MachineInfo_DeadLockThreadInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo_DeadLockThreadInfo create() => NodeInfo_MachineInfo_DeadLockThreadInfo._();
  NodeInfo_MachineInfo_DeadLockThreadInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo_MachineInfo_DeadLockThreadInfo> createRepeated() => $pb.PbList<NodeInfo_MachineInfo_DeadLockThreadInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo_DeadLockThreadInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo_MachineInfo_DeadLockThreadInfo>(create);
  static NodeInfo_MachineInfo_DeadLockThreadInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lockName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lockName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLockName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLockName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lockOwner => $_getSZ(2);
  @$pb.TagNumber(3)
  set lockOwner($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLockOwner() => $_has(2);
  @$pb.TagNumber(3)
  void clearLockOwner() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get state => $_getSZ(3);
  @$pb.TagNumber(4)
  set state($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get blockTime => $_getI64(4);
  @$pb.TagNumber(5)
  set blockTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBlockTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearBlockTime() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get waitTime => $_getI64(5);
  @$pb.TagNumber(6)
  set waitTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWaitTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearWaitTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get stackTrace => $_getSZ(6);
  @$pb.TagNumber(7)
  set stackTrace($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStackTrace() => $_has(6);
  @$pb.TagNumber(7)
  void clearStackTrace() => clearField(7);
}

class NodeInfo_MachineInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NodeInfo.MachineInfo', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..a<$core.int>(1, 'threadCount', $pb.PbFieldType.O3, protoName: 'threadCount')
    ..a<$core.int>(2, 'deadLockThreadCount', $pb.PbFieldType.O3, protoName: 'deadLockThreadCount')
    ..a<$core.int>(3, 'cpuCount', $pb.PbFieldType.O3, protoName: 'cpuCount')
    ..aInt64(4, 'totalMemory', protoName: 'totalMemory')
    ..aInt64(5, 'freeMemory', protoName: 'freeMemory')
    ..a<$core.double>(6, 'cpuRate', $pb.PbFieldType.OD, protoName: 'cpuRate')
    ..aOS(7, 'javaVersion', protoName: 'javaVersion')
    ..aOS(8, 'osName', protoName: 'osName')
    ..aInt64(9, 'jvmTotalMemoery', protoName: 'jvmTotalMemoery')
    ..aInt64(10, 'jvmFreeMemory', protoName: 'jvmFreeMemory')
    ..a<$core.double>(11, 'processCpuRate', $pb.PbFieldType.OD, protoName: 'processCpuRate')
    ..pc<NodeInfo_MachineInfo_MemoryDescInfo>(12, 'memoryDescInfoList', $pb.PbFieldType.PM, protoName: 'memoryDescInfoList', subBuilder: NodeInfo_MachineInfo_MemoryDescInfo.create)
    ..pc<NodeInfo_MachineInfo_DeadLockThreadInfo>(13, 'deadLockThreadInfoList', $pb.PbFieldType.PM, protoName: 'deadLockThreadInfoList', subBuilder: NodeInfo_MachineInfo_DeadLockThreadInfo.create)
    ..hasRequiredFields = false
  ;

  NodeInfo_MachineInfo._() : super();
  factory NodeInfo_MachineInfo() => create();
  factory NodeInfo_MachineInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo_MachineInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NodeInfo_MachineInfo clone() => NodeInfo_MachineInfo()..mergeFromMessage(this);
  NodeInfo_MachineInfo copyWith(void Function(NodeInfo_MachineInfo) updates) => super.copyWith((message) => updates(message as NodeInfo_MachineInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo create() => NodeInfo_MachineInfo._();
  NodeInfo_MachineInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo_MachineInfo> createRepeated() => $pb.PbList<NodeInfo_MachineInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo_MachineInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo_MachineInfo>(create);
  static NodeInfo_MachineInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threadCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set threadCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get deadLockThreadCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set deadLockThreadCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeadLockThreadCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeadLockThreadCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cpuCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set cpuCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCpuCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCpuCount() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalMemory => $_getI64(3);
  @$pb.TagNumber(4)
  set totalMemory($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalMemory() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalMemory() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get freeMemory => $_getI64(4);
  @$pb.TagNumber(5)
  set freeMemory($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFreeMemory() => $_has(4);
  @$pb.TagNumber(5)
  void clearFreeMemory() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get cpuRate => $_getN(5);
  @$pb.TagNumber(6)
  set cpuRate($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCpuRate() => $_has(5);
  @$pb.TagNumber(6)
  void clearCpuRate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get javaVersion => $_getSZ(6);
  @$pb.TagNumber(7)
  set javaVersion($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasJavaVersion() => $_has(6);
  @$pb.TagNumber(7)
  void clearJavaVersion() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get osName => $_getSZ(7);
  @$pb.TagNumber(8)
  set osName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOsName() => $_has(7);
  @$pb.TagNumber(8)
  void clearOsName() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get jvmTotalMemoery => $_getI64(8);
  @$pb.TagNumber(9)
  set jvmTotalMemoery($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasJvmTotalMemoery() => $_has(8);
  @$pb.TagNumber(9)
  void clearJvmTotalMemoery() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get jvmFreeMemory => $_getI64(9);
  @$pb.TagNumber(10)
  set jvmFreeMemory($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasJvmFreeMemory() => $_has(9);
  @$pb.TagNumber(10)
  void clearJvmFreeMemory() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get processCpuRate => $_getN(10);
  @$pb.TagNumber(11)
  set processCpuRate($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasProcessCpuRate() => $_has(10);
  @$pb.TagNumber(11)
  void clearProcessCpuRate() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<NodeInfo_MachineInfo_MemoryDescInfo> get memoryDescInfoList => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<NodeInfo_MachineInfo_DeadLockThreadInfo> get deadLockThreadInfoList => $_getList(12);
}

class NodeInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('NodeInfo', package: const $pb.PackageName('protocol'), createEmptyInstance: create)
    ..aInt64(1, 'beginSyncNum', protoName: 'beginSyncNum')
    ..aOS(2, 'block')
    ..aOS(3, 'solidityBlock', protoName: 'solidityBlock')
    ..a<$core.int>(4, 'currentConnectCount', $pb.PbFieldType.O3, protoName: 'currentConnectCount')
    ..a<$core.int>(5, 'activeConnectCount', $pb.PbFieldType.O3, protoName: 'activeConnectCount')
    ..a<$core.int>(6, 'passiveConnectCount', $pb.PbFieldType.O3, protoName: 'passiveConnectCount')
    ..aInt64(7, 'totalFlow', protoName: 'totalFlow')
    ..pc<NodeInfo_PeerInfo>(8, 'peerInfoList', $pb.PbFieldType.PM, protoName: 'peerInfoList', subBuilder: NodeInfo_PeerInfo.create)
    ..aOM<NodeInfo_ConfigNodeInfo>(9, 'configNodeInfo', protoName: 'configNodeInfo', subBuilder: NodeInfo_ConfigNodeInfo.create)
    ..aOM<NodeInfo_MachineInfo>(10, 'machineInfo', protoName: 'machineInfo', subBuilder: NodeInfo_MachineInfo.create)
    ..m<$core.String, $core.String>(11, 'cheatWitnessInfoMap', protoName: 'cheatWitnessInfoMap', entryClassName: 'NodeInfo.CheatWitnessInfoMapEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('protocol'))
    ..hasRequiredFields = false
  ;

  NodeInfo._() : super();
  factory NodeInfo() => create();
  factory NodeInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NodeInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  NodeInfo clone() => NodeInfo()..mergeFromMessage(this);
  NodeInfo copyWith(void Function(NodeInfo) updates) => super.copyWith((message) => updates(message as NodeInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NodeInfo create() => NodeInfo._();
  NodeInfo createEmptyInstance() => create();
  static $pb.PbList<NodeInfo> createRepeated() => $pb.PbList<NodeInfo>();
  @$core.pragma('dart2js:noInline')
  static NodeInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo>(create);
  static NodeInfo _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get beginSyncNum => $_getI64(0);
  @$pb.TagNumber(1)
  set beginSyncNum($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBeginSyncNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeginSyncNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get block => $_getSZ(1);
  @$pb.TagNumber(2)
  set block($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlock() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlock() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get solidityBlock => $_getSZ(2);
  @$pb.TagNumber(3)
  set solidityBlock($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSolidityBlock() => $_has(2);
  @$pb.TagNumber(3)
  void clearSolidityBlock() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get currentConnectCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set currentConnectCount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrentConnectCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentConnectCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get activeConnectCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set activeConnectCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActiveConnectCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearActiveConnectCount() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get passiveConnectCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set passiveConnectCount($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPassiveConnectCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassiveConnectCount() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get totalFlow => $_getI64(6);
  @$pb.TagNumber(7)
  set totalFlow($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalFlow() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalFlow() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<NodeInfo_PeerInfo> get peerInfoList => $_getList(7);

  @$pb.TagNumber(9)
  NodeInfo_ConfigNodeInfo get configNodeInfo => $_getN(8);
  @$pb.TagNumber(9)
  set configNodeInfo(NodeInfo_ConfigNodeInfo v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasConfigNodeInfo() => $_has(8);
  @$pb.TagNumber(9)
  void clearConfigNodeInfo() => clearField(9);
  @$pb.TagNumber(9)
  NodeInfo_ConfigNodeInfo ensureConfigNodeInfo() => $_ensure(8);

  @$pb.TagNumber(10)
  NodeInfo_MachineInfo get machineInfo => $_getN(9);
  @$pb.TagNumber(10)
  set machineInfo(NodeInfo_MachineInfo v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMachineInfo() => $_has(9);
  @$pb.TagNumber(10)
  void clearMachineInfo() => clearField(10);
  @$pb.TagNumber(10)
  NodeInfo_MachineInfo ensureMachineInfo() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.Map<$core.String, $core.String> get cheatWitnessInfoMap => $_getMap(10);
}

