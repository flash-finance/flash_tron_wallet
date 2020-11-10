///
//  Generated code. Do not modify.
//  source: core/Tron.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const AccountType$json = const {
  '1': 'AccountType',
  '2': const [
    const {'1': 'Normal', '2': 0},
    const {'1': 'AssetIssue', '2': 1},
    const {'1': 'Contract', '2': 2},
  ],
};

const ReasonCode$json = const {
  '1': 'ReasonCode',
  '2': const [
    const {'1': 'REQUESTED', '2': 0},
    const {'1': 'BAD_PROTOCOL', '2': 2},
    const {'1': 'TOO_MANY_PEERS', '2': 4},
    const {'1': 'DUPLICATE_PEER', '2': 5},
    const {'1': 'INCOMPATIBLE_PROTOCOL', '2': 6},
    const {'1': 'NULL_IDENTITY', '2': 7},
    const {'1': 'PEER_QUITING', '2': 8},
    const {'1': 'UNEXPECTED_IDENTITY', '2': 9},
    const {'1': 'LOCAL_IDENTITY', '2': 10},
    const {'1': 'PING_TIMEOUT', '2': 11},
    const {'1': 'USER_REASON', '2': 16},
    const {'1': 'RESET', '2': 17},
    const {'1': 'SYNC_FAIL', '2': 18},
    const {'1': 'FETCH_FAIL', '2': 19},
    const {'1': 'BAD_TX', '2': 20},
    const {'1': 'BAD_BLOCK', '2': 21},
    const {'1': 'FORKED', '2': 22},
    const {'1': 'UNLINKABLE', '2': 23},
    const {'1': 'INCOMPATIBLE_VERSION', '2': 24},
    const {'1': 'INCOMPATIBLE_CHAIN', '2': 25},
    const {'1': 'TIME_OUT', '2': 32},
    const {'1': 'CONNECT_FAIL', '2': 33},
    const {'1': 'TOO_MANY_PEERS_WITH_SAME_IP', '2': 34},
    const {'1': 'UNKNOWN', '2': 255},
  ],
};

const AccountId$json = const {
  '1': 'AccountId',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 12, '10': 'name'},
    const {'1': 'address', '3': 2, '4': 1, '5': 12, '10': 'address'},
  ],
};

const Vote$json = const {
  '1': 'Vote',
  '2': const [
    const {'1': 'vote_address', '3': 1, '4': 1, '5': 12, '10': 'voteAddress'},
    const {'1': 'vote_count', '3': 2, '4': 1, '5': 3, '10': 'voteCount'},
  ],
};

const Proposal$json = const {
  '1': 'Proposal',
  '2': const [
    const {'1': 'proposal_id', '3': 1, '4': 1, '5': 3, '10': 'proposalId'},
    const {'1': 'proposer_address', '3': 2, '4': 1, '5': 12, '10': 'proposerAddress'},
    const {'1': 'parameters', '3': 3, '4': 3, '5': 11, '6': '.protocol.Proposal.ParametersEntry', '10': 'parameters'},
    const {'1': 'expiration_time', '3': 4, '4': 1, '5': 3, '10': 'expirationTime'},
    const {'1': 'create_time', '3': 5, '4': 1, '5': 3, '10': 'createTime'},
    const {'1': 'approvals', '3': 6, '4': 3, '5': 12, '10': 'approvals'},
    const {'1': 'state', '3': 7, '4': 1, '5': 14, '6': '.protocol.Proposal.State', '10': 'state'},
  ],
  '3': const [Proposal_ParametersEntry$json],
  '4': const [Proposal_State$json],
};

const Proposal_ParametersEntry$json = const {
  '1': 'ParametersEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 3, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const Proposal_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'PENDING', '2': 0},
    const {'1': 'DISAPPROVED', '2': 1},
    const {'1': 'APPROVED', '2': 2},
    const {'1': 'CANCELED', '2': 3},
  ],
};

const Exchange$json = const {
  '1': 'Exchange',
  '2': const [
    const {'1': 'exchange_id', '3': 1, '4': 1, '5': 3, '10': 'exchangeId'},
    const {'1': 'creator_address', '3': 2, '4': 1, '5': 12, '10': 'creatorAddress'},
    const {'1': 'create_time', '3': 3, '4': 1, '5': 3, '10': 'createTime'},
    const {'1': 'first_token_id', '3': 6, '4': 1, '5': 12, '10': 'firstTokenId'},
    const {'1': 'first_token_balance', '3': 7, '4': 1, '5': 3, '10': 'firstTokenBalance'},
    const {'1': 'second_token_id', '3': 8, '4': 1, '5': 12, '10': 'secondTokenId'},
    const {'1': 'second_token_balance', '3': 9, '4': 1, '5': 3, '10': 'secondTokenBalance'},
  ],
};

const ChainParameters$json = const {
  '1': 'ChainParameters',
  '2': const [
    const {'1': 'chainParameter', '3': 1, '4': 3, '5': 11, '6': '.protocol.ChainParameters.ChainParameter', '10': 'chainParameter'},
  ],
  '3': const [ChainParameters_ChainParameter$json],
};

const ChainParameters_ChainParameter$json = const {
  '1': 'ChainParameter',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
};

const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'account_name', '3': 1, '4': 1, '5': 12, '10': 'accountName'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.protocol.AccountType', '10': 'type'},
    const {'1': 'address', '3': 3, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'balance', '3': 4, '4': 1, '5': 3, '10': 'balance'},
    const {'1': 'votes', '3': 5, '4': 3, '5': 11, '6': '.protocol.Vote', '10': 'votes'},
    const {'1': 'asset', '3': 6, '4': 3, '5': 11, '6': '.protocol.Account.AssetEntry', '10': 'asset'},
    const {'1': 'assetV2', '3': 56, '4': 3, '5': 11, '6': '.protocol.Account.AssetV2Entry', '10': 'assetV2'},
    const {'1': 'frozen', '3': 7, '4': 3, '5': 11, '6': '.protocol.Account.Frozen', '10': 'frozen'},
    const {'1': 'net_usage', '3': 8, '4': 1, '5': 3, '10': 'netUsage'},
    const {'1': 'acquired_delegated_frozen_balance_for_bandwidth', '3': 41, '4': 1, '5': 3, '10': 'acquiredDelegatedFrozenBalanceForBandwidth'},
    const {'1': 'delegated_frozen_balance_for_bandwidth', '3': 42, '4': 1, '5': 3, '10': 'delegatedFrozenBalanceForBandwidth'},
    const {'1': 'create_time', '3': 9, '4': 1, '5': 3, '10': 'createTime'},
    const {'1': 'latest_opration_time', '3': 10, '4': 1, '5': 3, '10': 'latestOprationTime'},
    const {'1': 'allowance', '3': 11, '4': 1, '5': 3, '10': 'allowance'},
    const {'1': 'latest_withdraw_time', '3': 12, '4': 1, '5': 3, '10': 'latestWithdrawTime'},
    const {'1': 'code', '3': 13, '4': 1, '5': 12, '10': 'code'},
    const {'1': 'is_witness', '3': 14, '4': 1, '5': 8, '10': 'isWitness'},
    const {'1': 'is_committee', '3': 15, '4': 1, '5': 8, '10': 'isCommittee'},
    const {'1': 'frozen_supply', '3': 16, '4': 3, '5': 11, '6': '.protocol.Account.Frozen', '10': 'frozenSupply'},
    const {'1': 'asset_issued_name', '3': 17, '4': 1, '5': 12, '10': 'assetIssuedName'},
    const {'1': 'asset_issued_ID', '3': 57, '4': 1, '5': 12, '10': 'assetIssuedID'},
    const {'1': 'latest_asset_operation_time', '3': 18, '4': 3, '5': 11, '6': '.protocol.Account.LatestAssetOperationTimeEntry', '10': 'latestAssetOperationTime'},
    const {'1': 'latest_asset_operation_timeV2', '3': 58, '4': 3, '5': 11, '6': '.protocol.Account.LatestAssetOperationTimeV2Entry', '10': 'latestAssetOperationTimeV2'},
    const {'1': 'free_net_usage', '3': 19, '4': 1, '5': 3, '10': 'freeNetUsage'},
    const {'1': 'free_asset_net_usage', '3': 20, '4': 3, '5': 11, '6': '.protocol.Account.FreeAssetNetUsageEntry', '10': 'freeAssetNetUsage'},
    const {'1': 'free_asset_net_usageV2', '3': 59, '4': 3, '5': 11, '6': '.protocol.Account.FreeAssetNetUsageV2Entry', '10': 'freeAssetNetUsageV2'},
    const {'1': 'latest_consume_time', '3': 21, '4': 1, '5': 3, '10': 'latestConsumeTime'},
    const {'1': 'latest_consume_free_time', '3': 22, '4': 1, '5': 3, '10': 'latestConsumeFreeTime'},
    const {'1': 'account_id', '3': 23, '4': 1, '5': 12, '10': 'accountId'},
    const {'1': 'account_resource', '3': 26, '4': 1, '5': 11, '6': '.protocol.Account.AccountResource', '10': 'accountResource'},
    const {'1': 'codeHash', '3': 30, '4': 1, '5': 12, '10': 'codeHash'},
    const {'1': 'owner_permission', '3': 31, '4': 1, '5': 11, '6': '.protocol.Permission', '10': 'ownerPermission'},
    const {'1': 'witness_permission', '3': 32, '4': 1, '5': 11, '6': '.protocol.Permission', '10': 'witnessPermission'},
    const {'1': 'active_permission', '3': 33, '4': 3, '5': 11, '6': '.protocol.Permission', '10': 'activePermission'},
  ],
  '3': const [Account_Frozen$json, Account_AssetEntry$json, Account_AssetV2Entry$json, Account_LatestAssetOperationTimeEntry$json, Account_LatestAssetOperationTimeV2Entry$json, Account_FreeAssetNetUsageEntry$json, Account_FreeAssetNetUsageV2Entry$json, Account_AccountResource$json],
};

const Account_Frozen$json = const {
  '1': 'Frozen',
  '2': const [
    const {'1': 'frozen_balance', '3': 1, '4': 1, '5': 3, '10': 'frozenBalance'},
    const {'1': 'expire_time', '3': 2, '4': 1, '5': 3, '10': 'expireTime'},
  ],
};

const Account_AssetEntry$json = const {
  '1': 'AssetEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const Account_AssetV2Entry$json = const {
  '1': 'AssetV2Entry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const Account_LatestAssetOperationTimeEntry$json = const {
  '1': 'LatestAssetOperationTimeEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const Account_LatestAssetOperationTimeV2Entry$json = const {
  '1': 'LatestAssetOperationTimeV2Entry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const Account_FreeAssetNetUsageEntry$json = const {
  '1': 'FreeAssetNetUsageEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const Account_FreeAssetNetUsageV2Entry$json = const {
  '1': 'FreeAssetNetUsageV2Entry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const Account_AccountResource$json = const {
  '1': 'AccountResource',
  '2': const [
    const {'1': 'energy_usage', '3': 1, '4': 1, '5': 3, '10': 'energyUsage'},
    const {'1': 'frozen_balance_for_energy', '3': 2, '4': 1, '5': 11, '6': '.protocol.Account.Frozen', '10': 'frozenBalanceForEnergy'},
    const {'1': 'latest_consume_time_for_energy', '3': 3, '4': 1, '5': 3, '10': 'latestConsumeTimeForEnergy'},
    const {'1': 'acquired_delegated_frozen_balance_for_energy', '3': 4, '4': 1, '5': 3, '10': 'acquiredDelegatedFrozenBalanceForEnergy'},
    const {'1': 'delegated_frozen_balance_for_energy', '3': 5, '4': 1, '5': 3, '10': 'delegatedFrozenBalanceForEnergy'},
    const {'1': 'storage_limit', '3': 6, '4': 1, '5': 3, '10': 'storageLimit'},
    const {'1': 'storage_usage', '3': 7, '4': 1, '5': 3, '10': 'storageUsage'},
    const {'1': 'latest_exchange_storage_time', '3': 8, '4': 1, '5': 3, '10': 'latestExchangeStorageTime'},
  ],
};

const Key$json = const {
  '1': 'Key',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'weight', '3': 2, '4': 1, '5': 3, '10': 'weight'},
  ],
};

const DelegatedResource$json = const {
  '1': 'DelegatedResource',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 12, '10': 'from'},
    const {'1': 'to', '3': 2, '4': 1, '5': 12, '10': 'to'},
    const {'1': 'frozen_balance_for_bandwidth', '3': 3, '4': 1, '5': 3, '10': 'frozenBalanceForBandwidth'},
    const {'1': 'frozen_balance_for_energy', '3': 4, '4': 1, '5': 3, '10': 'frozenBalanceForEnergy'},
    const {'1': 'expire_time_for_bandwidth', '3': 5, '4': 1, '5': 3, '10': 'expireTimeForBandwidth'},
    const {'1': 'expire_time_for_energy', '3': 6, '4': 1, '5': 3, '10': 'expireTimeForEnergy'},
  ],
};

const authority$json = const {
  '1': 'authority',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.protocol.AccountId', '10': 'account'},
    const {'1': 'permission_name', '3': 2, '4': 1, '5': 12, '10': 'permissionName'},
  ],
};

const Permission$json = const {
  '1': 'Permission',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.protocol.Permission.PermissionType', '10': 'type'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'permission_name', '3': 3, '4': 1, '5': 9, '10': 'permissionName'},
    const {'1': 'threshold', '3': 4, '4': 1, '5': 3, '10': 'threshold'},
    const {'1': 'parent_id', '3': 5, '4': 1, '5': 5, '10': 'parentId'},
    const {'1': 'operations', '3': 6, '4': 1, '5': 12, '10': 'operations'},
    const {'1': 'keys', '3': 7, '4': 3, '5': 11, '6': '.protocol.Key', '10': 'keys'},
  ],
  '4': const [Permission_PermissionType$json],
};

const Permission_PermissionType$json = const {
  '1': 'PermissionType',
  '2': const [
    const {'1': 'Owner', '2': 0},
    const {'1': 'Witness', '2': 1},
    const {'1': 'Active', '2': 2},
  ],
};

const Witness$json = const {
  '1': 'Witness',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'voteCount', '3': 2, '4': 1, '5': 3, '10': 'voteCount'},
    const {'1': 'pubKey', '3': 3, '4': 1, '5': 12, '10': 'pubKey'},
    const {'1': 'url', '3': 4, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'totalProduced', '3': 5, '4': 1, '5': 3, '10': 'totalProduced'},
    const {'1': 'totalMissed', '3': 6, '4': 1, '5': 3, '10': 'totalMissed'},
    const {'1': 'latestBlockNum', '3': 7, '4': 1, '5': 3, '10': 'latestBlockNum'},
    const {'1': 'latestSlotNum', '3': 8, '4': 1, '5': 3, '10': 'latestSlotNum'},
    const {'1': 'isJobs', '3': 9, '4': 1, '5': 8, '10': 'isJobs'},
  ],
};

const Votes$json = const {
  '1': 'Votes',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'old_votes', '3': 2, '4': 3, '5': 11, '6': '.protocol.Vote', '10': 'oldVotes'},
    const {'1': 'new_votes', '3': 3, '4': 3, '5': 11, '6': '.protocol.Vote', '10': 'newVotes'},
  ],
};

const TXOutput$json = const {
  '1': 'TXOutput',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 3, '10': 'value'},
    const {'1': 'pubKeyHash', '3': 2, '4': 1, '5': 12, '10': 'pubKeyHash'},
  ],
};

const TXInput$json = const {
  '1': 'TXInput',
  '2': const [
    const {'1': 'raw_data', '3': 1, '4': 1, '5': 11, '6': '.protocol.TXInput.raw', '10': 'rawData'},
    const {'1': 'signature', '3': 4, '4': 1, '5': 12, '10': 'signature'},
  ],
  '3': const [TXInput_raw$json],
};

const TXInput_raw$json = const {
  '1': 'raw',
  '2': const [
    const {'1': 'txID', '3': 1, '4': 1, '5': 12, '10': 'txID'},
    const {'1': 'vout', '3': 2, '4': 1, '5': 3, '10': 'vout'},
    const {'1': 'pubKey', '3': 3, '4': 1, '5': 12, '10': 'pubKey'},
  ],
};

const TXOutputs$json = const {
  '1': 'TXOutputs',
  '2': const [
    const {'1': 'outputs', '3': 1, '4': 3, '5': 11, '6': '.protocol.TXOutput', '10': 'outputs'},
  ],
};

const ResourceReceipt$json = const {
  '1': 'ResourceReceipt',
  '2': const [
    const {'1': 'energy_usage', '3': 1, '4': 1, '5': 3, '10': 'energyUsage'},
    const {'1': 'energy_fee', '3': 2, '4': 1, '5': 3, '10': 'energyFee'},
    const {'1': 'origin_energy_usage', '3': 3, '4': 1, '5': 3, '10': 'originEnergyUsage'},
    const {'1': 'energy_usage_total', '3': 4, '4': 1, '5': 3, '10': 'energyUsageTotal'},
    const {'1': 'net_usage', '3': 5, '4': 1, '5': 3, '10': 'netUsage'},
    const {'1': 'net_fee', '3': 6, '4': 1, '5': 3, '10': 'netFee'},
    const {'1': 'result', '3': 7, '4': 1, '5': 14, '6': '.protocol.Transaction.Result.contractResult', '10': 'result'},
  ],
};

const Transaction$json = const {
  '1': 'Transaction',
  '2': const [
    const {'1': 'raw_data', '3': 1, '4': 1, '5': 11, '6': '.protocol.Transaction.raw', '10': 'rawData'},
    const {'1': 'signature', '3': 2, '4': 3, '5': 12, '10': 'signature'},
    const {'1': 'ret', '3': 5, '4': 3, '5': 11, '6': '.protocol.Transaction.Result', '10': 'ret'},
  ],
  '3': const [Transaction_Contract$json, Transaction_Result$json, Transaction_raw$json],
};

const Transaction_Contract$json = const {
  '1': 'Contract',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.protocol.Transaction.Contract.ContractType', '10': 'type'},
    const {'1': 'parameter', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'parameter'},
    const {'1': 'provider', '3': 3, '4': 1, '5': 12, '10': 'provider'},
    const {'1': 'ContractName', '3': 4, '4': 1, '5': 12, '10': 'ContractName'},
    const {'1': 'Permission_id', '3': 5, '4': 1, '5': 5, '10': 'PermissionId'},
  ],
  '4': const [Transaction_Contract_ContractType$json],
};

const Transaction_Contract_ContractType$json = const {
  '1': 'ContractType',
  '2': const [
    const {'1': 'AccountCreateContract', '2': 0},
    const {'1': 'TransferContract', '2': 1},
    const {'1': 'TransferAssetContract', '2': 2},
    const {'1': 'VoteAssetContract', '2': 3},
    const {'1': 'VoteWitnessContract', '2': 4},
    const {'1': 'WitnessCreateContract', '2': 5},
    const {'1': 'AssetIssueContract', '2': 6},
    const {'1': 'WitnessUpdateContract', '2': 8},
    const {'1': 'ParticipateAssetIssueContract', '2': 9},
    const {'1': 'AccountUpdateContract', '2': 10},
    const {'1': 'FreezeBalanceContract', '2': 11},
    const {'1': 'UnfreezeBalanceContract', '2': 12},
    const {'1': 'WithdrawBalanceContract', '2': 13},
    const {'1': 'UnfreezeAssetContract', '2': 14},
    const {'1': 'UpdateAssetContract', '2': 15},
    const {'1': 'ProposalCreateContract', '2': 16},
    const {'1': 'ProposalApproveContract', '2': 17},
    const {'1': 'ProposalDeleteContract', '2': 18},
    const {'1': 'SetAccountIdContract', '2': 19},
    const {'1': 'CustomContract', '2': 20},
    const {'1': 'CreateSmartContract', '2': 30},
    const {'1': 'TriggerSmartContract', '2': 31},
    const {'1': 'GetContract', '2': 32},
    const {'1': 'UpdateSettingContract', '2': 33},
    const {'1': 'ExchangeCreateContract', '2': 41},
    const {'1': 'ExchangeInjectContract', '2': 42},
    const {'1': 'ExchangeWithdrawContract', '2': 43},
    const {'1': 'ExchangeTransactionContract', '2': 44},
    const {'1': 'UpdateEnergyLimitContract', '2': 45},
    const {'1': 'AccountPermissionUpdateContract', '2': 46},
    const {'1': 'ClearABIContract', '2': 48},
    const {'1': 'UpdateBrokerageContract', '2': 49},
  ],
};

const Transaction_Result$json = const {
  '1': 'Result',
  '2': const [
    const {'1': 'fee', '3': 1, '4': 1, '5': 3, '10': 'fee'},
    const {'1': 'ret', '3': 2, '4': 1, '5': 14, '6': '.protocol.Transaction.Result.code', '10': 'ret'},
    const {'1': 'contractRet', '3': 3, '4': 1, '5': 14, '6': '.protocol.Transaction.Result.contractResult', '10': 'contractRet'},
    const {'1': 'assetIssueID', '3': 14, '4': 1, '5': 9, '10': 'assetIssueID'},
    const {'1': 'withdraw_amount', '3': 15, '4': 1, '5': 3, '10': 'withdrawAmount'},
    const {'1': 'unfreeze_amount', '3': 16, '4': 1, '5': 3, '10': 'unfreezeAmount'},
    const {'1': 'exchange_received_amount', '3': 18, '4': 1, '5': 3, '10': 'exchangeReceivedAmount'},
    const {'1': 'exchange_inject_another_amount', '3': 19, '4': 1, '5': 3, '10': 'exchangeInjectAnotherAmount'},
    const {'1': 'exchange_withdraw_another_amount', '3': 20, '4': 1, '5': 3, '10': 'exchangeWithdrawAnotherAmount'},
    const {'1': 'exchange_id', '3': 21, '4': 1, '5': 3, '10': 'exchangeId'},
  ],
  '4': const [Transaction_Result_code$json, Transaction_Result_contractResult$json],
};

const Transaction_Result_code$json = const {
  '1': 'code',
  '2': const [
    const {'1': 'SUCESS', '2': 0},
    const {'1': 'FAILED', '2': 1},
  ],
};

const Transaction_Result_contractResult$json = const {
  '1': 'contractResult',
  '2': const [
    const {'1': 'DEFAULT', '2': 0},
    const {'1': 'SUCCESS', '2': 1},
    const {'1': 'REVERT', '2': 2},
    const {'1': 'BAD_JUMP_DESTINATION', '2': 3},
    const {'1': 'OUT_OF_MEMORY', '2': 4},
    const {'1': 'PRECOMPILED_CONTRACT', '2': 5},
    const {'1': 'STACK_TOO_SMALL', '2': 6},
    const {'1': 'STACK_TOO_LARGE', '2': 7},
    const {'1': 'ILLEGAL_OPERATION', '2': 8},
    const {'1': 'STACK_OVERFLOW', '2': 9},
    const {'1': 'OUT_OF_ENERGY', '2': 10},
    const {'1': 'OUT_OF_TIME', '2': 11},
    const {'1': 'JVM_STACK_OVER_FLOW', '2': 12},
    const {'1': 'UNKNOWN', '2': 13},
    const {'1': 'TRANSFER_FAILED', '2': 14},
  ],
};

const Transaction_raw$json = const {
  '1': 'raw',
  '2': const [
    const {'1': 'ref_block_bytes', '3': 1, '4': 1, '5': 12, '10': 'refBlockBytes'},
    const {'1': 'ref_block_num', '3': 3, '4': 1, '5': 3, '10': 'refBlockNum'},
    const {'1': 'ref_block_hash', '3': 4, '4': 1, '5': 12, '10': 'refBlockHash'},
    const {'1': 'expiration', '3': 8, '4': 1, '5': 3, '10': 'expiration'},
    const {'1': 'auths', '3': 9, '4': 3, '5': 11, '6': '.protocol.authority', '10': 'auths'},
    const {'1': 'data', '3': 10, '4': 1, '5': 12, '10': 'data'},
    const {'1': 'contract', '3': 11, '4': 3, '5': 11, '6': '.protocol.Transaction.Contract', '10': 'contract'},
    const {'1': 'scripts', '3': 12, '4': 1, '5': 12, '10': 'scripts'},
    const {'1': 'timestamp', '3': 14, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'fee_limit', '3': 18, '4': 1, '5': 3, '10': 'feeLimit'},
  ],
};

const TransactionInfo$json = const {
  '1': 'TransactionInfo',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    const {'1': 'fee', '3': 2, '4': 1, '5': 3, '10': 'fee'},
    const {'1': 'blockNumber', '3': 3, '4': 1, '5': 3, '10': 'blockNumber'},
    const {'1': 'blockTimeStamp', '3': 4, '4': 1, '5': 3, '10': 'blockTimeStamp'},
    const {'1': 'contractResult', '3': 5, '4': 3, '5': 12, '10': 'contractResult'},
    const {'1': 'contract_address', '3': 6, '4': 1, '5': 12, '10': 'contractAddress'},
    const {'1': 'receipt', '3': 7, '4': 1, '5': 11, '6': '.protocol.ResourceReceipt', '10': 'receipt'},
    const {'1': 'log', '3': 8, '4': 3, '5': 11, '6': '.protocol.TransactionInfo.Log', '10': 'log'},
    const {'1': 'result', '3': 9, '4': 1, '5': 14, '6': '.protocol.TransactionInfo.code', '10': 'result'},
    const {'1': 'resMessage', '3': 10, '4': 1, '5': 12, '10': 'resMessage'},
    const {'1': 'assetIssueID', '3': 14, '4': 1, '5': 9, '10': 'assetIssueID'},
    const {'1': 'withdraw_amount', '3': 15, '4': 1, '5': 3, '10': 'withdrawAmount'},
    const {'1': 'unfreeze_amount', '3': 16, '4': 1, '5': 3, '10': 'unfreezeAmount'},
    const {'1': 'internal_transactions', '3': 17, '4': 3, '5': 11, '6': '.protocol.InternalTransaction', '10': 'internalTransactions'},
    const {'1': 'exchange_received_amount', '3': 18, '4': 1, '5': 3, '10': 'exchangeReceivedAmount'},
    const {'1': 'exchange_inject_another_amount', '3': 19, '4': 1, '5': 3, '10': 'exchangeInjectAnotherAmount'},
    const {'1': 'exchange_withdraw_another_amount', '3': 20, '4': 1, '5': 3, '10': 'exchangeWithdrawAnotherAmount'},
    const {'1': 'exchange_id', '3': 21, '4': 1, '5': 3, '10': 'exchangeId'},
  ],
  '3': const [TransactionInfo_Log$json],
  '4': const [TransactionInfo_code$json],
};

const TransactionInfo_Log$json = const {
  '1': 'Log',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'topics', '3': 2, '4': 3, '5': 12, '10': 'topics'},
    const {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
  ],
};

const TransactionInfo_code$json = const {
  '1': 'code',
  '2': const [
    const {'1': 'SUCESS', '2': 0},
    const {'1': 'FAILED', '2': 1},
  ],
};

const Transactions$json = const {
  '1': 'Transactions',
  '2': const [
    const {'1': 'transactions', '3': 1, '4': 3, '5': 11, '6': '.protocol.Transaction', '10': 'transactions'},
  ],
};

const TransactionSign$json = const {
  '1': 'TransactionSign',
  '2': const [
    const {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.protocol.Transaction', '10': 'transaction'},
    const {'1': 'privateKey', '3': 2, '4': 1, '5': 12, '10': 'privateKey'},
  ],
};

const BlockHeader$json = const {
  '1': 'BlockHeader',
  '2': const [
    const {'1': 'raw_data', '3': 1, '4': 1, '5': 11, '6': '.protocol.BlockHeader.raw', '10': 'rawData'},
    const {'1': 'witness_signature', '3': 2, '4': 1, '5': 12, '10': 'witnessSignature'},
  ],
  '3': const [BlockHeader_raw$json],
};

const BlockHeader_raw$json = const {
  '1': 'raw',
  '2': const [
    const {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'txTrieRoot', '3': 2, '4': 1, '5': 12, '10': 'txTrieRoot'},
    const {'1': 'parentHash', '3': 3, '4': 1, '5': 12, '10': 'parentHash'},
    const {'1': 'number', '3': 7, '4': 1, '5': 3, '10': 'number'},
    const {'1': 'witness_id', '3': 8, '4': 1, '5': 3, '10': 'witnessId'},
    const {'1': 'witness_address', '3': 9, '4': 1, '5': 12, '10': 'witnessAddress'},
    const {'1': 'version', '3': 10, '4': 1, '5': 5, '10': 'version'},
    const {'1': 'accountStateRoot', '3': 11, '4': 1, '5': 12, '10': 'accountStateRoot'},
  ],
};

const Block$json = const {
  '1': 'Block',
  '2': const [
    const {'1': 'transactions', '3': 1, '4': 3, '5': 11, '6': '.protocol.Transaction', '10': 'transactions'},
    const {'1': 'block_header', '3': 2, '4': 1, '5': 11, '6': '.protocol.BlockHeader', '10': 'blockHeader'},
  ],
};

const ChainInventory$json = const {
  '1': 'ChainInventory',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 11, '6': '.protocol.ChainInventory.BlockId', '10': 'ids'},
    const {'1': 'remain_num', '3': 2, '4': 1, '5': 3, '10': 'remainNum'},
  ],
  '3': const [ChainInventory_BlockId$json],
};

const ChainInventory_BlockId$json = const {
  '1': 'BlockId',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    const {'1': 'number', '3': 2, '4': 1, '5': 3, '10': 'number'},
  ],
};

const BlockInventory$json = const {
  '1': 'BlockInventory',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 11, '6': '.protocol.BlockInventory.BlockId', '10': 'ids'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.protocol.BlockInventory.Type', '10': 'type'},
  ],
  '3': const [BlockInventory_BlockId$json],
  '4': const [BlockInventory_Type$json],
};

const BlockInventory_BlockId$json = const {
  '1': 'BlockId',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    const {'1': 'number', '3': 2, '4': 1, '5': 3, '10': 'number'},
  ],
};

const BlockInventory_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'SYNC', '2': 0},
    const {'1': 'ADVTISE', '2': 1},
    const {'1': 'FETCH', '2': 2},
  ],
};

const Inventory$json = const {
  '1': 'Inventory',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.protocol.Inventory.InventoryType', '10': 'type'},
    const {'1': 'ids', '3': 2, '4': 3, '5': 12, '10': 'ids'},
  ],
  '4': const [Inventory_InventoryType$json],
};

const Inventory_InventoryType$json = const {
  '1': 'InventoryType',
  '2': const [
    const {'1': 'TRX', '2': 0},
    const {'1': 'BLOCK', '2': 1},
  ],
};

const Items$json = const {
  '1': 'Items',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.protocol.Items.ItemType', '10': 'type'},
    const {'1': 'blocks', '3': 2, '4': 3, '5': 11, '6': '.protocol.Block', '10': 'blocks'},
    const {'1': 'block_headers', '3': 3, '4': 3, '5': 11, '6': '.protocol.BlockHeader', '10': 'blockHeaders'},
    const {'1': 'transactions', '3': 4, '4': 3, '5': 11, '6': '.protocol.Transaction', '10': 'transactions'},
  ],
  '4': const [Items_ItemType$json],
};

const Items_ItemType$json = const {
  '1': 'ItemType',
  '2': const [
    const {'1': 'ERR', '2': 0},
    const {'1': 'TRX', '2': 1},
    const {'1': 'BLOCK', '2': 2},
    const {'1': 'BLOCKHEADER', '2': 3},
  ],
};

const DynamicProperties$json = const {
  '1': 'DynamicProperties',
  '2': const [
    const {'1': 'last_solidity_block_num', '3': 1, '4': 1, '5': 3, '10': 'lastSolidityBlockNum'},
  ],
};

const DisconnectMessage$json = const {
  '1': 'DisconnectMessage',
  '2': const [
    const {'1': 'reason', '3': 1, '4': 1, '5': 14, '6': '.protocol.ReasonCode', '10': 'reason'},
  ],
};

const HelloMessage$json = const {
  '1': 'HelloMessage',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 11, '6': '.protocol.Endpoint', '10': 'from'},
    const {'1': 'version', '3': 2, '4': 1, '5': 5, '10': 'version'},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'genesisBlockId', '3': 4, '4': 1, '5': 11, '6': '.protocol.HelloMessage.BlockId', '10': 'genesisBlockId'},
    const {'1': 'solidBlockId', '3': 5, '4': 1, '5': 11, '6': '.protocol.HelloMessage.BlockId', '10': 'solidBlockId'},
    const {'1': 'headBlockId', '3': 6, '4': 1, '5': 11, '6': '.protocol.HelloMessage.BlockId', '10': 'headBlockId'},
  ],
  '3': const [HelloMessage_BlockId$json],
};

const HelloMessage_BlockId$json = const {
  '1': 'BlockId',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    const {'1': 'number', '3': 2, '4': 1, '5': 3, '10': 'number'},
  ],
};

const SmartContract$json = const {
  '1': 'SmartContract',
  '2': const [
    const {'1': 'origin_address', '3': 1, '4': 1, '5': 12, '10': 'originAddress'},
    const {'1': 'contract_address', '3': 2, '4': 1, '5': 12, '10': 'contractAddress'},
    const {'1': 'abi', '3': 3, '4': 1, '5': 11, '6': '.protocol.SmartContract.ABI', '10': 'abi'},
    const {'1': 'bytecode', '3': 4, '4': 1, '5': 12, '10': 'bytecode'},
    const {'1': 'call_value', '3': 5, '4': 1, '5': 3, '10': 'callValue'},
    const {'1': 'consume_user_resource_percent', '3': 6, '4': 1, '5': 3, '10': 'consumeUserResourcePercent'},
    const {'1': 'name', '3': 7, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'origin_energy_limit', '3': 8, '4': 1, '5': 3, '10': 'originEnergyLimit'},
    const {'1': 'code_hash', '3': 9, '4': 1, '5': 12, '10': 'codeHash'},
    const {'1': 'trx_hash', '3': 10, '4': 1, '5': 12, '10': 'trxHash'},
  ],
  '3': const [SmartContract_ABI$json],
};

const SmartContract_ABI$json = const {
  '1': 'ABI',
  '2': const [
    const {'1': 'entrys', '3': 1, '4': 3, '5': 11, '6': '.protocol.SmartContract.ABI.Entry', '10': 'entrys'},
  ],
  '3': const [SmartContract_ABI_Entry$json],
};

const SmartContract_ABI_Entry$json = const {
  '1': 'Entry',
  '2': const [
    const {'1': 'anonymous', '3': 1, '4': 1, '5': 8, '10': 'anonymous'},
    const {'1': 'constant', '3': 2, '4': 1, '5': 8, '10': 'constant'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'inputs', '3': 4, '4': 3, '5': 11, '6': '.protocol.SmartContract.ABI.Entry.Param', '10': 'inputs'},
    const {'1': 'outputs', '3': 5, '4': 3, '5': 11, '6': '.protocol.SmartContract.ABI.Entry.Param', '10': 'outputs'},
    const {'1': 'type', '3': 6, '4': 1, '5': 14, '6': '.protocol.SmartContract.ABI.Entry.EntryType', '10': 'type'},
    const {'1': 'payable', '3': 7, '4': 1, '5': 8, '10': 'payable'},
    const {'1': 'stateMutability', '3': 8, '4': 1, '5': 14, '6': '.protocol.SmartContract.ABI.Entry.StateMutabilityType', '10': 'stateMutability'},
  ],
  '3': const [SmartContract_ABI_Entry_Param$json],
  '4': const [SmartContract_ABI_Entry_EntryType$json, SmartContract_ABI_Entry_StateMutabilityType$json],
};

const SmartContract_ABI_Entry_Param$json = const {
  '1': 'Param',
  '2': const [
    const {'1': 'indexed', '3': 1, '4': 1, '5': 8, '10': 'indexed'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
  ],
};

const SmartContract_ABI_Entry_EntryType$json = const {
  '1': 'EntryType',
  '2': const [
    const {'1': 'UnknownEntryType', '2': 0},
    const {'1': 'Constructor', '2': 1},
    const {'1': 'Function', '2': 2},
    const {'1': 'Event', '2': 3},
    const {'1': 'Fallback', '2': 4},
  ],
};

const SmartContract_ABI_Entry_StateMutabilityType$json = const {
  '1': 'StateMutabilityType',
  '2': const [
    const {'1': 'UnknownMutabilityType', '2': 0},
    const {'1': 'Pure', '2': 1},
    const {'1': 'View', '2': 2},
    const {'1': 'Nonpayable', '2': 3},
    const {'1': 'Payable', '2': 4},
  ],
};

const InternalTransaction$json = const {
  '1': 'InternalTransaction',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    const {'1': 'caller_address', '3': 2, '4': 1, '5': 12, '10': 'callerAddress'},
    const {'1': 'transferTo_address', '3': 3, '4': 1, '5': 12, '10': 'transferToAddress'},
    const {'1': 'callValueInfo', '3': 4, '4': 3, '5': 11, '6': '.protocol.InternalTransaction.CallValueInfo', '10': 'callValueInfo'},
    const {'1': 'note', '3': 5, '4': 1, '5': 12, '10': 'note'},
    const {'1': 'rejected', '3': 6, '4': 1, '5': 8, '10': 'rejected'},
  ],
  '3': const [InternalTransaction_CallValueInfo$json],
};

const InternalTransaction_CallValueInfo$json = const {
  '1': 'CallValueInfo',
  '2': const [
    const {'1': 'callValue', '3': 1, '4': 1, '5': 3, '10': 'callValue'},
    const {'1': 'tokenId', '3': 2, '4': 1, '5': 9, '10': 'tokenId'},
  ],
};

const DelegatedResourceAccountIndex$json = const {
  '1': 'DelegatedResourceAccountIndex',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 12, '10': 'account'},
    const {'1': 'fromAccounts', '3': 2, '4': 3, '5': 12, '10': 'fromAccounts'},
    const {'1': 'toAccounts', '3': 3, '4': 3, '5': 12, '10': 'toAccounts'},
  ],
};

const NodeInfo$json = const {
  '1': 'NodeInfo',
  '2': const [
    const {'1': 'beginSyncNum', '3': 1, '4': 1, '5': 3, '10': 'beginSyncNum'},
    const {'1': 'block', '3': 2, '4': 1, '5': 9, '10': 'block'},
    const {'1': 'solidityBlock', '3': 3, '4': 1, '5': 9, '10': 'solidityBlock'},
    const {'1': 'currentConnectCount', '3': 4, '4': 1, '5': 5, '10': 'currentConnectCount'},
    const {'1': 'activeConnectCount', '3': 5, '4': 1, '5': 5, '10': 'activeConnectCount'},
    const {'1': 'passiveConnectCount', '3': 6, '4': 1, '5': 5, '10': 'passiveConnectCount'},
    const {'1': 'totalFlow', '3': 7, '4': 1, '5': 3, '10': 'totalFlow'},
    const {'1': 'peerInfoList', '3': 8, '4': 3, '5': 11, '6': '.protocol.NodeInfo.PeerInfo', '10': 'peerInfoList'},
    const {'1': 'configNodeInfo', '3': 9, '4': 1, '5': 11, '6': '.protocol.NodeInfo.ConfigNodeInfo', '10': 'configNodeInfo'},
    const {'1': 'machineInfo', '3': 10, '4': 1, '5': 11, '6': '.protocol.NodeInfo.MachineInfo', '10': 'machineInfo'},
    const {'1': 'cheatWitnessInfoMap', '3': 11, '4': 3, '5': 11, '6': '.protocol.NodeInfo.CheatWitnessInfoMapEntry', '10': 'cheatWitnessInfoMap'},
  ],
  '3': const [NodeInfo_CheatWitnessInfoMapEntry$json, NodeInfo_PeerInfo$json, NodeInfo_ConfigNodeInfo$json, NodeInfo_MachineInfo$json],
};

const NodeInfo_CheatWitnessInfoMapEntry$json = const {
  '1': 'CheatWitnessInfoMapEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

const NodeInfo_PeerInfo$json = const {
  '1': 'PeerInfo',
  '2': const [
    const {'1': 'lastSyncBlock', '3': 1, '4': 1, '5': 9, '10': 'lastSyncBlock'},
    const {'1': 'remainNum', '3': 2, '4': 1, '5': 3, '10': 'remainNum'},
    const {'1': 'lastBlockUpdateTime', '3': 3, '4': 1, '5': 3, '10': 'lastBlockUpdateTime'},
    const {'1': 'syncFlag', '3': 4, '4': 1, '5': 8, '10': 'syncFlag'},
    const {'1': 'headBlockTimeWeBothHave', '3': 5, '4': 1, '5': 3, '10': 'headBlockTimeWeBothHave'},
    const {'1': 'needSyncFromPeer', '3': 6, '4': 1, '5': 8, '10': 'needSyncFromPeer'},
    const {'1': 'needSyncFromUs', '3': 7, '4': 1, '5': 8, '10': 'needSyncFromUs'},
    const {'1': 'host', '3': 8, '4': 1, '5': 9, '10': 'host'},
    const {'1': 'port', '3': 9, '4': 1, '5': 5, '10': 'port'},
    const {'1': 'nodeId', '3': 10, '4': 1, '5': 9, '10': 'nodeId'},
    const {'1': 'connectTime', '3': 11, '4': 1, '5': 3, '10': 'connectTime'},
    const {'1': 'avgLatency', '3': 12, '4': 1, '5': 1, '10': 'avgLatency'},
    const {'1': 'syncToFetchSize', '3': 13, '4': 1, '5': 5, '10': 'syncToFetchSize'},
    const {'1': 'syncToFetchSizePeekNum', '3': 14, '4': 1, '5': 3, '10': 'syncToFetchSizePeekNum'},
    const {'1': 'syncBlockRequestedSize', '3': 15, '4': 1, '5': 5, '10': 'syncBlockRequestedSize'},
    const {'1': 'unFetchSynNum', '3': 16, '4': 1, '5': 3, '10': 'unFetchSynNum'},
    const {'1': 'blockInPorcSize', '3': 17, '4': 1, '5': 5, '10': 'blockInPorcSize'},
    const {'1': 'headBlockWeBothHave', '3': 18, '4': 1, '5': 9, '10': 'headBlockWeBothHave'},
    const {'1': 'isActive', '3': 19, '4': 1, '5': 8, '10': 'isActive'},
    const {'1': 'score', '3': 20, '4': 1, '5': 5, '10': 'score'},
    const {'1': 'nodeCount', '3': 21, '4': 1, '5': 5, '10': 'nodeCount'},
    const {'1': 'inFlow', '3': 22, '4': 1, '5': 3, '10': 'inFlow'},
    const {'1': 'disconnectTimes', '3': 23, '4': 1, '5': 5, '10': 'disconnectTimes'},
    const {'1': 'localDisconnectReason', '3': 24, '4': 1, '5': 9, '10': 'localDisconnectReason'},
    const {'1': 'remoteDisconnectReason', '3': 25, '4': 1, '5': 9, '10': 'remoteDisconnectReason'},
  ],
};

const NodeInfo_ConfigNodeInfo$json = const {
  '1': 'ConfigNodeInfo',
  '2': const [
    const {'1': 'codeVersion', '3': 1, '4': 1, '5': 9, '10': 'codeVersion'},
    const {'1': 'p2pVersion', '3': 2, '4': 1, '5': 9, '10': 'p2pVersion'},
    const {'1': 'listenPort', '3': 3, '4': 1, '5': 5, '10': 'listenPort'},
    const {'1': 'discoverEnable', '3': 4, '4': 1, '5': 8, '10': 'discoverEnable'},
    const {'1': 'activeNodeSize', '3': 5, '4': 1, '5': 5, '10': 'activeNodeSize'},
    const {'1': 'passiveNodeSize', '3': 6, '4': 1, '5': 5, '10': 'passiveNodeSize'},
    const {'1': 'sendNodeSize', '3': 7, '4': 1, '5': 5, '10': 'sendNodeSize'},
    const {'1': 'maxConnectCount', '3': 8, '4': 1, '5': 5, '10': 'maxConnectCount'},
    const {'1': 'sameIpMaxConnectCount', '3': 9, '4': 1, '5': 5, '10': 'sameIpMaxConnectCount'},
    const {'1': 'backupListenPort', '3': 10, '4': 1, '5': 5, '10': 'backupListenPort'},
    const {'1': 'backupMemberSize', '3': 11, '4': 1, '5': 5, '10': 'backupMemberSize'},
    const {'1': 'backupPriority', '3': 12, '4': 1, '5': 5, '10': 'backupPriority'},
    const {'1': 'dbVersion', '3': 13, '4': 1, '5': 5, '10': 'dbVersion'},
    const {'1': 'minParticipationRate', '3': 14, '4': 1, '5': 5, '10': 'minParticipationRate'},
    const {'1': 'supportConstant', '3': 15, '4': 1, '5': 8, '10': 'supportConstant'},
    const {'1': 'minTimeRatio', '3': 16, '4': 1, '5': 1, '10': 'minTimeRatio'},
    const {'1': 'maxTimeRatio', '3': 17, '4': 1, '5': 1, '10': 'maxTimeRatio'},
    const {'1': 'allowCreationOfContracts', '3': 18, '4': 1, '5': 3, '10': 'allowCreationOfContracts'},
    const {'1': 'allowAdaptiveEnergy', '3': 19, '4': 1, '5': 3, '10': 'allowAdaptiveEnergy'},
  ],
};

const NodeInfo_MachineInfo$json = const {
  '1': 'MachineInfo',
  '2': const [
    const {'1': 'threadCount', '3': 1, '4': 1, '5': 5, '10': 'threadCount'},
    const {'1': 'deadLockThreadCount', '3': 2, '4': 1, '5': 5, '10': 'deadLockThreadCount'},
    const {'1': 'cpuCount', '3': 3, '4': 1, '5': 5, '10': 'cpuCount'},
    const {'1': 'totalMemory', '3': 4, '4': 1, '5': 3, '10': 'totalMemory'},
    const {'1': 'freeMemory', '3': 5, '4': 1, '5': 3, '10': 'freeMemory'},
    const {'1': 'cpuRate', '3': 6, '4': 1, '5': 1, '10': 'cpuRate'},
    const {'1': 'javaVersion', '3': 7, '4': 1, '5': 9, '10': 'javaVersion'},
    const {'1': 'osName', '3': 8, '4': 1, '5': 9, '10': 'osName'},
    const {'1': 'jvmTotalMemoery', '3': 9, '4': 1, '5': 3, '10': 'jvmTotalMemoery'},
    const {'1': 'jvmFreeMemory', '3': 10, '4': 1, '5': 3, '10': 'jvmFreeMemory'},
    const {'1': 'processCpuRate', '3': 11, '4': 1, '5': 1, '10': 'processCpuRate'},
    const {'1': 'memoryDescInfoList', '3': 12, '4': 3, '5': 11, '6': '.protocol.NodeInfo.MachineInfo.MemoryDescInfo', '10': 'memoryDescInfoList'},
    const {'1': 'deadLockThreadInfoList', '3': 13, '4': 3, '5': 11, '6': '.protocol.NodeInfo.MachineInfo.DeadLockThreadInfo', '10': 'deadLockThreadInfoList'},
  ],
  '3': const [NodeInfo_MachineInfo_MemoryDescInfo$json, NodeInfo_MachineInfo_DeadLockThreadInfo$json],
};

const NodeInfo_MachineInfo_MemoryDescInfo$json = const {
  '1': 'MemoryDescInfo',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'initSize', '3': 2, '4': 1, '5': 3, '10': 'initSize'},
    const {'1': 'useSize', '3': 3, '4': 1, '5': 3, '10': 'useSize'},
    const {'1': 'maxSize', '3': 4, '4': 1, '5': 3, '10': 'maxSize'},
    const {'1': 'useRate', '3': 5, '4': 1, '5': 1, '10': 'useRate'},
  ],
};

const NodeInfo_MachineInfo_DeadLockThreadInfo$json = const {
  '1': 'DeadLockThreadInfo',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'lockName', '3': 2, '4': 1, '5': 9, '10': 'lockName'},
    const {'1': 'lockOwner', '3': 3, '4': 1, '5': 9, '10': 'lockOwner'},
    const {'1': 'state', '3': 4, '4': 1, '5': 9, '10': 'state'},
    const {'1': 'blockTime', '3': 5, '4': 1, '5': 3, '10': 'blockTime'},
    const {'1': 'waitTime', '3': 6, '4': 1, '5': 3, '10': 'waitTime'},
    const {'1': 'stackTrace', '3': 7, '4': 1, '5': 9, '10': 'stackTrace'},
  ],
};

