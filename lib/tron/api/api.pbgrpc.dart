///
//  Generated code. Do not modify.
//  source: api/api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import '../core/Tron.pb.dart' as $0;
import '../core/Contract.pb.dart' as $1;
import 'api.pb.dart' as $2;
export 'api.pb.dart';

class WalletClient extends $grpc.Client {
  static final _$getAccount = $grpc.ClientMethod<$0.Account, $0.Account>(
      '/protocol.Wallet/GetAccount',
      ($0.Account value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$getAccountById = $grpc.ClientMethod<$0.Account, $0.Account>(
      '/protocol.Wallet/GetAccountById',
      ($0.Account value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$createTransaction =
      $grpc.ClientMethod<$1.TransferContract, $0.Transaction>(
          '/protocol.Wallet/CreateTransaction',
          ($1.TransferContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$createTransaction2 =
      $grpc.ClientMethod<$1.TransferContract, $2.TransactionExtention>(
          '/protocol.Wallet/CreateTransaction2',
          ($1.TransferContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$broadcastTransaction =
      $grpc.ClientMethod<$0.Transaction, $2.Return>(
          '/protocol.Wallet/BroadcastTransaction',
          ($0.Transaction value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Return.fromBuffer(value));
  static final _$updateAccount =
      $grpc.ClientMethod<$1.AccountUpdateContract, $0.Transaction>(
          '/protocol.Wallet/UpdateAccount',
          ($1.AccountUpdateContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$setAccountId =
      $grpc.ClientMethod<$1.SetAccountIdContract, $0.Transaction>(
          '/protocol.Wallet/SetAccountId',
          ($1.SetAccountIdContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$updateAccount2 =
      $grpc.ClientMethod<$1.AccountUpdateContract, $2.TransactionExtention>(
          '/protocol.Wallet/UpdateAccount2',
          ($1.AccountUpdateContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$voteWitnessAccount =
      $grpc.ClientMethod<$1.VoteWitnessContract, $0.Transaction>(
          '/protocol.Wallet/VoteWitnessAccount',
          ($1.VoteWitnessContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$updateSetting =
      $grpc.ClientMethod<$1.UpdateSettingContract, $2.TransactionExtention>(
          '/protocol.Wallet/UpdateSetting',
          ($1.UpdateSettingContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$updateEnergyLimit =
      $grpc.ClientMethod<$1.UpdateEnergyLimitContract, $2.TransactionExtention>(
          '/protocol.Wallet/UpdateEnergyLimit',
          ($1.UpdateEnergyLimitContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$voteWitnessAccount2 =
      $grpc.ClientMethod<$1.VoteWitnessContract, $2.TransactionExtention>(
          '/protocol.Wallet/VoteWitnessAccount2',
          ($1.VoteWitnessContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$createAssetIssue =
      $grpc.ClientMethod<$1.AssetIssueContract, $0.Transaction>(
          '/protocol.Wallet/CreateAssetIssue',
          ($1.AssetIssueContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$createAssetIssue2 =
      $grpc.ClientMethod<$1.AssetIssueContract, $2.TransactionExtention>(
          '/protocol.Wallet/CreateAssetIssue2',
          ($1.AssetIssueContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$updateWitness =
      $grpc.ClientMethod<$1.WitnessUpdateContract, $0.Transaction>(
          '/protocol.Wallet/UpdateWitness',
          ($1.WitnessUpdateContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$updateWitness2 =
      $grpc.ClientMethod<$1.WitnessUpdateContract, $2.TransactionExtention>(
          '/protocol.Wallet/UpdateWitness2',
          ($1.WitnessUpdateContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$createAccount =
      $grpc.ClientMethod<$1.AccountCreateContract, $0.Transaction>(
          '/protocol.Wallet/CreateAccount',
          ($1.AccountCreateContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$createAccount2 =
      $grpc.ClientMethod<$1.AccountCreateContract, $2.TransactionExtention>(
          '/protocol.Wallet/CreateAccount2',
          ($1.AccountCreateContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$createWitness =
      $grpc.ClientMethod<$1.WitnessCreateContract, $0.Transaction>(
          '/protocol.Wallet/CreateWitness',
          ($1.WitnessCreateContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$createWitness2 =
      $grpc.ClientMethod<$1.WitnessCreateContract, $2.TransactionExtention>(
          '/protocol.Wallet/CreateWitness2',
          ($1.WitnessCreateContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$transferAsset =
      $grpc.ClientMethod<$1.TransferAssetContract, $0.Transaction>(
          '/protocol.Wallet/TransferAsset',
          ($1.TransferAssetContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$transferAsset2 =
      $grpc.ClientMethod<$1.TransferAssetContract, $2.TransactionExtention>(
          '/protocol.Wallet/TransferAsset2',
          ($1.TransferAssetContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$participateAssetIssue =
      $grpc.ClientMethod<$1.ParticipateAssetIssueContract, $0.Transaction>(
          '/protocol.Wallet/ParticipateAssetIssue',
          ($1.ParticipateAssetIssueContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$participateAssetIssue2 = $grpc.ClientMethod<
          $1.ParticipateAssetIssueContract, $2.TransactionExtention>(
      '/protocol.Wallet/ParticipateAssetIssue2',
      ($1.ParticipateAssetIssueContract value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.TransactionExtention.fromBuffer(value));
  static final _$freezeBalance =
      $grpc.ClientMethod<$1.FreezeBalanceContract, $0.Transaction>(
          '/protocol.Wallet/FreezeBalance',
          ($1.FreezeBalanceContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$freezeBalance2 =
      $grpc.ClientMethod<$1.FreezeBalanceContract, $2.TransactionExtention>(
          '/protocol.Wallet/FreezeBalance2',
          ($1.FreezeBalanceContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$unfreezeBalance =
      $grpc.ClientMethod<$1.UnfreezeBalanceContract, $0.Transaction>(
          '/protocol.Wallet/UnfreezeBalance',
          ($1.UnfreezeBalanceContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$unfreezeBalance2 =
      $grpc.ClientMethod<$1.UnfreezeBalanceContract, $2.TransactionExtention>(
          '/protocol.Wallet/UnfreezeBalance2',
          ($1.UnfreezeBalanceContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$unfreezeAsset =
      $grpc.ClientMethod<$1.UnfreezeAssetContract, $0.Transaction>(
          '/protocol.Wallet/UnfreezeAsset',
          ($1.UnfreezeAssetContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$unfreezeAsset2 =
      $grpc.ClientMethod<$1.UnfreezeAssetContract, $2.TransactionExtention>(
          '/protocol.Wallet/UnfreezeAsset2',
          ($1.UnfreezeAssetContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$withdrawBalance =
      $grpc.ClientMethod<$1.WithdrawBalanceContract, $0.Transaction>(
          '/protocol.Wallet/WithdrawBalance',
          ($1.WithdrawBalanceContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$withdrawBalance2 =
      $grpc.ClientMethod<$1.WithdrawBalanceContract, $2.TransactionExtention>(
          '/protocol.Wallet/WithdrawBalance2',
          ($1.WithdrawBalanceContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$updateAsset =
      $grpc.ClientMethod<$1.UpdateAssetContract, $0.Transaction>(
          '/protocol.Wallet/UpdateAsset',
          ($1.UpdateAssetContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$updateAsset2 =
      $grpc.ClientMethod<$1.UpdateAssetContract, $2.TransactionExtention>(
          '/protocol.Wallet/UpdateAsset2',
          ($1.UpdateAssetContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$proposalCreate =
      $grpc.ClientMethod<$1.ProposalCreateContract, $2.TransactionExtention>(
          '/protocol.Wallet/ProposalCreate',
          ($1.ProposalCreateContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$proposalApprove =
      $grpc.ClientMethod<$1.ProposalApproveContract, $2.TransactionExtention>(
          '/protocol.Wallet/ProposalApprove',
          ($1.ProposalApproveContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$proposalDelete =
      $grpc.ClientMethod<$1.ProposalDeleteContract, $2.TransactionExtention>(
          '/protocol.Wallet/ProposalDelete',
          ($1.ProposalDeleteContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$buyStorage =
      $grpc.ClientMethod<$1.BuyStorageContract, $2.TransactionExtention>(
          '/protocol.Wallet/BuyStorage',
          ($1.BuyStorageContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$buyStorageBytes =
      $grpc.ClientMethod<$1.BuyStorageBytesContract, $2.TransactionExtention>(
          '/protocol.Wallet/BuyStorageBytes',
          ($1.BuyStorageBytesContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$sellStorage =
      $grpc.ClientMethod<$1.SellStorageContract, $2.TransactionExtention>(
          '/protocol.Wallet/SellStorage',
          ($1.SellStorageContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$exchangeCreate =
      $grpc.ClientMethod<$1.ExchangeCreateContract, $2.TransactionExtention>(
          '/protocol.Wallet/ExchangeCreate',
          ($1.ExchangeCreateContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$exchangeInject =
      $grpc.ClientMethod<$1.ExchangeInjectContract, $2.TransactionExtention>(
          '/protocol.Wallet/ExchangeInject',
          ($1.ExchangeInjectContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$exchangeWithdraw =
      $grpc.ClientMethod<$1.ExchangeWithdrawContract, $2.TransactionExtention>(
          '/protocol.Wallet/ExchangeWithdraw',
          ($1.ExchangeWithdrawContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$exchangeTransaction = $grpc.ClientMethod<
          $1.ExchangeTransactionContract, $2.TransactionExtention>(
      '/protocol.Wallet/ExchangeTransaction',
      ($1.ExchangeTransactionContract value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.TransactionExtention.fromBuffer(value));
  static final _$listNodes = $grpc.ClientMethod<$2.EmptyMessage, $2.NodeList>(
      '/protocol.Wallet/ListNodes',
      ($2.EmptyMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.NodeList.fromBuffer(value));
  static final _$getAssetIssueByAccount =
      $grpc.ClientMethod<$0.Account, $2.AssetIssueList>(
          '/protocol.Wallet/GetAssetIssueByAccount',
          ($0.Account value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.AssetIssueList.fromBuffer(value));
  static final _$getAccountNet =
      $grpc.ClientMethod<$0.Account, $2.AccountNetMessage>(
          '/protocol.Wallet/GetAccountNet',
          ($0.Account value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.AccountNetMessage.fromBuffer(value));
  static final _$getAccountResource =
      $grpc.ClientMethod<$0.Account, $2.AccountResourceMessage>(
          '/protocol.Wallet/GetAccountResource',
          ($0.Account value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.AccountResourceMessage.fromBuffer(value));
  static final _$getAssetIssueByName =
      $grpc.ClientMethod<$2.BytesMessage, $1.AssetIssueContract>(
          '/protocol.Wallet/GetAssetIssueByName',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.AssetIssueContract.fromBuffer(value));
  static final _$getAssetIssueListByName =
      $grpc.ClientMethod<$2.BytesMessage, $2.AssetIssueList>(
          '/protocol.Wallet/GetAssetIssueListByName',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.AssetIssueList.fromBuffer(value));
  static final _$getAssetIssueById =
      $grpc.ClientMethod<$2.BytesMessage, $1.AssetIssueContract>(
          '/protocol.Wallet/GetAssetIssueById',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.AssetIssueContract.fromBuffer(value));
  static final _$getNowBlock = $grpc.ClientMethod<$2.EmptyMessage, $0.Block>(
      '/protocol.Wallet/GetNowBlock',
      ($2.EmptyMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Block.fromBuffer(value));
  static final _$getNowBlock2 =
      $grpc.ClientMethod<$2.EmptyMessage, $2.BlockExtention>(
          '/protocol.Wallet/GetNowBlock2',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.BlockExtention.fromBuffer(value));
  static final _$getBlockByNum = $grpc.ClientMethod<$2.NumberMessage, $0.Block>(
      '/protocol.Wallet/GetBlockByNum',
      ($2.NumberMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Block.fromBuffer(value));
  static final _$getBlockByNum2 =
      $grpc.ClientMethod<$2.NumberMessage, $2.BlockExtention>(
          '/protocol.Wallet/GetBlockByNum2',
          ($2.NumberMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.BlockExtention.fromBuffer(value));
  static final _$getTransactionCountByBlockNum =
      $grpc.ClientMethod<$2.NumberMessage, $2.NumberMessage>(
          '/protocol.Wallet/GetTransactionCountByBlockNum',
          ($2.NumberMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value));
  static final _$getBlockById = $grpc.ClientMethod<$2.BytesMessage, $0.Block>(
      '/protocol.Wallet/GetBlockById',
      ($2.BytesMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Block.fromBuffer(value));
  static final _$getBlockByLimitNext =
      $grpc.ClientMethod<$2.BlockLimit, $2.BlockList>(
          '/protocol.Wallet/GetBlockByLimitNext',
          ($2.BlockLimit value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.BlockList.fromBuffer(value));
  static final _$getBlockByLimitNext2 =
      $grpc.ClientMethod<$2.BlockLimit, $2.BlockListExtention>(
          '/protocol.Wallet/GetBlockByLimitNext2',
          ($2.BlockLimit value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.BlockListExtention.fromBuffer(value));
  static final _$getBlockByLatestNum =
      $grpc.ClientMethod<$2.NumberMessage, $2.BlockList>(
          '/protocol.Wallet/GetBlockByLatestNum',
          ($2.NumberMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.BlockList.fromBuffer(value));
  static final _$getBlockByLatestNum2 =
      $grpc.ClientMethod<$2.NumberMessage, $2.BlockListExtention>(
          '/protocol.Wallet/GetBlockByLatestNum2',
          ($2.NumberMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.BlockListExtention.fromBuffer(value));
  static final _$getTransactionById =
      $grpc.ClientMethod<$2.BytesMessage, $0.Transaction>(
          '/protocol.Wallet/GetTransactionById',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$deployContract =
      $grpc.ClientMethod<$1.CreateSmartContract, $2.TransactionExtention>(
          '/protocol.Wallet/DeployContract',
          ($1.CreateSmartContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$getContract =
      $grpc.ClientMethod<$2.BytesMessage, $0.SmartContract>(
          '/protocol.Wallet/GetContract',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SmartContract.fromBuffer(value));
  static final _$triggerContract =
      $grpc.ClientMethod<$1.TriggerSmartContract, $2.TransactionExtention>(
          '/protocol.Wallet/TriggerContract',
          ($1.TriggerSmartContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$triggerConstantContract =
      $grpc.ClientMethod<$1.TriggerSmartContract, $2.TransactionExtention>(
          '/protocol.Wallet/TriggerConstantContract',
          ($1.TriggerSmartContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$clearContractABI =
      $grpc.ClientMethod<$1.ClearABIContract, $2.TransactionExtention>(
          '/protocol.Wallet/ClearContractABI',
          ($1.ClearABIContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$listWitnesses =
      $grpc.ClientMethod<$2.EmptyMessage, $2.WitnessList>(
          '/protocol.Wallet/ListWitnesses',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.WitnessList.fromBuffer(value));
  static final _$getDelegatedResource =
      $grpc.ClientMethod<$2.DelegatedResourceMessage, $2.DelegatedResourceList>(
          '/protocol.Wallet/GetDelegatedResource',
          ($2.DelegatedResourceMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.DelegatedResourceList.fromBuffer(value));
  static final _$getDelegatedResourceAccountIndex =
      $grpc.ClientMethod<$2.BytesMessage, $0.DelegatedResourceAccountIndex>(
          '/protocol.Wallet/GetDelegatedResourceAccountIndex',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DelegatedResourceAccountIndex.fromBuffer(value));
  static final _$listProposals =
      $grpc.ClientMethod<$2.EmptyMessage, $2.ProposalList>(
          '/protocol.Wallet/ListProposals',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.ProposalList.fromBuffer(value));
  static final _$getPaginatedProposalList =
      $grpc.ClientMethod<$2.PaginatedMessage, $2.ProposalList>(
          '/protocol.Wallet/GetPaginatedProposalList',
          ($2.PaginatedMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.ProposalList.fromBuffer(value));
  static final _$getProposalById =
      $grpc.ClientMethod<$2.BytesMessage, $0.Proposal>(
          '/protocol.Wallet/GetProposalById',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Proposal.fromBuffer(value));
  static final _$listExchanges =
      $grpc.ClientMethod<$2.EmptyMessage, $2.ExchangeList>(
          '/protocol.Wallet/ListExchanges',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.ExchangeList.fromBuffer(value));
  static final _$getPaginatedExchangeList =
      $grpc.ClientMethod<$2.PaginatedMessage, $2.ExchangeList>(
          '/protocol.Wallet/GetPaginatedExchangeList',
          ($2.PaginatedMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.ExchangeList.fromBuffer(value));
  static final _$getExchangeById =
      $grpc.ClientMethod<$2.BytesMessage, $0.Exchange>(
          '/protocol.Wallet/GetExchangeById',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Exchange.fromBuffer(value));
  static final _$getChainParameters =
      $grpc.ClientMethod<$2.EmptyMessage, $0.ChainParameters>(
          '/protocol.Wallet/GetChainParameters',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ChainParameters.fromBuffer(value));
  static final _$getAssetIssueList =
      $grpc.ClientMethod<$2.EmptyMessage, $2.AssetIssueList>(
          '/protocol.Wallet/GetAssetIssueList',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.AssetIssueList.fromBuffer(value));
  static final _$getPaginatedAssetIssueList =
      $grpc.ClientMethod<$2.PaginatedMessage, $2.AssetIssueList>(
          '/protocol.Wallet/GetPaginatedAssetIssueList',
          ($2.PaginatedMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.AssetIssueList.fromBuffer(value));
  static final _$totalTransaction =
      $grpc.ClientMethod<$2.EmptyMessage, $2.NumberMessage>(
          '/protocol.Wallet/TotalTransaction',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value));
  static final _$getNextMaintenanceTime =
      $grpc.ClientMethod<$2.EmptyMessage, $2.NumberMessage>(
          '/protocol.Wallet/GetNextMaintenanceTime',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value));
  static final _$getTransactionSign =
      $grpc.ClientMethod<$0.TransactionSign, $0.Transaction>(
          '/protocol.Wallet/GetTransactionSign',
          ($0.TransactionSign value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$getTransactionSign2 =
      $grpc.ClientMethod<$0.TransactionSign, $2.TransactionExtention>(
          '/protocol.Wallet/GetTransactionSign2',
          ($0.TransactionSign value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$createAddress =
      $grpc.ClientMethod<$2.BytesMessage, $2.BytesMessage>(
          '/protocol.Wallet/CreateAddress',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value));
  static final _$easyTransferAsset =
      $grpc.ClientMethod<$2.EasyTransferAssetMessage, $2.EasyTransferResponse>(
          '/protocol.Wallet/EasyTransferAsset',
          ($2.EasyTransferAssetMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.EasyTransferResponse.fromBuffer(value));
  static final _$easyTransferAssetByPrivate = $grpc.ClientMethod<
          $2.EasyTransferAssetByPrivateMessage, $2.EasyTransferResponse>(
      '/protocol.Wallet/EasyTransferAssetByPrivate',
      ($2.EasyTransferAssetByPrivateMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.EasyTransferResponse.fromBuffer(value));
  static final _$easyTransfer =
      $grpc.ClientMethod<$2.EasyTransferMessage, $2.EasyTransferResponse>(
          '/protocol.Wallet/EasyTransfer',
          ($2.EasyTransferMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.EasyTransferResponse.fromBuffer(value));
  static final _$easyTransferByPrivate = $grpc.ClientMethod<
          $2.EasyTransferByPrivateMessage, $2.EasyTransferResponse>(
      '/protocol.Wallet/EasyTransferByPrivate',
      ($2.EasyTransferByPrivateMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.EasyTransferResponse.fromBuffer(value));
  static final _$generateAddress =
      $grpc.ClientMethod<$2.EmptyMessage, $2.AddressPrKeyPairMessage>(
          '/protocol.Wallet/GenerateAddress',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.AddressPrKeyPairMessage.fromBuffer(value));
  static final _$getTransactionInfoById =
      $grpc.ClientMethod<$2.BytesMessage, $0.TransactionInfo>(
          '/protocol.Wallet/GetTransactionInfoById',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TransactionInfo.fromBuffer(value));
  static final _$accountPermissionUpdate = $grpc.ClientMethod<
          $1.AccountPermissionUpdateContract, $2.TransactionExtention>(
      '/protocol.Wallet/AccountPermissionUpdate',
      ($1.AccountPermissionUpdateContract value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.TransactionExtention.fromBuffer(value));
  static final _$addSign =
      $grpc.ClientMethod<$0.TransactionSign, $2.TransactionExtention>(
          '/protocol.Wallet/AddSign',
          ($0.TransactionSign value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$getTransactionSignWeight =
      $grpc.ClientMethod<$0.Transaction, $2.TransactionSignWeight>(
          '/protocol.Wallet/GetTransactionSignWeight',
          ($0.Transaction value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionSignWeight.fromBuffer(value));
  static final _$getTransactionApprovedList =
      $grpc.ClientMethod<$0.Transaction, $2.TransactionApprovedList>(
          '/protocol.Wallet/GetTransactionApprovedList',
          ($0.Transaction value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionApprovedList.fromBuffer(value));
  static final _$getNodeInfo = $grpc.ClientMethod<$2.EmptyMessage, $0.NodeInfo>(
      '/protocol.Wallet/GetNodeInfo',
      ($2.EmptyMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.NodeInfo.fromBuffer(value));
  static final _$getRewardInfo =
      $grpc.ClientMethod<$2.BytesMessage, $2.NumberMessage>(
          '/protocol.Wallet/GetRewardInfo',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value));
  static final _$getBrokerageInfo =
      $grpc.ClientMethod<$2.BytesMessage, $2.NumberMessage>(
          '/protocol.Wallet/GetBrokerageInfo',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value));
  static final _$updateBrokerage =
      $grpc.ClientMethod<$1.UpdateBrokerageContract, $2.TransactionExtention>(
          '/protocol.Wallet/UpdateBrokerage',
          ($1.UpdateBrokerageContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));

  WalletClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Account> getAccount($0.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Account> getAccountById($0.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAccountById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> createTransaction(
      $1.TransferContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createTransaction, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> createTransaction2(
      $1.TransferContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createTransaction2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.Return> broadcastTransaction($0.Transaction request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$broadcastTransaction, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> updateAccount(
      $1.AccountUpdateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> setAccountId(
      $1.SetAccountIdContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$setAccountId, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> updateAccount2(
      $1.AccountUpdateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateAccount2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> voteWitnessAccount(
      $1.VoteWitnessContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$voteWitnessAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> updateSetting(
      $1.UpdateSettingContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateSetting, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> updateEnergyLimit(
      $1.UpdateEnergyLimitContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateEnergyLimit, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> voteWitnessAccount2(
      $1.VoteWitnessContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$voteWitnessAccount2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> createAssetIssue(
      $1.AssetIssueContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createAssetIssue, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> createAssetIssue2(
      $1.AssetIssueContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createAssetIssue2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> updateWitness(
      $1.WitnessUpdateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateWitness, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> updateWitness2(
      $1.WitnessUpdateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateWitness2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> createAccount(
      $1.AccountCreateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> createAccount2(
      $1.AccountCreateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createAccount2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> createWitness(
      $1.WitnessCreateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createWitness, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> createWitness2(
      $1.WitnessCreateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createWitness2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> transferAsset(
      $1.TransferAssetContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$transferAsset, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> transferAsset2(
      $1.TransferAssetContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$transferAsset2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> participateAssetIssue(
      $1.ParticipateAssetIssueContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$participateAssetIssue, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> participateAssetIssue2(
      $1.ParticipateAssetIssueContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$participateAssetIssue2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> freezeBalance(
      $1.FreezeBalanceContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$freezeBalance, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> freezeBalance2(
      $1.FreezeBalanceContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$freezeBalance2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> unfreezeBalance(
      $1.UnfreezeBalanceContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$unfreezeBalance, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> unfreezeBalance2(
      $1.UnfreezeBalanceContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$unfreezeBalance2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> unfreezeAsset(
      $1.UnfreezeAssetContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$unfreezeAsset, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> unfreezeAsset2(
      $1.UnfreezeAssetContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$unfreezeAsset2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> withdrawBalance(
      $1.WithdrawBalanceContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$withdrawBalance, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> withdrawBalance2(
      $1.WithdrawBalanceContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$withdrawBalance2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> updateAsset(
      $1.UpdateAssetContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateAsset, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> updateAsset2(
      $1.UpdateAssetContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateAsset2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> proposalCreate(
      $1.ProposalCreateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$proposalCreate, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> proposalApprove(
      $1.ProposalApproveContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$proposalApprove, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> proposalDelete(
      $1.ProposalDeleteContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$proposalDelete, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> buyStorage(
      $1.BuyStorageContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$buyStorage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> buyStorageBytes(
      $1.BuyStorageBytesContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$buyStorageBytes, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> sellStorage(
      $1.SellStorageContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$sellStorage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> exchangeCreate(
      $1.ExchangeCreateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$exchangeCreate, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> exchangeInject(
      $1.ExchangeInjectContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$exchangeInject, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> exchangeWithdraw(
      $1.ExchangeWithdrawContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$exchangeWithdraw, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> exchangeTransaction(
      $1.ExchangeTransactionContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$exchangeTransaction, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.NodeList> listNodes($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$listNodes, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AssetIssueList> getAssetIssueByAccount(
      $0.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAssetIssueByAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AccountNetMessage> getAccountNet($0.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAccountNet, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AccountResourceMessage> getAccountResource(
      $0.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAccountResource, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.AssetIssueContract> getAssetIssueByName(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAssetIssueByName, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AssetIssueList> getAssetIssueListByName(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAssetIssueListByName, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.AssetIssueContract> getAssetIssueById(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAssetIssueById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Block> getNowBlock($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getNowBlock, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.BlockExtention> getNowBlock2($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getNowBlock2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Block> getBlockByNum($2.NumberMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockByNum, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.BlockExtention> getBlockByNum2(
      $2.NumberMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockByNum2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.NumberMessage> getTransactionCountByBlockNum(
      $2.NumberMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionCountByBlockNum, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Block> getBlockById($2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.BlockList> getBlockByLimitNext($2.BlockLimit request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockByLimitNext, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.BlockListExtention> getBlockByLimitNext2(
      $2.BlockLimit request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockByLimitNext2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.BlockList> getBlockByLatestNum(
      $2.NumberMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockByLatestNum, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.BlockListExtention> getBlockByLatestNum2(
      $2.NumberMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockByLatestNum2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> getTransactionById(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> deployContract(
      $1.CreateSmartContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deployContract, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.SmartContract> getContract($2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getContract, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> triggerContract(
      $1.TriggerSmartContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$triggerContract, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> triggerConstantContract(
      $1.TriggerSmartContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$triggerConstantContract, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> clearContractABI(
      $1.ClearABIContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$clearContractABI, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.WitnessList> listWitnesses($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listWitnesses, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.DelegatedResourceList> getDelegatedResource(
      $2.DelegatedResourceMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getDelegatedResource, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.DelegatedResourceAccountIndex>
      getDelegatedResourceAccountIndex($2.BytesMessage request,
          {$grpc.CallOptions options}) {
    final call = $createCall(_$getDelegatedResourceAccountIndex,
        $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.ProposalList> listProposals($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listProposals, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.ProposalList> getPaginatedProposalList(
      $2.PaginatedMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getPaginatedProposalList, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Proposal> getProposalById($2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getProposalById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.ExchangeList> listExchanges($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listExchanges, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.ExchangeList> getPaginatedExchangeList(
      $2.PaginatedMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getPaginatedExchangeList, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Exchange> getExchangeById($2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getExchangeById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ChainParameters> getChainParameters(
      $2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getChainParameters, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AssetIssueList> getAssetIssueList(
      $2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAssetIssueList, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AssetIssueList> getPaginatedAssetIssueList(
      $2.PaginatedMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getPaginatedAssetIssueList, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.NumberMessage> totalTransaction(
      $2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$totalTransaction, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.NumberMessage> getNextMaintenanceTime(
      $2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getNextMaintenanceTime, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> getTransactionSign(
      $0.TransactionSign request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionSign, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> getTransactionSign2(
      $0.TransactionSign request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionSign2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.BytesMessage> createAddress($2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createAddress, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.EasyTransferResponse> easyTransferAsset(
      $2.EasyTransferAssetMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$easyTransferAsset, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.EasyTransferResponse> easyTransferAssetByPrivate(
      $2.EasyTransferAssetByPrivateMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$easyTransferAssetByPrivate, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.EasyTransferResponse> easyTransfer(
      $2.EasyTransferMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$easyTransfer, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.EasyTransferResponse> easyTransferByPrivate(
      $2.EasyTransferByPrivateMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$easyTransferByPrivate, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AddressPrKeyPairMessage> generateAddress(
      $2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$generateAddress, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.TransactionInfo> getTransactionInfoById(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionInfoById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> accountPermissionUpdate(
      $1.AccountPermissionUpdateContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$accountPermissionUpdate, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> addSign(
      $0.TransactionSign request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$addSign, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionSignWeight> getTransactionSignWeight(
      $0.Transaction request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionSignWeight, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionApprovedList> getTransactionApprovedList(
      $0.Transaction request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionApprovedList, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.NodeInfo> getNodeInfo($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getNodeInfo, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.NumberMessage> getRewardInfo($2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getRewardInfo, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.NumberMessage> getBrokerageInfo(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBrokerageInfo, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> updateBrokerage(
      $1.UpdateBrokerageContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$updateBrokerage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class WalletServiceBase extends $grpc.Service {
  $core.String get $name => 'protocol.Wallet';

  WalletServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Account, $0.Account>(
        'GetAccount',
        getAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Account.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Account, $0.Account>(
        'GetAccountById',
        getAccountById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Account.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.TransferContract, $0.Transaction>(
        'CreateTransaction',
        createTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TransferContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.TransferContract, $2.TransactionExtention>(
            'CreateTransaction2',
            createTransaction2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.TransferContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Transaction, $2.Return>(
        'BroadcastTransaction',
        broadcastTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value),
        ($2.Return value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AccountUpdateContract, $0.Transaction>(
        'UpdateAccount',
        updateAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.AccountUpdateContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SetAccountIdContract, $0.Transaction>(
        'SetAccountId',
        setAccountId_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.SetAccountIdContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.AccountUpdateContract, $2.TransactionExtention>(
            'UpdateAccount2',
            updateAccount2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.AccountUpdateContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.VoteWitnessContract, $0.Transaction>(
        'VoteWitnessAccount',
        voteWitnessAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.VoteWitnessContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.UpdateSettingContract, $2.TransactionExtention>(
            'UpdateSetting',
            updateSetting_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.UpdateSettingContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateEnergyLimitContract,
            $2.TransactionExtention>(
        'UpdateEnergyLimit',
        updateEnergyLimit_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UpdateEnergyLimitContract.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.VoteWitnessContract, $2.TransactionExtention>(
            'VoteWitnessAccount2',
            voteWitnessAccount2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.VoteWitnessContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AssetIssueContract, $0.Transaction>(
        'CreateAssetIssue',
        createAssetIssue_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.AssetIssueContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.AssetIssueContract, $2.TransactionExtention>(
            'CreateAssetIssue2',
            createAssetIssue2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.AssetIssueContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.WitnessUpdateContract, $0.Transaction>(
        'UpdateWitness',
        updateWitness_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.WitnessUpdateContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.WitnessUpdateContract, $2.TransactionExtention>(
            'UpdateWitness2',
            updateWitness2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.WitnessUpdateContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AccountCreateContract, $0.Transaction>(
        'CreateAccount',
        createAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.AccountCreateContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.AccountCreateContract, $2.TransactionExtention>(
            'CreateAccount2',
            createAccount2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.AccountCreateContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.WitnessCreateContract, $0.Transaction>(
        'CreateWitness',
        createWitness_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.WitnessCreateContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.WitnessCreateContract, $2.TransactionExtention>(
            'CreateWitness2',
            createWitness2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.WitnessCreateContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.TransferAssetContract, $0.Transaction>(
        'TransferAsset',
        transferAsset_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.TransferAssetContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.TransferAssetContract, $2.TransactionExtention>(
            'TransferAsset2',
            transferAsset2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.TransferAssetContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.ParticipateAssetIssueContract, $0.Transaction>(
            'ParticipateAssetIssue',
            participateAssetIssue_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.ParticipateAssetIssueContract.fromBuffer(value),
            ($0.Transaction value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ParticipateAssetIssueContract,
            $2.TransactionExtention>(
        'ParticipateAssetIssue2',
        participateAssetIssue2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ParticipateAssetIssueContract.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FreezeBalanceContract, $0.Transaction>(
        'FreezeBalance',
        freezeBalance_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.FreezeBalanceContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.FreezeBalanceContract, $2.TransactionExtention>(
            'FreezeBalance2',
            freezeBalance2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.FreezeBalanceContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UnfreezeBalanceContract, $0.Transaction>(
        'UnfreezeBalance',
        unfreezeBalance_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UnfreezeBalanceContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UnfreezeBalanceContract,
            $2.TransactionExtention>(
        'UnfreezeBalance2',
        unfreezeBalance2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UnfreezeBalanceContract.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UnfreezeAssetContract, $0.Transaction>(
        'UnfreezeAsset',
        unfreezeAsset_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UnfreezeAssetContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.UnfreezeAssetContract, $2.TransactionExtention>(
            'UnfreezeAsset2',
            unfreezeAsset2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.UnfreezeAssetContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.WithdrawBalanceContract, $0.Transaction>(
        'WithdrawBalance',
        withdrawBalance_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.WithdrawBalanceContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.WithdrawBalanceContract,
            $2.TransactionExtention>(
        'WithdrawBalance2',
        withdrawBalance2_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.WithdrawBalanceContract.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateAssetContract, $0.Transaction>(
        'UpdateAsset',
        updateAsset_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UpdateAssetContract.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.UpdateAssetContract, $2.TransactionExtention>(
            'UpdateAsset2',
            updateAsset2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.UpdateAssetContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.ProposalCreateContract, $2.TransactionExtention>(
            'ProposalCreate',
            proposalCreate_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.ProposalCreateContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ProposalApproveContract,
            $2.TransactionExtention>(
        'ProposalApprove',
        proposalApprove_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ProposalApproveContract.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.ProposalDeleteContract, $2.TransactionExtention>(
            'ProposalDelete',
            proposalDelete_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.ProposalDeleteContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.BuyStorageContract, $2.TransactionExtention>(
            'BuyStorage',
            buyStorage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.BuyStorageContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.BuyStorageBytesContract,
            $2.TransactionExtention>(
        'BuyStorageBytes',
        buyStorageBytes_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.BuyStorageBytesContract.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.SellStorageContract, $2.TransactionExtention>(
            'SellStorage',
            sellStorage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.SellStorageContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.ExchangeCreateContract, $2.TransactionExtention>(
            'ExchangeCreate',
            exchangeCreate_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.ExchangeCreateContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.ExchangeInjectContract, $2.TransactionExtention>(
            'ExchangeInject',
            exchangeInject_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.ExchangeInjectContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ExchangeWithdrawContract,
            $2.TransactionExtention>(
        'ExchangeWithdraw',
        exchangeWithdraw_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ExchangeWithdrawContract.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ExchangeTransactionContract,
            $2.TransactionExtention>(
        'ExchangeTransaction',
        exchangeTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.ExchangeTransactionContract.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.NodeList>(
        'ListNodes',
        listNodes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.NodeList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Account, $2.AssetIssueList>(
        'GetAssetIssueByAccount',
        getAssetIssueByAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Account.fromBuffer(value),
        ($2.AssetIssueList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Account, $2.AccountNetMessage>(
        'GetAccountNet',
        getAccountNet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Account.fromBuffer(value),
        ($2.AccountNetMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Account, $2.AccountResourceMessage>(
        'GetAccountResource',
        getAccountResource_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Account.fromBuffer(value),
        ($2.AccountResourceMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $1.AssetIssueContract>(
        'GetAssetIssueByName',
        getAssetIssueByName_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($1.AssetIssueContract value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $2.AssetIssueList>(
        'GetAssetIssueListByName',
        getAssetIssueListByName_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($2.AssetIssueList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $1.AssetIssueContract>(
        'GetAssetIssueById',
        getAssetIssueById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($1.AssetIssueContract value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $0.Block>(
        'GetNowBlock',
        getNowBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($0.Block value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.BlockExtention>(
        'GetNowBlock2',
        getNowBlock2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.BlockExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.NumberMessage, $0.Block>(
        'GetBlockByNum',
        getBlockByNum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value),
        ($0.Block value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.NumberMessage, $2.BlockExtention>(
        'GetBlockByNum2',
        getBlockByNum2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value),
        ($2.BlockExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.NumberMessage, $2.NumberMessage>(
        'GetTransactionCountByBlockNum',
        getTransactionCountByBlockNum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value),
        ($2.NumberMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $0.Block>(
        'GetBlockById',
        getBlockById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($0.Block value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BlockLimit, $2.BlockList>(
        'GetBlockByLimitNext',
        getBlockByLimitNext_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BlockLimit.fromBuffer(value),
        ($2.BlockList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BlockLimit, $2.BlockListExtention>(
        'GetBlockByLimitNext2',
        getBlockByLimitNext2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BlockLimit.fromBuffer(value),
        ($2.BlockListExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.NumberMessage, $2.BlockList>(
        'GetBlockByLatestNum',
        getBlockByLatestNum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value),
        ($2.BlockList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.NumberMessage, $2.BlockListExtention>(
        'GetBlockByLatestNum2',
        getBlockByLatestNum2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value),
        ($2.BlockListExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $0.Transaction>(
        'GetTransactionById',
        getTransactionById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.CreateSmartContract, $2.TransactionExtention>(
            'DeployContract',
            deployContract_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.CreateSmartContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $0.SmartContract>(
        'GetContract',
        getContract_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($0.SmartContract value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.TriggerSmartContract, $2.TransactionExtention>(
            'TriggerContract',
            triggerContract_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.TriggerSmartContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.TriggerSmartContract, $2.TransactionExtention>(
            'TriggerConstantContract',
            triggerConstantContract_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.TriggerSmartContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.ClearABIContract, $2.TransactionExtention>(
            'ClearContractABI',
            clearContractABI_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.ClearABIContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.WitnessList>(
        'ListWitnesses',
        listWitnesses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.WitnessList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DelegatedResourceMessage,
            $2.DelegatedResourceList>(
        'GetDelegatedResource',
        getDelegatedResource_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.DelegatedResourceMessage.fromBuffer(value),
        ($2.DelegatedResourceList value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.BytesMessage, $0.DelegatedResourceAccountIndex>(
            'GetDelegatedResourceAccountIndex',
            getDelegatedResourceAccountIndex_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
            ($0.DelegatedResourceAccountIndex value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.ProposalList>(
        'ListProposals',
        listProposals_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.ProposalList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.PaginatedMessage, $2.ProposalList>(
        'GetPaginatedProposalList',
        getPaginatedProposalList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.PaginatedMessage.fromBuffer(value),
        ($2.ProposalList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $0.Proposal>(
        'GetProposalById',
        getProposalById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($0.Proposal value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.ExchangeList>(
        'ListExchanges',
        listExchanges_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.ExchangeList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.PaginatedMessage, $2.ExchangeList>(
        'GetPaginatedExchangeList',
        getPaginatedExchangeList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.PaginatedMessage.fromBuffer(value),
        ($2.ExchangeList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $0.Exchange>(
        'GetExchangeById',
        getExchangeById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($0.Exchange value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $0.ChainParameters>(
        'GetChainParameters',
        getChainParameters_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($0.ChainParameters value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.AssetIssueList>(
        'GetAssetIssueList',
        getAssetIssueList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.AssetIssueList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.PaginatedMessage, $2.AssetIssueList>(
        'GetPaginatedAssetIssueList',
        getPaginatedAssetIssueList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.PaginatedMessage.fromBuffer(value),
        ($2.AssetIssueList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.NumberMessage>(
        'TotalTransaction',
        totalTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.NumberMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.NumberMessage>(
        'GetNextMaintenanceTime',
        getNextMaintenanceTime_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.NumberMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TransactionSign, $0.Transaction>(
        'GetTransactionSign',
        getTransactionSign_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TransactionSign.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TransactionSign, $2.TransactionExtention>(
        'GetTransactionSign2',
        getTransactionSign2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TransactionSign.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $2.BytesMessage>(
        'CreateAddress',
        createAddress_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($2.BytesMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EasyTransferAssetMessage,
            $2.EasyTransferResponse>(
        'EasyTransferAsset',
        easyTransferAsset_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.EasyTransferAssetMessage.fromBuffer(value),
        ($2.EasyTransferResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EasyTransferAssetByPrivateMessage,
            $2.EasyTransferResponse>(
        'EasyTransferAssetByPrivate',
        easyTransferAssetByPrivate_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.EasyTransferAssetByPrivateMessage.fromBuffer(value),
        ($2.EasyTransferResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.EasyTransferMessage, $2.EasyTransferResponse>(
            'EasyTransfer',
            easyTransfer_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.EasyTransferMessage.fromBuffer(value),
            ($2.EasyTransferResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EasyTransferByPrivateMessage,
            $2.EasyTransferResponse>(
        'EasyTransferByPrivate',
        easyTransferByPrivate_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.EasyTransferByPrivateMessage.fromBuffer(value),
        ($2.EasyTransferResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.AddressPrKeyPairMessage>(
        'GenerateAddress',
        generateAddress_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.AddressPrKeyPairMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $0.TransactionInfo>(
        'GetTransactionInfoById',
        getTransactionInfoById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($0.TransactionInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AccountPermissionUpdateContract,
            $2.TransactionExtention>(
        'AccountPermissionUpdate',
        accountPermissionUpdate_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.AccountPermissionUpdateContract.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TransactionSign, $2.TransactionExtention>(
        'AddSign',
        addSign_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TransactionSign.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Transaction, $2.TransactionSignWeight>(
        'GetTransactionSignWeight',
        getTransactionSignWeight_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value),
        ($2.TransactionSignWeight value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Transaction, $2.TransactionApprovedList>(
        'GetTransactionApprovedList',
        getTransactionApprovedList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value),
        ($2.TransactionApprovedList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $0.NodeInfo>(
        'GetNodeInfo',
        getNodeInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($0.NodeInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $2.NumberMessage>(
        'GetRewardInfo',
        getRewardInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($2.NumberMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $2.NumberMessage>(
        'GetBrokerageInfo',
        getBrokerageInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($2.NumberMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateBrokerageContract,
            $2.TransactionExtention>(
        'UpdateBrokerage',
        updateBrokerage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.UpdateBrokerageContract.fromBuffer(value),
        ($2.TransactionExtention value) => value.writeToBuffer()));
  }

  $async.Future<$0.Account> getAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Account> request) async {
    return getAccount(call, await request);
  }

  $async.Future<$0.Account> getAccountById_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Account> request) async {
    return getAccountById(call, await request);
  }

  $async.Future<$0.Transaction> createTransaction_Pre($grpc.ServiceCall call,
      $async.Future<$1.TransferContract> request) async {
    return createTransaction(call, await request);
  }

  $async.Future<$2.TransactionExtention> createTransaction2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.TransferContract> request) async {
    return createTransaction2(call, await request);
  }

  $async.Future<$2.Return> broadcastTransaction_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Transaction> request) async {
    return broadcastTransaction(call, await request);
  }

  $async.Future<$0.Transaction> updateAccount_Pre($grpc.ServiceCall call,
      $async.Future<$1.AccountUpdateContract> request) async {
    return updateAccount(call, await request);
  }

  $async.Future<$0.Transaction> setAccountId_Pre($grpc.ServiceCall call,
      $async.Future<$1.SetAccountIdContract> request) async {
    return setAccountId(call, await request);
  }

  $async.Future<$2.TransactionExtention> updateAccount2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.AccountUpdateContract> request) async {
    return updateAccount2(call, await request);
  }

  $async.Future<$0.Transaction> voteWitnessAccount_Pre($grpc.ServiceCall call,
      $async.Future<$1.VoteWitnessContract> request) async {
    return voteWitnessAccount(call, await request);
  }

  $async.Future<$2.TransactionExtention> updateSetting_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.UpdateSettingContract> request) async {
    return updateSetting(call, await request);
  }

  $async.Future<$2.TransactionExtention> updateEnergyLimit_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.UpdateEnergyLimitContract> request) async {
    return updateEnergyLimit(call, await request);
  }

  $async.Future<$2.TransactionExtention> voteWitnessAccount2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.VoteWitnessContract> request) async {
    return voteWitnessAccount2(call, await request);
  }

  $async.Future<$0.Transaction> createAssetIssue_Pre($grpc.ServiceCall call,
      $async.Future<$1.AssetIssueContract> request) async {
    return createAssetIssue(call, await request);
  }

  $async.Future<$2.TransactionExtention> createAssetIssue2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.AssetIssueContract> request) async {
    return createAssetIssue2(call, await request);
  }

  $async.Future<$0.Transaction> updateWitness_Pre($grpc.ServiceCall call,
      $async.Future<$1.WitnessUpdateContract> request) async {
    return updateWitness(call, await request);
  }

  $async.Future<$2.TransactionExtention> updateWitness2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.WitnessUpdateContract> request) async {
    return updateWitness2(call, await request);
  }

  $async.Future<$0.Transaction> createAccount_Pre($grpc.ServiceCall call,
      $async.Future<$1.AccountCreateContract> request) async {
    return createAccount(call, await request);
  }

  $async.Future<$2.TransactionExtention> createAccount2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.AccountCreateContract> request) async {
    return createAccount2(call, await request);
  }

  $async.Future<$0.Transaction> createWitness_Pre($grpc.ServiceCall call,
      $async.Future<$1.WitnessCreateContract> request) async {
    return createWitness(call, await request);
  }

  $async.Future<$2.TransactionExtention> createWitness2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.WitnessCreateContract> request) async {
    return createWitness2(call, await request);
  }

  $async.Future<$0.Transaction> transferAsset_Pre($grpc.ServiceCall call,
      $async.Future<$1.TransferAssetContract> request) async {
    return transferAsset(call, await request);
  }

  $async.Future<$2.TransactionExtention> transferAsset2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.TransferAssetContract> request) async {
    return transferAsset2(call, await request);
  }

  $async.Future<$0.Transaction> participateAssetIssue_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ParticipateAssetIssueContract> request) async {
    return participateAssetIssue(call, await request);
  }

  $async.Future<$2.TransactionExtention> participateAssetIssue2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ParticipateAssetIssueContract> request) async {
    return participateAssetIssue2(call, await request);
  }

  $async.Future<$0.Transaction> freezeBalance_Pre($grpc.ServiceCall call,
      $async.Future<$1.FreezeBalanceContract> request) async {
    return freezeBalance(call, await request);
  }

  $async.Future<$2.TransactionExtention> freezeBalance2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.FreezeBalanceContract> request) async {
    return freezeBalance2(call, await request);
  }

  $async.Future<$0.Transaction> unfreezeBalance_Pre($grpc.ServiceCall call,
      $async.Future<$1.UnfreezeBalanceContract> request) async {
    return unfreezeBalance(call, await request);
  }

  $async.Future<$2.TransactionExtention> unfreezeBalance2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.UnfreezeBalanceContract> request) async {
    return unfreezeBalance2(call, await request);
  }

  $async.Future<$0.Transaction> unfreezeAsset_Pre($grpc.ServiceCall call,
      $async.Future<$1.UnfreezeAssetContract> request) async {
    return unfreezeAsset(call, await request);
  }

  $async.Future<$2.TransactionExtention> unfreezeAsset2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.UnfreezeAssetContract> request) async {
    return unfreezeAsset2(call, await request);
  }

  $async.Future<$0.Transaction> withdrawBalance_Pre($grpc.ServiceCall call,
      $async.Future<$1.WithdrawBalanceContract> request) async {
    return withdrawBalance(call, await request);
  }

  $async.Future<$2.TransactionExtention> withdrawBalance2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.WithdrawBalanceContract> request) async {
    return withdrawBalance2(call, await request);
  }

  $async.Future<$0.Transaction> updateAsset_Pre($grpc.ServiceCall call,
      $async.Future<$1.UpdateAssetContract> request) async {
    return updateAsset(call, await request);
  }

  $async.Future<$2.TransactionExtention> updateAsset2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.UpdateAssetContract> request) async {
    return updateAsset2(call, await request);
  }

  $async.Future<$2.TransactionExtention> proposalCreate_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ProposalCreateContract> request) async {
    return proposalCreate(call, await request);
  }

  $async.Future<$2.TransactionExtention> proposalApprove_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ProposalApproveContract> request) async {
    return proposalApprove(call, await request);
  }

  $async.Future<$2.TransactionExtention> proposalDelete_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ProposalDeleteContract> request) async {
    return proposalDelete(call, await request);
  }

  $async.Future<$2.TransactionExtention> buyStorage_Pre($grpc.ServiceCall call,
      $async.Future<$1.BuyStorageContract> request) async {
    return buyStorage(call, await request);
  }

  $async.Future<$2.TransactionExtention> buyStorageBytes_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.BuyStorageBytesContract> request) async {
    return buyStorageBytes(call, await request);
  }

  $async.Future<$2.TransactionExtention> sellStorage_Pre($grpc.ServiceCall call,
      $async.Future<$1.SellStorageContract> request) async {
    return sellStorage(call, await request);
  }

  $async.Future<$2.TransactionExtention> exchangeCreate_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ExchangeCreateContract> request) async {
    return exchangeCreate(call, await request);
  }

  $async.Future<$2.TransactionExtention> exchangeInject_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ExchangeInjectContract> request) async {
    return exchangeInject(call, await request);
  }

  $async.Future<$2.TransactionExtention> exchangeWithdraw_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ExchangeWithdrawContract> request) async {
    return exchangeWithdraw(call, await request);
  }

  $async.Future<$2.TransactionExtention> exchangeTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ExchangeTransactionContract> request) async {
    return exchangeTransaction(call, await request);
  }

  $async.Future<$2.NodeList> listNodes_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return listNodes(call, await request);
  }

  $async.Future<$2.AssetIssueList> getAssetIssueByAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Account> request) async {
    return getAssetIssueByAccount(call, await request);
  }

  $async.Future<$2.AccountNetMessage> getAccountNet_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Account> request) async {
    return getAccountNet(call, await request);
  }

  $async.Future<$2.AccountResourceMessage> getAccountResource_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Account> request) async {
    return getAccountResource(call, await request);
  }

  $async.Future<$1.AssetIssueContract> getAssetIssueByName_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getAssetIssueByName(call, await request);
  }

  $async.Future<$2.AssetIssueList> getAssetIssueListByName_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getAssetIssueListByName(call, await request);
  }

  $async.Future<$1.AssetIssueContract> getAssetIssueById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getAssetIssueById(call, await request);
  }

  $async.Future<$0.Block> getNowBlock_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getNowBlock(call, await request);
  }

  $async.Future<$2.BlockExtention> getNowBlock2_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getNowBlock2(call, await request);
  }

  $async.Future<$0.Block> getBlockByNum_Pre(
      $grpc.ServiceCall call, $async.Future<$2.NumberMessage> request) async {
    return getBlockByNum(call, await request);
  }

  $async.Future<$2.BlockExtention> getBlockByNum2_Pre(
      $grpc.ServiceCall call, $async.Future<$2.NumberMessage> request) async {
    return getBlockByNum2(call, await request);
  }

  $async.Future<$2.NumberMessage> getTransactionCountByBlockNum_Pre(
      $grpc.ServiceCall call, $async.Future<$2.NumberMessage> request) async {
    return getTransactionCountByBlockNum(call, await request);
  }

  $async.Future<$0.Block> getBlockById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getBlockById(call, await request);
  }

  $async.Future<$2.BlockList> getBlockByLimitNext_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BlockLimit> request) async {
    return getBlockByLimitNext(call, await request);
  }

  $async.Future<$2.BlockListExtention> getBlockByLimitNext2_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BlockLimit> request) async {
    return getBlockByLimitNext2(call, await request);
  }

  $async.Future<$2.BlockList> getBlockByLatestNum_Pre(
      $grpc.ServiceCall call, $async.Future<$2.NumberMessage> request) async {
    return getBlockByLatestNum(call, await request);
  }

  $async.Future<$2.BlockListExtention> getBlockByLatestNum2_Pre(
      $grpc.ServiceCall call, $async.Future<$2.NumberMessage> request) async {
    return getBlockByLatestNum2(call, await request);
  }

  $async.Future<$0.Transaction> getTransactionById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getTransactionById(call, await request);
  }

  $async.Future<$2.TransactionExtention> deployContract_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.CreateSmartContract> request) async {
    return deployContract(call, await request);
  }

  $async.Future<$0.SmartContract> getContract_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getContract(call, await request);
  }

  $async.Future<$2.TransactionExtention> triggerContract_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.TriggerSmartContract> request) async {
    return triggerContract(call, await request);
  }

  $async.Future<$2.TransactionExtention> triggerConstantContract_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.TriggerSmartContract> request) async {
    return triggerConstantContract(call, await request);
  }

  $async.Future<$2.TransactionExtention> clearContractABI_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.ClearABIContract> request) async {
    return clearContractABI(call, await request);
  }

  $async.Future<$2.WitnessList> listWitnesses_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return listWitnesses(call, await request);
  }

  $async.Future<$2.DelegatedResourceList> getDelegatedResource_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.DelegatedResourceMessage> request) async {
    return getDelegatedResource(call, await request);
  }

  $async.Future<$0.DelegatedResourceAccountIndex>
      getDelegatedResourceAccountIndex_Pre($grpc.ServiceCall call,
          $async.Future<$2.BytesMessage> request) async {
    return getDelegatedResourceAccountIndex(call, await request);
  }

  $async.Future<$2.ProposalList> listProposals_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return listProposals(call, await request);
  }

  $async.Future<$2.ProposalList> getPaginatedProposalList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.PaginatedMessage> request) async {
    return getPaginatedProposalList(call, await request);
  }

  $async.Future<$0.Proposal> getProposalById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getProposalById(call, await request);
  }

  $async.Future<$2.ExchangeList> listExchanges_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return listExchanges(call, await request);
  }

  $async.Future<$2.ExchangeList> getPaginatedExchangeList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.PaginatedMessage> request) async {
    return getPaginatedExchangeList(call, await request);
  }

  $async.Future<$0.Exchange> getExchangeById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getExchangeById(call, await request);
  }

  $async.Future<$0.ChainParameters> getChainParameters_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getChainParameters(call, await request);
  }

  $async.Future<$2.AssetIssueList> getAssetIssueList_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getAssetIssueList(call, await request);
  }

  $async.Future<$2.AssetIssueList> getPaginatedAssetIssueList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.PaginatedMessage> request) async {
    return getPaginatedAssetIssueList(call, await request);
  }

  $async.Future<$2.NumberMessage> totalTransaction_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return totalTransaction(call, await request);
  }

  $async.Future<$2.NumberMessage> getNextMaintenanceTime_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getNextMaintenanceTime(call, await request);
  }

  $async.Future<$0.Transaction> getTransactionSign_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TransactionSign> request) async {
    return getTransactionSign(call, await request);
  }

  $async.Future<$2.TransactionExtention> getTransactionSign2_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TransactionSign> request) async {
    return getTransactionSign2(call, await request);
  }

  $async.Future<$2.BytesMessage> createAddress_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return createAddress(call, await request);
  }

  $async.Future<$2.EasyTransferResponse> easyTransferAsset_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.EasyTransferAssetMessage> request) async {
    return easyTransferAsset(call, await request);
  }

  $async.Future<$2.EasyTransferResponse> easyTransferAssetByPrivate_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.EasyTransferAssetByPrivateMessage> request) async {
    return easyTransferAssetByPrivate(call, await request);
  }

  $async.Future<$2.EasyTransferResponse> easyTransfer_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.EasyTransferMessage> request) async {
    return easyTransfer(call, await request);
  }

  $async.Future<$2.EasyTransferResponse> easyTransferByPrivate_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.EasyTransferByPrivateMessage> request) async {
    return easyTransferByPrivate(call, await request);
  }

  $async.Future<$2.AddressPrKeyPairMessage> generateAddress_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return generateAddress(call, await request);
  }

  $async.Future<$0.TransactionInfo> getTransactionInfoById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getTransactionInfoById(call, await request);
  }

  $async.Future<$2.TransactionExtention> accountPermissionUpdate_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.AccountPermissionUpdateContract> request) async {
    return accountPermissionUpdate(call, await request);
  }

  $async.Future<$2.TransactionExtention> addSign_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TransactionSign> request) async {
    return addSign(call, await request);
  }

  $async.Future<$2.TransactionSignWeight> getTransactionSignWeight_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Transaction> request) async {
    return getTransactionSignWeight(call, await request);
  }

  $async.Future<$2.TransactionApprovedList> getTransactionApprovedList_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Transaction> request) async {
    return getTransactionApprovedList(call, await request);
  }

  $async.Future<$0.NodeInfo> getNodeInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getNodeInfo(call, await request);
  }

  $async.Future<$2.NumberMessage> getRewardInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getRewardInfo(call, await request);
  }

  $async.Future<$2.NumberMessage> getBrokerageInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getBrokerageInfo(call, await request);
  }

  $async.Future<$2.TransactionExtention> updateBrokerage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.UpdateBrokerageContract> request) async {
    return updateBrokerage(call, await request);
  }

  $async.Future<$0.Account> getAccount(
      $grpc.ServiceCall call, $0.Account request);
  $async.Future<$0.Account> getAccountById(
      $grpc.ServiceCall call, $0.Account request);
  $async.Future<$0.Transaction> createTransaction(
      $grpc.ServiceCall call, $1.TransferContract request);
  $async.Future<$2.TransactionExtention> createTransaction2(
      $grpc.ServiceCall call, $1.TransferContract request);
  $async.Future<$2.Return> broadcastTransaction(
      $grpc.ServiceCall call, $0.Transaction request);
  $async.Future<$0.Transaction> updateAccount(
      $grpc.ServiceCall call, $1.AccountUpdateContract request);
  $async.Future<$0.Transaction> setAccountId(
      $grpc.ServiceCall call, $1.SetAccountIdContract request);
  $async.Future<$2.TransactionExtention> updateAccount2(
      $grpc.ServiceCall call, $1.AccountUpdateContract request);
  $async.Future<$0.Transaction> voteWitnessAccount(
      $grpc.ServiceCall call, $1.VoteWitnessContract request);
  $async.Future<$2.TransactionExtention> updateSetting(
      $grpc.ServiceCall call, $1.UpdateSettingContract request);
  $async.Future<$2.TransactionExtention> updateEnergyLimit(
      $grpc.ServiceCall call, $1.UpdateEnergyLimitContract request);
  $async.Future<$2.TransactionExtention> voteWitnessAccount2(
      $grpc.ServiceCall call, $1.VoteWitnessContract request);
  $async.Future<$0.Transaction> createAssetIssue(
      $grpc.ServiceCall call, $1.AssetIssueContract request);
  $async.Future<$2.TransactionExtention> createAssetIssue2(
      $grpc.ServiceCall call, $1.AssetIssueContract request);
  $async.Future<$0.Transaction> updateWitness(
      $grpc.ServiceCall call, $1.WitnessUpdateContract request);
  $async.Future<$2.TransactionExtention> updateWitness2(
      $grpc.ServiceCall call, $1.WitnessUpdateContract request);
  $async.Future<$0.Transaction> createAccount(
      $grpc.ServiceCall call, $1.AccountCreateContract request);
  $async.Future<$2.TransactionExtention> createAccount2(
      $grpc.ServiceCall call, $1.AccountCreateContract request);
  $async.Future<$0.Transaction> createWitness(
      $grpc.ServiceCall call, $1.WitnessCreateContract request);
  $async.Future<$2.TransactionExtention> createWitness2(
      $grpc.ServiceCall call, $1.WitnessCreateContract request);
  $async.Future<$0.Transaction> transferAsset(
      $grpc.ServiceCall call, $1.TransferAssetContract request);
  $async.Future<$2.TransactionExtention> transferAsset2(
      $grpc.ServiceCall call, $1.TransferAssetContract request);
  $async.Future<$0.Transaction> participateAssetIssue(
      $grpc.ServiceCall call, $1.ParticipateAssetIssueContract request);
  $async.Future<$2.TransactionExtention> participateAssetIssue2(
      $grpc.ServiceCall call, $1.ParticipateAssetIssueContract request);
  $async.Future<$0.Transaction> freezeBalance(
      $grpc.ServiceCall call, $1.FreezeBalanceContract request);
  $async.Future<$2.TransactionExtention> freezeBalance2(
      $grpc.ServiceCall call, $1.FreezeBalanceContract request);
  $async.Future<$0.Transaction> unfreezeBalance(
      $grpc.ServiceCall call, $1.UnfreezeBalanceContract request);
  $async.Future<$2.TransactionExtention> unfreezeBalance2(
      $grpc.ServiceCall call, $1.UnfreezeBalanceContract request);
  $async.Future<$0.Transaction> unfreezeAsset(
      $grpc.ServiceCall call, $1.UnfreezeAssetContract request);
  $async.Future<$2.TransactionExtention> unfreezeAsset2(
      $grpc.ServiceCall call, $1.UnfreezeAssetContract request);
  $async.Future<$0.Transaction> withdrawBalance(
      $grpc.ServiceCall call, $1.WithdrawBalanceContract request);
  $async.Future<$2.TransactionExtention> withdrawBalance2(
      $grpc.ServiceCall call, $1.WithdrawBalanceContract request);
  $async.Future<$0.Transaction> updateAsset(
      $grpc.ServiceCall call, $1.UpdateAssetContract request);
  $async.Future<$2.TransactionExtention> updateAsset2(
      $grpc.ServiceCall call, $1.UpdateAssetContract request);
  $async.Future<$2.TransactionExtention> proposalCreate(
      $grpc.ServiceCall call, $1.ProposalCreateContract request);
  $async.Future<$2.TransactionExtention> proposalApprove(
      $grpc.ServiceCall call, $1.ProposalApproveContract request);
  $async.Future<$2.TransactionExtention> proposalDelete(
      $grpc.ServiceCall call, $1.ProposalDeleteContract request);
  $async.Future<$2.TransactionExtention> buyStorage(
      $grpc.ServiceCall call, $1.BuyStorageContract request);
  $async.Future<$2.TransactionExtention> buyStorageBytes(
      $grpc.ServiceCall call, $1.BuyStorageBytesContract request);
  $async.Future<$2.TransactionExtention> sellStorage(
      $grpc.ServiceCall call, $1.SellStorageContract request);
  $async.Future<$2.TransactionExtention> exchangeCreate(
      $grpc.ServiceCall call, $1.ExchangeCreateContract request);
  $async.Future<$2.TransactionExtention> exchangeInject(
      $grpc.ServiceCall call, $1.ExchangeInjectContract request);
  $async.Future<$2.TransactionExtention> exchangeWithdraw(
      $grpc.ServiceCall call, $1.ExchangeWithdrawContract request);
  $async.Future<$2.TransactionExtention> exchangeTransaction(
      $grpc.ServiceCall call, $1.ExchangeTransactionContract request);
  $async.Future<$2.NodeList> listNodes(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.AssetIssueList> getAssetIssueByAccount(
      $grpc.ServiceCall call, $0.Account request);
  $async.Future<$2.AccountNetMessage> getAccountNet(
      $grpc.ServiceCall call, $0.Account request);
  $async.Future<$2.AccountResourceMessage> getAccountResource(
      $grpc.ServiceCall call, $0.Account request);
  $async.Future<$1.AssetIssueContract> getAssetIssueByName(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.AssetIssueList> getAssetIssueListByName(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$1.AssetIssueContract> getAssetIssueById(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$0.Block> getNowBlock(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.BlockExtention> getNowBlock2(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$0.Block> getBlockByNum(
      $grpc.ServiceCall call, $2.NumberMessage request);
  $async.Future<$2.BlockExtention> getBlockByNum2(
      $grpc.ServiceCall call, $2.NumberMessage request);
  $async.Future<$2.NumberMessage> getTransactionCountByBlockNum(
      $grpc.ServiceCall call, $2.NumberMessage request);
  $async.Future<$0.Block> getBlockById(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.BlockList> getBlockByLimitNext(
      $grpc.ServiceCall call, $2.BlockLimit request);
  $async.Future<$2.BlockListExtention> getBlockByLimitNext2(
      $grpc.ServiceCall call, $2.BlockLimit request);
  $async.Future<$2.BlockList> getBlockByLatestNum(
      $grpc.ServiceCall call, $2.NumberMessage request);
  $async.Future<$2.BlockListExtention> getBlockByLatestNum2(
      $grpc.ServiceCall call, $2.NumberMessage request);
  $async.Future<$0.Transaction> getTransactionById(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.TransactionExtention> deployContract(
      $grpc.ServiceCall call, $1.CreateSmartContract request);
  $async.Future<$0.SmartContract> getContract(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.TransactionExtention> triggerContract(
      $grpc.ServiceCall call, $1.TriggerSmartContract request);
  $async.Future<$2.TransactionExtention> triggerConstantContract(
      $grpc.ServiceCall call, $1.TriggerSmartContract request);
  $async.Future<$2.TransactionExtention> clearContractABI(
      $grpc.ServiceCall call, $1.ClearABIContract request);
  $async.Future<$2.WitnessList> listWitnesses(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.DelegatedResourceList> getDelegatedResource(
      $grpc.ServiceCall call, $2.DelegatedResourceMessage request);
  $async.Future<$0.DelegatedResourceAccountIndex>
      getDelegatedResourceAccountIndex(
          $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.ProposalList> listProposals(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.ProposalList> getPaginatedProposalList(
      $grpc.ServiceCall call, $2.PaginatedMessage request);
  $async.Future<$0.Proposal> getProposalById(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.ExchangeList> listExchanges(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.ExchangeList> getPaginatedExchangeList(
      $grpc.ServiceCall call, $2.PaginatedMessage request);
  $async.Future<$0.Exchange> getExchangeById(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$0.ChainParameters> getChainParameters(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.AssetIssueList> getAssetIssueList(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.AssetIssueList> getPaginatedAssetIssueList(
      $grpc.ServiceCall call, $2.PaginatedMessage request);
  $async.Future<$2.NumberMessage> totalTransaction(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.NumberMessage> getNextMaintenanceTime(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$0.Transaction> getTransactionSign(
      $grpc.ServiceCall call, $0.TransactionSign request);
  $async.Future<$2.TransactionExtention> getTransactionSign2(
      $grpc.ServiceCall call, $0.TransactionSign request);
  $async.Future<$2.BytesMessage> createAddress(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.EasyTransferResponse> easyTransferAsset(
      $grpc.ServiceCall call, $2.EasyTransferAssetMessage request);
  $async.Future<$2.EasyTransferResponse> easyTransferAssetByPrivate(
      $grpc.ServiceCall call, $2.EasyTransferAssetByPrivateMessage request);
  $async.Future<$2.EasyTransferResponse> easyTransfer(
      $grpc.ServiceCall call, $2.EasyTransferMessage request);
  $async.Future<$2.EasyTransferResponse> easyTransferByPrivate(
      $grpc.ServiceCall call, $2.EasyTransferByPrivateMessage request);
  $async.Future<$2.AddressPrKeyPairMessage> generateAddress(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$0.TransactionInfo> getTransactionInfoById(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.TransactionExtention> accountPermissionUpdate(
      $grpc.ServiceCall call, $1.AccountPermissionUpdateContract request);
  $async.Future<$2.TransactionExtention> addSign(
      $grpc.ServiceCall call, $0.TransactionSign request);
  $async.Future<$2.TransactionSignWeight> getTransactionSignWeight(
      $grpc.ServiceCall call, $0.Transaction request);
  $async.Future<$2.TransactionApprovedList> getTransactionApprovedList(
      $grpc.ServiceCall call, $0.Transaction request);
  $async.Future<$0.NodeInfo> getNodeInfo(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.NumberMessage> getRewardInfo(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.NumberMessage> getBrokerageInfo(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.TransactionExtention> updateBrokerage(
      $grpc.ServiceCall call, $1.UpdateBrokerageContract request);
}

class WalletSolidityClient extends $grpc.Client {
  static final _$getAccount = $grpc.ClientMethod<$0.Account, $0.Account>(
      '/protocol.WalletSolidity/GetAccount',
      ($0.Account value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$getAccountById = $grpc.ClientMethod<$0.Account, $0.Account>(
      '/protocol.WalletSolidity/GetAccountById',
      ($0.Account value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$listWitnesses =
      $grpc.ClientMethod<$2.EmptyMessage, $2.WitnessList>(
          '/protocol.WalletSolidity/ListWitnesses',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.WitnessList.fromBuffer(value));
  static final _$getAssetIssueList =
      $grpc.ClientMethod<$2.EmptyMessage, $2.AssetIssueList>(
          '/protocol.WalletSolidity/GetAssetIssueList',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.AssetIssueList.fromBuffer(value));
  static final _$getPaginatedAssetIssueList =
      $grpc.ClientMethod<$2.PaginatedMessage, $2.AssetIssueList>(
          '/protocol.WalletSolidity/GetPaginatedAssetIssueList',
          ($2.PaginatedMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.AssetIssueList.fromBuffer(value));
  static final _$getAssetIssueByName =
      $grpc.ClientMethod<$2.BytesMessage, $1.AssetIssueContract>(
          '/protocol.WalletSolidity/GetAssetIssueByName',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.AssetIssueContract.fromBuffer(value));
  static final _$getAssetIssueListByName =
      $grpc.ClientMethod<$2.BytesMessage, $2.AssetIssueList>(
          '/protocol.WalletSolidity/GetAssetIssueListByName',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.AssetIssueList.fromBuffer(value));
  static final _$getAssetIssueById =
      $grpc.ClientMethod<$2.BytesMessage, $1.AssetIssueContract>(
          '/protocol.WalletSolidity/GetAssetIssueById',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.AssetIssueContract.fromBuffer(value));
  static final _$getNowBlock = $grpc.ClientMethod<$2.EmptyMessage, $0.Block>(
      '/protocol.WalletSolidity/GetNowBlock',
      ($2.EmptyMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Block.fromBuffer(value));
  static final _$getNowBlock2 =
      $grpc.ClientMethod<$2.EmptyMessage, $2.BlockExtention>(
          '/protocol.WalletSolidity/GetNowBlock2',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.BlockExtention.fromBuffer(value));
  static final _$getBlockByNum = $grpc.ClientMethod<$2.NumberMessage, $0.Block>(
      '/protocol.WalletSolidity/GetBlockByNum',
      ($2.NumberMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Block.fromBuffer(value));
  static final _$getBlockByNum2 =
      $grpc.ClientMethod<$2.NumberMessage, $2.BlockExtention>(
          '/protocol.WalletSolidity/GetBlockByNum2',
          ($2.NumberMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.BlockExtention.fromBuffer(value));
  static final _$getTransactionCountByBlockNum =
      $grpc.ClientMethod<$2.NumberMessage, $2.NumberMessage>(
          '/protocol.WalletSolidity/GetTransactionCountByBlockNum',
          ($2.NumberMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value));
  static final _$getDelegatedResource =
      $grpc.ClientMethod<$2.DelegatedResourceMessage, $2.DelegatedResourceList>(
          '/protocol.WalletSolidity/GetDelegatedResource',
          ($2.DelegatedResourceMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.DelegatedResourceList.fromBuffer(value));
  static final _$getDelegatedResourceAccountIndex =
      $grpc.ClientMethod<$2.BytesMessage, $0.DelegatedResourceAccountIndex>(
          '/protocol.WalletSolidity/GetDelegatedResourceAccountIndex',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DelegatedResourceAccountIndex.fromBuffer(value));
  static final _$getExchangeById =
      $grpc.ClientMethod<$2.BytesMessage, $0.Exchange>(
          '/protocol.WalletSolidity/GetExchangeById',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Exchange.fromBuffer(value));
  static final _$listExchanges =
      $grpc.ClientMethod<$2.EmptyMessage, $2.ExchangeList>(
          '/protocol.WalletSolidity/ListExchanges',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.ExchangeList.fromBuffer(value));
  static final _$getTransactionById =
      $grpc.ClientMethod<$2.BytesMessage, $0.Transaction>(
          '/protocol.WalletSolidity/GetTransactionById',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value));
  static final _$getTransactionInfoById =
      $grpc.ClientMethod<$2.BytesMessage, $0.TransactionInfo>(
          '/protocol.WalletSolidity/GetTransactionInfoById',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TransactionInfo.fromBuffer(value));
  static final _$generateAddress =
      $grpc.ClientMethod<$2.EmptyMessage, $2.AddressPrKeyPairMessage>(
          '/protocol.WalletSolidity/GenerateAddress',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.AddressPrKeyPairMessage.fromBuffer(value));
  static final _$triggerConstantContract =
      $grpc.ClientMethod<$1.TriggerSmartContract, $2.TransactionExtention>(
          '/protocol.WalletSolidity/TriggerConstantContract',
          ($1.TriggerSmartContract value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionExtention.fromBuffer(value));
  static final _$getRewardInfo =
      $grpc.ClientMethod<$2.BytesMessage, $2.NumberMessage>(
          '/protocol.WalletSolidity/GetRewardInfo',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value));
  static final _$getBrokerageInfo =
      $grpc.ClientMethod<$2.BytesMessage, $2.NumberMessage>(
          '/protocol.WalletSolidity/GetBrokerageInfo',
          ($2.BytesMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value));

  WalletSolidityClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.Account> getAccount($0.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAccount, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Account> getAccountById($0.Account request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAccountById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.WitnessList> listWitnesses($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listWitnesses, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AssetIssueList> getAssetIssueList(
      $2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAssetIssueList, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AssetIssueList> getPaginatedAssetIssueList(
      $2.PaginatedMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getPaginatedAssetIssueList, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.AssetIssueContract> getAssetIssueByName(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAssetIssueByName, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AssetIssueList> getAssetIssueListByName(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAssetIssueListByName, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.AssetIssueContract> getAssetIssueById(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAssetIssueById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Block> getNowBlock($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getNowBlock, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.BlockExtention> getNowBlock2($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getNowBlock2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Block> getBlockByNum($2.NumberMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockByNum, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.BlockExtention> getBlockByNum2(
      $2.NumberMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockByNum2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.NumberMessage> getTransactionCountByBlockNum(
      $2.NumberMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionCountByBlockNum, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.DelegatedResourceList> getDelegatedResource(
      $2.DelegatedResourceMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getDelegatedResource, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.DelegatedResourceAccountIndex>
      getDelegatedResourceAccountIndex($2.BytesMessage request,
          {$grpc.CallOptions options}) {
    final call = $createCall(_$getDelegatedResourceAccountIndex,
        $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Exchange> getExchangeById($2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getExchangeById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.ExchangeList> listExchanges($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listExchanges, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Transaction> getTransactionById(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.TransactionInfo> getTransactionInfoById(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionInfoById, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.AddressPrKeyPairMessage> generateAddress(
      $2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$generateAddress, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionExtention> triggerConstantContract(
      $1.TriggerSmartContract request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$triggerConstantContract, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.NumberMessage> getRewardInfo($2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getRewardInfo, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.NumberMessage> getBrokerageInfo(
      $2.BytesMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBrokerageInfo, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class WalletSolidityServiceBase extends $grpc.Service {
  $core.String get $name => 'protocol.WalletSolidity';

  WalletSolidityServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Account, $0.Account>(
        'GetAccount',
        getAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Account.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Account, $0.Account>(
        'GetAccountById',
        getAccountById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Account.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.WitnessList>(
        'ListWitnesses',
        listWitnesses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.WitnessList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.AssetIssueList>(
        'GetAssetIssueList',
        getAssetIssueList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.AssetIssueList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.PaginatedMessage, $2.AssetIssueList>(
        'GetPaginatedAssetIssueList',
        getPaginatedAssetIssueList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.PaginatedMessage.fromBuffer(value),
        ($2.AssetIssueList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $1.AssetIssueContract>(
        'GetAssetIssueByName',
        getAssetIssueByName_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($1.AssetIssueContract value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $2.AssetIssueList>(
        'GetAssetIssueListByName',
        getAssetIssueListByName_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($2.AssetIssueList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $1.AssetIssueContract>(
        'GetAssetIssueById',
        getAssetIssueById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($1.AssetIssueContract value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $0.Block>(
        'GetNowBlock',
        getNowBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($0.Block value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.BlockExtention>(
        'GetNowBlock2',
        getNowBlock2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.BlockExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.NumberMessage, $0.Block>(
        'GetBlockByNum',
        getBlockByNum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value),
        ($0.Block value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.NumberMessage, $2.BlockExtention>(
        'GetBlockByNum2',
        getBlockByNum2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value),
        ($2.BlockExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.NumberMessage, $2.NumberMessage>(
        'GetTransactionCountByBlockNum',
        getTransactionCountByBlockNum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value),
        ($2.NumberMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DelegatedResourceMessage,
            $2.DelegatedResourceList>(
        'GetDelegatedResource',
        getDelegatedResource_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.DelegatedResourceMessage.fromBuffer(value),
        ($2.DelegatedResourceList value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.BytesMessage, $0.DelegatedResourceAccountIndex>(
            'GetDelegatedResourceAccountIndex',
            getDelegatedResourceAccountIndex_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
            ($0.DelegatedResourceAccountIndex value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $0.Exchange>(
        'GetExchangeById',
        getExchangeById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($0.Exchange value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.ExchangeList>(
        'ListExchanges',
        listExchanges_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.ExchangeList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $0.Transaction>(
        'GetTransactionById',
        getTransactionById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($0.Transaction value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $0.TransactionInfo>(
        'GetTransactionInfoById',
        getTransactionInfoById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($0.TransactionInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.AddressPrKeyPairMessage>(
        'GenerateAddress',
        generateAddress_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.AddressPrKeyPairMessage value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.TriggerSmartContract, $2.TransactionExtention>(
            'TriggerConstantContract',
            triggerConstantContract_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.TriggerSmartContract.fromBuffer(value),
            ($2.TransactionExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $2.NumberMessage>(
        'GetRewardInfo',
        getRewardInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($2.NumberMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.BytesMessage, $2.NumberMessage>(
        'GetBrokerageInfo',
        getBrokerageInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BytesMessage.fromBuffer(value),
        ($2.NumberMessage value) => value.writeToBuffer()));
  }

  $async.Future<$0.Account> getAccount_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Account> request) async {
    return getAccount(call, await request);
  }

  $async.Future<$0.Account> getAccountById_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Account> request) async {
    return getAccountById(call, await request);
  }

  $async.Future<$2.WitnessList> listWitnesses_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return listWitnesses(call, await request);
  }

  $async.Future<$2.AssetIssueList> getAssetIssueList_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getAssetIssueList(call, await request);
  }

  $async.Future<$2.AssetIssueList> getPaginatedAssetIssueList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.PaginatedMessage> request) async {
    return getPaginatedAssetIssueList(call, await request);
  }

  $async.Future<$1.AssetIssueContract> getAssetIssueByName_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getAssetIssueByName(call, await request);
  }

  $async.Future<$2.AssetIssueList> getAssetIssueListByName_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getAssetIssueListByName(call, await request);
  }

  $async.Future<$1.AssetIssueContract> getAssetIssueById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getAssetIssueById(call, await request);
  }

  $async.Future<$0.Block> getNowBlock_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getNowBlock(call, await request);
  }

  $async.Future<$2.BlockExtention> getNowBlock2_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getNowBlock2(call, await request);
  }

  $async.Future<$0.Block> getBlockByNum_Pre(
      $grpc.ServiceCall call, $async.Future<$2.NumberMessage> request) async {
    return getBlockByNum(call, await request);
  }

  $async.Future<$2.BlockExtention> getBlockByNum2_Pre(
      $grpc.ServiceCall call, $async.Future<$2.NumberMessage> request) async {
    return getBlockByNum2(call, await request);
  }

  $async.Future<$2.NumberMessage> getTransactionCountByBlockNum_Pre(
      $grpc.ServiceCall call, $async.Future<$2.NumberMessage> request) async {
    return getTransactionCountByBlockNum(call, await request);
  }

  $async.Future<$2.DelegatedResourceList> getDelegatedResource_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.DelegatedResourceMessage> request) async {
    return getDelegatedResource(call, await request);
  }

  $async.Future<$0.DelegatedResourceAccountIndex>
      getDelegatedResourceAccountIndex_Pre($grpc.ServiceCall call,
          $async.Future<$2.BytesMessage> request) async {
    return getDelegatedResourceAccountIndex(call, await request);
  }

  $async.Future<$0.Exchange> getExchangeById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getExchangeById(call, await request);
  }

  $async.Future<$2.ExchangeList> listExchanges_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return listExchanges(call, await request);
  }

  $async.Future<$0.Transaction> getTransactionById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getTransactionById(call, await request);
  }

  $async.Future<$0.TransactionInfo> getTransactionInfoById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getTransactionInfoById(call, await request);
  }

  $async.Future<$2.AddressPrKeyPairMessage> generateAddress_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return generateAddress(call, await request);
  }

  $async.Future<$2.TransactionExtention> triggerConstantContract_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.TriggerSmartContract> request) async {
    return triggerConstantContract(call, await request);
  }

  $async.Future<$2.NumberMessage> getRewardInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getRewardInfo(call, await request);
  }

  $async.Future<$2.NumberMessage> getBrokerageInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$2.BytesMessage> request) async {
    return getBrokerageInfo(call, await request);
  }

  $async.Future<$0.Account> getAccount(
      $grpc.ServiceCall call, $0.Account request);
  $async.Future<$0.Account> getAccountById(
      $grpc.ServiceCall call, $0.Account request);
  $async.Future<$2.WitnessList> listWitnesses(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.AssetIssueList> getAssetIssueList(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.AssetIssueList> getPaginatedAssetIssueList(
      $grpc.ServiceCall call, $2.PaginatedMessage request);
  $async.Future<$1.AssetIssueContract> getAssetIssueByName(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.AssetIssueList> getAssetIssueListByName(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$1.AssetIssueContract> getAssetIssueById(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$0.Block> getNowBlock(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.BlockExtention> getNowBlock2(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$0.Block> getBlockByNum(
      $grpc.ServiceCall call, $2.NumberMessage request);
  $async.Future<$2.BlockExtention> getBlockByNum2(
      $grpc.ServiceCall call, $2.NumberMessage request);
  $async.Future<$2.NumberMessage> getTransactionCountByBlockNum(
      $grpc.ServiceCall call, $2.NumberMessage request);
  $async.Future<$2.DelegatedResourceList> getDelegatedResource(
      $grpc.ServiceCall call, $2.DelegatedResourceMessage request);
  $async.Future<$0.DelegatedResourceAccountIndex>
      getDelegatedResourceAccountIndex(
          $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$0.Exchange> getExchangeById(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.ExchangeList> listExchanges(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$0.Transaction> getTransactionById(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$0.TransactionInfo> getTransactionInfoById(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.AddressPrKeyPairMessage> generateAddress(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$2.TransactionExtention> triggerConstantContract(
      $grpc.ServiceCall call, $1.TriggerSmartContract request);
  $async.Future<$2.NumberMessage> getRewardInfo(
      $grpc.ServiceCall call, $2.BytesMessage request);
  $async.Future<$2.NumberMessage> getBrokerageInfo(
      $grpc.ServiceCall call, $2.BytesMessage request);
}

class WalletExtensionClient extends $grpc.Client {
  static final _$getTransactionsFromThis =
      $grpc.ClientMethod<$2.AccountPaginated, $2.TransactionList>(
          '/protocol.WalletExtension/GetTransactionsFromThis',
          ($2.AccountPaginated value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionList.fromBuffer(value));
  static final _$getTransactionsFromThis2 =
      $grpc.ClientMethod<$2.AccountPaginated, $2.TransactionListExtention>(
          '/protocol.WalletExtension/GetTransactionsFromThis2',
          ($2.AccountPaginated value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionListExtention.fromBuffer(value));
  static final _$getTransactionsToThis =
      $grpc.ClientMethod<$2.AccountPaginated, $2.TransactionList>(
          '/protocol.WalletExtension/GetTransactionsToThis',
          ($2.AccountPaginated value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionList.fromBuffer(value));
  static final _$getTransactionsToThis2 =
      $grpc.ClientMethod<$2.AccountPaginated, $2.TransactionListExtention>(
          '/protocol.WalletExtension/GetTransactionsToThis2',
          ($2.AccountPaginated value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.TransactionListExtention.fromBuffer(value));

  WalletExtensionClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$2.TransactionList> getTransactionsFromThis(
      $2.AccountPaginated request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionsFromThis, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionListExtention> getTransactionsFromThis2(
      $2.AccountPaginated request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionsFromThis2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionList> getTransactionsToThis(
      $2.AccountPaginated request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionsToThis, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$2.TransactionListExtention> getTransactionsToThis2(
      $2.AccountPaginated request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactionsToThis2, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class WalletExtensionServiceBase extends $grpc.Service {
  $core.String get $name => 'protocol.WalletExtension';

  WalletExtensionServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.AccountPaginated, $2.TransactionList>(
        'GetTransactionsFromThis',
        getTransactionsFromThis_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.AccountPaginated.fromBuffer(value),
        ($2.TransactionList value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.AccountPaginated, $2.TransactionListExtention>(
            'GetTransactionsFromThis2',
            getTransactionsFromThis2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.AccountPaginated.fromBuffer(value),
            ($2.TransactionListExtention value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.AccountPaginated, $2.TransactionList>(
        'GetTransactionsToThis',
        getTransactionsToThis_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.AccountPaginated.fromBuffer(value),
        ($2.TransactionList value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.AccountPaginated, $2.TransactionListExtention>(
            'GetTransactionsToThis2',
            getTransactionsToThis2_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.AccountPaginated.fromBuffer(value),
            ($2.TransactionListExtention value) => value.writeToBuffer()));
  }

  $async.Future<$2.TransactionList> getTransactionsFromThis_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.AccountPaginated> request) async {
    return getTransactionsFromThis(call, await request);
  }

  $async.Future<$2.TransactionListExtention> getTransactionsFromThis2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.AccountPaginated> request) async {
    return getTransactionsFromThis2(call, await request);
  }

  $async.Future<$2.TransactionList> getTransactionsToThis_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.AccountPaginated> request) async {
    return getTransactionsToThis(call, await request);
  }

  $async.Future<$2.TransactionListExtention> getTransactionsToThis2_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.AccountPaginated> request) async {
    return getTransactionsToThis2(call, await request);
  }

  $async.Future<$2.TransactionList> getTransactionsFromThis(
      $grpc.ServiceCall call, $2.AccountPaginated request);
  $async.Future<$2.TransactionListExtention> getTransactionsFromThis2(
      $grpc.ServiceCall call, $2.AccountPaginated request);
  $async.Future<$2.TransactionList> getTransactionsToThis(
      $grpc.ServiceCall call, $2.AccountPaginated request);
  $async.Future<$2.TransactionListExtention> getTransactionsToThis2(
      $grpc.ServiceCall call, $2.AccountPaginated request);
}

class DatabaseClient extends $grpc.Client {
  static final _$getBlockReference =
      $grpc.ClientMethod<$2.EmptyMessage, $2.BlockReference>(
          '/protocol.Database/getBlockReference',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.BlockReference.fromBuffer(value));
  static final _$getDynamicProperties =
      $grpc.ClientMethod<$2.EmptyMessage, $0.DynamicProperties>(
          '/protocol.Database/GetDynamicProperties',
          ($2.EmptyMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DynamicProperties.fromBuffer(value));
  static final _$getNowBlock = $grpc.ClientMethod<$2.EmptyMessage, $0.Block>(
      '/protocol.Database/GetNowBlock',
      ($2.EmptyMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Block.fromBuffer(value));
  static final _$getBlockByNum = $grpc.ClientMethod<$2.NumberMessage, $0.Block>(
      '/protocol.Database/GetBlockByNum',
      ($2.NumberMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Block.fromBuffer(value));

  DatabaseClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$2.BlockReference> getBlockReference(
      $2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockReference, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.DynamicProperties> getDynamicProperties(
      $2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getDynamicProperties, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Block> getNowBlock($2.EmptyMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getNowBlock, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Block> getBlockByNum($2.NumberMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBlockByNum, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class DatabaseServiceBase extends $grpc.Service {
  $core.String get $name => 'protocol.Database';

  DatabaseServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $2.BlockReference>(
        'getBlockReference',
        getBlockReference_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($2.BlockReference value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $0.DynamicProperties>(
        'GetDynamicProperties',
        getDynamicProperties_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($0.DynamicProperties value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.EmptyMessage, $0.Block>(
        'GetNowBlock',
        getNowBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.EmptyMessage.fromBuffer(value),
        ($0.Block value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.NumberMessage, $0.Block>(
        'GetBlockByNum',
        getBlockByNum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.NumberMessage.fromBuffer(value),
        ($0.Block value) => value.writeToBuffer()));
  }

  $async.Future<$2.BlockReference> getBlockReference_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getBlockReference(call, await request);
  }

  $async.Future<$0.DynamicProperties> getDynamicProperties_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getDynamicProperties(call, await request);
  }

  $async.Future<$0.Block> getNowBlock_Pre(
      $grpc.ServiceCall call, $async.Future<$2.EmptyMessage> request) async {
    return getNowBlock(call, await request);
  }

  $async.Future<$0.Block> getBlockByNum_Pre(
      $grpc.ServiceCall call, $async.Future<$2.NumberMessage> request) async {
    return getBlockByNum(call, await request);
  }

  $async.Future<$2.BlockReference> getBlockReference(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$0.DynamicProperties> getDynamicProperties(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$0.Block> getNowBlock(
      $grpc.ServiceCall call, $2.EmptyMessage request);
  $async.Future<$0.Block> getBlockByNum(
      $grpc.ServiceCall call, $2.NumberMessage request);
}

class NetworkClient extends $grpc.Client {
  NetworkClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);
}

abstract class NetworkServiceBase extends $grpc.Service {
  $core.String get $name => 'protocol.Network';

  NetworkServiceBase() {}
}
