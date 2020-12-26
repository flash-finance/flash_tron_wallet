import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bs58check/bs58check.dart';
import 'package:flash_tron_wallet/common/common_config.dart';
import 'package:flash_tron_wallet/common/common_service.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/model/tron_info_model.dart';
import 'package:flash_tron_wallet/tron/api/api.pbgrpc.dart';
import 'package:flash_tron_wallet/tron/core/Tron.pb.dart';
import 'package:flash_tron_wallet/tron/grpc/grpc_client.dart';
import 'package:flash_tron_wallet/tron/service/tron_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class HomeProvider with ChangeNotifier {
  init() async {
    await getSelectWalletIndex();
    await getSelectWallet();
    await getTronInfo();
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

  int _selectAssetFilterIndex = 0;

  int get selectAssetFilterIndex => _selectAssetFilterIndex;

  changeSelectAssetFilterIndex(int index) {
    _selectAssetFilterIndex = index;
    notifyListeners();
  }

  TronInfo _tronInfo;

  TronInfo get tronInfo => _tronInfo;

  String _tronGrpcIP = 'grpc.trongrid.io';

  String get tronGrpcIP => _tronGrpcIP;

  String _swapAddress = 'TGS7NxoAQ44pQYCSAW3FPrVMhQ1TpdsTXg';

  String get swapAddress => _swapAddress;

  List<TokenRows> _tokenList = [];

  List<TokenRows> get tokenList => _tokenList;

  String _dexContract;

  String get dexContract => _dexContract;

  getTronInfo() async {
    try {
      String url = servicePath['tronInfoQuery'];
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      _currentVersion = packageInfo.version;
      await requestGet(url).then((val) {
        var respData = Map<String, dynamic>.from(val);
        TronInfoRespModel respModel = TronInfoRespModel.fromJson(respData);
        if (respModel != null &&
            respModel.code == 0 &&
            respModel.data != null) {
          if (respModel.data.tronInfo != null) {
            _tronInfo = respModel.data.tronInfo;
            if (_tronInfo.tronGrpcIP != null) {
              _tronGrpcIP = _tronInfo.tronGrpcIP;
            }
            if (_tronInfo.swapContract != null) {
              _swapAddress = _tronInfo.swapContract;
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
        AssetEntity entity = AssetEntity(
          type: item.tokenType,
          address: item.tokenAddress,
          name: item.tokenShort,
          precision: item.tokenPrecision,
          balance: 0,
          usd: 0,
          logoUrl: item.logoUrl,
          originBalance: '0',
        );
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
        if (tokenList[i].tokenType == 1) {
          getTrxBalance4Async(userAddress, tokenList[i]);
        } else if (tokenList[i].tokenType == 2) {
          getTrc20Balance4Async(userAddress, tokenList[i]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // 异步
  getTrxBalance4Async(String userAddress, TokenRows item) async {
    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    final stub = WalletClient(channel);
    try {
      Uint8List originAddress = base58.decode(userAddress).sublist(0, 21);
      Account response =
          await stub.getAccount(Account()..address = originAddress);
      AssetEntity entity =
          TronAsset().getTrxBalance(response, userAddress, item);
      for (int i = 0; i < _assetList.length; i++) {
        if (_assetList[i].address == entity.address) {
          _assetList[i].type = entity.type;
          _assetList[i].address = entity.address;
          _assetList[i].name = entity.name;
          _assetList[i].precision = entity.precision;
          _assetList[i].balance = entity.balance;
          _assetList[i].usd = entity.usd;
          _assetList[i].logoUrl = entity.logoUrl;
          _assetList[i].originBalance = entity.originBalance;
          notifyListeners();
          String _key = '$userAddress+${_assetList[i].address}';
          _balanceMap[_key] = _assetList[i].originBalance;
          notifyListeners();
          break;
        }
      }
      return;
    } catch (e) {
      print(e);
    }
  }

  // 异步
  getTrc20Balance4Async(String userAddress, TokenRows item) async {
    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    try {
      final stub = WalletClient(channel);
      AssetEntity entity =
          await TronAsset().getTrc20Balance(stub, userAddress, item);
      for (int i = 0; i < _assetList.length; i++) {
        if (_assetList[i].address == entity.address) {
          _assetList[i].type = entity.type;
          _assetList[i].address = entity.address;
          _assetList[i].name = entity.name;
          _assetList[i].precision = entity.precision;
          _assetList[i].balance = entity.balance;
          _assetList[i].usd = entity.usd;
          _assetList[i].logoUrl = entity.logoUrl;
          _assetList[i].originBalance = entity.originBalance;
          notifyListeners();
          String _key = '$userAddress+${_assetList[i].address}';
          _balanceMap[_key] = _assetList[i].originBalance;
          notifyListeners();
          break;
        }
      }
      return;
    } catch (e) {
      print(e);
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
    List<AssetEntity> list = [];
    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    final stub = WalletClient(channel);
    Uint8List originAddress = base58.decode(userAddress).sublist(0, 21);
    try {
      Account response =
          await stub.getAccount(Account()..address = originAddress);
      for (int i = 0; i < tokenList.length; i++) {
        if (tokenList[i].tokenType == 1) {
          AssetEntity trxEntity =
              TronAsset().getTrxBalance(response, userAddress, tokenList[i]);
          list.add(trxEntity);
        } else if (tokenList[i].tokenType == 2) {
          AssetEntity trc20Balance = await TronAsset()
              .getTrc20Balance(stub, userAddress, tokenList[i]);
          list.add(trc20Balance);
        }
      }
      _assetList = list;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Map<String, String> _balanceMap = Map<String, String>();

  Map<String, String> get balanceMap => _balanceMap;

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

  int _swapLeftIndex = 0;

  int get swapLeftIndex => _swapLeftIndex;

  changeSwapLeftIndex(int value) {
    _swapLeftIndex = value;
    notifyListeners();
  }

  int _swapRightIndex = 1;

  int get swapRightIndex => _swapRightIndex;

  changeSwapRightIndex(int value) {
    _swapRightIndex = value;
    notifyListeners();
  }
}
