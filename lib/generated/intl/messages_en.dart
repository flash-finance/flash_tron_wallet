// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "addWalletTip1" : MessageLookupByLibrary.simpleMessage("1. need to set a 6-digit password for wallet management and transaction authorization"),
    "addWalletTip2" : MessageLookupByLibrary.simpleMessage("2. the platform does not store passwords and cannot be retrieved, please keep them properly"),
    "addWalletTip3" : MessageLookupByLibrary.simpleMessage("1. the mnemonic is the private key, which is used to restore the wallet. Please back it up to a safe place"),
    "addWalletTip4" : MessageLookupByLibrary.simpleMessage("2. please keep the mnemonic properly, if someone obtains it, they can directly obtain your assets"),
    "assetAddWallet" : MessageLookupByLibrary.simpleMessage("Add Wallet"),
    "assetAssets" : MessageLookupByLibrary.simpleMessage("Assets"),
    "assetBackupMnemonic" : MessageLookupByLibrary.simpleMessage("Backup Mnemonic"),
    "assetBackupPrivateKey" : MessageLookupByLibrary.simpleMessage("Backup Private Key"),
    "assetConfirmPassword" : MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "assetCreateWallet" : MessageLookupByLibrary.simpleMessage("Create Wallet"),
    "assetDeleteWallet" : MessageLookupByLibrary.simpleMessage("Delete Wallet"),
    "assetDetails" : MessageLookupByLibrary.simpleMessage("Details"),
    "assetImportMnemonic" : MessageLookupByLibrary.simpleMessage("Import Mnemonic"),
    "assetImportPrivateKey" : MessageLookupByLibrary.simpleMessage("Import Private Key"),
    "assetMnemonic" : MessageLookupByLibrary.simpleMessage("Mnemonic"),
    "assetMyAssets" : MessageLookupByLibrary.simpleMessage("My Assets"),
    "assetNameLong" : MessageLookupByLibrary.simpleMessage("Name Too Long"),
    "assetPrivateKey" : MessageLookupByLibrary.simpleMessage("Private Key"),
    "assetReceive" : MessageLookupByLibrary.simpleMessage("Receive"),
    "assetSetPassword" : MessageLookupByLibrary.simpleMessage("Set Password"),
    "assetSwap" : MessageLookupByLibrary.simpleMessage("Swap"),
    "assetTransfer" : MessageLookupByLibrary.simpleMessage("Transfer"),
    "assetUpdatePassword" : MessageLookupByLibrary.simpleMessage("Update Password"),
    "assetUpdateWalletName" : MessageLookupByLibrary.simpleMessage("Update Wallet Name"),
    "assetWalletDetails" : MessageLookupByLibrary.simpleMessage("Wallet Details"),
    "assetWalletList" : MessageLookupByLibrary.simpleMessage("Wallet List"),
    "assetWalletName" : MessageLookupByLibrary.simpleMessage("Wallet Name"),
    "bottomTab1" : MessageLookupByLibrary.simpleMessage("Assets"),
    "bottomTab2" : MessageLookupByLibrary.simpleMessage("Swap"),
    "bottomTab3" : MessageLookupByLibrary.simpleMessage("Mine"),
    "commonBackupMnemonic" : MessageLookupByLibrary.simpleMessage("please backup your mnemonic"),
    "commonCanNotBeEmpty" : MessageLookupByLibrary.simpleMessage("can not be empty"),
    "commonCancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "commonConfirm" : MessageLookupByLibrary.simpleMessage("Confirm"),
    "commonConfirmPwdError" : MessageLookupByLibrary.simpleMessage("the two entered passwords are inconsistent"),
    "commonCopySuccess" : MessageLookupByLibrary.simpleMessage("Copy Success"),
    "commonCreateFail" : MessageLookupByLibrary.simpleMessage("create failed, please try again"),
    "commonDeleteWalletTip" : MessageLookupByLibrary.simpleMessage("please make sure that the private key or mnemonic is backed up, are you sure to delete it?"),
    "commonExecutedError" : MessageLookupByLibrary.simpleMessage("executed error, please try again"),
    "commonImportFail" : MessageLookupByLibrary.simpleMessage("import failed, please try again"),
    "commonImportSuccess" : MessageLookupByLibrary.simpleMessage("imported successfully"),
    "commonIncorrectFormat" : MessageLookupByLibrary.simpleMessage("incorrect format"),
    "commonNeed6Digit" : MessageLookupByLibrary.simpleMessage("need 6 digit"),
    "commonPleaseEnterYourPassword" : MessageLookupByLibrary.simpleMessage("please enter your password"),
    "commonSavedSafely" : MessageLookupByLibrary.simpleMessage("Saved Safely"),
    "commonSubmit" : MessageLookupByLibrary.simpleMessage("Submit"),
    "commonUpdateSuccess" : MessageLookupByLibrary.simpleMessage("Update Success"),
    "mineCurrentVersion" : MessageLookupByLibrary.simpleMessage("CurrentVersion"),
    "mineManageWallet" : MessageLookupByLibrary.simpleMessage("Manage Wallets")
  };
}
