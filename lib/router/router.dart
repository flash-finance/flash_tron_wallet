import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'handler.dart';

class Routes {
  static String root = '/';
  static String asset = '/asset';
  static String swap = '/swap';
  static String mine = '/mine';

  static String addWallet = '/asset/addWallet';
  static String sendToken = '/asset/sendToken';
  static String receiveToken = '/asset/receiveToken';

  static String importKey = '/asset/importKey/:type';
  static String importMnemonic = '/asset/importMnemonic/:type';
  static String buildFirstWallet = '/asset/buildFirstWallet/:type';
  static String buildSecondWallet = '/asset/buildSecondWallet/:type';
  static String walletDetail = 'asset/walletDetail/:selectIndex';
  static String backupKey = '/asset/backupKey';
  static String backupMnemonic = '/asset/backupMnemonic';
  static String updatePwd = '/asset/updatePwd';

  static String walletManage = '/mine/walletManage';

  static String qrScan = '/asset/qrScan';

  static void configureRouter(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('error, route was not found');
      return null;
    });

    router.define(asset, handler: assetHandler);
    router.define(swap, handler: swapHandler);
    router.define(mine, handler: mineHandler);

    router.define(addWallet, handler: addWalletHandler);
    router.define(sendToken, handler: sendTokenHandler);
    router.define(receiveToken, handler: receiveTokenHandler);

    router.define(importKey, handler: importKeyHandler);
    router.define(importMnemonic, handler: importMnemonicHandler);
    router.define(buildFirstWallet, handler: buildWalletFirstHandler);
    router.define(buildSecondWallet, handler: buildWalletSecondHandler);
    router.define(walletDetail, handler: walletDetailHandler);
    router.define(backupKey, handler: backupKeyHandler);
    router.define(backupMnemonic, handler: backupMnemonicHandler);

    router.define(updatePwd, handler: updatePwdHandler);

    router.define(walletManage, handler: walletManageHandler);
    
    router.define(qrScan, handler: qrScanHandler);
  }
}
