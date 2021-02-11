import 'package:flash_tron_wallet/index/asset/add_wallet/add_wallet_page.dart';
import 'package:flash_tron_wallet/index/asset/backup_key/backup_key_page.dart';
import 'package:flash_tron_wallet/index/asset/backup_mnemonic/backup_mnemonic_page.dart';
import 'package:flash_tron_wallet/index/asset/build_wallet/build_wallet_first_page.dart';
import 'package:flash_tron_wallet/index/asset/build_wallet/build_wallet_second_page.dart';
import 'package:flash_tron_wallet/index/asset/import_key/import_key_page.dart';
import 'package:flash_tron_wallet/index/asset/import_mnemonic/import_mnemonic_page.dart';
import 'package:flash_tron_wallet/index/asset/recevice_token/receive_token_page.dart';
import 'package:flash_tron_wallet/index/asset/send_token/send_token_page.dart';
import 'package:flash_tron_wallet/index/asset/update_pwd/update_pwd_page.dart';
import 'package:flash_tron_wallet/index/asset/wallet_detail/wallet_detail_page.dart';
import 'package:flash_tron_wallet/index/mine/wallet_manage/wallet_manage_page.dart';
import 'package:flash_tron_wallet/index/qr/qr_scan_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute {
  static String assetAddWallet = '/asset/addWallet';

  static String assetSendToken = '/asset/sendToken';
  static String assetSendTokenSuffix = assetSendToken + '/:value';

  static String assetReceiveToken = '/asset/receiveToken';

  static String assetImportKey = '/asset/importKey';
  static String assetImportKeySuffix = assetImportKey + '/:type';

  static String assetImportMnemonic = '/asset/importMnemonic';
  static String assetImportMnemonicSuffix = assetImportMnemonic + '/:type';

  static String assetBuildFirstWallet = '/asset/buildFirstWallet';
  static String assetBuildFirstWalletSuffix = assetBuildFirstWallet + '/:type';

  static String assetBuildSecondWallet = '/asset/buildSecondWallet';
  static String assetBuildSecondWalletSuffix =
      assetBuildSecondWallet + '/:type';

  static String assetWalletDetail = 'asset/walletDetail';
  static String assetWalletDetailSuffix = assetWalletDetail + '/:selectIndex';

  static String assetBackupKey = '/asset/backupKey';
  static String assetBackupMnemonic = '/asset/backupMnemonic';
  static String assetUpdatePwd = '/asset/updatePwd';

  static String assetQrScan = '/asset/qrScan';
  static String assetQrScanSuffix = assetQrScan + '/:type';

  static String mineWalletManage = '/mine/walletManage';

  static List<GetPage> pages = [
    GetPage(
      name: assetAddWallet,
      page: () => AddWalletPage(),
    ),
    GetPage(
      name: assetSendTokenSuffix,
      page: () => SendTokenPage(),
    ),
    GetPage(
      name: assetReceiveToken,
      page: () => ReceiveTokenPage(),
    ),
    GetPage(
      name: assetImportKeySuffix,
      page: () => ImportKeyPage(),
    ),
    GetPage(
      name: assetImportMnemonicSuffix,
      page: () => ImportMnemonicPage(),
    ),
    GetPage(
      name: assetBuildFirstWalletSuffix,
      page: () => BuildWalletFirstPage(),
    ),
    GetPage(
      name: assetBuildSecondWalletSuffix,
      page: () => BuildWalletSecondPage(),
    ),
    GetPage(
      name: assetWalletDetailSuffix,
      page: () => WalletDetailPage(),
    ),
    GetPage(
      name: assetBackupKey,
      page: () => BackupKeyPage(),
    ),
    GetPage(
      name: assetBackupMnemonic,
      page: () => BackupMnemonicPage(),
    ),
    GetPage(
      name: assetUpdatePwd,
      page: () => UpdatePwdPage(),
    ),
    GetPage(
      name: assetQrScanSuffix,
      page: () => QrScanPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: mineWalletManage,
      page: () => WalletManagePage(),
    ),
  ];
}
