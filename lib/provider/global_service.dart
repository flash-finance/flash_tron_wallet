import 'dart:convert';
import 'dart:typed_data';

import 'package:bs58check/bs58check.dart';
import 'package:flash_tron_wallet/common/config/common_config.dart';
import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/http_util.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/model/tron_info_model.dart';
import 'package:flash_tron_wallet/tron/api/api.pbgrpc.dart';
import 'package:flash_tron_wallet/tron/core/Tron.pb.dart';
import 'package:flash_tron_wallet/tron/grpc/grpc_client.dart';
import 'package:flash_tron_wallet/tron/service/tron_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalService extends GetxService {
  static GlobalService get to => Get.find();

  var _currentIndex = Rx<int>(0);

  int get currentIndex => _currentIndex.value;

  PageController _pvController;

  PageController get pvController => _pvController;

  String _themeKey = 'themeKey';

  @override
  void onInit() async {
    super.onInit();
  }

  void initData() async {
    _pvController = PageController();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_langTypeKey) != null) {
      bool temp = prefs.getBool(_langTypeKey);
      _langType.value = temp;
    }
    if (_langType.value) {
      var locale = Locale('zh', 'CN');
      Get.updateLocale(locale);
    } else {
      var locale = Locale('en', 'US');
      Get.updateLocale(locale);
    }
    int value = prefs.getInt(_themeKey);
    if (value == null) {
      await setThemeMode(0);
    } else {
      await setThemeMode(value);
    }

    await getSelectWalletIndex();
    await getSelectWallet();
    await getTronInfo();
    await getAsset4Init();
    getAsset4ReloadAsync();
  }

  changeCurrentIndex(int value) {
    print('changeCurrentIndex:$value');
    _currentIndex.value = value;
    _pvController.jumpToPage(value);
  }

  var _langType = Rx<bool>(true);

  bool get langType => _langType.value;

  String _langTypeKey = 'langTypeKey';

  changeLangType() async {
    _langType.value = !_langType.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_langTypeKey, _langType.value);
    if (_langType.value) {
      var locale = Locale('zh', 'CN');
      Get.updateLocale(locale);
    } else {
      var locale = Locale('en', 'US');
      Get.updateLocale(locale);
    }
  }

  var _themeModeValue = Rx<int>(0);

  int get themeModeValue => _themeModeValue.value;

  setThemeMode(int value) async {
    switch (value) {
      case 0:
        Get.changeTheme(MyTheme.lightTheme);
        break;
      case 1:
        Get.changeTheme(MyTheme.darkTheme);
        break;
      default:
        break;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, value);
    _themeModeValue.value = value;
  }

  var _backgroundFlag = Rx<bool>(false);

  get backgroundFlag => _backgroundFlag.value;

  changeBackgroundFlag(bool newFlag) {
    _backgroundFlag.value = newFlag;
  }

  var _walletList = Rx<List<WalletEntity>>([]);
  List<WalletEntity> get walletList => _walletList.value;

  var _selectWalletIndex = Rx<int>(-1);
  int get selectWalletIndex => _selectWalletIndex.value;

  var _selectWalletEntity = Rx<WalletEntity>(null);
  WalletEntity get selectWalletEntity => _selectWalletEntity.value;

  String _selectWalletIndexKey = 'selectWalletIndexKey';
  String _selectWalletListKey = 'selectWalletListKey';

  getSelectWalletIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int temp = prefs.getInt(_selectWalletIndexKey);
    print('getSelectWalletIndex temp: $temp');
    if (temp != null) {
      _selectWalletIndex.value = temp;
    }
  }

  getSelectWallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tempList = prefs.getStringList(_selectWalletListKey);
    _walletList.value = [];
    if (tempList != null) {
      for (int i = 0; i < tempList.length; i++) {
        String temp = tempList[i];
        var respData = Map<String, dynamic>.from(json.decode(temp));
        WalletEntity item = WalletEntity.fromJson(respData);
        _walletList.value.add(item);
      }
      if (_walletList.value.length > _selectWalletIndex.value) {
        _selectWalletEntity.value = _walletList.value[_selectWalletIndex.value];
      }
    }
    print(
        'getSelectWallet _selectWalletEntity: ${_selectWalletEntity.toJson()}');
  }

  Future<bool> saveSelectWalletIndex(int value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _selectWalletIndex.value = value;
      prefs.setInt(_selectWalletIndexKey, _selectWalletIndex.value);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> saveSelectWalletList(List<WalletEntity> dataList) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _walletList.value = dataList;
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
    return true;
  }

  Future<bool> addWallet(WalletEntity item) async {
    print('addWallet: ${item.toJson()}');
    try {
      _walletList.value.insert(0, item);
      _selectWalletIndex.value = 0;
      _selectWalletEntity.value = _walletList.value[0];

      SharedPreferences prefs = await SharedPreferences.getInstance();

      _selectWalletIndex = _selectWalletIndex;
      prefs.setInt(_selectWalletIndexKey, _selectWalletIndex.value);

      List<String> tempList = [];
      for (int i = 0; i < _walletList.value.length; i++) {
        String temp = json.encode(_walletList.value[i]);
        tempList.add(temp);
      }
      prefs.setStringList(_selectWalletListKey, tempList);
      print('_walletList: ${_walletList.value.length}');
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> changeSelectWallet(int index) async {
    try {
      if (_walletList.value.length > index) {
        _selectWalletIndex.value = index;
        _selectWalletEntity.value = _walletList.value[index];
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
      if (_walletList.value.length > index) {
        _walletList.value[index].name = newName;
        await saveSelectWalletList(_walletList.value);
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> updatePwd(int index, String newPwd) async {
    try {
      if (_walletList.value.length > index) {
        _walletList.value[index].pwd = newPwd;
        await saveSelectWalletList(_walletList.value);
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> delWallet(int index) async {
    try {
      if (_walletList.value.length > index) {
        _walletList.value.removeAt(index);
        if (_selectWalletIndex.value == index) {
          if (_walletList.value.length > 0) {
            _selectWalletIndex.value = 0;
            _selectWalletEntity.value = _walletList.value[0];
          } else {
            _selectWalletIndex.value = -1;
            _selectWalletEntity = null;
          }
        } else if (_selectWalletIndex.value > index) {
          _selectWalletIndex.value--;
          _selectWalletEntity.value =
              _walletList.value[_selectWalletIndex.value];
        }
        await saveSelectWalletList(_walletList.value);
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  var _firstRandom = Rx<String>('');

  String get firstRandom => _firstRandom.value;

  changeFirstRandom(String value) {
    _firstRandom.value = value;
  }

  var _secondRandom = Rx<String>('');

  String get secondRandom => _secondRandom.value;

  changeSecondRandom(String value) {
    _secondRandom.value = value;
  }

  var _assetList = Rx<List<AssetEntity>>([]);

  List<AssetEntity> get assetList => _assetList.value;

  updateAssetList(List<AssetEntity> list) {
    _assetList.value = list;
  }

  var _selectAssetFilterIndex = Rx<int>(0);

  int get selectAssetFilterIndex => _selectAssetFilterIndex.value;

  changeSelectAssetFilterIndex(int index) {
    _selectAssetFilterIndex.value = index;
  }

  var _tronInfo = Rx<TronInfo>(null);

  TronInfo get tronInfo => _tronInfo.value;

  var _tronGrpcIP = Rx<String>('grpc.trongrid.io');

  String get tronGrpcIP => _tronGrpcIP.value;

  var _swapAddress = Rx<String>('TGS7NxoAQ44pQYCSAW3FPrVMhQ1TpdsTXg');

  String get swapAddress => _swapAddress.value;

  var _tokenList = Rx<List<TokenRows>>([]);

  List<TokenRows> get tokenList => _tokenList.value;

  String _dexContract;

  String get dexContract => _dexContract;

  getTronInfo() async {
    try {
      String url = CommonConfig.servicePath[CommonConfig.tronInfoQueryUrl];
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      _currentVersion.value = packageInfo.version;
      await HttpUtil.get(url).then((val) {
        var respData = Map<String, dynamic>.from(val);
        TronInfoRespModel respModel = TronInfoRespModel.fromJson(respData);
        if (respModel != null &&
            respModel.code == 0 &&
            respModel.data != null) {
          if (respModel.data.tronInfo != null) {
            _tronInfo.value = respModel.data.tronInfo;
            if (_tronInfo.value.tronGrpcIP != null) {
              _tronGrpcIP.value = _tronInfo.value.tronGrpcIP;
            }
            if (_tronInfo.value.swapContract != null) {
              _swapAddress.value = _tronInfo.value.swapContract;
            }
          }

          if (respModel.data.tokenRows != null &&
              respModel.data.tokenRows.length > 0) {
            _tokenList.value = respModel.data.tokenRows;
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  getAsset4Init() async {
    if (_selectWalletEntity.value == null) {
      if (_assetList.value != null && _assetList.value.length > 0) {
        _assetList.value = [];
      }
      return;
    }
    try {
      List<AssetEntity> list = [];
      for (int i = 0; i < _tokenList.value.length; i++) {
        TokenRows item = _tokenList.value[i];
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
      _assetList.value = list;
    } catch (e) {
      print(e);
    }
  }

  // 异步
  getAsset4ReloadAsync() async {
    if (_selectWalletEntity.value == null) {
      if (_assetList.value != null && _assetList.value.length > 0) {
        _assetList.value = [];
      }
      return;
    }
    try {
      String userAddress = _selectWalletEntity.value.tronAddress;
      for (int i = 0; i < _tokenList.value.length; i++) {
        if (_tokenList.value[i].tokenType == 1) {
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
      for (int i = 0; i < _assetList.value.length; i++) {
        if (_assetList.value[i].address == entity.address) {
          _assetList.value[i].type = entity.type;
          _assetList.value[i].address = entity.address;
          _assetList.value[i].name = entity.name;
          _assetList.value[i].precision = entity.precision;
          _assetList.value[i].balance = entity.balance;
          _assetList.value[i].usd = entity.usd;
          _assetList.value[i].logoUrl = entity.logoUrl;
          _assetList.value[i].originBalance = entity.originBalance;
          String _key = '$userAddress+${_assetList.value[i].address}';
          _balanceMap.value[_key] = _assetList.value[i].originBalance;
          break;
        }
      }
      return;
    } catch (e) {
      print('getTrxBalance4Async error: ${e.toString()}');
    }
  }

  // 异步
  getTrc20Balance4Async(String userAddress, TokenRows item) async {
    final channel = ClientChannelManager.getChannel(tronGrpcIP);
    try {
      final stub = WalletClient(channel);
      AssetEntity entity =
          await TronAsset().getTrc20Balance(stub, userAddress, item);
      for (int i = 0; i < _assetList.value.length; i++) {
        if (_assetList.value[i].address == entity.address) {
          _assetList.value[i].type = entity.type;
          _assetList.value[i].address = entity.address;
          _assetList.value[i].name = entity.name;
          _assetList.value[i].precision = entity.precision;
          _assetList.value[i].balance = entity.balance;
          _assetList.value[i].usd = entity.usd;
          _assetList.value[i].logoUrl = entity.logoUrl;
          _assetList.value[i].originBalance = entity.originBalance;
          String _key = '$userAddress+${_assetList.value[i].address}';
          _balanceMap.value[_key] = _assetList.value[i].originBalance;
          break;
        }
      }
      return;
    } catch (e) {
      print('getTrc20Balance4Async error: ${e.toString()}');
    }
  }

  var _balanceMap = Rx<Map<String, String>>(Map<String, String>());
  Map<String, String> get balanceMap => _balanceMap.value;

  var _appDownloaded = Rx<bool>(false);

  bool get appDownloaded => _appDownloaded.value;

  changeAppDownloaded(bool value) {
    _appDownloaded.value = value;
  }

  var _currentVersion = Rx<String>('');

  String get currentVersion => _currentVersion.value;

  var _swapLeftIndex = Rx<int>(0);

  int get swapLeftIndex => _swapLeftIndex.value;

  changeSwapLeftIndex(int value) {
    _swapLeftIndex.value = value;
  }

  var _swapRightIndex = Rx<int>(1);

  int get swapRightIndex => _swapRightIndex.value;

  changeSwapRightIndex(int value) {
    _swapRightIndex.value = value;
  }
}

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: MyColorUtil.theme,
    accentColor: MyColorUtil.theme,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    fontFamily: CommonConfig.fontFamily,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: MyColorUtil.theme,
    accentColor: MyColorUtil.theme,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    fontFamily: CommonConfig.fontFamily,
  );
}
