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
    "assetBalance" : MessageLookupByLibrary.simpleMessage("Balance"),
    "assetConfirmPassword" : MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "assetCopyAddress" : MessageLookupByLibrary.simpleMessage("Copy Address"),
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
    "assetReceivingAddress" : MessageLookupByLibrary.simpleMessage("Receiving Address"),
    "assetReceivingQrCode" : MessageLookupByLibrary.simpleMessage("Receiving QR Code"),
    "assetSetPassword" : MessageLookupByLibrary.simpleMessage("Set Password"),
    "assetSwap" : MessageLookupByLibrary.simpleMessage("Swap"),
    "assetTransfer" : MessageLookupByLibrary.simpleMessage("Transfer"),
    "assetTransferAddress" : MessageLookupByLibrary.simpleMessage("Transfer Address"),
    "assetTransferAmount" : MessageLookupByLibrary.simpleMessage("Transfer Amount"),
    "assetTransferError1" : MessageLookupByLibrary.simpleMessage("receiving address cannot be empty"),
    "assetTransferError2" : MessageLookupByLibrary.simpleMessage("receiving address format incorrect"),
    "assetTransferError3" : MessageLookupByLibrary.simpleMessage("receiving address and transfer address cannot be the same"),
    "assetTransferError4" : MessageLookupByLibrary.simpleMessage("transfer amount cannot be empty"),
    "assetTransferError5" : MessageLookupByLibrary.simpleMessage("transfer amount must be greater than 0"),
    "assetTransferError6" : MessageLookupByLibrary.simpleMessage("insufficient transfer amount"),
    "assetTransferSuccess" : MessageLookupByLibrary.simpleMessage("Transfer Success"),
    "assetTransferTip1" : MessageLookupByLibrary.simpleMessage("enter or paste wallet address"),
    "assetTransferTip2" : MessageLookupByLibrary.simpleMessage("input amount"),
    "assetTransferTip3" : MessageLookupByLibrary.simpleMessage("transfer processing..."),
    "assetTransferTip4" : MessageLookupByLibrary.simpleMessage("during the transfer process, please do not repeat the operation"),
    "assetTransferTip5" : MessageLookupByLibrary.simpleMessage("transfer failed, please try again later"),
    "assetUpdatePassword" : MessageLookupByLibrary.simpleMessage("Update Password"),
    "assetUpdateWalletName" : MessageLookupByLibrary.simpleMessage("Update Wallet Name"),
    "assetWalletDetails" : MessageLookupByLibrary.simpleMessage("Wallet Details"),
    "assetWalletList" : MessageLookupByLibrary.simpleMessage("Wallet List"),
    "assetWalletName" : MessageLookupByLibrary.simpleMessage("Wallet Name"),
    "backupWalletTip1" : MessageLookupByLibrary.simpleMessage("please back up the mnemonic to a safe place, once the mnemonic is lost, it cannot be retrieved"),
    "backupWalletTip2" : MessageLookupByLibrary.simpleMessage("please back up the private key to a safe place, once the private key is lost, it cannot be retrieved"),
    "bottomTab1" : MessageLookupByLibrary.simpleMessage("Assets"),
    "bottomTab2" : MessageLookupByLibrary.simpleMessage("Swap"),
    "bottomTab3" : MessageLookupByLibrary.simpleMessage("Mine"),
    "commonBackupMnemonic" : MessageLookupByLibrary.simpleMessage("please backup your mnemonic"),
    "commonCanNotBeEmpty" : MessageLookupByLibrary.simpleMessage("can not be empty"),
    "commonCancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "commonConfirm" : MessageLookupByLibrary.simpleMessage("Confirm"),
    "commonConfirmNewPwd" : MessageLookupByLibrary.simpleMessage("confirm new password"),
    "commonConfirmPwdError" : MessageLookupByLibrary.simpleMessage("the two entered passwords are inconsistent"),
    "commonCopySuccess" : MessageLookupByLibrary.simpleMessage("Copy Success"),
    "commonCreateFail" : MessageLookupByLibrary.simpleMessage("create failed, please try again"),
    "commonCurrent" : MessageLookupByLibrary.simpleMessage("current"),
    "commonDeleteWalletTip" : MessageLookupByLibrary.simpleMessage("please make sure that the private key or mnemonic is backed up, are you sure to delete it?"),
    "commonDone" : MessageLookupByLibrary.simpleMessage("Done"),
    "commonEnterOldPwd" : MessageLookupByLibrary.simpleMessage("enter old password"),
    "commonError1" : MessageLookupByLibrary.simpleMessage("password can not be empty"),
    "commonError2" : MessageLookupByLibrary.simpleMessage("password is 6 digits"),
    "commonError3" : MessageLookupByLibrary.simpleMessage("password error"),
    "commonExecuteFail" : MessageLookupByLibrary.simpleMessage("execute failed, please try again"),
    "commonExecutedError" : MessageLookupByLibrary.simpleMessage("executed error, please try again"),
    "commonImportFail" : MessageLookupByLibrary.simpleMessage("import failed, please try again"),
    "commonImportSuccess" : MessageLookupByLibrary.simpleMessage("imported successfully"),
    "commonIncorrectFormat" : MessageLookupByLibrary.simpleMessage("incorrect format"),
    "commonMax" : MessageLookupByLibrary.simpleMessage("MAX"),
    "commonNeed6Digit" : MessageLookupByLibrary.simpleMessage("need 6 digit"),
    "commonPhotoAlbum" : MessageLookupByLibrary.simpleMessage("Photo Album"),
    "commonPleaseEnterYourPassword" : MessageLookupByLibrary.simpleMessage("please enter your password"),
    "commonPwd6Digit" : MessageLookupByLibrary.simpleMessage("the password 6 numbers"),
    "commonPwdIncorrect" : MessageLookupByLibrary.simpleMessage("the password incorrect"),
    "commonSavedSafely" : MessageLookupByLibrary.simpleMessage("Saved Safely"),
    "commonScan" : MessageLookupByLibrary.simpleMessage("Scan"),
    "commonSend" : MessageLookupByLibrary.simpleMessage("Send"),
    "commonSetNewPwd" : MessageLookupByLibrary.simpleMessage("set new password"),
    "commonSubmit" : MessageLookupByLibrary.simpleMessage("Submit"),
    "commonUpdateSuccess" : MessageLookupByLibrary.simpleMessage("Update Success"),
    "mineCurrentVersion" : MessageLookupByLibrary.simpleMessage("Current Version"),
    "mineLangTip1" : MessageLookupByLibrary.simpleMessage("whether to switch language"),
    "mineManageWallet" : MessageLookupByLibrary.simpleMessage("Manage Wallets"),
    "mineNoWallet" : MessageLookupByLibrary.simpleMessage("No Wallet"),
    "swapBalance" : MessageLookupByLibrary.simpleMessage("Balance"),
    "swapChange" : MessageLookupByLibrary.simpleMessage("Change"),
    "swapMarket" : MessageLookupByLibrary.simpleMessage("Market"),
    "swapMarketPrice" : MessageLookupByLibrary.simpleMessage("Price"),
    "swapName" : MessageLookupByLibrary.simpleMessage("Name"),
    "swapPool" : MessageLookupByLibrary.simpleMessage("Pool"),
    "swapPooledTokens" : MessageLookupByLibrary.simpleMessage("Pooled Tokens"),
    "swapReceive" : MessageLookupByLibrary.simpleMessage("Receive"),
    "swapSend" : MessageLookupByLibrary.simpleMessage("Send"),
    "swapSwap" : MessageLookupByLibrary.simpleMessage("Swap"),
    "swapTips01" : MessageLookupByLibrary.simpleMessage("trading:  directly to the platform of JustSwap"),
    "swapToken" : MessageLookupByLibrary.simpleMessage("Token"),
    "swapTokenBalance" : MessageLookupByLibrary.simpleMessage("Balance"),
    "swapTokenName" : MessageLookupByLibrary.simpleMessage("Name"),
    "swapTokenNotEnough" : MessageLookupByLibrary.simpleMessage("Token Not Enough"),
    "swapTokenPrice" : MessageLookupByLibrary.simpleMessage("Price"),
    "swapTotalLiquidity" : MessageLookupByLibrary.simpleMessage("Total Liquidity")
  };
}
