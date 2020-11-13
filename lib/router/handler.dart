import 'package:flash_tron_wallet/page/asset/build_wallet_first_page.dart';
import 'package:flash_tron_wallet/page/asset/import_key_page.dart';
import 'package:flash_tron_wallet/page/asset/import_mnemonic_page.dart';
import 'package:flash_tron_wallet/page/asset_page.dart';
import 'package:flash_tron_wallet/page/defi_page.dart';
import 'package:flash_tron_wallet/page/mine/wallet/backup_key_page.dart';
import 'package:flash_tron_wallet/page/mine/wallet/backup_mnemonic_page.dart';
import 'package:flash_tron_wallet/page/mine/wallet/build_wallet_second_page.dart';
import 'package:flash_tron_wallet/page/mine/wallet/build_wallet_third_page.dart';
import 'package:flash_tron_wallet/page/mine/wallet/import_wallet_page.dart';
import 'package:flash_tron_wallet/page/mine/wallet/receive_wallet_page.dart';
import 'package:flash_tron_wallet/page/mine/wallet/send_wallet_page.dart';
import 'package:flash_tron_wallet/page/mine/wallet/update_name_page.dart';
import 'package:flash_tron_wallet/page/mine/wallet/update_pwd_page.dart';
import 'package:flash_tron_wallet/page/mine_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

Handler assetHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return AssetPage();
});

Handler deFiHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return DeFiPage();
});


Handler mineHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return MinePage();
});


Handler importWalletHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ImportWalletPage();
});

Handler importKeyHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ImportKeyPage();
});

Handler importMnemonicHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ImportMnemonicPage();
});

Handler backupKeyHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return BackupKeyPage();
});

Handler backupMnemonicHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return BackupMnemonicPage();
});

Handler buildWalletFirstHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return BuildWalletFirstPage();
});

Handler buildWalletSecondHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return BuildWalletSecondPage();
});

Handler buildWalletThirdHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return BuildWalletThirdPage();
});

Handler receiveWalletHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ReceiveWalletPage();
});

Handler sendWalletHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SendWalletPage();
});

Handler updatePwdHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return UpdatePwdPage();
});

Handler updateNameHandler =
Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return UpdateNamePage();
});


