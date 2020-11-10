///
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Return$json = const {
  '1': 'Return',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 8, '10': 'result'},
    const {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.protocol.Return.response_code', '10': 'code'},
    const {'1': 'message', '3': 3, '4': 1, '5': 12, '10': 'message'},
  ],
  '4': const [Return_response_code$json],
};

const Return_response_code$json = const {
  '1': 'response_code',
  '2': const [
    const {'1': 'SUCCESS', '2': 0},
    const {'1': 'SIGERROR', '2': 1},
    const {'1': 'CONTRACT_VALIDATE_ERROR', '2': 2},
    const {'1': 'CONTRACT_EXE_ERROR', '2': 3},
    const {'1': 'BANDWITH_ERROR', '2': 4},
    const {'1': 'DUP_TRANSACTION_ERROR', '2': 5},
    const {'1': 'TAPOS_ERROR', '2': 6},
    const {'1': 'TOO_BIG_TRANSACTION_ERROR', '2': 7},
    const {'1': 'TRANSACTION_EXPIRATION_ERROR', '2': 8},
    const {'1': 'SERVER_BUSY', '2': 9},
    const {'1': 'NO_CONNECTION', '2': 10},
    const {'1': 'NOT_ENOUGH_EFFECTIVE_CONNECTION', '2': 11},
    const {'1': 'OTHER_ERROR', '2': 20},
  ],
};

const BlockReference$json = const {
  '1': 'BlockReference',
  '2': const [
    const {'1': 'block_num', '3': 1, '4': 1, '5': 3, '10': 'blockNum'},
    const {'1': 'block_hash', '3': 2, '4': 1, '5': 12, '10': 'blockHash'},
  ],
};

const WitnessList$json = const {
  '1': 'WitnessList',
  '2': const [
    const {'1': 'witnesses', '3': 1, '4': 3, '5': 11, '6': '.protocol.Witness', '10': 'witnesses'},
  ],
};

const ProposalList$json = const {
  '1': 'ProposalList',
  '2': const [
    const {'1': 'proposals', '3': 1, '4': 3, '5': 11, '6': '.protocol.Proposal', '10': 'proposals'},
  ],
};

const ExchangeList$json = const {
  '1': 'ExchangeList',
  '2': const [
    const {'1': 'exchanges', '3': 1, '4': 3, '5': 11, '6': '.protocol.Exchange', '10': 'exchanges'},
  ],
};

const AssetIssueList$json = const {
  '1': 'AssetIssueList',
  '2': const [
    const {'1': 'assetIssue', '3': 1, '4': 3, '5': 11, '6': '.protocol.AssetIssueContract', '10': 'assetIssue'},
  ],
};

const BlockList$json = const {
  '1': 'BlockList',
  '2': const [
    const {'1': 'block', '3': 1, '4': 3, '5': 11, '6': '.protocol.Block', '10': 'block'},
  ],
};

const TransactionList$json = const {
  '1': 'TransactionList',
  '2': const [
    const {'1': 'transaction', '3': 1, '4': 3, '5': 11, '6': '.protocol.Transaction', '10': 'transaction'},
  ],
};

const DelegatedResourceMessage$json = const {
  '1': 'DelegatedResourceMessage',
  '2': const [
    const {'1': 'fromAddress', '3': 1, '4': 1, '5': 12, '10': 'fromAddress'},
    const {'1': 'toAddress', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
  ],
};

const DelegatedResourceList$json = const {
  '1': 'DelegatedResourceList',
  '2': const [
    const {'1': 'delegatedResource', '3': 1, '4': 3, '5': 11, '6': '.protocol.DelegatedResource', '10': 'delegatedResource'},
  ],
};

const NodeList$json = const {
  '1': 'NodeList',
  '2': const [
    const {'1': 'nodes', '3': 1, '4': 3, '5': 11, '6': '.protocol.Node', '10': 'nodes'},
  ],
};

const Node$json = const {
  '1': 'Node',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 11, '6': '.protocol.Address', '10': 'address'},
  ],
};

const Address$json = const {
  '1': 'Address',
  '2': const [
    const {'1': 'host', '3': 1, '4': 1, '5': 12, '10': 'host'},
    const {'1': 'port', '3': 2, '4': 1, '5': 5, '10': 'port'},
  ],
};

const EmptyMessage$json = const {
  '1': 'EmptyMessage',
};

const NumberMessage$json = const {
  '1': 'NumberMessage',
  '2': const [
    const {'1': 'num', '3': 1, '4': 1, '5': 3, '10': 'num'},
  ],
};

const BytesMessage$json = const {
  '1': 'BytesMessage',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
  ],
};

const TimeMessage$json = const {
  '1': 'TimeMessage',
  '2': const [
    const {'1': 'beginInMilliseconds', '3': 1, '4': 1, '5': 3, '10': 'beginInMilliseconds'},
    const {'1': 'endInMilliseconds', '3': 2, '4': 1, '5': 3, '10': 'endInMilliseconds'},
  ],
};

const BlockLimit$json = const {
  '1': 'BlockLimit',
  '2': const [
    const {'1': 'startNum', '3': 1, '4': 1, '5': 3, '10': 'startNum'},
    const {'1': 'endNum', '3': 2, '4': 1, '5': 3, '10': 'endNum'},
  ],
};

const TransactionLimit$json = const {
  '1': 'TransactionLimit',
  '2': const [
    const {'1': 'transactionId', '3': 1, '4': 1, '5': 12, '10': 'transactionId'},
    const {'1': 'limitNum', '3': 2, '4': 1, '5': 3, '10': 'limitNum'},
  ],
};

const AccountPaginated$json = const {
  '1': 'AccountPaginated',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.protocol.Account', '10': 'account'},
    const {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
    const {'1': 'limit', '3': 3, '4': 1, '5': 3, '10': 'limit'},
  ],
};

const TimePaginatedMessage$json = const {
  '1': 'TimePaginatedMessage',
  '2': const [
    const {'1': 'timeMessage', '3': 1, '4': 1, '5': 11, '6': '.protocol.TimeMessage', '10': 'timeMessage'},
    const {'1': 'offset', '3': 2, '4': 1, '5': 3, '10': 'offset'},
    const {'1': 'limit', '3': 3, '4': 1, '5': 3, '10': 'limit'},
  ],
};

const AccountNetMessage$json = const {
  '1': 'AccountNetMessage',
  '2': const [
    const {'1': 'freeNetUsed', '3': 1, '4': 1, '5': 3, '10': 'freeNetUsed'},
    const {'1': 'freeNetLimit', '3': 2, '4': 1, '5': 3, '10': 'freeNetLimit'},
    const {'1': 'NetUsed', '3': 3, '4': 1, '5': 3, '10': 'NetUsed'},
    const {'1': 'NetLimit', '3': 4, '4': 1, '5': 3, '10': 'NetLimit'},
    const {'1': 'assetNetUsed', '3': 5, '4': 3, '5': 11, '6': '.protocol.AccountNetMessage.AssetNetUsedEntry', '10': 'assetNetUsed'},
    const {'1': 'assetNetLimit', '3': 6, '4': 3, '5': 11, '6': '.protocol.AccountNetMessage.AssetNetLimitEntry', '10': 'assetNetLimit'},
    const {'1': 'TotalNetLimit', '3': 7, '4': 1, '5': 3, '10': 'TotalNetLimit'},
    const {'1': 'TotalNetWeight', '3': 8, '4': 1, '5': 3, '10': 'TotalNetWeight'},
  ],
  '3': const [AccountNetMessage_AssetNetUsedEntry$json, AccountNetMessage_AssetNetLimitEntry$json],
};

const AccountNetMessage_AssetNetUsedEntry$json = const {
  '1': 'AssetNetUsedEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const AccountNetMessage_AssetNetLimitEntry$json = const {
  '1': 'AssetNetLimitEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const AccountResourceMessage$json = const {
  '1': 'AccountResourceMessage',
  '2': const [
    const {'1': 'freeNetUsed', '3': 1, '4': 1, '5': 3, '10': 'freeNetUsed'},
    const {'1': 'freeNetLimit', '3': 2, '4': 1, '5': 3, '10': 'freeNetLimit'},
    const {'1': 'NetUsed', '3': 3, '4': 1, '5': 3, '10': 'NetUsed'},
    const {'1': 'NetLimit', '3': 4, '4': 1, '5': 3, '10': 'NetLimit'},
    const {'1': 'assetNetUsed', '3': 5, '4': 3, '5': 11, '6': '.protocol.AccountResourceMessage.AssetNetUsedEntry', '10': 'assetNetUsed'},
    const {'1': 'assetNetLimit', '3': 6, '4': 3, '5': 11, '6': '.protocol.AccountResourceMessage.AssetNetLimitEntry', '10': 'assetNetLimit'},
    const {'1': 'TotalNetLimit', '3': 7, '4': 1, '5': 3, '10': 'TotalNetLimit'},
    const {'1': 'TotalNetWeight', '3': 8, '4': 1, '5': 3, '10': 'TotalNetWeight'},
    const {'1': 'EnergyUsed', '3': 13, '4': 1, '5': 3, '10': 'EnergyUsed'},
    const {'1': 'EnergyLimit', '3': 14, '4': 1, '5': 3, '10': 'EnergyLimit'},
    const {'1': 'TotalEnergyLimit', '3': 15, '4': 1, '5': 3, '10': 'TotalEnergyLimit'},
    const {'1': 'TotalEnergyWeight', '3': 16, '4': 1, '5': 3, '10': 'TotalEnergyWeight'},
    const {'1': 'storageUsed', '3': 21, '4': 1, '5': 3, '10': 'storageUsed'},
    const {'1': 'storageLimit', '3': 22, '4': 1, '5': 3, '10': 'storageLimit'},
  ],
  '3': const [AccountResourceMessage_AssetNetUsedEntry$json, AccountResourceMessage_AssetNetLimitEntry$json],
};

const AccountResourceMessage_AssetNetUsedEntry$json = const {
  '1': 'AssetNetUsedEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const AccountResourceMessage_AssetNetLimitEntry$json = const {
  '1': 'AssetNetLimitEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
  '7': const {'7': true},
};

const PaginatedMessage$json = const {
  '1': 'PaginatedMessage',
  '2': const [
    const {'1': 'offset', '3': 1, '4': 1, '5': 3, '10': 'offset'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 3, '10': 'limit'},
  ],
};

const EasyTransferMessage$json = const {
  '1': 'EasyTransferMessage',
  '2': const [
    const {'1': 'passPhrase', '3': 1, '4': 1, '5': 12, '10': 'passPhrase'},
    const {'1': 'toAddress', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
    const {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
  ],
};

const EasyTransferAssetMessage$json = const {
  '1': 'EasyTransferAssetMessage',
  '2': const [
    const {'1': 'passPhrase', '3': 1, '4': 1, '5': 12, '10': 'passPhrase'},
    const {'1': 'toAddress', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
    const {'1': 'assetId', '3': 3, '4': 1, '5': 9, '10': 'assetId'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
  ],
};

const EasyTransferByPrivateMessage$json = const {
  '1': 'EasyTransferByPrivateMessage',
  '2': const [
    const {'1': 'privateKey', '3': 1, '4': 1, '5': 12, '10': 'privateKey'},
    const {'1': 'toAddress', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
    const {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
  ],
};

const EasyTransferAssetByPrivateMessage$json = const {
  '1': 'EasyTransferAssetByPrivateMessage',
  '2': const [
    const {'1': 'privateKey', '3': 1, '4': 1, '5': 12, '10': 'privateKey'},
    const {'1': 'toAddress', '3': 2, '4': 1, '5': 12, '10': 'toAddress'},
    const {'1': 'assetId', '3': 3, '4': 1, '5': 9, '10': 'assetId'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 3, '10': 'amount'},
  ],
};

const EasyTransferResponse$json = const {
  '1': 'EasyTransferResponse',
  '2': const [
    const {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.protocol.Transaction', '10': 'transaction'},
    const {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.protocol.Return', '10': 'result'},
    const {'1': 'txid', '3': 3, '4': 1, '5': 12, '10': 'txid'},
  ],
};

const AddressPrKeyPairMessage$json = const {
  '1': 'AddressPrKeyPairMessage',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'privateKey', '3': 2, '4': 1, '5': 9, '10': 'privateKey'},
  ],
};

const TransactionExtention$json = const {
  '1': 'TransactionExtention',
  '2': const [
    const {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.protocol.Transaction', '10': 'transaction'},
    const {'1': 'txid', '3': 2, '4': 1, '5': 12, '10': 'txid'},
    const {'1': 'constant_result', '3': 3, '4': 3, '5': 12, '10': 'constantResult'},
    const {'1': 'result', '3': 4, '4': 1, '5': 11, '6': '.protocol.Return', '10': 'result'},
  ],
};

const BlockExtention$json = const {
  '1': 'BlockExtention',
  '2': const [
    const {'1': 'transactions', '3': 1, '4': 3, '5': 11, '6': '.protocol.TransactionExtention', '10': 'transactions'},
    const {'1': 'block_header', '3': 2, '4': 1, '5': 11, '6': '.protocol.BlockHeader', '10': 'blockHeader'},
    const {'1': 'blockid', '3': 3, '4': 1, '5': 12, '10': 'blockid'},
  ],
};

const BlockListExtention$json = const {
  '1': 'BlockListExtention',
  '2': const [
    const {'1': 'block', '3': 1, '4': 3, '5': 11, '6': '.protocol.BlockExtention', '10': 'block'},
  ],
};

const TransactionListExtention$json = const {
  '1': 'TransactionListExtention',
  '2': const [
    const {'1': 'transaction', '3': 1, '4': 3, '5': 11, '6': '.protocol.TransactionExtention', '10': 'transaction'},
  ],
};

const TransactionSignWeight$json = const {
  '1': 'TransactionSignWeight',
  '2': const [
    const {'1': 'permission', '3': 1, '4': 1, '5': 11, '6': '.protocol.Permission', '10': 'permission'},
    const {'1': 'approved_list', '3': 2, '4': 3, '5': 12, '10': 'approvedList'},
    const {'1': 'current_weight', '3': 3, '4': 1, '5': 3, '10': 'currentWeight'},
    const {'1': 'result', '3': 4, '4': 1, '5': 11, '6': '.protocol.TransactionSignWeight.Result', '10': 'result'},
    const {'1': 'transaction', '3': 5, '4': 1, '5': 11, '6': '.protocol.TransactionExtention', '10': 'transaction'},
  ],
  '3': const [TransactionSignWeight_Result$json],
};

const TransactionSignWeight_Result$json = const {
  '1': 'Result',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.protocol.TransactionSignWeight.Result.response_code', '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
  '4': const [TransactionSignWeight_Result_response_code$json],
};

const TransactionSignWeight_Result_response_code$json = const {
  '1': 'response_code',
  '2': const [
    const {'1': 'ENOUGH_PERMISSION', '2': 0},
    const {'1': 'NOT_ENOUGH_PERMISSION', '2': 1},
    const {'1': 'SIGNATURE_FORMAT_ERROR', '2': 2},
    const {'1': 'COMPUTE_ADDRESS_ERROR', '2': 3},
    const {'1': 'PERMISSION_ERROR', '2': 4},
    const {'1': 'OTHER_ERROR', '2': 20},
  ],
};

const TransactionApprovedList$json = const {
  '1': 'TransactionApprovedList',
  '2': const [
    const {'1': 'approved_list', '3': 2, '4': 3, '5': 12, '10': 'approvedList'},
    const {'1': 'result', '3': 4, '4': 1, '5': 11, '6': '.protocol.TransactionApprovedList.Result', '10': 'result'},
    const {'1': 'transaction', '3': 5, '4': 1, '5': 11, '6': '.protocol.TransactionExtention', '10': 'transaction'},
  ],
  '3': const [TransactionApprovedList_Result$json],
};

const TransactionApprovedList_Result$json = const {
  '1': 'Result',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.protocol.TransactionApprovedList.Result.response_code', '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
  '4': const [TransactionApprovedList_Result_response_code$json],
};

const TransactionApprovedList_Result_response_code$json = const {
  '1': 'response_code',
  '2': const [
    const {'1': 'SUCCESS', '2': 0},
    const {'1': 'SIGNATURE_FORMAT_ERROR', '2': 1},
    const {'1': 'COMPUTE_ADDRESS_ERROR', '2': 2},
    const {'1': 'OTHER_ERROR', '2': 20},
  ],
};

