import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flash_tron_wallet/route/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WalletDetailPage extends StatefulWidget {
  final String selectIndex = Get.parameters['selectIndex'];

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
    WalletEntity wallet = GlobalService.to.selectWalletEntity;
    bool flag = wallet.mnemonic != null;
    return Container(
      child: ListView(
        children: <Widget>[
          MyCommonUtil.interval(value: 20),
          _topWidget(context, wallet),
          MyCommonUtil.interval(value: 20),
          flag ? _backupMnemonicWidget(context, wallet.pwd) : Container(),
          _backupKeyWidget(context, wallet.pwd),
          _updatePwdWidget(context),
          _delWalletWidget(context),
          MyCommonUtil.interval(value: 20),
        ],
      ),
    );
  }

  Widget _topWidget(BuildContext context, WalletEntity wallet) {
    String temp = wallet.tronAddress;
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
                    _showUpdateNameDialLog(
                        context, int.parse(widget.selectIndex));
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '${wallet.name}',
                            style: MyTextUtil.textStyle(2,
                                color: Colors.grey[800],
                                spacing: 0.0,
                                size: 28),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: MyScreenUtil.width(30)),
                        Container(
                          child: Icon(
                            IconData(0xe635, fontFamily: 'ICON'),
                            size: MyScreenUtil.sp(35),
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyCommonUtil.sizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: wallet.tronAddress));
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
                                color: Colors.grey[800],
                                spacing: 0.0,
                                size: 28),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: MyScreenUtil.width(30)),
                        Container(
                          child: Icon(
                            IconData(0xe618, fontFamily: 'ICON'),
                            size: MyScreenUtil.sp(30),
                            color: Colors.grey[800],
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

  Widget _backupMnemonicWidget(BuildContext context, String pwd) {
    return InkWell(
      onTap: () {
        return _showInputPwdDialLog(context, 1, pwd);
      },
      child: Container(
        margin: MyCommonUtil.edge(left: 40, right: 40, top: 30),
        padding: MyCommonUtil.edge(bottom: 30),
        decoration: BoxDecoration(
          border: MyCommonUtil.bottomBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '${MyLocaleKey.assetBackupMnemonic.tr}',
                style: MyTextUtil.textStyle(2,
                    color: Colors.grey[800], spacing: 0.0, size: 30),
              ),
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: MyScreenUtil.sp(27),
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backupKeyWidget(BuildContext context, String pwd) {
    return InkWell(
      onTap: () {
        return _showInputPwdDialLog(context, 2, pwd);
      },
      child: Container(
        margin: MyCommonUtil.edge(left: 40, right: 40, top: 30),
        padding: MyCommonUtil.edge(bottom: 30),
        decoration: BoxDecoration(
          border: MyCommonUtil.bottomBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '${MyLocaleKey.assetBackupPrivateKey.tr}',
                style: MyTextUtil.textStyle(2,
                    color: Colors.grey[800], spacing: 0.0, size: 30),
              ),
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: MyScreenUtil.sp(27),
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _updatePwdWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.assetUpdatePwd);
      },
      child: Container(
        margin: MyCommonUtil.edge(left: 40, right: 40, top: 30),
        padding: MyCommonUtil.edge(bottom: 30),
        decoration: BoxDecoration(
          border: MyCommonUtil.bottomBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '${MyLocaleKey.assetUpdatePassword.tr}',
                style: MyTextUtil.textStyle(2,
                    color: Colors.grey[800], spacing: 0.0, size: 30),
              ),
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: MyScreenUtil.sp(27),
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _delWalletWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        return _showDelWalletDialLog(context);
      },
      child: Container(
        margin: MyCommonUtil.edge(left: 40, right: 40, top: 30),
        padding: MyCommonUtil.edge(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '${MyLocaleKey.assetDeleteWallet.tr}',
                style: MyTextUtil.textStyle(2,
                    color: Colors.grey[850], spacing: 0.0, size: 30),
              ),
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: MyScreenUtil.sp(27),
                color: Colors.grey[700],
              ),
            ),
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
                    color: Colors.grey[850], spacing: 0.2, size: 30),
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
                          fillColor: Colors.white,
                        ),
                        style: MyTextUtil.textStyle4Num(
                            color: Colors.grey[800],
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
                FlatButton(
                  child: Text(
                    '${MyLocaleKey.commonCancel.tr}',
                    style: MyTextUtil.textStyle(2,
                        color: MyColorUtil.theme, spacing: 0.5, size: 30),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text(
                      '${MyLocaleKey.commonConfirm.tr}',
                      style: MyTextUtil.textStyle(2,
                          color: MyColorUtil.theme, spacing: 0.5, size: 30),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _backupKey(context).then((val) {
                          if (val == true) {
                            Navigator.pop(context);
                            if (type == 1) {
                              /*Application.router.navigateTo(
                                  context, Routes.assetBackupMnemonic,
                                  transition: TransitionType.cupertino);*/
                              Get.toNamed(AppRoute.assetBackupMnemonic);
                            } else if (type == 2) {
                              /*Application.router.navigateTo(
                                  context, Routes.assetBackupKey,
                                  transition: TransitionType.cupertino);*/
                              Get.toNamed(AppRoute.assetBackupKey);
                            }
                          } else {
                            MyCommonUtil.showToast(
                                '${MyLocaleKey.commonExecutedError.tr}');
                          }
                        });
                      }
                    }),
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
                    color: Colors.grey[850], spacing: 0.0, size: 30),
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
                          fillColor: Colors.white,
                        ),
                        style: MyTextUtil.textStyle(2,
                            color: Colors.grey[850], spacing: 0.2, size: 30),
                        //obscureText: true,
                        maxLength: 10,
                        maxLengthEnforced: true,
                        validator: (String value) {
                          if (value.length > 10) {
                            return '${MyLocaleKey.assetNameLong.tr}';
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
                    color: Colors.grey[850], spacing: 0.2, size: 28),
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
    int index = GlobalService.to.selectWalletIndex;
    return await GlobalService.to.delWallet(index);
  }
}
