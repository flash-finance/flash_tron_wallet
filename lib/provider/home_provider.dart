import 'dart:async';
import 'dart:typed_data';

import 'package:bs58check/bs58check.dart';
import 'package:flash_tron_wallet/config/service_config.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/model/dex_info_model.dart';
import 'package:flash_tron_wallet/service/method_service.dart';
import 'package:flash_tron_wallet/tron/api/api.pbgrpc.dart';
import 'package:flash_tron_wallet/tron/core/Tron.pb.dart';
import 'package:flash_tron_wallet/tron/service/tron_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class HomeProvider with ChangeNotifier {
  init() async {
    await getWalletEntity();
    await getDexInfo();
    await getAssetHide();
    await getAsset4Init();
  }

  bool _backgroundFlag = false;

  get backgroundFlag => _backgroundFlag;

  changeBackgroundFlag(bool newFlag) {
    _backgroundFlag = newFlag;
    notifyListeners();
  }

  // ***wallet ***

  final _lock = Lock();

  WalletEntity _walletEntity;

  WalletEntity get walletEntity => _walletEntity;

  String _nameKey = 'name';

  String _pwdKey = 'pwd';

  String _mnemonicKey = 'mnemonic';

  String _privKey = 'private';

  String _addressKey = 'address';

  getWalletEntity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _name = prefs.getString(_nameKey);
    _pwd = prefs.getString(_pwdKey);
    _mnemonic = prefs.getString(_mnemonicKey);
    _privateKey = prefs.getString(_privKey);
    _tronAddress = prefs.getString(_addressKey);
    notifyListeners();
  }

  Future<bool> saveWalletEntity(WalletEntity entity) async {
    //print('saveWalletEntity start');
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _name = entity.name;
      prefs.setString(_nameKey, entity.name);
      _pwd = entity.pwd;
      prefs.setString(_pwdKey, entity.pwd);
      _mnemonic = entity.mnemonic;
      prefs.setString(_mnemonicKey, entity.mnemonic);
      _privateKey = entity.privateKey;
      prefs.setString(_privKey, entity.privateKey);
      _tronAddress = entity.tronAddress;
      prefs.setString(_addressKey, entity.tronAddress);
    } catch (e) {
      print(e);
      return false;
    }
    //print('saveWalletEntity end');
    notifyListeners();
    return true;
  }

  Future<bool> updateName(String newName) async {
    //print('updateName start');
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _name = newName;
      prefs.setString(_nameKey, newName);
    } catch (e) {
      print(e);
      return false;
    }
    //print('updateName end');
    notifyListeners();
    return true;
  }

  Future<bool> updatePwd(String newPwd) async {
    //print('updatePwd start');
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _pwd = newPwd;
      prefs.setString(_pwdKey, newPwd);
    } catch (e) {
      print(e);
      return false;
    }
    //print('updatePwd end');
    notifyListeners();
    return true;
  }

  Future<bool> delWallet() async {
    //print('delWallet start');
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _name = null;
      prefs.remove(_nameKey);
      _pwd = null;
      prefs.remove(_pwdKey);
      _mnemonic = null;
      prefs.remove(_mnemonicKey);
      _privateKey = null;
      prefs.remove(_privKey);
      _tronAddress = null;
      prefs.remove(_addressKey);
      notifyListeners();
      _assetList = [];
      notifyListeners();
    } catch (e) {
      print(e);
      return false;
    }
    //print('delWallet end');
    return true;
  }

  String _name;

  String get name => _name;

  Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _name = prefs.getString(_nameKey);
    notifyListeners();
    return _name;
  }

  String _pwd;

  String get pwd => _pwd;

  Future<String> getPwd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _pwd = prefs.getString(_pwdKey);
    notifyListeners();
    return _pwd;
  }

  String _mnemonic;

  String get mnemonic => _mnemonic;

  Future<String> getMnemonic() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _mnemonic = prefs.getString(_mnemonicKey);
    notifyListeners();
    return _mnemonic;
  }

  String _privateKey;

  String get privateKey => _privateKey;

  Future<String> getPrivateKey(String pwd) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _privateKey = prefs.getString(_privKey);
    notifyListeners();
    return _privateKey;
  }

  String _tronAddress;

  String get tronAddress => _tronAddress;

  Future<String> getTronAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tronAddress = prefs.getString(_addressKey);
    notifyListeners();
    return _tronAddress;
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

  String _thirdRandom = '';

  String get thirdRandom => _thirdRandom;

  changeThirdRandom(String value) {
    _thirdRandom = value;
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

  bool _assetFilterShowHide = true;

  bool get assetFilterShowHide => _assetFilterShowHide;

  changeAssetFilterShowHide(bool flag) {
    _assetFilterShowHide = flag;
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

  int _selectTransferFilterIndex = 0;

  int get selectTransferFilterIndex => _selectTransferFilterIndex;

  changeSelectTransferFilterIndex(int index) {
    _selectTransferFilterIndex = index;
    notifyListeners();
  }

  List<TransferFilterModel> get transferFilterList => _transferFilterList;

  List<TransferFilterModel> _transferFilterList = [
    TransferFilterModel(name: '全部', value: 'all'),
    TransferFilterModel(name: '转出', value: 'out'),
    TransferFilterModel(name: '转入', value: 'in'),
  ];

  getAsset4Init() async {
    if (_tronAddress == null) {
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
        AssetEntity entity = AssetEntity(type: 0, address: item.tokenAddress, name: item.tokenShort, precision: item.tokenPrecision, balance: 0, frozen: 0, order: 0, cny: 0, logoUrl: item.logoUrl);
        list.add(entity);
      }
      _assetList = list;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getAsset4Reload() async {
    if (_tronAddress == null) {
      if (_assetList != null && _assetList.length > 0) {
        _assetList = [];
      }
      notifyListeners();
      return;
    }
    String userAddress = _tronAddress;
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