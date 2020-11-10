///
//  Generated code. Do not modify.
//  source: core/Contract.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ResourceCode$json = const {
  '1': 'ResourceCode',
  '2': const [
    const {'1': 'BANDWIDTH', '2': 0},
    const {'1': 'ENERGY', '2': 1},
  ],
};

const AccountCreateContract$json = const {
  '1': 'AccountCreateContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'account_address', '3': 2, '4': 1, '5': 12, '10': 'accountAddress'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.protocol.AccountType', '10': 'type'},
  ],
};

const AccountUpdateContract$json = const {
  '1': 'AccountUpdateContract',
  '2': const [
    const {'1': 'account_name', '3': 1, '4': 1, '5': 12, '10': 'accountName'},
    const {'1': 'owner_address', '3': 2, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

const SetAccountIdContract$json = const {
  '1': 'SetAccountIdContract',
  '2': const [
    const {'1': 'account_id', '3': 1, '4': 1, '5': 12, '10': 'accountId'},
    const {'1': 'owner_address', '3': 2, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

const TransferContract$json = const {
  '1': 'TransferContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'to_address', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
    const {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
  ],
};

const TransferAssetContract$json = const {
  '1': 'TransferAssetContract',
  '2': const [
    const {'1': 'asset_name', '3': 1, '4': 1, '5': 12, '10': 'assetName'},
    const {'1': 'owner_address', '3': 2, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'to_address', '3': 3, '4': 1, '5': 12, '10': 'toAddress'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
  ],
};

const VoteAssetContract$json = const {
  '1': 'VoteAssetContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'vote_address', '3': 2, '4': 3, '5': 12, '10': 'voteAddress'},
    const {'1': 'support', '3': 3, '4': 1, '5': 8, '10': 'support'},
    const {'1': 'count', '3': 5, '4': 1, '5': 5, '10': 'count'},
  ],
};

const VoteWitnessContract$json = const {
  '1': 'VoteWitnessContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'votes', '3': 2, '4': 3, '5': 11, '6': '.protocol.VoteWitnessContract.Vote', '10': 'votes'},
    const {'1': 'support', '3': 3, '4': 1, '5': 8, '10': 'support'},
  ],
  '3': const [VoteWitnessContract_Vote$json],
};

const VoteWitnessContract_Vote$json = const {
  '1': 'Vote',
  '2': const [
    const {'1': 'vote_address', '3': 1, '4': 1, '5': 12, '10': 'voteAddress'},
    const {'1': 'vote_count', '3': 2, '4': 1, '5': 3, '10': 'voteCount'},
  ],
};

const UpdateSettingContract$json = const {
  '1': 'UpdateSettingContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'contract_address', '3': 2, '4': 1, '5': 12, '10': 'contractAddress'},
    const {'1': 'consume_user_resource_percent', '3': 3, '4': 1, '5': 3, '10': 'consumeUserResourcePercent'},
  ],
};

const UpdateEnergyLimitContract$json = const {
  '1': 'UpdateEnergyLimitContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'contract_address', '3': 2, '4': 1, '5': 12, '10': 'contractAddress'},
    const {'1': 'origin_energy_limit', '3': 3, '4': 1, '5': 3, '10': 'originEnergyLimit'},
  ],
};

const ClearABIContract$json = const {
  '1': 'ClearABIContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'contract_address', '3': 2, '4': 1, '5': 12, '10': 'contractAddress'},
  ],
};

const WitnessCreateContract$json = const {
  '1': 'WitnessCreateContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'url', '3': 2, '4': 1, '5': 12, '10': 'url'},
  ],
};

const WitnessUpdateContract$json = const {
  '1': 'WitnessUpdateContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'update_url', '3': 12, '4': 1, '5': 12, '10': 'updateUrl'},
  ],
};

const AssetIssueContract$json = const {
  '1': 'AssetIssueContract',
  '2': const [
    const {'1': 'id', '3': 41, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'name', '3': 2, '4': 1, '5': 12, '10': 'name'},
    const {'1': 'abbr', '3': 3, '4': 1, '5': 12, '10': 'abbr'},
    const {'1': 'total_supply', '3': 4, '4': 1, '5': 3, '10': 'totalSupply'},
    const {'1': 'frozen_supply', '3': 5, '4': 3, '5': 11, '6': '.protocol.AssetIssueContract.FrozenSupply', '10': 'frozenSupply'},
    const {'1': 'trx_num', '3': 6, '4': 1, '5': 5, '10': 'trxNum'},
    const {'1': 'precision', '3': 7, '4': 1, '5': 5, '10': 'precision'},
    const {'1': 'num', '3': 8, '4': 1, '5': 5, '10': 'num'},
    const {'1': 'start_time', '3': 9, '4': 1, '5': 3, '10': 'startTime'},
    const {'1': 'end_time', '3': 10, '4': 1, '5': 3, '10': 'endTime'},
    const {'1': 'order', '3': 11, '4': 1, '5': 3, '10': 'order'},
    const {'1': 'vote_score', '3': 16, '4': 1, '5': 5, '10': 'voteScore'},
    const {'1': 'description', '3': 20, '4': 1, '5': 12, '10': 'description'},
    const {'1': 'url', '3': 21, '4': 1, '5': 12, '10': 'url'},
    const {'1': 'free_asset_net_limit', '3': 22, '4': 1, '5': 3, '10': 'freeAssetNetLimit'},
    const {'1': 'public_free_asset_net_limit', '3': 23, '4': 1, '5': 3, '10': 'publicFreeAssetNetLimit'},
    const {'1': 'public_free_asset_net_usage', '3': 24, '4': 1, '5': 3, '10': 'publicFreeAssetNetUsage'},
    const {'1': 'public_latest_free_net_time', '3': 25, '4': 1, '5': 3, '10': 'publicLatestFreeNetTime'},
  ],
  '3': const [AssetIssueContract_FrozenSupply$json],
};

const AssetIssueContract_FrozenSupply$json = const {
  '1': 'FrozenSupply',
  '2': const [
    const {'1': 'frozen_amount', '3': 1, '4': 1, '5': 3, '10': 'frozenAmount'},
    const {'1': 'frozen_days', '3': 2, '4': 1, '5': 3, '10': 'frozenDays'},
  ],
};

const ParticipateAssetIssueContract$json = const {
  '1': 'ParticipateAssetIssueContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'to_address', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
    const {'1': 'asset_name', '3': 3, '4': 1, '5': 12, '10': 'assetName'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
  ],
};

const FreezeBalanceContract$json = const {
  '1': 'FreezeBalanceContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'frozen_balance', '3': 2, '4': 1, '5': 3, '10': 'frozenBalance'},
    const {'1': 'frozen_duration', '3': 3, '4': 1, '5': 3, '10': 'frozenDuration'},
    const {'1': 'resource', '3': 10, '4': 1, '5': 14, '6': '.protocol.ResourceCode', '10': 'resource'},
    const {'1': 'receiver_address', '3': 15, '4': 1, '5': 12, '10': 'receiverAddress'},
  ],
};

const UnfreezeBalanceContract$json = const {
  '1': 'UnfreezeBalanceContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'resource', '3': 10, '4': 1, '5': 14, '6': '.protocol.ResourceCode', '10': 'resource'},
    const {'1': 'receiver_address', '3': 15, '4': 1, '5': 12, '10': 'receiverAddress'},
  ],
};

const UnfreezeAssetContract$json = const {
  '1': 'UnfreezeAssetContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

const WithdrawBalanceContract$json = const {
  '1': 'WithdrawBalanceContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
  ],
};

const UpdateAssetContract$json = const {
  '1': 'UpdateAssetContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'description', '3': 2, '4': 1, '5': 12, '10': 'description'},
    const {'1': 'url', '3': 3, '4': 1, '5': 12, '10': 'url'},
    const {'1': 'new_limit', '3': 4, '4': 1, '5': 3, '10': 'newLimit'},
    const {'1': 'new_public_limit', '3': 5, '4': 1, '5': 3, '10': 'newPublicLimit'},
  ],
};

const ProposalCreateContract$json = const {
  '1': 'ProposalCreateContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'parameters', '3': 2, '4': 3, '5': 11, '6': '.protocol.ProposalCreateContract.ParametersEntry', '10': 'parameters'},
  ],
  '3': const [ProposalCreateContract_ParametersEntry$json],
};

const ProposalCreateContract_ParametersEntry$json = const {
  '1': 'ParametersEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 3, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const ProposalApproveContract$json = const {
  '1': 'ProposalApproveContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'proposal_id', '3': 2, '4': 1, '5': 3, '10': 'proposalId'},
    const {'1': 'is_add_approval', '3': 3, '4': 1, '5': 8, '10': 'isAddApproval'},
  ],
};

const ProposalDeleteContract$json = const {
  '1': 'ProposalDeleteContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'proposal_id', '3': 2, '4': 1, '5': 3, '10': 'proposalId'},
  ],
};

const CreateSmartContract$json = const {
  '1': 'CreateSmartContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'new_contract', '3': 2, '4': 1, '5': 11, '6': '.protocol.SmartContract', '10': 'newContract'},
    const {'1': 'call_token_value', '3': 3, '4': 1, '5': 3, '10': 'callTokenValue'},
    const {'1': 'token_id', '3': 4, '4': 1, '5': 3, '10': 'tokenId'},
  ],
};

const TriggerSmartContract$json = const {
  '1': 'TriggerSmartContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'contract_address', '3': 2, '4': 1, '5': 12, '10': 'contractAddress'},
    const {'1': 'call_value', '3': 3, '4': 1, '5': 3, '10': 'callValue'},
    const {'1': 'data', '3': 4, '4': 1, '5': 12, '10': 'data'},
    const {'1': 'call_token_value', '3': 5, '4': 1, '5': 3, '10': 'callTokenValue'},
    const {'1': 'token_id', '3': 6, '4': 1, '5': 3, '10': 'tokenId'},
  ],
};

const BuyStorageContract$json = const {
  '1': 'BuyStorageContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'quant', '3': 2, '4': 1, '5': 3, '10': 'quant'},
  ],
};

const BuyStorageBytesContract$json = const {
  '1': 'BuyStorageBytesContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'bytes', '3': 2, '4': 1, '5': 3, '10': 'bytes'},
  ],
};

const SellStorageContract$json = const {
  '1': 'SellStorageContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'storage_bytes', '3': 2, '4': 1, '5': 3, '10': 'storageBytes'},
  ],
};

const ExchangeCreateContract$json = const {
  '1': 'ExchangeCreateContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'first_token_id', '3': 2, '4': 1, '5': 12, '10': 'firstTokenId'},
    const {'1': 'first_token_balance', '3': 3, '4': 1, '5': 3, '10': 'firstTokenBalance'},
    const {'1': 'second_token_id', '3': 4, '4': 1, '5': 12, '10': 'secondTokenId'},
    const {'1': 'second_token_balance', '3': 5, '4': 1, '5': 3, '10': 'secondTokenBalance'},
  ],
};

const ExchangeInjectContract$json = const {
  '1': 'ExchangeInjectContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'exchange_id', '3': 2, '4': 1, '5': 3, '10': 'exchangeId'},
    const {'1': 'token_id', '3': 3, '4': 1, '5': 12, '10': 'tokenId'},
    const {'1': 'quant', '3': 4, '4': 1, '5': 3, '10': 'quant'},
  ],
};

const ExchangeWithdrawContract$json = const {
  '1': 'ExchangeWithdrawContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'exchange_id', '3': 2, '4': 1, '5': 3, '10': 'exchangeId'},
    const {'1': 'token_id', '3': 3, '4': 1, '5': 12, '10': 'tokenId'},
    const {'1': 'quant', '3': 4, '4': 1, '5': 3, '10': 'quant'},
  ],
};

const ExchangeTransactionContract$json = const {
  '1': 'ExchangeTransactionContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'exchange_id', '3': 2, '4': 1, '5': 3, '10': 'exchangeId'},
    const {'1': 'token_id', '3': 3, '4': 1, '5': 12, '10': 'tokenId'},
    const {'1': 'quant', '3': 4, '4': 1, '5': 3, '10': 'quant'},
    const {'1': 'expected', '3': 5, '4': 1, '5': 3, '10': 'expected'},
  ],
};

const AccountPermissionUpdateContract$json = const {
  '1': 'AccountPermissionUpdateContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'owner', '3': 2, '4': 1, '5': 11, '6': '.protocol.Permission', '10': 'owner'},
    const {'1': 'witness', '3': 3, '4': 1, '5': 11, '6': '.protocol.Permission', '10': 'witness'},
    const {'1': 'actives', '3': 4, '4': 3, '5': 11, '6': '.protocol.Permission', '10': 'actives'},
  ],
};

const UpdateBrokerageContract$json = const {
  '1': 'UpdateBrokerageContract',
  '2': const [
    const {'1': 'owner_address', '3': 1, '4': 1, '5': 12, '10': 'ownerAddress'},
    const {'1': 'brokerage', '3': 2, '4': 1, '5': 5, '10': 'brokerage'},
  ],
};

