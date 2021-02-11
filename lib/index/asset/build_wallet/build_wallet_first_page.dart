import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flash_tron_wallet/route/app_route.dart';
import 'package:flash_tron_wallet/tron/service/tron_wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BuildWalletFirstPage extends StatefulWidget {
  final String type = Get.parameters['type'];

  @override
  _BuildWalletFirstPageState createState() => _BuildWalletFirstPageState();
}

class _BuildWalletFirstPageState extends State<BuildWalletFirstPage> {
  final _formKey = GlobalKey<FormState>();
  Color _setPwdEyeColor = Colors.grey;
  Color _confirmPwdEyeColor = Colors.grey;

  bool _setPwdClickEye = true;
  bool _confirmPwdClickEye = true;

  String _name;
  String _setPwd;
  String _confirmPwd;

  bool _buildWalletLoading = false;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasAppBar: true,
      hasBack: true,
      title: '${MyLocaleKey.assetCreateWallet.tr}',
      body: _bodyWidget(context),
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
                    MyCommonUtil.sizedBox(height: 0),
                    _setPwdWidget(),
                    MyCommonUtil.sizedBox(height: 0),
                    _confirmPwdWidget(),
                    MyCommonUtil.sizedBox(height: 50),
                    _submitWidget(context),
                  ],
                ),
              ),
            ],
          ),
        ),
        _buildWalletLoading
            ? MyCommonUtil.defaultLoading(bottom: 600)
            : Container(),
      ],
    );
  }

  Widget _nameWidget() {
    return Container(
      child: TextFormField(
        readOnly: !_buildWalletLoading ? false : true,
        onSaved: (String value) => _name = value,
        maxLength: 10,
        inputFormatters: [],
        cursorColor: MyColorUtil.theme,
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

  Widget _setPwdWidget() {
    return Container(
      child: TextFormField(
        readOnly: !_buildWalletLoading ? false : true,
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
        cursorColor: MyColorUtil.theme,
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
                      _setPwdClickEye ? Colors.grey : MyColorUtil.theme;
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
        readOnly: !_buildWalletLoading ? false : true,
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
        cursorColor: MyColorUtil.theme,
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
                  _confirmPwdEyeColor =
                      _confirmPwdClickEye ? Colors.grey : MyColorUtil.theme;
                });
              },
            )),
        style: MyTextUtil.textStyle4Num(
          color: Colors.grey[800],
          spacing: 0.2,
          size: 32,
          fontWeight: FontWeight.w500,
        ),
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
    return MyCommonUtil.submit(
      context,
      320,
      '${MyLocaleKey.commonSubmit.tr}',
      _onPressed(context),
    );
  }

  Function _onPressed(BuildContext context) {
    return !_buildWalletLoading
        ? () {
            FocusScope.of(context).requestFocus(FocusNode());
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              if (_setPwd != _confirmPwd) {
                MyCommonUtil.showToast(
                    '${MyLocaleKey.commonConfirmPwdError.tr}');
              } else {
                _submit(context).then((val) {
                  setState(() {
                    _buildWalletLoading = false;
                  });
                  if (val == true) {
                    Get.toNamed(
                        AppRoute.assetBuildSecondWallet + '/${widget.type}');
                  } else {
                    MyCommonUtil.showToast(
                        '${MyLocaleKey.commonCreateFail.tr}');
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
                  color: Colors.white, spacing: 0.1, size: 21),
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
                  color: Colors.white, spacing: 0.1, size: 21),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _submit(BuildContext context) async {
    setState(() {
      _buildWalletLoading = true;
    });
    WalletEntity entity = TronWallet().createWallet(_name, _setPwd);
    bool result = await GlobalService.to.addWallet(entity);
    if (result) {
      _getAsset(context);
    }
    await Future.delayed(Duration(milliseconds: 1000), () {});

    return result;
  }

  Future<bool> _getAsset(BuildContext context) async {
    GlobalService.to.getAsset4Init();
    return true;
  }
}
