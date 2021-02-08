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
          _buildWalletLoading
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
            color: MyColorUtil.theme,
            onPressed: !_buildWalletLoading
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
                            /*Application.router.navigateTo(
                                context,
                                Routes.assetBuildSecondWallet +
                                    '/${widget.type}',
                                transition: TransitionType.cupertino);*/
                            Get.toNamed(AppRoute.assetBuildSecondWallet +
                                '/${widget.type}');
                          } else {
                            MyCommonUtil.showToast(
                                '${MyLocaleKey.commonCreateFail.tr}');
                          }
                        });
                      }
                    }
                  }
                : () {},
            shape: StadiumBorder(side: BorderSide(color: MyColorUtil.theme)),
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
        color: MyColorUtil.theme,
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
