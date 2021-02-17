import 'dart:convert';
import 'dart:typed_data';

import 'package:bs58check/bs58check.dart';
import 'package:crypto/crypto.dart';
import 'package:ethereum_util/src/abi.dart' as abi;
import 'package:fixnum/fixnum.dart';
import 'package:flash_tron_wallet/entity/tron/abi_entity.dart';
import 'package:flash_tron_wallet/google/protobuf/any.pb.dart';
import 'package:flash_tron_wallet/tron/api/api.pbgrpc.dart';
import 'package:flash_tron_wallet/tron/core/Contract.pb.dart';
import 'package:flash_tron_wallet/tron/core/Tron.pb.dart';
import 'package:flash_tron_wallet/tron/grpc/grpc_client.dart';
import 'package:web3dart/crypto.dart';

import 'msg_signature.dart';

class TronSwap {
  Future<String> getTrxBalance(String tronGrpcIP, String userAddress) async {
    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    final stub = WalletClient(channel);
    try {
      Uint8List originAddress = base58.decode(userAddress).sublist(0, 21);
      Account response =
          await stub.getAccount(Account()..address = originAddress);
      if (response != null && response.balance != null) {
        String trxBalance = response.balance.toDouble().toString();
        return trxBalance;
      } else {
        return '0';
      }
    } catch (e) {
      print(e);
      return '0';
    }
  }

  Future<String> getTrc20Balance(
      String tronGrpcIP, String userAddress, String tokenAddress) async {
    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    final stub = WalletClient(channel);
    try {
      SmartContract response = await stub.getContract(
          BytesMessage()..value = base58.decode(tokenAddress).sublist(0, 21));
      String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
      abiCode = abiCode.substring(0, abiCode.length - 1);

      String abiUserAddress = getAbiTronAddress(userAddress);
      String functionName = 'balanceOf';

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
      Uint8List rawEncode = abi.rawEncode(inputList, [abiUserAddress]);
      Uint8List dataList =
          hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));

      TriggerSmartContract req = TriggerSmartContract();
      req.ownerAddress = base58.decode(userAddress).sublist(0, 21);
      req.contractAddress = base58.decode(tokenAddress).sublist(0, 21);
      req.data = dataList;

      final result = await stub.triggerContract(req);
      if (result != null &&
          result.constantResult != null &&
          result.constantResult.length > 0) {
        String balance = bytesToInt(result.constantResult[0]).toString();
        return balance;
      } else {
        return '0';
      }
    } catch (e) {
      print(e);
      return '0';
    }
  }

  Future<String> allowance(String tronGrpcIP, String userAddress,
      String swapTokenAddress, String flashSwapAddress) async {
    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    final stub = WalletClient(channel);
    try {
      SmartContract response = await stub.getContract(BytesMessage()
        ..value = base58.decode(swapTokenAddress).sublist(0, 21));
      String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
      abiCode = abiCode.substring(0, abiCode.length - 1);

      String functionName = 'allowance';
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
      params.add(getAbiTronAddress(userAddress));
      params.add(getAbiTronAddress(flashSwapAddress));

      Uint8List rawEncode = abi.rawEncode(inputList, params);
      Uint8List dataList =
          hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));

      TriggerSmartContract req = TriggerSmartContract();
      req.ownerAddress = base58.decode(userAddress).sublist(0, 21);
      req.contractAddress = base58.decode(swapTokenAddress).sublist(0, 21);
      req.data = dataList;

      final result = await stub.triggerContract(req);
      if (result != null &&
          result.constantResult != null &&
          result.constantResult.length > 0) {
        String balance = bytesToInt(result.constantResult[0]).toString();
        return balance;
      } else {
        return '';
      }
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<bool> approve(String tronGrpcIP, String userAddress, String privateKey,
      String swapTokenAddress, String flashSwapAddress) async {
    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    final stub = WalletClient(channel);
    try {
      SmartContract response = await stub.getContract(BytesMessage()
        ..value = base58.decode(swapTokenAddress).sublist(0, 21));
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
      params.add(getAbiTronAddress(flashSwapAddress));
      params.add(
          '0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff');

      Uint8List rawEncode = abi.rawEncode(inputList, params);
      Uint8List dataList =
          hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));

      bool flag = await execute(
          stub, privateKey, userAddress, swapTokenAddress, dataList, 0);
      return flag;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> trxToTokenSwap(
      String tronGrpcIP,
      String userAddress,
      String privateKey,
      String flashSwapAddress,
      String swapTokenAddress,
      String lpTokenAddress,
      String trxSold) async {
    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    final stub = WalletClient(channel);
    try {
      SmartContract response = await stub.getContract(BytesMessage()
        ..value = base58.decode(flashSwapAddress).sublist(0, 21));
      String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
      abiCode = abiCode.substring(0, abiCode.length - 1);

      String functionName = 'trxToTokenSwap';
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
      params.add(getAbiTronAddress(swapTokenAddress));
      params.add(getAbiTronAddress(lpTokenAddress));
      int minTokens = 1;
      params.add(BigInt.from(minTokens));
      params.add(getAbiTronAddress(userAddress));

      Uint8List rawEncode = abi.rawEncode(inputList, params);
      Uint8List dataList =
          hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));

      double trxSoldValue = double.parse(trxSold);

      bool flag = await execute(stub, privateKey, userAddress, flashSwapAddress,
          dataList, BigInt.from(trxSoldValue).toInt());
      return flag;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> tokenToTrxSwap(
      String tronGrpcIP,
      String userAddress,
      String privateKey,
      String flashSwapAddress,
      String swapTokenAddress,
      String lpTokenAddress,
      String tokensSold) async {
    print('TronSwap tokenToTrxSwap');

    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    final stub = WalletClient(channel);
    try {
      SmartContract response = await stub.getContract(BytesMessage()
        ..value = base58.decode(flashSwapAddress).sublist(0, 21));
      String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
      abiCode = abiCode.substring(0, abiCode.length - 1);

      String functionName = 'tokenToTrxSwap';
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
      params.add(getAbiTronAddress(swapTokenAddress));
      params.add(getAbiTronAddress(lpTokenAddress));

      String tokensSoldValue = tokensSold;
      params.add(tokensSoldValue);
      int minTrx = 1;
      params.add(BigInt.from(minTrx));
      params.add(getAbiTronAddress(userAddress));

      Uint8List rawEncode = abi.rawEncode(inputList, params);
      Uint8List dataList =
          hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));
      //print('encode dataList1 hex: ${bytesToHex(dataList)}');

      bool flag = await execute(
          stub, privateKey, userAddress, flashSwapAddress, dataList, 0);
      return flag;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> tokenToTokenSwap(
      String tronGrpcIP,
      String userAddress,
      String privateKey,
      String flashSwapAddress,
      String swapTokenAddress,
      String lpTokenAddress,
      String tokensSold,
      String targetTokenAddress) async {
    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    final stub = WalletClient(channel);
    try {
      SmartContract response = await stub.getContract(BytesMessage()
        ..value = base58.decode(flashSwapAddress).sublist(0, 21));
      String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
      abiCode = abiCode.substring(0, abiCode.length - 1);

      String functionName = 'tokenToTokenSwap';
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
      params.add(getAbiTronAddress(swapTokenAddress));
      params.add(getAbiTronAddress(lpTokenAddress));
      String tokensSoldValue = tokensSold;
      params.add(tokensSoldValue);
      int minTokensBought = 1;
      params.add(BigInt.from(minTokensBought));
      int minTrxBought = 1;
      params.add(BigInt.from(minTrxBought));
      params.add(getAbiTronAddress(userAddress));
      params.add(getAbiTronAddress(targetTokenAddress));

      Uint8List rawEncode = abi.rawEncode(inputList, params);
      Uint8List dataList =
          hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));
      //print('encode dataList1 hex: ${bytesToHex(dataList)}');

      bool flag = await execute(
          stub, privateKey, userAddress, flashSwapAddress, dataList, 0);
      return flag;
    } catch (e) {
      print(e);
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
    trans.rawData.feeLimit = Int64(100 * 1000000);
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

  double getPrecision(int precision) {
    double result = 1;
    double baseValue = 10;
    for (int i = 0; i < precision; i++) {
      result = result * baseValue;
    }
    return result;
  }
}
