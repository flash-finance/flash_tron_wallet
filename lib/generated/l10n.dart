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

  // skipped getter for the 'asset-MyAssets' key

  // skipped getter for the 'asset-Details' key

  // skipped getter for the 'asset-Transfer' key

  // skipped getter for the 'asset-Receive' key

  // skipped getter for the 'asset-Swap' key

  // skipped getter for the 'asset-AddWallet' key

  // skipped getter for the 'asset-ImportPrivateKey' key

  // skipped getter for the 'asset-ImportMnemonic' key

  // skipped getter for the 'asset-CreateWallet' key

  // skipped getter for the 'asset-WalletDetails' key

  // skipped getter for the 'asset-BackupMnemonic' key

  // skipped getter for the 'asset-BackupPrivateKey' key

  // skipped getter for the 'asset-ModifyPassword' key

  // skipped getter for the 'asset-DeleteWallet' key

  // skipped getter for the 'asset-Assets' key

  // skipped getter for the 'asset-WalletList' key
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