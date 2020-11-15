import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'handler.dart';

class Routes {
  static String root = '/';
  static String asset = '/asset';
  static String deFi = '/deFi';
  static String mine = '/mine';

  static String importKey = '/asset/importKey';
  static String importMnemonic = '/asset/importMnemonic';
  static String buildFirstWallet = '/asset/buildFirstWallet';
  static String buildSecondWallet = '/asset/buildSecondWallet';
  static String walletDetail = 'asset/walletDetail';
  static String backupKey = '/asset/backupKey';
  static String backupMnemonic = '/asset/backupMnemonic';
  static String updatePwd = '/asset/updatePwd';
  static String addWallet = '/asset/addWallet';




  static String importWallet = '/asset/importWallet';
  static String buildThirdWallet = '/mine/buildThirdWallet';
  static String receiveWallet = '/mine/receiveWallet';
  static String sendWallet = '/mine/sendWallet';
  static String updateName = '/mine/updateName';

  static void configureRouter(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('error, route was not found');
      return null;
    });

    router.define(asset, handler: assetHandler);
    router.define(deFi, handler: deFiHandler);
    router.define(mine, handler: mineHandler);

    router.define(importKey, handler: importKeyHandler);
    router.define(importMnemonic, handler: importMnemonicHandler);
    router.define(buildFirstWallet, handler: buildWalletFirstHandler);
    router.define(buildSecondWallet, handler: buildWalletSecondHandler);
    router.define(walletDetail, handler: walletDetailHandler);
    router.define(backupKey, handler: backupKeyHandler);
    router.define(addWallet, handler: addWalletHandler);


    router.define(backupMnemonic, handler: backupMnemonicHandler);
    router.define(receiveWallet, handler: receiveWalletHandler);
    router.define(sendWallet, handler: sendWalletHandler);
    router.define(updatePwd, handler: updatePwdHandler);
    router.define(updateName, handler: updateNameHandler);
  }
}
