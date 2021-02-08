import 'package:flash_tron_wallet/page/asset/add_wallet_page.dart';
import 'package:flash_tron_wallet/page/asset/backup_key_page.dart';
import 'package:flash_tron_wallet/page/asset/backup_mnemonic_page.dart';
import 'package:flash_tron_wallet/page/asset/build_wallet_first_page.dart';
import 'package:flash_tron_wallet/page/asset/build_wallet_second_page.dart';
import 'package:flash_tron_wallet/page/asset/import_key_page.dart';
import 'package:flash_tron_wallet/page/asset/import_mnemonic_page.dart';
import 'package:flash_tron_wallet/page/asset/receive_token_page.dart';
import 'package:flash_tron_wallet/page/asset/send_token_page.dart';
import 'package:flash_tron_wallet/page/asset/update_pwd_page.dart';
import 'package:flash_tron_wallet/page/asset/wallet_detail_page.dart';
import 'package:flash_tron_wallet/page/mine/wallet_manage_page.dart';
import 'package:flash_tron_wallet/page/qr/qr_scan_page.dart';
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
    ),
    GetPage(
      name: mineWalletManage,
      page: () => WalletManagePage(),
    ),
  ];
}
