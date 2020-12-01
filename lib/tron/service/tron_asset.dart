import 'dart:convert';
import 'dart:typed_data';

import 'package:bs58check/bs58check.dart';
import 'package:flash_tron_wallet/entity/tron/abi_entity.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/model/dex_info_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/tron/api/api.pbgrpc.dart';
import 'package:flash_tron_wallet/tron/core/Contract.pb.dart';
import 'package:flash_tron_wallet/tron/core/Tron.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/crypto.dart';

import 'package:ethereum_util/src/abi.dart' as abi;


class TronAsset {

  Future<bool> getAsset(BuildContext context, String userAddress, List<TokenRows> tokenList) async {
    //print('TronAsset getAsset');
    String tronGrpcIP = Provider.of<HomeProvider>(context, listen: false).tronGrpcIP;
    double trxPriceCny = Provider.of<HomeProvider>(context, listen: false).trxPriceCny;
    List<AssetEntity> list = [];
    final channel = ClientChannel(
      tronGrpcIP.trim(),
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = WalletClient(channel);
    Uint8List originAddress = base58.decode(userAddress).sublist(0, 21);
    try {
      Account response = await stub.getAccount(Account()..address = originAddress);
      //print('getAsset response:\n ${response.toProto3Json().toString()}');
      for (int i = 0; i < tokenList.length; i++) {
        if (tokenList[i].tokenType == 0) {
          AssetEntity trxEntity = TronAsset().getTrxBalance(response, userAddress, tokenList[i], trxPriceCny);
          list.add(trxEntity);
        } else if (tokenList[i].tokenType == 1) {
          AssetEntity trc10Entity = TronAsset().getTrc10Balance(response, userAddress, tokenList[i], trxPriceCny);
          list.add(trc10Entity);
        } else if (tokenList[i].tokenType == 2) {
          AssetEntity trc20Balance = await TronAsset().getTrc20Balance(stub, userAddress, tokenList[i], trxPriceCny);
          list.add(trc20Balance);
        }
      }
      Provider.of<HomeProvider>(context, listen: false).updateAssetList(list);
    } catch (e) {
      print(e);
      await channel.shutdown();
      return false;
    }
    await channel.shutdown();
    return true;
  }

  AssetEntity getTrxBalance(Account response, String userAddress, TokenRows item, double trxPriceCny) {
    AssetEntity entity = AssetEntity(type: 0, address: item.tokenAddress, name: item.tokenShort, precision: item.tokenPrecision, balance: 0, frozen: 0, order: 0, cny: 0, logoUrl: item.logoUrl);
    if (response != null && response.balance != null) {
      double trxBalance = response.balance.toDouble() / getPrecision(item.tokenPrecision);
      double trxCny = trxBalance * trxPriceCny;
      entity.balance = trxBalance;
      entity.cny = trxCny;
      if (response.frozen != null && response.frozen.length > 0 && response.frozen[0].frozenBalance != null) {
        double trxFrozen = response.frozen[0].frozenBalance.toDouble() / getPrecision(item.tokenPrecision);
        entity.frozen = trxFrozen;
        entity.cny += trxFrozen * trxPriceCny;
      }
      if (response.accountResource != null && response.accountResource.frozenBalanceForEnergy != null
          && response.accountResource.frozenBalanceForEnergy.frozenBalance != null) {
        double frozen4Energy = response.accountResource.frozenBalanceForEnergy.frozenBalance.toDouble() / getPrecision(item.tokenPrecision);
        entity.frozen += frozen4Energy;
        entity.cny += frozen4Energy * trxPriceCny;
      }
    }
    return entity;
  }

  AssetEntity getTrc10Balance(Account response, String userAddress, TokenRows item, double trxPriceCny) {
    AssetEntity entity = AssetEntity(type: 1, address: item.tokenAddress, name: item.tokenShort, precision: item.tokenPrecision, balance: 0, frozen: 0, order: 0, cny: 0, logoUrl: item.logoUrl);
    if (response != null && response.assetV2 != null && response.assetV2.length > 0) {
      if (response.assetV2[item.tokenAddress] != null) {
        double trc10Balance = response.assetV2[item.tokenAddress].toDouble() / getPrecision(item.tokenPrecision);
        entity.balance = trc10Balance;
        entity.cny = trc10Balance * item.priceTrx * trxPriceCny;
      }
    }
    return entity;
  }

  Future<AssetEntity> getTrc20Balance(WalletClient stub, String userAddress, TokenRows item, double trxPriceCny) async {
    AssetEntity entity = AssetEntity(type: 2, address: item.tokenAddress, name: item.tokenShort, precision: item.tokenPrecision, balance: 0, frozen: 0, order: 0, cny: 0, logoUrl: item.logoUrl);
    try {
      SmartContract response = await stub.getContract(BytesMessage()..value = base58.decode(item.tokenAddress).sublist(0, 21));
      String abiCode = jsonEncode(response.abi.toProto3Json()).substring(10);
      abiCode = abiCode.substring(0, abiCode.length - 1);
      //print('contractName:\n $contractName');
      //print('abiCode:\n $abiCode');

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
      Uint8List dataList = hexToBytes(bytesToHex(methodID) + bytesToHex(rawEncode));
      //print('encode dataList hex: ${bytesToHex(dataList)}');

      TriggerSmartContract req = TriggerSmartContract();
      req.ownerAddress = base58.decode(userAddress).sublist(0, 21);
      req.contractAddress = base58.decode(item.tokenAddress).sublist(0, 21);
      req.data = dataList;

      final result = await stub.triggerContract(req);
      //print('result: ${result.toProto3Json()}');
      //print('result msg: ${utf8.decode(result.result.message)}');
     // print('balance: ${bytesToInt(result.constantResult[0]).toInt()}');
      if (result != null && result.constantResult != null && result.constantResult.length > 0) {
        double balance = bytesToInt(result.constantResult[0]).toDouble() / getPrecision(item.tokenPrecision);
        entity.balance = balance;
        entity.cny = balance * item.priceTrx * trxPriceCny;
      }
    } catch (e) {
      print(e);
    }
    return entity;
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
