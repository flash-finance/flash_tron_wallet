///
//  Generated code. Do not modify.
//  source: core/Tron.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AccountType extends $pb.ProtobufEnum {
  static const AccountType Normal = AccountType._(0, 'Normal');
  static const AccountType AssetIssue = AccountType._(1, 'AssetIssue');
  static const AccountType Contract = AccountType._(2, 'Contract');

  static const $core.List<AccountType> values = <AccountType> [
    Normal,
    AssetIssue,
    Contract,
  ];

  static final $core.Map<$core.int, AccountType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AccountType valueOf($core.int value) => _byValue[value];

  const AccountType._($core.int v, $core.String n) : super(v, n);
}

class ReasonCode extends $pb.ProtobufEnum {
  static const ReasonCode REQUESTED = ReasonCode._(0, 'REQUESTED');
  static const ReasonCode BAD_PROTOCOL = ReasonCode._(2, 'BAD_PROTOCOL');
  static const ReasonCode TOO_MANY_PEERS = ReasonCode._(4, 'TOO_MANY_PEERS');
  static const ReasonCode DUPLICATE_PEER = ReasonCode._(5, 'DUPLICATE_PEER');
  static const ReasonCode INCOMPATIBLE_PROTOCOL = ReasonCode._(6, 'INCOMPATIBLE_PROTOCOL');
  static const ReasonCode NULL_IDENTITY = ReasonCode._(7, 'NULL_IDENTITY');
  static const ReasonCode PEER_QUITING = ReasonCode._(8, 'PEER_QUITING');
  static const ReasonCode UNEXPECTED_IDENTITY = ReasonCode._(9, 'UNEXPECTED_IDENTITY');
  static const ReasonCode LOCAL_IDENTITY = ReasonCode._(10, 'LOCAL_IDENTITY');
  static const ReasonCode PING_TIMEOUT = ReasonCode._(11, 'PING_TIMEOUT');
  static const ReasonCode USER_REASON = ReasonCode._(16, 'USER_REASON');
  static const ReasonCode RESET = ReasonCode._(17, 'RESET');
  static const ReasonCode SYNC_FAIL = ReasonCode._(18, 'SYNC_FAIL');
  static const ReasonCode FETCH_FAIL = ReasonCode._(19, 'FETCH_FAIL');
  static const ReasonCode BAD_TX = ReasonCode._(20, 'BAD_TX');
  static const ReasonCode BAD_BLOCK = ReasonCode._(21, 'BAD_BLOCK');
  static const ReasonCode FORKED = ReasonCode._(22, 'FORKED');
  static const ReasonCode UNLINKABLE = ReasonCode._(23, 'UNLINKABLE');
  static const ReasonCode INCOMPATIBLE_VERSION = ReasonCode._(24, 'INCOMPATIBLE_VERSION');
  static const ReasonCode INCOMPATIBLE_CHAIN = ReasonCode._(25, 'INCOMPATIBLE_CHAIN');
  static const ReasonCode TIME_OUT = ReasonCode._(32, 'TIME_OUT');
  static const ReasonCode CONNECT_FAIL = ReasonCode._(33, 'CONNECT_FAIL');
  static const ReasonCode TOO_MANY_PEERS_WITH_SAME_IP = ReasonCode._(34, 'TOO_MANY_PEERS_WITH_SAME_IP');
  static const ReasonCode UNKNOWN = ReasonCode._(255, 'UNKNOWN');

  static const $core.List<ReasonCode> values = <ReasonCode> [
    REQUESTED,
    BAD_PROTOCOL,
    TOO_MANY_PEERS,
    DUPLICATE_PEER,
    INCOMPATIBLE_PROTOCOL,
    NULL_IDENTITY,
    PEER_QUITING,
    UNEXPECTED_IDENTITY,
    LOCAL_IDENTITY,
    PING_TIMEOUT,
    USER_REASON,
    RESET,
    SYNC_FAIL,
    FETCH_FAIL,
    BAD_TX,
    BAD_BLOCK,
    FORKED,
    UNLINKABLE,
    INCOMPATIBLE_VERSION,
    INCOMPATIBLE_CHAIN,
    TIME_OUT,
    CONNECT_FAIL,
    TOO_MANY_PEERS_WITH_SAME_IP,
    UNKNOWN,
  ];

  static final $core.Map<$core.int, ReasonCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReasonCode valueOf($core.int value) => _byValue[value];

  const ReasonCode._($core.int v, $core.String n) : super(v, n);
}

class Proposal_State extends $pb.ProtobufEnum {
  static const Proposal_State PENDING = Proposal_State._(0, 'PENDING');
  static const Proposal_State DISAPPROVED = Proposal_State._(1, 'DISAPPROVED');
  static const Proposal_State APPROVED = Proposal_State._(2, 'APPROVED');
  static const Proposal_State CANCELED = Proposal_State._(3, 'CANCELED');

  static const $core.List<Proposal_State> values = <Proposal_State> [
    PENDING,
    DISAPPROVED,
    APPROVED,
    CANCELED,
  ];

  static final $core.Map<$core.int, Proposal_State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Proposal_State valueOf($core.int value) => _byValue[value];

  const Proposal_State._($core.int v, $core.String n) : super(v, n);
}

class Permission_PermissionType extends $pb.ProtobufEnum {
  static const Permission_PermissionType Owner = Permission_PermissionType._(0, 'Owner');
  static const Permission_PermissionType Witness = Permission_PermissionType._(1, 'Witness');
  static const Permission_PermissionType Active = Permission_PermissionType._(2, 'Active');

  static const $core.List<Permission_PermissionType> values = <Permission_PermissionType> [
    Owner,
    Witness,
    Active,
  ];

  static final $core.Map<$core.int, Permission_PermissionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Permission_PermissionType valueOf($core.int value) => _byValue[value];

  const Permission_PermissionType._($core.int v, $core.String n) : super(v, n);
}

class Transaction_Contract_ContractType extends $pb.ProtobufEnum {
  static const Transaction_Contract_ContractType AccountCreateContract = Transaction_Contract_ContractType._(0, 'AccountCreateContract');
  static const Transaction_Contract_ContractType TransferContract = Transaction_Contract_ContractType._(1, 'TransferContract');
  static const Transaction_Contract_ContractType TransferAssetContract = Transaction_Contract_ContractType._(2, 'TransferAssetContract');
  static const Transaction_Contract_ContractType VoteAssetContract = Transaction_Contract_ContractType._(3, 'VoteAssetContract');
  static const Transaction_Contract_ContractType VoteWitnessContract = Transaction_Contract_ContractType._(4, 'VoteWitnessContract');
  static const Transaction_Contract_ContractType WitnessCreateContract = Transaction_Contract_ContractType._(5, 'WitnessCreateContract');
  static const Transaction_Contract_ContractType AssetIssueContract = Transaction_Contract_ContractType._(6, 'AssetIssueContract');
  static const Transaction_Contract_ContractType WitnessUpdateContract = Transaction_Contract_ContractType._(8, 'WitnessUpdateContract');
  static const Transaction_Contract_ContractType ParticipateAssetIssueContract = Transaction_Contract_ContractType._(9, 'ParticipateAssetIssueContract');
  static const Transaction_Contract_ContractType AccountUpdateContract = Transaction_Contract_ContractType._(10, 'AccountUpdateContract');
  static const Transaction_Contract_ContractType FreezeBalanceContract = Transaction_Contract_ContractType._(11, 'FreezeBalanceContract');
  static const Transaction_Contract_ContractType UnfreezeBalanceContract = Transaction_Contract_ContractType._(12, 'UnfreezeBalanceContract');
  static const Transaction_Contract_ContractType WithdrawBalanceContract = Transaction_Contract_ContractType._(13, 'WithdrawBalanceContract');
  static const Transaction_Contract_ContractType UnfreezeAssetContract = Transaction_Contract_ContractType._(14, 'UnfreezeAssetContract');
  static const Transaction_Contract_ContractType UpdateAssetContract = Transaction_Contract_ContractType._(15, 'UpdateAssetContract');
  static const Transaction_Contract_ContractType ProposalCreateContract = Transaction_Contract_ContractType._(16, 'ProposalCreateContract');
  static const Transaction_Contract_ContractType ProposalApproveContract = Transaction_Contract_ContractType._(17, 'ProposalApproveContract');
  static const Transaction_Contract_ContractType ProposalDeleteContract = Transaction_Contract_ContractType._(18, 'ProposalDeleteContract');
  static const Transaction_Contract_ContractType SetAccountIdContract = Transaction_Contract_ContractType._(19, 'SetAccountIdContract');
  static const Transaction_Contract_ContractType CustomContract = Transaction_Contract_ContractType._(20, 'CustomContract');
  static const Transaction_Contract_ContractType CreateSmartContract = Transaction_Contract_ContractType._(30, 'CreateSmartContract');
  static const Transaction_Contract_ContractType TriggerSmartContract = Transaction_Contract_ContractType._(31, 'TriggerSmartContract');
  static const Transaction_Contract_ContractType GetContract = Transaction_Contract_ContractType._(32, 'GetContract');
  static const Transaction_Contract_ContractType UpdateSettingContract = Transaction_Contract_ContractType._(33, 'UpdateSettingContract');
  static const Transaction_Contract_ContractType ExchangeCreateContract = Transaction_Contract_ContractType._(41, 'ExchangeCreateContract');
  static const Transaction_Contract_ContractType ExchangeInjectContract = Transaction_Contract_ContractType._(42, 'ExchangeInjectContract');
  static const Transaction_Contract_ContractType ExchangeWithdrawContract = Transaction_Contract_ContractType._(43, 'ExchangeWithdrawContract');
  static const Transaction_Contract_ContractType ExchangeTransactionContract = Transaction_Contract_ContractType._(44, 'ExchangeTransactionContract');
  static const Transaction_Contract_ContractType UpdateEnergyLimitContract = Transaction_Contract_ContractType._(45, 'UpdateEnergyLimitContract');
  static const Transaction_Contract_ContractType AccountPermissionUpdateContract = Transaction_Contract_ContractType._(46, 'AccountPermissionUpdateContract');
  static const Transaction_Contract_ContractType ClearABIContract = Transaction_Contract_ContractType._(48, 'ClearABIContract');
  static const Transaction_Contract_ContractType UpdateBrokerageContract = Transaction_Contract_ContractType._(49, 'UpdateBrokerageContract');

  static const $core.List<Transaction_Contract_ContractType> values = <Transaction_Contract_ContractType> [
    AccountCreateContract,
    TransferContract,
    TransferAssetContract,
    VoteAssetContract,
    VoteWitnessContract,
    WitnessCreateContract,
    AssetIssueContract,
    WitnessUpdateContract,
    ParticipateAssetIssueContract,
    AccountUpdateContract,
    FreezeBalanceContract,
    UnfreezeBalanceContract,
    WithdrawBalanceContract,
    UnfreezeAssetContract,
    UpdateAssetContract,
    ProposalCreateContract,
    ProposalApproveContract,
    ProposalDeleteContract,
    SetAccountIdContract,
    CustomContract,
    CreateSmartContract,
    TriggerSmartContract,
    GetContract,
    UpdateSettingContract,
    ExchangeCreateContract,
    ExchangeInjectContract,
    ExchangeWithdrawContract,
    ExchangeTransactionContract,
    UpdateEnergyLimitContract,
    AccountPermissionUpdateContract,
    ClearABIContract,
    UpdateBrokerageContract,
  ];

  static final $core.Map<$core.int, Transaction_Contract_ContractType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Transaction_Contract_ContractType valueOf($core.int value) => _byValue[value];

  const Transaction_Contract_ContractType._($core.int v, $core.String n) : super(v, n);
}

class Transaction_Result_code extends $pb.ProtobufEnum {
  static const Transaction_Result_code SUCESS = Transaction_Result_code._(0, 'SUCESS');
  static const Transaction_Result_code FAILED = Transaction_Result_code._(1, 'FAILED');

  static const $core.List<Transaction_Result_code> values = <Transaction_Result_code> [
    SUCESS,
    FAILED,
  ];

  static final $core.Map<$core.int, Transaction_Result_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Transaction_Result_code valueOf($core.int value) => _byValue[value];

  const Transaction_Result_code._($core.int v, $core.String n) : super(v, n);
}

class Transaction_Result_contractResult extends $pb.ProtobufEnum {
  static const Transaction_Result_contractResult DEFAULT = Transaction_Result_contractResult._(0, 'DEFAULT');
  static const Transaction_Result_contractResult SUCCESS = Transaction_Result_contractResult._(1, 'SUCCESS');
  static const Transaction_Result_contractResult REVERT = Transaction_Result_contractResult._(2, 'REVERT');
  static const Transaction_Result_contractResult BAD_JUMP_DESTINATION = Transaction_Result_contractResult._(3, 'BAD_JUMP_DESTINATION');
  static const Transaction_Result_contractResult OUT_OF_MEMORY = Transaction_Result_contractResult._(4, 'OUT_OF_MEMORY');
  static const Transaction_Result_contractResult PRECOMPILED_CONTRACT = Transaction_Result_contractResult._(5, 'PRECOMPILED_CONTRACT');
  static const Transaction_Result_contractResult STACK_TOO_SMALL = Transaction_Result_contractResult._(6, 'STACK_TOO_SMALL');
  static const Transaction_Result_contractResult STACK_TOO_LARGE = Transaction_Result_contractResult._(7, 'STACK_TOO_LARGE');
  static const Transaction_Result_contractResult ILLEGAL_OPERATION = Transaction_Result_contractResult._(8, 'ILLEGAL_OPERATION');
  static const Transaction_Result_contractResult STACK_OVERFLOW = Transaction_Result_contractResult._(9, 'STACK_OVERFLOW');
  static const Transaction_Result_contractResult OUT_OF_ENERGY = Transaction_Result_contractResult._(10, 'OUT_OF_ENERGY');
  static const Transaction_Result_contractResult OUT_OF_TIME = Transaction_Result_contractResult._(11, 'OUT_OF_TIME');
  static const Transaction_Result_contractResult JVM_STACK_OVER_FLOW = Transaction_Result_contractResult._(12, 'JVM_STACK_OVER_FLOW');
  static const Transaction_Result_contractResult UNKNOWN = Transaction_Result_contractResult._(13, 'UNKNOWN');
  static const Transaction_Result_contractResult TRANSFER_FAILED = Transaction_Result_contractResult._(14, 'TRANSFER_FAILED');

  static const $core.List<Transaction_Result_contractResult> values = <Transaction_Result_contractResult> [
    DEFAULT,
    SUCCESS,
    REVERT,
    BAD_JUMP_DESTINATION,
    OUT_OF_MEMORY,
    PRECOMPILED_CONTRACT,
    STACK_TOO_SMALL,
    STACK_TOO_LARGE,
    ILLEGAL_OPERATION,
    STACK_OVERFLOW,
    OUT_OF_ENERGY,
    OUT_OF_TIME,
    JVM_STACK_OVER_FLOW,
    UNKNOWN,
    TRANSFER_FAILED,
  ];

  static final $core.Map<$core.int, Transaction_Result_contractResult> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Transaction_Result_contractResult valueOf($core.int value) => _byValue[value];

  const Transaction_Result_contractResult._($core.int v, $core.String n) : super(v, n);
}

class TransactionInfo_code extends $pb.ProtobufEnum {
  static const TransactionInfo_code SUCESS = TransactionInfo_code._(0, 'SUCESS');
  static const TransactionInfo_code FAILED = TransactionInfo_code._(1, 'FAILED');

  static const $core.List<TransactionInfo_code> values = <TransactionInfo_code> [
    SUCESS,
    FAILED,
  ];

  static final $core.Map<$core.int, TransactionInfo_code> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionInfo_code valueOf($core.int value) => _byValue[value];

  const TransactionInfo_code._($core.int v, $core.String n) : super(v, n);
}

class BlockInventory_Type extends $pb.ProtobufEnum {
  static const BlockInventory_Type SYNC = BlockInventory_Type._(0, 'SYNC');
  static const BlockInventory_Type ADVTISE = BlockInventory_Type._(1, 'ADVTISE');
  static const BlockInventory_Type FETCH = BlockInventory_Type._(2, 'FETCH');

  static const $core.List<BlockInventory_Type> values = <BlockInventory_Type> [
    SYNC,
    ADVTISE,
    FETCH,
  ];

  static final $core.Map<$core.int, BlockInventory_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BlockInventory_Type valueOf($core.int value) => _byValue[value];

  const BlockInventory_Type._($core.int v, $core.String n) : super(v, n);
}

class Inventory_InventoryType extends $pb.ProtobufEnum {
  static const Inventory_InventoryType TRX = Inventory_InventoryType._(0, 'TRX');
  static const Inventory_InventoryType BLOCK = Inventory_InventoryType._(1, 'BLOCK');

  static const $core.List<Inventory_InventoryType> values = <Inventory_InventoryType> [
    TRX,
    BLOCK,
  ];

  static final $core.Map<$core.int, Inventory_InventoryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Inventory_InventoryType valueOf($core.int value) => _byValue[value];

  const Inventory_InventoryType._($core.int v, $core.String n) : super(v, n);
}

class Items_ItemType extends $pb.ProtobufEnum {
  static const Items_ItemType ERR = Items_ItemType._(0, 'ERR');
  static const Items_ItemType TRX = Items_ItemType._(1, 'TRX');
  static const Items_ItemType BLOCK = Items_ItemType._(2, 'BLOCK');
  static const Items_ItemType BLOCKHEADER = Items_ItemType._(3, 'BLOCKHEADER');

  static const $core.List<Items_ItemType> values = <Items_ItemType> [
    ERR,
    TRX,
    BLOCK,
    BLOCKHEADER,
  ];

  static final $core.Map<$core.int, Items_ItemType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Items_ItemType valueOf($core.int value) => _byValue[value];

  const Items_ItemType._($core.int v, $core.String n) : super(v, n);
}

class SmartContract_ABI_Entry_EntryType extends $pb.ProtobufEnum {
  static const SmartContract_ABI_Entry_EntryType UnknownEntryType = SmartContract_ABI_Entry_EntryType._(0, 'UnknownEntryType');
  static const SmartContract_ABI_Entry_EntryType Constructor = SmartContract_ABI_Entry_EntryType._(1, 'Constructor');
  static const SmartContract_ABI_Entry_EntryType Function = SmartContract_ABI_Entry_EntryType._(2, 'Function');
  static const SmartContract_ABI_Entry_EntryType Event = SmartContract_ABI_Entry_EntryType._(3, 'Event');
  static const SmartContract_ABI_Entry_EntryType Fallback = SmartContract_ABI_Entry_EntryType._(4, 'Fallback');

  static const $core.List<SmartContract_ABI_Entry_EntryType> values = <SmartContract_ABI_Entry_EntryType> [
    UnknownEntryType,
    Constructor,
    Function,
    Event,
    Fallback,
  ];

  static final $core.Map<$core.int, SmartContract_ABI_Entry_EntryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SmartContract_ABI_Entry_EntryType valueOf($core.int value) => _byValue[value];

  const SmartContract_ABI_Entry_EntryType._($core.int v, $core.String n) : super(v, n);
}

class SmartContract_ABI_Entry_StateMutabilityType extends $pb.ProtobufEnum {
  static const SmartContract_ABI_Entry_StateMutabilityType UnknownMutabilityType = SmartContract_ABI_Entry_StateMutabilityType._(0, 'UnknownMutabilityType');
  static const SmartContract_ABI_Entry_StateMutabilityType Pure = SmartContract_ABI_Entry_StateMutabilityType._(1, 'Pure');
  static const SmartContract_ABI_Entry_StateMutabilityType View = SmartContract_ABI_Entry_StateMutabilityType._(2, 'View');
  static const SmartContract_ABI_Entry_StateMutabilityType Nonpayable = SmartContract_ABI_Entry_StateMutabilityType._(3, 'Nonpayable');
  static const SmartContract_ABI_Entry_StateMutabilityType Payable = SmartContract_ABI_Entry_StateMutabilityType._(4, 'Payable');

  static const $core.List<SmartContract_ABI_Entry_StateMutabilityType> values = <SmartContract_ABI_Entry_StateMutabilityType> [
    UnknownMutabilityType,
    Pure,
    View,
    Nonpayable,
    Payable,
  ];

  static final $core.Map<$core.int, SmartContract_ABI_Entry_StateMutabilityType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SmartContract_ABI_Entry_StateMutabilityType valueOf($core.int value) => _byValue[value];

  const SmartContract_ABI_Entry_StateMutabilityType._($core.int v, $core.String n) : super(v, n);
}

