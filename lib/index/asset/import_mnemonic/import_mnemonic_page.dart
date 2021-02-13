import 'package:bip39/bip39.dart' as bip39;
import 'package:flash_tron_wallet/common/enum/text_type.dart';
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
  Color _setPwdEyeColor = MyColorUtil.subBiz();
  Color _confirmPwdEyeColor = MyColorUtil.subBiz();

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
      body: Obx((() => _bodyWidget(context))),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              MyCommonUtil.sizedBox(height: 20),
              _descWidget(),
              MyCommonUtil.sizedBox(height: 20),
              Container(
                margin: MyCommonUtil.edge(left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    _nameWidget(),
                    _mnemonicWidget(),
                    _setPwdWidget(),
                    _confirmPwdWidget(),
                    MyCommonUtil.sizedBox(height: 50),
                    _submitWidget(context),
                  ],
                ),
              ),
            ],
          ),
        ),
        _importMnemonicLoading
            ? MyCommonUtil.defaultLoading(bottom: 600)
            : Container(),
      ],
    );
  }

  Widget _nameWidget() {
    return MyCommonUtil.textFormField(
      readOnly: _importMnemonicLoading,
      onSaved: (String value) => _name = value,
      maxLength: 10,
      inputFormatter: [],
      labelText: '${MyLocaleKey.assetWalletName.tr}',
      textType: TextType.normal,
      validator: (String value) {
        if (value.isEmpty) {
          return '${MyLocaleKey.commonCanNotBeEmpty.tr}';
        } else {
          return null;
        }
      },
    );
  }

  Widget _mnemonicWidget() {
    return MyCommonUtil.textFormField(
      readOnly: _importMnemonicLoading,
      onSaved: (String value) => _mnemonic = value,
      maxLine: 2,
      maxLength: 150,
      labelText: '${MyLocaleKey.assetMnemonic.tr}',
      textType: TextType.onlyEn,
      validator: (String value) {
        if (value.isEmpty) {
          return '${MyLocaleKey.commonCanNotBeEmpty.tr}';
        } else {
          return null;
        }
      },
    );
  }

  Widget _setPwdWidget() {
    return MyCommonUtil.textFormField(
      readOnly: _importMnemonicLoading,
      obscureText: _setPwdClickEye,
      onSaved: (String value) {
        if (value.length > 6) {
          value = value.substring(0, 6);
        }
        _setPwd = value;
      },
      maxLength: 6,
      inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      keyboardType: TextInputType.number,
      labelText: '${MyLocaleKey.assetSetPassword.tr}',
      textType: TextType.onlyNum,
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
                _setPwdClickEye ? MyColorUtil.subBiz() : MyColorUtil.theme;
          });
        },
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return '${MyLocaleKey.commonCanNotBeEmpty.tr}';
        } else if (value.trim().length < 6) {
          return '${MyLocaleKey.commonNeed6Digit.tr}';
        } else {
          return null;
        }
      },
    );
  }

  Widget _confirmPwdWidget() {
    return MyCommonUtil.textFormField(
      readOnly: _importMnemonicLoading,
      obscureText: _confirmPwdClickEye,
      onSaved: (String value) {
        if (value.length > 6) {
          value = value.substring(0, 6);
        }
        _confirmPwd = value;
      },
      maxLength: 6,
      inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      keyboardType: TextInputType.number,
      labelText: '${MyLocaleKey.assetConfirmPassword.tr}',
      textType: TextType.onlyNum,
      suffixIcon: IconButton(
        icon: Icon(
          Icons.remove_red_eye,
          color: _confirmPwdEyeColor,
          size: MyScreenUtil.sp(38),
        ),
        onPressed: () {
          setState(() {
            _confirmPwdClickEye = !_confirmPwdClickEye;
            _confirmPwdEyeColor =
                _confirmPwdClickEye ? MyColorUtil.subBiz() : MyColorUtil.theme;
          });
        },
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return '${MyLocaleKey.commonCanNotBeEmpty.tr}';
        } else {
          return null;
        }
      },
    );
  }

  Widget _submitWidget(BuildContext context) {
    return MyCommonUtil.submit(
      context,
      320,
      '${MyLocaleKey.commonSubmit.tr}',
      onPressed(context),
    );
  }

  Function onPressed(BuildContext context) {
    return !_importMnemonicLoading
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
        : () {};
  }

  Widget _descWidget() {
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColorUtil.theme,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: MyCommonUtil.edge(left: 60, right: 60, top: 30, bottom: 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '${MyLocaleKey.addWalletTip1.tr}',
              style: MyTextUtil.textStyle(1,
                  color: MyColorUtil.white, spacing: 0.1, size: 21),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: MyCommonUtil.edge(left: 60, right: 60, top: 5, bottom: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              '${MyLocaleKey.addWalletTip2.tr}',
              style: MyTextUtil.textStyle(1,
                  color: MyColorUtil.white, spacing: 0.1, size: 21),
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
