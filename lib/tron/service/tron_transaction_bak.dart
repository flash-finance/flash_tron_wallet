import 'dart:convert';
import 'dart:typed_data';

import 'package:bs58check/bs58check.dart';
import 'package:crypto/crypto.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flash_tron_wallet/entity/tron/abi_entity.dart';
import 'package:flash_tron_wallet/google/protobuf/any.pb.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/tron/api/api.pbgrpc.dart';
import 'package:flash_tron_wallet/tron/core/Contract.pb.dart';
import 'package:flash_tron_wallet/tron/core/Tron.pb.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/crypto.dart';

import 'msg_signature.dart';

import 'package:ethereum_util/src/abi.dart' as abi;

class TronTransactionBak {
  Future<bool> transTrx(BuildContext context, String fromAddress,
      String toAddress, Int64 amount) async {
    print('TronTransaction transTrx');
    String tronGrpcIP =
        Provider.of<HomeProvider>(context, listen: false).tronGrpcIP;
    final channel = ClientChannel(
      tronGrpcIP.trim(),
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = WalletClient(channel);
    Uint8List originFromAddress = base58.decode(fromAddress).sublist(0, 21);
    Uint8List originToAddress = base58.decode(toAddress).sublist(0, 21);
    try {
      final tc = TransferContract();
      tc.ownerAddress = originFromAddress;
      tc.toAddress = originToAddress;
      tc.amount = amount;

      TransactionExtention trxResult = await stub.createTransaction2(tc);
      Transaction transaction = trxResult.transaction;
      Transaction_raw rawData = trxResult.transaction.rawData;
      Uint8List hash = sha256.convert(rawData.writeToBuffer()).bytes;

      String hexPrivateKey = Provider.of<HomeProvider>(context, listen: false)
          .selectWalletEntity
          .privateKey;

      MsgSignature msgSignature = sign(hash, hexToBytes(hexPrivateKey));

      TronMsgSignature msgSignature2 = TronMsgSignature(
          intToBytes(msgSignature.r),
          intToBytes(msgSignature.s),
          msgSignature.v);
      Uint8List ms2 = msgSignature2.getSignature();

      transaction.signature.add(ms2);

      Return result = await stub.broadcastTransaction(transaction);
      if (result.toProto3Json().toString().contains('true') == true) {
        await channel.shutdown();
        return true;
      } else {
        print('transTrx result error msg: ${utf8.decode(result.message)}');
        await channel.shutdown();
        return false;
      }
    } catch (e) {
      print(e);
      await channel.shutdown();
      return false;
    }
  }

  Future<bool> transTrc20(BuildContext context, String contractAddress,
      String fromAddress, String toAddress, int amount) async {
    print('TronTransaction transTrc20');
    String tronGrpcIP =
        Provider.of<HomeProvider>(context, listen: false).tronGrpcIP;
    final channel = ClientChannel(
      tronGrpcIP.trim(),
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = WalletClient(channel);
    try {
      SmartContract response = await stub.getContract(BytesMessage()
        ..value = base58.decode(contractAddress).sublist(0, 21));
      String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
      abiCode = abiCode.substring(0, abiCode.length - 1);

      String functionName = 'transfer';
      AbiEntity abiEntity = AbiEntity.fromJson(response.abi.toProto3Json());
      List<String> inputList = [];
      if (abiEntity != null && abiEntity.entrys != null) {
        for (Entrys item in abiEntity.entrys) {
          if (functionName == item.name) {
            if (item.inputs != null) {
              for (Inputs input in item.inputs) {
                inputList.add(input.type);
              }
            }
          }
        }
      }

      Uint8List methodID = abi.methodID(functionName, inputList);

      List<dynamic> params = [];
      String abiToAddress = getAbiTronAddress(toAddress);
      params.add(abiToAddress);
      params.add(BigInt.from(amount));

      Uint8List rawEncode = abi.rawEncode(inputList, params);
      Uint8List dataList =
          hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));
      //print('encode dataList1 hex: ${bytesToHex(dataList)}');

      String hexPrivateKey = Provider.of<HomeProvider>(context, listen: false)
          .selectWalletEntity
          .privateKey;

      bool flag = await execute(
          stub, hexPrivateKey, fromAddress, contractAddress, dataList, 0);
      await channel.shutdown();
      return flag;
    } catch (e) {
      print(e);
      await channel.shutdown();
      return false;
    }
  }

  Future<bool> trc20Approve(BuildContext context, String contractAddress,
      String fromAddress, String toAddress, int amount) async {
    print('TronTransaction trc20Approve');
    String tronGrpcIP =
        Provider.of<HomeProvider>(context, listen: false).tronGrpcIP;
    final channel = ClientChannel(
      tronGrpcIP.trim(),
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = WalletClient(channel);
    try {
      SmartContract response = await stub.getContract(BytesMessage()
        ..value = base58.decode(contractAddress).sublist(0, 21));
      String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
      abiCode = abiCode.substring(0, abiCode.length - 1);

      String functionName = 'approve';
      AbiEntity abiEntity = AbiEntity.fromJson(response.abi.toProto3Json());
      List<String> inputList = [];
      if (abiEntity != null && abiEntity.entrys != null) {
        for (Entrys item in abiEntity.entrys) {
          if (functionName == item.name) {
            if (item.inputs != null) {
              for (Inputs input in item.inputs) {
                inputList.add(input.type);
              }
            }
          }
        }
      }

      Uint8List methodID = abi.methodID(functionName, inputList);

      List<dynamic> params = [];
      String abiToAddress = getAbiTronAddress(toAddress);
      params.add(abiToAddress);
      params.add(BigInt.from(amount));

      Uint8List rawEncode = abi.rawEncode(inputList, params);
      Uint8List dataList =
          hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));
      //print('encode dataList1 hex: ${bytesToHex(dataList)}');

      String hexPrivateKey = Provider.of<HomeProvider>(context, listen: false)
          .selectWalletEntity
          .privateKey;

      bool flag = await execute(
          stub, hexPrivateKey, fromAddress, contractAddress, dataList, 0);
      await channel.shutdown();
      return flag;
    } catch (e) {
      print(e);
      await channel.shutdown();
      return false;
    }
  }

  Future<bool> trc20DexOrder(
      BuildContext context,
      String contractAddress,
      int orderType,
      String userAddress,
      String quoteTokenAddress,
      int quoteAmount,
      String baseTokenAddress,
      int baseAmount,
      int tradePrice,
      int channelID) async {
    print('TronTransaction trc20DexOrder');
    String tronGrpcIP =
        Provider.of<HomeProvider>(context, listen: false).tronGrpcIP;
    final channel = ClientChannel(
      tronGrpcIP.trim(),
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = WalletClient(channel);
    try {
      SmartContract response = await stub.getContract(BytesMessage()
        ..value = base58.decode(contractAddress).sublist(0, 21));
      String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
      abiCode = abiCode.substring(0, abiCode.length - 1);

      String functionName = orderType == 1 ? 'buy' : 'sell';
      AbiEntity abiEntity = AbiEntity.fromJson(response.abi.toProto3Json());
      List<String> inputList = [];
      if (abiEntity != null && abiEntity.entrys != null) {
        for (Entrys item in abiEntity.entrys) {
          if (functionName == item.name) {
            if (item.inputs != null) {
              for (Inputs input in item.inputs) {
                inputList.add(input.type);
              }
            }
          }
        }
      }

      Uint8List methodID = abi.methodID(functionName, inputList);

      List<dynamic> params = [];
      String abiQuoteTokenAddress = getAbiTronAddress(quoteTokenAddress);
      params.add(abiQuoteTokenAddress);
      params.add(BigInt.from(quoteAmount));

      String abiBaseTokenAddress = getAbiTronAddress(baseTokenAddress);
      params.add(abiBaseTokenAddress);
      params.add(BigInt.from(baseAmount));

      params.add(BigInt.from(tradePrice));
      params.add(BigInt.from(channelID));

      Uint8List rawEncode = abi.rawEncode(inputList, params);
      Uint8List dataList =
          hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));
      //print('encode dataList1 hex: ${bytesToHex(dataList)}');

      String hexPrivateKey = Provider.of<HomeProvider>(context, listen: false)
          .selectWalletEntity
          .privateKey;

      int callValue = 0;
      if (orderType == 1) {
        callValue = baseAmount;
      }
      bool flag = await execute(stub, hexPrivateKey, userAddress,
          contractAddress, dataList, callValue);
      await channel.shutdown();
      return flag;
    } catch (e) {
      print(e);
      await channel.shutdown();
      return false;
    }
  }

  Future<bool> trc20DexCancel(BuildContext context, String contractAddress,
      String userAddress, int orderID) async {
    print('TronTransaction trc20DexCancel');
    String tronGrpcIP =
        Provider.of<HomeProvider>(context, listen: false).tronGrpcIP;
    final channel = ClientChannel(
      tronGrpcIP.trim(),
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = WalletClient(channel);
    try {
      SmartContract response = await stub.getContract(BytesMessage()
        ..value = base58.decode(contractAddress).sublist(0, 21));
      String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
      abiCode = abiCode.substring(0, abiCode.length - 1);

      String functionName = 'cancel';
      AbiEntity abiEntity = AbiEntity.fromJson(response.abi.toProto3Json());
      List<String> inputList = [];
      if (abiEntity != null && abiEntity.entrys != null) {
        for (Entrys item in abiEntity.entrys) {
          if (functionName == item.name) {
            if (item.inputs != null) {
              for (Inputs input in item.inputs) {
                inputList.add(input.type);
              }
            }
          }
        }
      }

      Uint8List methodID = abi.methodID(functionName, inputList);

      List<dynamic> params = [];
      params.add(BigInt.from(orderID));

      Uint8List rawEncode = abi.rawEncode(inputList, params);
      Uint8List dataList =
          hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));
      //print('encode dataList1 hex: ${bytesToHex(dataList)}');

      String hexPrivateKey = Provider.of<HomeProvider>(context, listen: false)
          .selectWalletEntity
          .privateKey;

      int callValue = 0;
      bool flag = await execute(stub, hexPrivateKey, userAddress,
          contractAddress, dataList, callValue);
      await channel.shutdown();
      return flag;
    } catch (e) {
      print(e);
      await channel.shutdown();
      return false;
    }
  }

  Future<bool> execute(
      WalletClient stub,
      String hexPrivateKey,
      String base58OwnerAddress,
      String base58ContractAddress,
      Uint8List dataList,
      int callValue) async {
    final TriggerSmartContract req = TriggerSmartContract();
    req.ownerAddress = base58.decode(base58OwnerAddress).sublist(0, 21);
    req.contractAddress = base58.decode(base58ContractAddress).sublist(0, 21);
    req.callValue = Int64(callValue);
    req.data = dataList;

    Transaction trans = await buildTransaction(stub, req, hexPrivateKey,
        Transaction_Contract_ContractType.TriggerSmartContract, dataList);
    Return result = await stub.broadcastTransaction(trans);

    if (result.toProto3Json().toString().contains('true') == true) {
      print('execute success');
      return true;
    } else {
      print('execute error msg: ${utf8.decode(result.message)}');
      return false;
    }
  }

  Future<Transaction> buildTransaction(
      WalletClient stub,
      TriggerSmartContract req,
      String hexPrivateKey,
      Transaction_Contract_ContractType ctxType,
      Uint8List data) async {
    Transaction trans = Transaction();
    trans.rawData = Transaction_raw();
    Transaction_Contract transContract = Transaction_Contract();
    transContract.type = ctxType;
    transContract.parameter = Any.pack(req);
    trans.rawData.contract.add(transContract);

    BlockExtention resp = await stub.getNowBlock2(EmptyMessage());
    trans.rawData.refBlockBytes = resp.blockHeader.rawData.number
        .toBytes()
        .reversed
        .toList()
        .sublist(6, 8);
    trans.rawData.refBlockHash = sha256
        .convert(resp.blockHeader.rawData.writeToBuffer())
        .bytes
        .sublist(8, 16);
    trans.rawData.timestamp =
        Int64(DateTime.now().toUtc().millisecondsSinceEpoch);
    trans.rawData.feeLimit = Int64(10 * 1000000);
    trans.rawData.expiration = Int64(DateTime.now()
        .toUtc()
        .add(Duration(seconds: 180))
        .millisecondsSinceEpoch);

    Uint8List hash = sha256.convert(trans.rawData.writeToBuffer()).bytes;
    //print('hash: ${bytesToHex(hash)}');

    MsgSignature msgSignature = sign(hash, hexToBytes(hexPrivateKey));

    TronMsgSignature msgSignature2 = TronMsgSignature(
        intToBytes(msgSignature.r), intToBytes(msgSignature.s), msgSignature.v);
    Uint8List ms2 = msgSignature2.getSignature();

    trans.signature.add(ms2);
    return trans;
  }

  String getAbiTronAddress(String base58Address) {
    Uint8List address = base58.decode(base58Address).sublist(1, 21);
    return '0x' + bytesToHex(address);
  }
}