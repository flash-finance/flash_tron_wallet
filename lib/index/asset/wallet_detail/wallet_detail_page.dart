import 'package:flash_tron_wallet/common/enum/detail_wallet_type.dart';
import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/icon_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/index/asset/backup_key/backup_key_page.dart';
import 'package:flash_tron_wallet/index/asset/backup_mnemonic/backup_mnemonic_page.dart';
import 'package:flash_tron_wallet/index/asset/update_pwd/update_pwd_page.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WalletDetailPage extends StatefulWidget {
  final int index;
  final WalletEntity wallet;

  WalletDetailPage(this.index, this.wallet);

  @override
  _WalletDetailPageState createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> {
  final _formKey = GlobalKey<FormState>();
  String _name;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasAppBar: true,
      hasBack: true,
      title: '${MyLocaleKey.assetWalletDetails.tr}',
      body: Obx(() => _bodyWidget(context)),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    bool flag = widget.wallet.mnemonic != null;
    return Container(
      child: ListView(
        children: <Widget>[
          MyCommonUtil.interval(value: 20),
          _topWidget(context),
          MyCommonUtil.interval(value: 20),
          flag
              ? _itemWidget(context, '${MyLocaleKey.assetBackupMnemonic.tr}',
                  DetailWalletType.backupMnemonic, true)
              : Container(),
          _itemWidget(context, '${MyLocaleKey.assetBackupPrivateKey.tr}',
              DetailWalletType.backupKey, true),
          _itemWidget(context, '${MyLocaleKey.assetUpdatePassword.tr}',
              DetailWalletType.updatePwd, true),
          _itemWidget(context, '${MyLocaleKey.assetDeleteWallet.tr}',
              DetailWalletType.delWallet, false),
          MyCommonUtil.interval(value: 20),
        ],
      ),
    );
  }

  Widget _topWidget(BuildContext context) {
    String temp = widget.wallet.tronAddress;
    String tronAddress = temp.substring(0, 8) +
        '...' +
        temp.substring(temp.length - 8, temp.length);
    return Container(
      padding: MyCommonUtil.edge(left: 10, right: 30, top: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          Container(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                'asset/image/flash.png',
                width: MyScreenUtil.width(130),
                height: MyScreenUtil.width(130),
                fit: BoxFit.cover,
              ),
            ),
          ),
          MyCommonUtil.sizedBox(width: 10),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _showUpdateNameDialLog(context, widget.index);
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '${widget.wallet.name}',
                            style: MyTextUtil.textStyle(2,
                                color: MyColorUtil.biz(),
                                spacing: 0.0,
                                size: 28),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: MyScreenUtil.width(50)),
                        Container(
                          child: MyCommonUtil.icon(
                            MyIconUtil.noteExt,
                            size: 35,
                            color: MyColorUtil.biz(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyCommonUtil.sizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: widget.wallet.tronAddress));
                    MyCommonUtil.showToast(
                        '${MyLocaleKey.commonCopySuccess.tr}');
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '$tronAddress',
                            style: MyTextUtil.textStyle4En(2,
                                color: MyColorUtil.biz(),
                                spacing: 0.0,
                                size: 28),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: MyScreenUtil.width(50)),
                        Container(
                          child: MyCommonUtil.icon(
                            MyIconUtil.copyExt,
                            size: 30,
                            color: MyColorUtil.biz(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemWidget(
      BuildContext context, String name, DetailWalletType type, bool flag) {
    return InkWell(
      onTap: () {
        switch (type) {
          case DetailWalletType.backupMnemonic:
            _showInputPwdDialLog(context, 1, widget.wallet.pwd);
            break;
          case DetailWalletType.backupKey:
            _showInputPwdDialLog(context, 2, widget.wallet.pwd);
            break;
          case DetailWalletType.updatePwd:
            Get.to(UpdatePwdPage(widget.index, widget.wallet));
            break;
          case DetailWalletType.delWallet:
            _showDelWalletDialLog(context);
            break;
        }
      },
      child: Container(
        margin: MyCommonUtil.edge(left: 40, right: 40, top: 30),
        padding: MyCommonUtil.edge(bottom: 30),
        decoration: BoxDecoration(
          border: flag ? MyCommonUtil.bottomBorder() : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '$name',
                style: MyTextUtil.textStyle(2,
                    color: MyColorUtil.biz(), spacing: 0.0, size: 30),
              ),
            ),
            MyCommonUtil.arrowForward(),
          ],
        ),
      ),
    );
  }

  _showInputPwdDialLog(BuildContext context, int type, String pwd) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                '${MyLocaleKey.commonPleaseEnterYourPassword.tr}',
                style: MyTextUtil.textStyle(2,
                    color: MyColorUtil.biz(), spacing: 0.2, size: 30),
              ),
              content: Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        onSaved: (String value) {
                          if (value.length > 6) {
                            value = value.substring(0, 6);
                          }
                        },
                        cursorColor: MyColorUtil.theme,
                        decoration: InputDecoration(
                          hintText: '',
                          filled: true,
                          fillColor: MyColorUtil.white,
                        ),
                        style: MyTextUtil.textStyle4Num(
                            color: MyColorUtil.biz(),
                            spacing: 0.2,
                            size: 32,
                            fontWeight: FontWeight.w500),
                        obscureText: true,
                        maxLength: 6,
                        maxLengthEnforced: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        validator: (String value) {
                          if (value.length < 6) {
                            return '${MyLocaleKey.commonPwd6Digit.tr}';
                          } else if (value.substring(0, 6) != pwd) {
                            return '${MyLocaleKey.commonPwdIncorrect.tr}';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                MyCommonUtil.flatButton(
                  '${MyLocaleKey.commonCancel.tr}',
                  () => Navigator.pop(context),
                ),
                MyCommonUtil.flatButton(
                  '${MyLocaleKey.commonConfirm.tr}',
                  () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _backupKey(context).then((val) {
                        if (val == true) {
                          Navigator.pop(context);
                          if (type == 1) {
                            Get.to(BackupMnemonicPage(
                                widget.index, widget.wallet));
                          } else if (type == 2) {
                            Get.to(BackupKeyPage(widget.index, widget.wallet));
                          }
                        } else {
                          MyCommonUtil.showToast(
                              '${MyLocaleKey.commonExecutedError.tr}');
                        }
                      });
                    }
                  },
                ),
              ],
            ));
  }

  _showUpdateNameDialLog(BuildContext context, int index) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                '${MyLocaleKey.assetUpdateWalletName.tr}',
                style: MyTextUtil.textStyle(2,
                    color: MyColorUtil.biz(), spacing: 0.0, size: 30),
              ),
              content: Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        onSaved: (String value) {
                          _name = value;
                        },
                        cursorColor: MyColorUtil.theme,
                        decoration: InputDecoration(
                          hintText: '',
                          filled: true,
                          fillColor: MyColorUtil.white,
                        ),
                        style: MyTextUtil.textStyle(2,
                            color: MyColorUtil.biz(), spacing: 0.2, size: 30),
                        //obscureText: true,
                        maxLength: 10,
                        maxLengthEnforced: true,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return '${MyLocaleKey.commonCanNotBeEmpty.tr}';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                MyCommonUtil.flatButton(
                  '${MyLocaleKey.commonCancel.tr}',
                  () => Navigator.pop(context),
                ),
                MyCommonUtil.flatButton(
                  '${MyLocaleKey.commonConfirm.tr}',
                  () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _updateName(context, index).then((val) {
                        if (val == true) {
                          MyCommonUtil.showToast(
                              '${MyLocaleKey.commonUpdateSuccess.tr}');
                          Navigator.pop(context);
                        } else {
                          MyCommonUtil.showToast(
                              '${MyLocaleKey.commonExecutedError.tr}');
                        }
                      });
                    }
                  },
                ),
              ],
            ));
  }

  _showDelWalletDialLog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                '${MyLocaleKey.commonDeleteWalletTip.tr}',
                style: MyTextUtil.textStyle(2,
                    color: MyColorUtil.biz(), spacing: 0.2, size: 28),
              ),
              actions: <Widget>[
                MyCommonUtil.flatButton(
                  '${MyLocaleKey.commonCancel.tr}',
                  () => Navigator.pop(context),
                ),
                MyCommonUtil.flatButton(
                  '${MyLocaleKey.commonConfirm.tr}',
                  () => {
                    _delWallet(context).then((val) {
                      if (val == true) {
                        Navigator.of(context)..pop()..pop();
                      } else {
                        MyCommonUtil.showToast(
                            '${MyLocaleKey.commonExecutedError.tr}');
                      }
                    }),
                  },
                ),
              ],
            ));
  }

  Future<bool> _updateName(BuildContext context, int index) async {
    return await GlobalService.to.updateName(index, _name);
  }

  Future<bool> _backupKey(BuildContext context) async {
    return true;
  }

  Future<bool> _delWallet(BuildContext context) async {
    return await GlobalService.to.delWallet(widget.index);
  }
}
