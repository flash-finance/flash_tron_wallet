// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "addWalletTip1" : MessageLookupByLibrary.simpleMessage("1. 需要设置6位数字的密码，用于钱包管理和交易授权"),
    "addWalletTip2" : MessageLookupByLibrary.simpleMessage("2. 平台不存储密码，也无法找回，请务必妥善保管"),
    "addWalletTip3" : MessageLookupByLibrary.simpleMessage("1. 助记词即私钥，用于恢复钱包，请备份到安全的地方"),
    "addWalletTip4" : MessageLookupByLibrary.simpleMessage("2. 请妥善保存助记词，如有人获得助记词，可直接获取您的资产"),
    "assetAddWallet" : MessageLookupByLibrary.simpleMessage("添加钱包"),
    "assetAssets" : MessageLookupByLibrary.simpleMessage("资产"),
    "assetBackupMnemonic" : MessageLookupByLibrary.simpleMessage("备份助记词"),
    "assetBackupPrivateKey" : MessageLookupByLibrary.simpleMessage("备份私钥"),
    "assetConfirmPassword" : MessageLookupByLibrary.simpleMessage("确认密码"),
    "assetCopyAddress" : MessageLookupByLibrary.simpleMessage("复制地址"),
    "assetCreateWallet" : MessageLookupByLibrary.simpleMessage("创建钱包"),
    "assetDeleteWallet" : MessageLookupByLibrary.simpleMessage("删除钱包"),
    "assetDetails" : MessageLookupByLibrary.simpleMessage("详情"),
    "assetImportMnemonic" : MessageLookupByLibrary.simpleMessage("导入助记词"),
    "assetImportPrivateKey" : MessageLookupByLibrary.simpleMessage("导入私钥"),
    "assetMnemonic" : MessageLookupByLibrary.simpleMessage("助记词"),
    "assetMyAssets" : MessageLookupByLibrary.simpleMessage("我的资产"),
    "assetNameLong" : MessageLookupByLibrary.simpleMessage("名称过长"),
    "assetPrivateKey" : MessageLookupByLibrary.simpleMessage("私钥"),
    "assetReceive" : MessageLookupByLibrary.simpleMessage("收款"),
    "assetReceivingQrCode" : MessageLookupByLibrary.simpleMessage("收款二维码"),
    "assetSetPassword" : MessageLookupByLibrary.simpleMessage("设置密码"),
    "assetSwap" : MessageLookupByLibrary.simpleMessage("交易"),
    "assetTransfer" : MessageLookupByLibrary.simpleMessage("转账"),
    "assetUpdatePassword" : MessageLookupByLibrary.simpleMessage("修改密码"),
    "assetUpdateWalletName" : MessageLookupByLibrary.simpleMessage("修改钱包名称"),
    "assetWalletDetails" : MessageLookupByLibrary.simpleMessage("钱包详情"),
    "assetWalletList" : MessageLookupByLibrary.simpleMessage("钱包列表"),
    "assetWalletName" : MessageLookupByLibrary.simpleMessage("钱包名称"),
    "backupWalletTip1" : MessageLookupByLibrary.simpleMessage("请将助记词备份到安全的地方, 助记词一旦丢失，无法找回"),
    "backupWalletTip2" : MessageLookupByLibrary.simpleMessage("请将私钥备份到安全的地方, 私钥一旦丢失，无法找回"),
    "bottomTab1" : MessageLookupByLibrary.simpleMessage("资产"),
    "bottomTab2" : MessageLookupByLibrary.simpleMessage("交易"),
    "bottomTab3" : MessageLookupByLibrary.simpleMessage("我的"),
    "commonBackupMnemonic" : MessageLookupByLibrary.simpleMessage("请备份您的助记词"),
    "commonCanNotBeEmpty" : MessageLookupByLibrary.simpleMessage("不能为空"),
    "commonCancel" : MessageLookupByLibrary.simpleMessage("取消"),
    "commonConfirm" : MessageLookupByLibrary.simpleMessage("确认"),
    "commonConfirmNewPwd" : MessageLookupByLibrary.simpleMessage("确认新密码"),
    "commonConfirmPwdError" : MessageLookupByLibrary.simpleMessage("两次输入密码不一致"),
    "commonCopySuccess" : MessageLookupByLibrary.simpleMessage("复制成功"),
    "commonCreateFail" : MessageLookupByLibrary.simpleMessage("创建出错，请再尝试\'"),
    "commonDeleteWalletTip" : MessageLookupByLibrary.simpleMessage("请确保私钥或助记词已备份，确定删除?"),
    "commonDone" : MessageLookupByLibrary.simpleMessage("完成"),
    "commonEnterOldPwd" : MessageLookupByLibrary.simpleMessage("输入旧密码"),
    "commonExecuteFail" : MessageLookupByLibrary.simpleMessage("执行出错，请再尝试"),
    "commonExecutedError" : MessageLookupByLibrary.simpleMessage("执行出错, 请再尝试"),
    "commonImportFail" : MessageLookupByLibrary.simpleMessage("导入失败，请再尝试"),
    "commonImportSuccess" : MessageLookupByLibrary.simpleMessage("导入成功"),
    "commonIncorrectFormat" : MessageLookupByLibrary.simpleMessage("格式不正确"),
    "commonNeed6Digit" : MessageLookupByLibrary.simpleMessage("需要6位数字"),
    "commonPleaseEnterYourPassword" : MessageLookupByLibrary.simpleMessage("请输入密码"),
    "commonPwd6Digit" : MessageLookupByLibrary.simpleMessage("密码为6位"),
    "commonPwdIncorrect" : MessageLookupByLibrary.simpleMessage("密码不正确"),
    "commonSavedSafely" : MessageLookupByLibrary.simpleMessage("已安全保存"),
    "commonSetNewPwd" : MessageLookupByLibrary.simpleMessage("设置新密码"),
    "commonSubmit" : MessageLookupByLibrary.simpleMessage("提交"),
    "commonUpdateSuccess" : MessageLookupByLibrary.simpleMessage("修改成功"),
    "mineCurrentVersion" : MessageLookupByLibrary.simpleMessage("当前版本"),
    "mineManageWallet" : MessageLookupByLibrary.simpleMessage("钱包管理")
  };
}
