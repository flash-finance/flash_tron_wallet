import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'handler.dart';

class Routes {
  static String root = '/';
  static String asset = '/asset';
  static String deFi = '/deFi';
  static String mine = '/mine';

  static String importWallet = '/mine/importWallet';
  static String importKey = '/mine/importKey';
  static String importMnemonic = '/mine/importMnemonic';
  static String backupKey = '/mine/backupKey';
  static String backupMnemonic = '/mine/backupMnemonic';
  static String buildFirstWallet = '/mine/buildFirstWallet';
  static String buildSecondWallet = '/mine/buildSecondWallet';
  static String buildThirdWallet = '/mine/buildThirdWallet';
  static String receiveWallet = '/mine/receiveWallet';
  static String sendWallet = '/mine/sendWallet';
  static String updatePwd = '/mine/updatePwd';
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

    router.define(importWallet, handler: importWalletHandler);
    router.define(importKey, handler: importKeyHandler);
    router.define(importMnemonic, handler: importMnemonicHandler);
    router.define(backupKey, handler: backupKeyHandler);
    router.define(backupMnemonic, handler: backupMnemonicHandler);
    router.define(buildFirstWallet, handler: buildWalletFirstHandler);
    router.define(buildSecondWallet, handler: buildWalletSecondHandler);
    router.define(buildThirdWallet, handler: buildWalletThirdHandler);
    router.define(receiveWallet, handler: receiveWalletHandler);
    router.define(sendWallet, handler: sendWalletHandler);
    router.define(updatePwd, handler: updatePwdHandler);
    router.define(updateName, handler: updateNameHandler);
  }
}
