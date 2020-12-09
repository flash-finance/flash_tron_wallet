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

  /// `Please enter your password`
  String get commonPleaseEnterYourPassword {
    return Intl.message(
      'Please enter your password',
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

  /// `Executed error.Please try again`
  String get commonExecutedError {
    return Intl.message(
      'Executed error.Please try again',
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

  /// `Please make sure that the private key or mnemonic is backed up. Are you sure to delete it?`
  String get commonDeleteWalletTip {
    return Intl.message(
      'Please make sure that the private key or mnemonic is backed up. Are you sure to delete it?',
      name: 'commonDeleteWalletTip',
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

  /// `Manage Wallets`
  String get mineManageWallet {
    return Intl.message(
      'Manage Wallets',
      name: 'mineManageWallet',
      desc: '',
      args: [],
    );
  }

  /// `CurrentVersion`
  String get mineCurrentVersion {
    return Intl.message(
      'CurrentVersion',
      name: 'mineCurrentVersion',
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