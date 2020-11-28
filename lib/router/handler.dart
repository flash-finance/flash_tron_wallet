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
import 'package:flash_tron_wallet/page/asset/wallet_manage_page.dart';
import 'package:flash_tron_wallet/page/asset_page.dart';
import 'package:flash_tron_wallet/page/swap_page.dart';
import 'package:flash_tron_wallet/page/mine_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

Handler assetHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return AssetPage();
});

Handler swapHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SwapPage();
});


Handler mineHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MinePage();
});

Handler addWalletHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return AddWalletPage();
});

Handler sendTokenHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SendTokenPage();
});


Handler receiveTokenHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ReceiveTokenPage();
});

Handler walletDetailHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String selectIndex = params['selectIndex'][0];
  return WalletDetailPage(selectIndex);
});

Handler importKeyHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ImportKeyPage();
});

Handler importMnemonicHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ImportMnemonicPage();
});

Handler buildWalletFirstHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String type = params['type'][0];
  return BuildWalletFirstPage(type);
});

Handler buildWalletSecondHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String type = params['type'][0];
  return BuildWalletSecondPage(type);
});


Handler backupKeyHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return BackupKeyPage();
});

Handler backupMnemonicHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return BackupMnemonicPage();
});


Handler updatePwdHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return UpdatePwdPage();
});


Handler walletManageHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return WalletManagePage();
});








