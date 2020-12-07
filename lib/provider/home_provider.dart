import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bs58check/bs58check.dart';
import 'package:flash_tron_wallet/config/config.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/model/dex_info_model.dart';
import 'package:flash_tron_wallet/service/method_service.dart';
import 'package:flash_tron_wallet/tron/api/api.pbgrpc.dart';
import 'package:flash_tron_wallet/tron/core/Tron.pb.dart';
import 'package:flash_tron_wallet/tron/service/tron_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class HomeProvider with ChangeNotifier {
  init() async {
    await getSelectWalletIndex();
    await getSelectWallet();
    await getDexInfo();
    await getAssetHide();
    await getAsset4Init();
    getAsset4ReloadAsync();
  }

  bool _backgroundFlag = false;

  get backgroundFlag => _backgroundFlag;

  changeBackgroundFlag(bool newFlag) {
    _backgroundFlag = newFlag;
    notifyListeners();
  }

  // ***wallet ***

  final _lock = Lock();

  List<WalletEntity> _walletList = [];
  List<WalletEntity> get walletList => _walletList;


  int _selectWalletIndex = -1;
  int get selectWalletIndex => _selectWalletIndex;

  WalletEntity _selectWalletEntity;
  WalletEntity get selectWalletEntity => _selectWalletEntity;

  String _selectWalletIndexKey = 'selectWalletIndexKey';
  String _selectWalletListKey = 'selectWalletListKey';

  getSelectWalletIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int temp = prefs.getInt(_selectWalletIndexKey);
    if (temp != null) {
      _selectWalletIndex = temp;
    }
    notifyListeners();
  }

  getSelectWallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tempList = prefs.getStringList(_selectWalletListKey);
    _walletList = [];
    if (tempList != null) {
      for (int i = 0; i < tempList.length; i++) {
        String temp = tempList[i];
        var respData = Map<String, dynamic>.from(json.decode(temp));
        WalletEntity item = WalletEntity.fromJson(respData);
        _walletList.add(item);
      }
      if (_walletList.length > _selectWalletIndex) {
        _selectWalletEntity = _walletList[_selectWalletIndex];
      }
    }
    notifyListeners();
  }

  Future<bool> saveSelectWalletIndex(int value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _selectWalletIndex = value;
      prefs.setInt(_selectWalletIndexKey, _selectWalletIndex);
    } catch (e) {
      print(e);
      return false;
    }
    notifyListeners();
    return true;
  }

  Future<bool> saveSelectWalletList(List<WalletEntity> dataList) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _walletList = dataList;
      List<String> tempList = [];
      for (int i = 0; i < dataList.length; i++) {
        String temp = json.encode(dataList[i]);
        tempList.add(temp);
      }
      prefs.setStringList(_selectWalletListKey, tempList);
    } catch (e) {
      print(e);
      return false;
    }
    notifyListeners();
    return true;
  }

  Future<bool> addWallet(WalletEntity item) async {
    try {
      _walletList.insert(0, item);
      _selectWalletIndex = 0;
      _selectWalletEntity = _walletList[0];

      SharedPreferences prefs = await SharedPreferences.getInstance();

      _selectWalletIndex = _selectWalletIndex;
      prefs.setInt(_selectWalletIndexKey, _selectWalletIndex);

      List<String> tempList = [];
      for (int i = 0; i < _walletList.length; i++) {
        String temp = json.encode(_walletList[i]);
        tempList.add(temp);
      }
      prefs.setStringList(_selectWalletListKey, tempList);
      notifyListeners();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> changeSelectWallet(int index) async {
    try {
      if (_walletList.length > index) {
        _selectWalletIndex = index;
        _selectWalletEntity = _walletList[index];
        notifyListeners();
        await saveSelectWalletIndex(index);
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
  
  Future<bool> updateName(int index, String newName) async {
    try {
      if (_walletList.length > index) {
        _walletList[index].name = newName;
        notifyListeners();
        await saveSelectWalletList(_walletList);
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> updatePwd(int index, String newPwd) async {
    try {
      if (_walletList.length > index) {
        _walletList[index].pwd = newPwd;
        notifyListeners();
        await saveSelectWalletList(_walletList);
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> delWallet(int index) async {
    try {
      if (_walletList.length > index) {
        _walletList.removeAt(index);
        if (_selectWalletIndex == index) {
          if (_walletList.length > 0) {
            _selectWalletIndex = 0;
            _selectWalletEntity = _walletList[0];
          } else {
            _selectWalletIndex = -1;
            _selectWalletEntity = null;
          }
        } else if (_selectWalletIndex > index) {
          _selectWalletIndex--;
          _selectWalletEntity = _walletList[_selectWalletIndex];
        }
        notifyListeners();
        await saveSelectWalletList(_walletList);
      }

    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }


  String _firstRandom = '';

  String get firstRandom => _firstRandom;

  changeFirstRandom(String value) {
    _firstRandom = value;
    notifyListeners();
  }

  String _secondRandom = '';

  String get secondRandom => _secondRandom;

  changeSecondRandom(String value) {
    _secondRandom = value;
    notifyListeners();
  }

  List<AssetEntity> _assetList = [];

  List<AssetEntity> get assetList => _assetList;

  updateAssetList(List<AssetEntity> list) {
    _assetList = list;
    notifyListeners();
  }

  String _assetHide = '0';

  String get assetHide => _assetHide;

  Future<bool> updateAssetHide(String value) async {
    //print('updateAssetHide start');
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _assetHide = value;
      prefs.setString('assetHide', value);
    } catch (e) {
      print(e);
      return false;
    }
    //print('updateAssetHide end');
    notifyListeners();
    return true;
  }

  getAssetHide() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString('assetHide');
    if (value != null && value != '') {
      _assetHide = value;
    }
    notifyListeners();
  }

  int _selectAssetFilterIndex = 0;

  int get selectAssetFilterIndex => _selectAssetFilterIndex;

  changeSelectAssetFilterIndex(int index) {
    _selectAssetFilterIndex = index;
    notifyListeners();
  }

  DexInfo _dexInfo = DexInfo(
      tronGrpcIP: 'grpc.shasta.trongrid.io',
      trxPriceUsdt: 0.01500,
      usdtPriceCny: 7.18);

  DexInfo get dexInfo => _dexInfo;

  int _chainType = 1;

  int get chainType => _chainType;

  String _tronGrpcIP = 'grpc.shasta.trongrid.io';

  String get tronGrpcIP => _tronGrpcIP;

  double _usdtPriceCny = 7.18;

  double get usdtPriceCny => _usdtPriceCny;

  double _dexLimitOrderTrx = 10.0;

  double get dexLimitOrderTrx => _dexLimitOrderTrx;

  double _trxPriceCny = 0.015000 * 7.18;

  double get trxPriceCny => _trxPriceCny;

  List<TokenRows> _tokenList = [
    TokenRows(
        id: 1,
        tokenType: 0,
        tokenShort: 'TRX',
        tokenAddress: 'T9yD14Nj9j7xAB4dbGeiX9h8unkKHxuWwb',
        tokenPrecision: 6,
        logoUrl: '',
        priceTrx: 1,
        status: 1),
  ];

  List<TokenRows> get tokenList => _tokenList;

  String _dexContract;

  String get dexContract => _dexContract;

  getDexInfo() async {
    //print('getDexInfo start');
    try {
      String url = servicePath['dexInfoQuery'];
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      _currentVersion = packageInfo.version;
      await requestGet(url).then((val) {
        var respData = Map<String, dynamic>.from(val);
        DexInfoRespModel respModel = DexInfoRespModel.fromJson(respData);
        if (respModel != null &&
            respModel.code == 0 &&
            respModel.data != null) {
          if (respModel.data.dexInfo != null) {
            _dexInfo = respModel.data.dexInfo;
            if (_dexInfo.dexLimitOrderTrx != null) {
              _dexLimitOrderTrx = _dexInfo.dexLimitOrderTrx;
            }
            if (_dexInfo.dexContract != null) {
              _dexContract = _dexInfo.dexContract;
            }
            if (_dexInfo.chainType != null) {
              _chainType = _dexInfo.chainType;
            }

            if (_dexInfo.tronGrpcIP != null) {
              _tronGrpcIP = _dexInfo.tronGrpcIP;
            }
            if (_dexInfo.trxPriceUsdt != null &&
                _dexInfo.usdtPriceCny != null) {
              _usdtPriceCny = _dexInfo.usdtPriceCny;
              _trxPriceCny = _dexInfo.trxPriceUsdt * _dexInfo.usdtPriceCny;
            }
          }

          if (respModel.data.tokenRows != null &&
              respModel.data.tokenRows.length > 0) {
            _tokenList = respModel.data.tokenRows;
          }
        }
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
    //print('getDexInfo end');
  }


  getAsset4Init() async {
    if (_selectWalletEntity == null) {
      if (_assetList != null && _assetList.length > 0) {
        _assetList = [];
      }
      notifyListeners();
      return;
    }
    try {
      List<AssetEntity> list = [];
      for (int i = 0; i < tokenList.length; i++) {
        TokenRows item = tokenList[i];
        AssetEntity entity = AssetEntity(type: item.tokenType, address: item.tokenAddress, name: item.tokenShort, precision: item.tokenPrecision, balance: 0, frozen: 0, order: 0, cny: 0, logoUrl: item.logoUrl);
        list.add(entity);
      }
      _assetList = list;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  // 异步
  getAsset4ReloadAsync() async {
    if (_selectWalletEntity == null) {
      if (_assetList != null && _assetList.length > 0) {
        _assetList = [];
      }
      notifyListeners();
      return;
    }
    try {
      String userAddress = _selectWalletEntity.tronAddress;
      for (int i = 0; i < tokenList.length; i++) {
        if (tokenList[i].tokenType == 0) {
          getTrxBalance4Async(userAddress, tokenList[i], trxPriceCny);
        } else if (tokenList[i].tokenType == 2) {
          getTrc20Balance4Async(userAddress, tokenList[i], trxPriceCny);
        }
      }
    } catch (e) {
      print(e);
    }

  }

  getTrxBalance4Async(String userAddress, TokenRows item, double trxPriceCny) async {
    final channel = ClientChannel(
      tronGrpcIP.trim(),
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = WalletClient(channel);
    try {
      Uint8List originAddress = base58.decode(userAddress).sublist(0, 21);
      Account response = await stub.getAccount(Account()..address = originAddress);
      AssetEntity entity = TronAsset().getTrxBalance(response, userAddress, item, trxPriceCny);
      //print('getTrxBalance4Async:${entity.toJson()}, length:${_assetList.length}');
      for (int i = 0; i < _assetList.length; i++) {
        if (_assetList[i].address == entity.address) {
          _assetList[i].type = entity.type;
          _assetList[i].address = entity.address;
          _assetList[i].name = entity.name;
          _assetList[i].precision = entity.precision;
          _assetList[i].balance = entity.balance;
          _assetList[i].frozen = entity.frozen;
          _assetList[i].order = entity.order;
          _assetList[i].cny = entity.cny;
          _assetList[i].logoUrl = entity.logoUrl;
          notifyListeners();
          break;
        }
      }
      return;
    } catch (e) {
      print(e);
    } finally {
      await channel.shutdown();
    }
  }

  getTrc20Balance4Async(String userAddress, TokenRows item, double trxPriceCny) async {
    final channel = ClientChannel(
      tronGrpcIP.trim(),
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    try {
      final stub = WalletClient(channel);
      AssetEntity entity = await TronAsset().getTrc20Balance(stub, userAddress, item, trxPriceCny);
      //print('getTrc20Balance4Async:${entity.toJson()}, length:${_assetList.length}');
      for (int i = 0; i < _assetList.length; i++) {
        if (_assetList[i].address == entity.address) {
          _assetList[i].type = entity.type;
          _assetList[i].address = entity.address;
          _assetList[i].name = entity.name;
          _assetList[i].precision = entity.precision;
          _assetList[i].balance = entity.balance;
          _assetList[i].frozen = entity.frozen;
          _assetList[i].order = entity.order;
          _assetList[i].cny = entity.cny;
          _assetList[i].logoUrl = entity.logoUrl;
          notifyListeners();
          break;
        }
      }
      return;
    } catch (e) {
      print(e);
    } finally{
      await channel.shutdown();
    }
  }

  // 同步
  getAsset4ReloadSync() async {
    if (_selectWalletEntity == null) {
      if (_assetList != null && _assetList.length > 0) {
        _assetList = [];
      }
      notifyListeners();
      return;
    }
    String userAddress = _selectWalletEntity.tronAddress;
    String tronGrpcIP = _tronGrpcIP;
    double trxPriceCny = _trxPriceCny;
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
      for (int i = 0; i < tokenList.length; i++) {
        if (tokenList[i].tokenType == 0) {
          AssetEntity trxEntity = TronAsset().getTrxBalance(response, userAddress, tokenList[i], trxPriceCny);
          list.add(trxEntity);
        } else if (tokenList[i].tokenType == 1) {
          AssetEntity trc10Entity = TronAsset().getTrc10Balance(response, userAddress, tokenList[i], trxPriceCny);
          list.add(trc10Entity);
        } else if (tokenList[i].tokenType == 2) {
          AssetEntity trc20Balance = await TronAsset()
              .getTrc20Balance(stub, userAddress, tokenList[i], trxPriceCny);
          list.add(trc20Balance);
        }
      }
      _assetList = list;
      notifyListeners();
    } catch (e) {
      print(e);
    }
    await channel.shutdown();
  }


  bool _importKeyLoading = false;

  get importKeyLoading => _importKeyLoading;

  changeImportKeyLoading(bool value) {
    _importKeyLoading = value;
    notifyListeners();
  }

  bool _importMnemonicLoading = false;

  get importMnemonicLoading => _importMnemonicLoading;

  changeImportMnemonicLoading(bool value) {
    _importMnemonicLoading = value;
    notifyListeners();
  }

  bool _buildWalletLoading = false;

  bool get buildWalletLoading => _buildWalletLoading;

  changeBuildWalletLoading(bool value) {
    _buildWalletLoading = value;
    notifyListeners();
  }

  bool _appDownloaded = false;

  bool get appDownloaded => _appDownloaded;

  changeAppDownloaded(bool value) {
    _appDownloaded = value;
  }

  String _currentVersion = '';

  String get currentVersion => _currentVersion;
}


class TransferFilterModel {
  String name;
  String value;

  TransferFilterModel({this.name, this.value});
}