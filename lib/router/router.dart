import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'handler.dart';

class Routes {
  static String root = '/';

  static String assetAddWallet = '/asset/addWallet';
  static String assetSendToken = '/asset/sendToken';
  static String assetSendTokenValue = assetSendToken + '/:value';

  static String assetReceiveToken = '/asset/receiveToken';

  static String assetImportKey = '/asset/importKey';
  static String assetImportKeyType =  assetImportKey + '/:type';

  static String assetImportMnemonic = '/asset/importMnemonic';
  static String assetImportMnemonicType = assetImportMnemonic + '/:type';

  static String assetBuildFirstWallet = '/asset/buildFirstWallet';
  static String assetBuildFirstWalletType = assetBuildFirstWallet + '/:type';

  static String assetBuildSecondWallet = '/asset/buildSecondWallet';
  static String assetBuildSecondWalletType = assetBuildSecondWallet + '/:type';

  static String assetWalletDetail = 'asset/walletDetail';
  static String assetWalletDetailIndex = assetWalletDetail + '/:selectIndex';


  static String assetBackupKey = '/asset/backupKey';
  static String assetBackupMnemonic = '/asset/backupMnemonic';
  static String assetUpdatePwd = '/asset/updatePwd';

  static String assetQrScan = '/asset/qrScan';
  static String assetQrScanType = assetQrScan + '/:type';


  static String mineWalletManage = '/mine/walletManage';


  static void configureRouter(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('error, route was not found');
      return null;
    });


    router.define(assetAddWallet, handler: addWalletHandler);
    router.define(assetSendTokenValue, handler: sendTokenHandler);
    router.define(assetReceiveToken, handler: receiveTokenHandler);

    router.define(assetImportKeyType, handler: importKeyHandler);
    router.define(assetImportMnemonicType, handler: importMnemonicHandler);
    router.define(assetBuildFirstWalletType, handler: buildWalletFirstHandler);
    router.define(assetBuildSecondWalletType, handler: buildWalletSecondHandler);
    router.define(assetWalletDetailIndex, handler: walletDetailHandler);
    router.define(assetBackupKey, handler: backupKeyHandler);
    router.define(assetBackupMnemonic, handler: backupMnemonicHandler);
    router.define(assetQrScanType, handler: qrScanHandler);

    router.define(assetUpdatePwd, handler: updatePwdHandler);
    router.define(mineWalletManage, handler: walletManageHandler);
    
  }
}
