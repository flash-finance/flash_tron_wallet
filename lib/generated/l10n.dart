// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Assets`
  String get bottomTab1 {
    return Intl.message(
      'Assets',
      name: 'bottomTab1',
      desc: '',
      args: [],
    );
  }

  /// `Swap`
  String get bottomTab2 {
    return Intl.message(
      'Swap',
      name: 'bottomTab2',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get bottomTab3 {
    return Intl.message(
      'Mine',
      name: 'bottomTab3',
      desc: '',
      args: [],
    );
  }

  /// `Copy Success`
  String get commonCopySuccess {
    return Intl.message(
      'Copy Success',
      name: 'commonCopySuccess',
      desc: '',
      args: [],
    );
  }

  /// `please enter your password`
  String get commonPleaseEnterYourPassword {
    return Intl.message(
      'please enter your password',
      name: 'commonPleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get commonCancel {
    return Intl.message(
      'Cancel',
      name: 'commonCancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get commonConfirm {
    return Intl.message(
      'Confirm',
      name: 'commonConfirm',
      desc: '',
      args: [],
    );
  }

  /// `executed error, please try again`
  String get commonExecutedError {
    return Intl.message(
      'executed error, please try again',
      name: 'commonExecutedError',
      desc: '',
      args: [],
    );
  }

  /// `Update Success`
  String get commonUpdateSuccess {
    return Intl.message(
      'Update Success',
      name: 'commonUpdateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `please make sure that the private key or mnemonic is backed up, are you sure to delete it?`
  String get commonDeleteWalletTip {
    return Intl.message(
      'please make sure that the private key or mnemonic is backed up, are you sure to delete it?',
      name: 'commonDeleteWalletTip',
      desc: '',
      args: [],
    );
  }

  /// `can not be empty`
  String get commonCanNotBeEmpty {
    return Intl.message(
      'can not be empty',
      name: 'commonCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get commonSubmit {
    return Intl.message(
      'Submit',
      name: 'commonSubmit',
      desc: '',
      args: [],
    );
  }

  /// `incorrect format`
  String get commonIncorrectFormat {
    return Intl.message(
      'incorrect format',
      name: 'commonIncorrectFormat',
      desc: '',
      args: [],
    );
  }

  /// `need 6 digit`
  String get commonNeed6Digit {
    return Intl.message(
      'need 6 digit',
      name: 'commonNeed6Digit',
      desc: '',
      args: [],
    );
  }

  /// `the two entered passwords are inconsistent`
  String get commonConfirmPwdError {
    return Intl.message(
      'the two entered passwords are inconsistent',
      name: 'commonConfirmPwdError',
      desc: '',
      args: [],
    );
  }

  /// `imported successfully`
  String get commonImportSuccess {
    return Intl.message(
      'imported successfully',
      name: 'commonImportSuccess',
      desc: '',
      args: [],
    );
  }

  /// `import failed, please try again`
  String get commonImportFail {
    return Intl.message(
      'import failed, please try again',
      name: 'commonImportFail',
      desc: '',
      args: [],
    );
  }

  /// `create failed, please try again`
  String get commonCreateFail {
    return Intl.message(
      'create failed, please try again',
      name: 'commonCreateFail',
      desc: '',
      args: [],
    );
  }

  /// `execute failed, please try again`
  String get commonExecuteFail {
    return Intl.message(
      'execute failed, please try again',
      name: 'commonExecuteFail',
      desc: '',
      args: [],
    );
  }

  /// `please backup your mnemonic`
  String get commonBackupMnemonic {
    return Intl.message(
      'please backup your mnemonic',
      name: 'commonBackupMnemonic',
      desc: '',
      args: [],
    );
  }

  /// `Saved Safely`
  String get commonSavedSafely {
    return Intl.message(
      'Saved Safely',
      name: 'commonSavedSafely',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get commonDone {
    return Intl.message(
      'Done',
      name: 'commonDone',
      desc: '',
      args: [],
    );
  }

  /// `the password 6 numbers`
  String get commonPwd6Digit {
    return Intl.message(
      'the password 6 numbers',
      name: 'commonPwd6Digit',
      desc: '',
      args: [],
    );
  }

  /// `the password incorrect`
  String get commonPwdIncorrect {
    return Intl.message(
      'the password incorrect',
      name: 'commonPwdIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `enter old password`
  String get commonEnterOldPwd {
    return Intl.message(
      'enter old password',
      name: 'commonEnterOldPwd',
      desc: '',
      args: [],
    );
  }

  /// `set new password`
  String get commonSetNewPwd {
    return Intl.message(
      'set new password',
      name: 'commonSetNewPwd',
      desc: '',
      args: [],
    );
  }

  /// `confirm new password`
  String get commonConfirmNewPwd {
    return Intl.message(
      'confirm new password',
      name: 'commonConfirmNewPwd',
      desc: '',
      args: [],
    );
  }

  /// `MAX`
  String get commonMax {
    return Intl.message(
      'MAX',
      name: 'commonMax',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get commonSend {
    return Intl.message(
      'Send',
      name: 'commonSend',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get commonScan {
    return Intl.message(
      'Scan',
      name: 'commonScan',
      desc: '',
      args: [],
    );
  }

  /// `Photo Album`
  String get commonPhotoAlbum {
    return Intl.message(
      'Photo Album',
      name: 'commonPhotoAlbum',
      desc: '',
      args: [],
    );
  }

  /// `current`
  String get commonCurrent {
    return Intl.message(
      'current',
      name: 'commonCurrent',
      desc: '',
      args: [],
    );
  }

  /// `My Assets`
  String get assetMyAssets {
    return Intl.message(
      'My Assets',
      name: 'assetMyAssets',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get assetDetails {
    return Intl.message(
      'Details',
      name: 'assetDetails',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get assetTransfer {
    return Intl.message(
      'Transfer',
      name: 'assetTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get assetReceive {
    return Intl.message(
      'Receive',
      name: 'assetReceive',
      desc: '',
      args: [],
    );
  }

  /// `Swap`
  String get assetSwap {
    return Intl.message(
      'Swap',
      name: 'assetSwap',
      desc: '',
      args: [],
    );
  }

  /// `Add Wallet`
  String get assetAddWallet {
    return Intl.message(
      'Add Wallet',
      name: 'assetAddWallet',
      desc: '',
      args: [],
    );
  }

  /// `Import Private Key`
  String get assetImportPrivateKey {
    return Intl.message(
      'Import Private Key',
      name: 'assetImportPrivateKey',
      desc: '',
      args: [],
    );
  }

  /// `Import Mnemonic`
  String get assetImportMnemonic {
    return Intl.message(
      'Import Mnemonic',
      name: 'assetImportMnemonic',
      desc: '',
      args: [],
    );
  }

  /// `Create Wallet`
  String get assetCreateWallet {
    return Intl.message(
      'Create Wallet',
      name: 'assetCreateWallet',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Details`
  String get assetWalletDetails {
    return Intl.message(
      'Wallet Details',
      name: 'assetWalletDetails',
      desc: '',
      args: [],
    );
  }

  /// `Backup Mnemonic`
  String get assetBackupMnemonic {
    return Intl.message(
      'Backup Mnemonic',
      name: 'assetBackupMnemonic',
      desc: '',
      args: [],
    );
  }

  /// `Backup Private Key`
  String get assetBackupPrivateKey {
    return Intl.message(
      'Backup Private Key',
      name: 'assetBackupPrivateKey',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get assetUpdatePassword {
    return Intl.message(
      'Update Password',
      name: 'assetUpdatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Update Wallet Name`
  String get assetUpdateWalletName {
    return Intl.message(
      'Update Wallet Name',
      name: 'assetUpdateWalletName',
      desc: '',
      args: [],
    );
  }

  /// `Delete Wallet`
  String get assetDeleteWallet {
    return Intl.message(
      'Delete Wallet',
      name: 'assetDeleteWallet',
      desc: '',
      args: [],
    );
  }

  /// `Name Too Long`
  String get assetNameLong {
    return Intl.message(
      'Name Too Long',
      name: 'assetNameLong',
      desc: '',
      args: [],
    );
  }

  /// `Assets`
  String get assetAssets {
    return Intl.message(
      'Assets',
      name: 'assetAssets',
      desc: '',
      args: [],
    );
  }

  /// `Wallet List`
  String get assetWalletList {
    return Intl.message(
      'Wallet List',
      name: 'assetWalletList',
      desc: '',
      args: [],
    );
  }

  /// `1. need to set a 6-digit password for wallet management and transaction authorization`
  String get addWalletTip1 {
    return Intl.message(
      '1. need to set a 6-digit password for wallet management and transaction authorization',
      name: 'addWalletTip1',
      desc: '',
      args: [],
    );
  }

  /// `2. the platform does not store passwords and cannot be retrieved, please keep them properly`
  String get addWalletTip2 {
    return Intl.message(
      '2. the platform does not store passwords and cannot be retrieved, please keep them properly',
      name: 'addWalletTip2',
      desc: '',
      args: [],
    );
  }

  /// `1. the mnemonic is the private key, which is used to restore the wallet. Please back it up to a safe place`
  String get addWalletTip3 {
    return Intl.message(
      '1. the mnemonic is the private key, which is used to restore the wallet. Please back it up to a safe place',
      name: 'addWalletTip3',
      desc: '',
      args: [],
    );
  }

  /// `2. please keep the mnemonic properly, if someone obtains it, they can directly obtain your assets`
  String get addWalletTip4 {
    return Intl.message(
      '2. please keep the mnemonic properly, if someone obtains it, they can directly obtain your assets',
      name: 'addWalletTip4',
      desc: '',
      args: [],
    );
  }

  /// `please back up the mnemonic to a safe place, once the mnemonic is lost, it cannot be retrieved`
  String get backupWalletTip1 {
    return Intl.message(
      'please back up the mnemonic to a safe place, once the mnemonic is lost, it cannot be retrieved',
      name: 'backupWalletTip1',
      desc: '',
      args: [],
    );
  }

  /// `please back up the private key to a safe place, once the private key is lost, it cannot be retrieved`
  String get backupWalletTip2 {
    return Intl.message(
      'please back up the private key to a safe place, once the private key is lost, it cannot be retrieved',
      name: 'backupWalletTip2',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Name`
  String get assetWalletName {
    return Intl.message(
      'Wallet Name',
      name: 'assetWalletName',
      desc: '',
      args: [],
    );
  }

  /// `Private Key`
  String get assetPrivateKey {
    return Intl.message(
      'Private Key',
      name: 'assetPrivateKey',
      desc: '',
      args: [],
    );
  }

  /// `Mnemonic`
  String get assetMnemonic {
    return Intl.message(
      'Mnemonic',
      name: 'assetMnemonic',
      desc: '',
      args: [],
    );
  }

  /// `Set Password`
  String get assetSetPassword {
    return Intl.message(
      'Set Password',
      name: 'assetSetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get assetConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'assetConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Receiving QR Code`
  String get assetReceivingQrCode {
    return Intl.message(
      'Receiving QR Code',
      name: 'assetReceivingQrCode',
      desc: '',
      args: [],
    );
  }

  /// `Copy Address`
  String get assetCopyAddress {
    return Intl.message(
      'Copy Address',
      name: 'assetCopyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Transfer Address`
  String get assetTransferAddress {
    return Intl.message(
      'Transfer Address',
      name: 'assetTransferAddress',
      desc: '',
      args: [],
    );
  }

  /// `Receiving Address`
  String get assetReceivingAddress {
    return Intl.message(
      'Receiving Address',
      name: 'assetReceivingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Transfer Amount`
  String get assetTransferAmount {
    return Intl.message(
      'Transfer Amount',
      name: 'assetTransferAmount',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get assetBalance {
    return Intl.message(
      'Balance',
      name: 'assetBalance',
      desc: '',
      args: [],
    );
  }

  /// `enter or paste wallet address`
  String get assetTransferTip1 {
    return Intl.message(
      'enter or paste wallet address',
      name: 'assetTransferTip1',
      desc: '',
      args: [],
    );
  }

  /// `input amount`
  String get assetTransferTip2 {
    return Intl.message(
      'input amount',
      name: 'assetTransferTip2',
      desc: '',
      args: [],
    );
  }

  /// `transfer processing...`
  String get assetTransferTip3 {
    return Intl.message(
      'transfer processing...',
      name: 'assetTransferTip3',
      desc: '',
      args: [],
    );
  }

  /// `during the transfer process, please do not repeat the operation`
  String get assetTransferTip4 {
    return Intl.message(
      'during the transfer process, please do not repeat the operation',
      name: 'assetTransferTip4',
      desc: '',
      args: [],
    );
  }

  /// `transfer failed, please try again later`
  String get assetTransferTip5 {
    return Intl.message(
      'transfer failed, please try again later',
      name: 'assetTransferTip5',
      desc: '',
      args: [],
    );
  }

  /// `receiving address cannot be empty`
  String get assetTransferError1 {
    return Intl.message(
      'receiving address cannot be empty',
      name: 'assetTransferError1',
      desc: '',
      args: [],
    );
  }

  /// `receiving address format incorrect`
  String get assetTransferError2 {
    return Intl.message(
      'receiving address format incorrect',
      name: 'assetTransferError2',
      desc: '',
      args: [],
    );
  }

  /// `receiving address and transfer address cannot be the same`
  String get assetTransferError3 {
    return Intl.message(
      'receiving address and transfer address cannot be the same',
      name: 'assetTransferError3',
      desc: '',
      args: [],
    );
  }

  /// `transfer amount cannot be empty`
  String get assetTransferError4 {
    return Intl.message(
      'transfer amount cannot be empty',
      name: 'assetTransferError4',
      desc: '',
      args: [],
    );
  }

  /// `transfer amount must be greater than 0`
  String get assetTransferError5 {
    return Intl.message(
      'transfer amount must be greater than 0',
      name: 'assetTransferError5',
      desc: '',
      args: [],
    );
  }

  /// `insufficient transfer amount`
  String get assetTransferError6 {
    return Intl.message(
      'insufficient transfer amount',
      name: 'assetTransferError6',
      desc: '',
      args: [],
    );
  }

  /// `Transfer Success`
  String get assetTransferSuccess {
    return Intl.message(
      'Transfer Success',
      name: 'assetTransferSuccess',
      desc: '',
      args: [],
    );
  }

  /// `password can not be empty`
  String get commonError1 {
    return Intl.message(
      'password can not be empty',
      name: 'commonError1',
      desc: '',
      args: [],
    );
  }

  /// `password is 6 digits`
  String get commonError2 {
    return Intl.message(
      'password is 6 digits',
      name: 'commonError2',
      desc: '',
      args: [],
    );
  }

  /// `password error`
  String get commonError3 {
    return Intl.message(
      'password error',
      name: 'commonError3',
      desc: '',
      args: [],
    );
  }

  /// `Market`
  String get swapMarket {
    return Intl.message(
      'Market',
      name: 'swapMarket',
      desc: '',
      args: [],
    );
  }

  /// `Swap`
  String get swapSwap {
    return Intl.message(
      'Swap',
      name: 'swapSwap',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get swapName {
    return Intl.message(
      'Name',
      name: 'swapName',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get swapMarketPrice {
    return Intl.message(
      'Price',
      name: 'swapMarketPrice',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get swapChange {
    return Intl.message(
      'Change',
      name: 'swapChange',
      desc: '',
      args: [],
    );
  }

  /// `trading:  directly to the platform of JustSwap`
  String get swapTips01 {
    return Intl.message(
      'trading:  directly to the platform of JustSwap',
      name: 'swapTips01',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get swapSend {
    return Intl.message(
      'Send',
      name: 'swapSend',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get swapReceive {
    return Intl.message(
      'Receive',
      name: 'swapReceive',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get swapBalance {
    return Intl.message(
      'Balance',
      name: 'swapBalance',
      desc: '',
      args: [],
    );
  }

  /// `Pooled Tokens`
  String get swapPooledTokens {
    return Intl.message(
      'Pooled Tokens',
      name: 'swapPooledTokens',
      desc: '',
      args: [],
    );
  }

  /// `Token Name`
  String get swapTokenName {
    return Intl.message(
      'Token Name',
      name: 'swapTokenName',
      desc: '',
      args: [],
    );
  }

  /// `Price (USD)`
  String get swapTokenPrice {
    return Intl.message(
      'Price (USD)',
      name: 'swapTokenPrice',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get swapTokenBalance {
    return Intl.message(
      'Balance',
      name: 'swapTokenBalance',
      desc: '',
      args: [],
    );
  }

  /// `Pool`
  String get swapPool {
    return Intl.message(
      'Pool',
      name: 'swapPool',
      desc: '',
      args: [],
    );
  }

  /// `Total Liquidity`
  String get swapTotalLiquidity {
    return Intl.message(
      'Total Liquidity',
      name: 'swapTotalLiquidity',
      desc: '',
      args: [],
    );
  }

  /// `Token`
  String get swapToken {
    return Intl.message(
      'Token',
      name: 'swapToken',
      desc: '',
      args: [],
    );
  }

  /// `Token Not Enough`
  String get swapTokenNotEnough {
    return Intl.message(
      'Token Not Enough',
      name: 'swapTokenNotEnough',
      desc: '',
      args: [],
    );
  }

  /// `Manage Wallets`
  String get mineManageWallet {
    return Intl.message(
      'Manage Wallets',
      name: 'mineManageWallet',
      desc: '',
      args: [],
    );
  }

  /// `Current Version`
  String get mineCurrentVersion {
    return Intl.message(
      'Current Version',
      name: 'mineCurrentVersion',
      desc: '',
      args: [],
    );
  }

  /// `No Wallet`
  String get mineNoWallet {
    return Intl.message(
      'No Wallet',
      name: 'mineNoWallet',
      desc: '',
      args: [],
    );
  }

  /// `whether to switch language`
  String get mineLangTip1 {
    return Intl.message(
      'whether to switch language',
      name: 'mineLangTip1',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}