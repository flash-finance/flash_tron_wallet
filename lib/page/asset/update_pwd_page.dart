import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UpdatePwdPage extends StatefulWidget {
  @override
  _UpdatePwdPageState createState() => _UpdatePwdPageState();
}

class _UpdatePwdPageState extends State<UpdatePwdPage> {
  final _formKey = GlobalKey<FormState>();
  Color _oldPwdEyeColor = Colors.grey;
  Color _setPwdEyeColor = Colors.grey;
  Color _confirmPwdEyeColor = Colors.grey;

  bool _oldPwdClickEye = true;
  bool _setPwdClickEye = true;
  bool _confirmPwdClickEye = true;

  String _oldPwd;
  String _setPwd;
  String _confirmPwd;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasAppBar: true,
      hasBack: true,
      title: '${MyLocaleKey.assetUpdatePassword.tr}',
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    WalletEntity wallet = GlobalService.to.selectWalletEntity;
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(height: MyScreenUtil.height(20)),
            _descWidget(),
            SizedBox(height: MyScreenUtil.height(20)),
            Container(
              margin: EdgeInsets.only(
                  left: MyScreenUtil.width(30), right: MyScreenUtil.width(30)),
              child: Column(
                children: <Widget>[
                  _oldPwdWidget(wallet.pwd),
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
    );
  }

  Widget _oldPwdWidget(String pwd) {
    return Container(
      child: TextFormField(
        obscureText: _oldPwdClickEye,
        onSaved: (String value) => _oldPwd = value,
        maxLength: 6,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        cursorColor: MyColorUtil.theme,
        decoration: InputDecoration(
            labelText: '${MyLocaleKey.commonEnterOldPwd.tr}',
            labelStyle: MyTextUtil.textStyle(2,
                color: Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _oldPwdEyeColor,
                size: MyScreenUtil.sp(38),
              ),
              onPressed: () {
                setState(() {
                  _oldPwdClickEye = !_oldPwdClickEye;
                  _oldPwdEyeColor =
                      _oldPwdClickEye ? Colors.grey : MyColorUtil.theme;
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
          } else if (value.trim().length != 6) {
            return '${MyLocaleKey.commonNeed6Digit.tr}';
          } else if (value.trim() != pwd) {
            return '${MyLocaleKey.commonPwdIncorrect.tr}';
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
        obscureText: _setPwdClickEye,
        onSaved: (String value) => _setPwd = value,
        maxLength: 6,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        cursorColor: MyColorUtil.theme,
        decoration: InputDecoration(
            labelText: '${MyLocaleKey.commonSetNewPwd.tr}',
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
          } else if (value.trim().length != 6) {
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
        obscureText: _confirmPwdClickEye,
        onSaved: (String value) => _confirmPwd = value,
        maxLength: 6,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        keyboardType: TextInputType.number,
        cursorColor: MyColorUtil.theme,
        decoration: InputDecoration(
            labelText: '${MyLocaleKey.commonConfirmNewPwd.tr}',
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
            color: MyColorUtil.theme,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (_setPwd != _confirmPwd) {
                  MyCommonUtil.showToast(
                      '${MyLocaleKey.commonConfirmPwdError.tr}');
                } else {
                  _submit(context).then((val) {
                    if (val == true) {
                      MyCommonUtil.showToast(
                          '${MyLocaleKey.commonUpdateSuccess.tr}');
                      Navigator.pop(context);
                    } else {
                      MyCommonUtil.showToast(
                          '${MyLocaleKey.commonExecuteFail.tr}');
                    }
                  });
                }
              }
            },
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
            padding: EdgeInsets.fromLTRB(30, 15, 10, 0),
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
            padding: EdgeInsets.fromLTRB(30, 5, 10, 12),
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
    int index = GlobalService.to.selectWalletIndex;
    return await GlobalService.to.updatePwd(index, _setPwd);
  }
}
