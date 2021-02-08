import 'package:bip39/bip39.dart' as bip39;
import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flash_tron_wallet/tron/service/tron_wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ImportMnemonicPage extends StatefulWidget {
  final String type = Get.parameters['type'];

  @override
  _ImportMnemonicPageState createState() => _ImportMnemonicPageState();
}

class _ImportMnemonicPageState extends State<ImportMnemonicPage> {
  final _formKey = GlobalKey<FormState>();
  Color _setPwdEyeColor = Colors.grey;
  Color _confirmPwdEyeColor = Colors.grey;

  bool _setPwdClickEye = true;
  bool _confirmPwdClickEye = true;

  String _name;
  String _mnemonic;
  String _setPwd;
  String _confirmPwd;
  List<String> _list = [];

  bool _importMnemonicLoading = false;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasAppBar: true,
      hasBack: true,
      title: '${MyLocaleKey.assetImportMnemonic.tr}',
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: MyScreenUtil.height(20)),
                _descWidget(),
                SizedBox(height: MyScreenUtil.height(20)),
                Container(
                  margin: EdgeInsets.only(
                      left: MyScreenUtil.width(30),
                      right: MyScreenUtil.width(30)),
                  child: Column(
                    children: <Widget>[
                      _nameWidget(),
                      _mnemonicWidget(),
                      SizedBox(height: MyScreenUtil.height(0)),
                      _setPwdWidget(),
                      SizedBox(height: MyScreenUtil.height(0)),
                      _confirmPwdWidget(),
                      SizedBox(height: MyScreenUtil.height(50)),
                      _submitWidget(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _importMnemonicLoading
              ? Container(
                  padding: EdgeInsets.only(
                      top: MyScreenUtil.height(300),
                      left: MyScreenUtil.width(350)),
                  child: CupertinoActivityIndicator(),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _nameWidget() {
    return Container(
      child: TextFormField(
        readOnly: !_importMnemonicLoading ? false : true,
        onSaved: (String value) => _name = value,
        maxLength: 10,
        inputFormatters: [],
        cursorColor: MyColorUtil.themeColor,
        decoration: InputDecoration(
          labelText: '${MyLocaleKey.assetWalletName.tr}',
          labelStyle: MyTextUtil.textStyle(2,
              color: Colors.grey[700], spacing: 0.1, size: 26),
        ),
        style: MyTextUtil.textStyle(2,
            color: Colors.grey[850], spacing: 0.2, size: 30),
        validator: (String value) {
          if (value.isEmpty) {
            return '${MyLocaleKey.commonCanNotBeEmpty.tr}';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _mnemonicWidget() {
    return Container(
      child: TextFormField(
        readOnly: !_importMnemonicLoading ? false : true,
        onSaved: (String value) => _mnemonic = value,
        maxLines: 2,
        maxLength: 150,
        cursorColor: MyColorUtil.themeColor,
        decoration: InputDecoration(
          labelText: '${MyLocaleKey.assetMnemonic.tr}',
          labelStyle: MyTextUtil.textStyle(2,
              color: Colors.grey[700], spacing: 0.1, size: 26),
        ),
        style: MyTextUtil.textStyle4En(2,
            color: Colors.grey[850], spacing: 0.0, size: 28),
        validator: (String value) {
          if (value.isEmpty) {
            return '${MyLocaleKey.commonCanNotBeEmpty.tr}';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _setPwdWidget() {
    return Container(
      child: TextFormField(
        readOnly: !_importMnemonicLoading ? false : true,
        obscureText: _setPwdClickEye,
        onSaved: (String value) {
          if (value.length > 6) {
            value = value.substring(0, 6);
          }
          _setPwd = value;
        },
        maxLength: 6,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        keyboardType: TextInputType.number,
        cursorColor: MyColorUtil.themeColor,
        decoration: InputDecoration(
            labelText: '${MyLocaleKey.assetSetPassword.tr}',
            labelStyle: MyTextUtil.textStyle(2,
                color: Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _setPwdEyeColor,
                size: MyScreenUtil.sp(38),
              ),
              onPressed: () {
                setState(() {
                  _setPwdClickEye = !_setPwdClickEye;
                  _setPwdEyeColor =
                      _setPwdClickEye ? Colors.grey : MyColorUtil.themeColor;
                });
              },
            )),
        style: MyTextUtil.textStyle4Num(
            color: Colors.grey[800],
            spacing: 0.2,
            size: 32,
            fontWeight: FontWeight.w500),
        validator: (String value) {
          if (value.isEmpty) {
            return '${MyLocaleKey.commonCanNotBeEmpty.tr}';
          } else if (value.trim().length < 6) {
            return '${MyLocaleKey.commonNeed6Digit.tr}';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _confirmPwdWidget() {
    return Container(
      child: TextFormField(
        readOnly: !_importMnemonicLoading ? false : true,
        obscureText: _confirmPwdClickEye,
        onSaved: (String value) {
          if (value.length > 6) {
            value = value.substring(0, 6);
          }
          _confirmPwd = value;
        },
        maxLength: 6,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        keyboardType: TextInputType.number,
        cursorColor: MyColorUtil.themeColor,
        decoration: InputDecoration(
            labelText: '${MyLocaleKey.assetConfirmPassword.tr}',
            labelStyle: MyTextUtil.textStyle(2,
                color: Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _confirmPwdEyeColor,
                size: MyScreenUtil.sp(38),
              ),
              onPressed: () {
                setState(() {
                  _confirmPwdClickEye = !_confirmPwdClickEye;
                  _confirmPwdEyeColor = _confirmPwdClickEye
                      ? Colors.grey
                      : MyColorUtil.themeColor;
                });
              },
            )),
        style: MyTextUtil.textStyle4Num(
            color: Colors.grey[800],
            spacing: 0.2,
            size: 32,
            fontWeight: FontWeight.w500),
        validator: (String value) {
          if (value.isEmpty) {
            return '${MyLocaleKey.commonCanNotBeEmpty.tr}';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _submitWidget(BuildContext context) {
    return Container(
      child: Align(
        child: SizedBox(
          width: MyScreenUtil.width(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                '${MyLocaleKey.commonSubmit.tr}',
                style: MyTextUtil.textStyle(1,
                    color: Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color: MyColorUtil.themeColor,
            onPressed: !_importMnemonicLoading
                ? () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      if (_setPwd != _confirmPwd) {
                        MyCommonUtil.showToast(
                            '${MyLocaleKey.commonConfirmPwdError.tr}');
                      } else if (!validateMnemonic()) {
                        MyCommonUtil.showToast(
                            '${MyLocaleKey.commonIncorrectFormat.tr}');
                      } else {
                        _submit().then((val) {
                          setState(() {
                            _importMnemonicLoading = false;
                          });
                          if (val == true) {
                            MyCommonUtil.showToast(
                                '${MyLocaleKey.commonImportSuccess.tr}');
                            if (widget.type == '1') {
                              Navigator.of(context)..pop();
                            } else if (widget.type == '2') {
                              Navigator.of(context)..pop()..pop();
                            }
                          } else {
                            MyCommonUtil.showToast(
                                '${MyLocaleKey.commonImportFail.tr}');
                          }
                        });
                      }
                    }
                  }
                : () {},
            shape:
                StadiumBorder(side: BorderSide(color: MyColorUtil.themeColor)),
          ),
        ),
      ),
    );
  }

  Widget _descWidget() {
    return Container(
      margin: EdgeInsets.only(
          left: MyScreenUtil.width(30), right: MyScreenUtil.width(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColorUtil.themeColor,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '${MyLocaleKey.addWalletTip1.tr}',
              style: MyTextUtil.textStyle(1,
                  color: Colors.white, spacing: 0.1, size: 21),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 12),
            alignment: Alignment.centerLeft,
            child: Text(
              '${MyLocaleKey.addWalletTip2.tr}',
              style: MyTextUtil.textStyle(1,
                  color: Colors.white, spacing: 0.1, size: 21),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  bool validateMnemonic() {
    _mnemonic = _mnemonic.trim();
    List<String> tempList = _mnemonic.split(' ');
    for (String temp in tempList) {
      if (temp.isNotEmpty) {
        _list.add(temp);
      }
    }
    String tempMnemonic = '';
    for (String temp in _list) {
      tempMnemonic += temp + ' ';
    }
    _mnemonic = tempMnemonic.trim();
    return bip39.validateMnemonic(_mnemonic);
  }

  Future<bool> _submit() async {
    setState(() {
      _importMnemonicLoading = true;
    });
    WalletEntity entity =
        TronWallet().importWalletByMnemonic(_name, _setPwd, _mnemonic);
    bool result = await GlobalService.to.addWallet(entity);
    if (result) {
      _getAsset();
    }
    return result;
  }

  Future<bool> _getAsset() async {
    await GlobalService.to.getAsset4Init();
    GlobalService.to.getAsset4ReloadAsync();
    return true;
  }
}
