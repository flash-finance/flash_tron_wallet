import 'package:flash_tron_wallet/common/enum/text_type.dart';
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
  final int index;
  final WalletEntity wallet;
  UpdatePwdPage(this.index, this.wallet);

  @override
  _UpdatePwdPageState createState() => _UpdatePwdPageState();
}

class _UpdatePwdPageState extends State<UpdatePwdPage> {
  final _formKey = GlobalKey<FormState>();
  Color _oldPwdEyeColor = MyColorUtil.subBiz();
  Color _setPwdEyeColor = MyColorUtil.subBiz();
  Color _confirmPwdEyeColor = MyColorUtil.subBiz();

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
      body: Obx(() => _bodyWidget(context)),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      child: Form(
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
                  _oldPwdWidget(widget.wallet.pwd),
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
    );
  }

  Widget _oldPwdWidget(String pwd) {
    return MyCommonUtil.textFormField(
      obscureText: _oldPwdClickEye,
      onSaved: (String value) => _oldPwd = value,
      maxLength: 6,
      inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      keyboardType: TextInputType.number,
      labelText: '${MyLocaleKey.commonEnterOldPwd.tr}',
      textType: TextType.onlyNum,
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
                _oldPwdClickEye ? MyColorUtil.subBiz() : MyColorUtil.theme;
          });
        },
      ),
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
    );
  }

  Widget _setPwdWidget() {
    return MyCommonUtil.textFormField(
      obscureText: _setPwdClickEye,
      onSaved: (String value) => _setPwd = value,
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
        } else if (value.trim().length != 6) {
          return '${MyLocaleKey.commonNeed6Digit.tr}';
        } else {
          return null;
        }
      },
    );
  }

  Widget _confirmPwdWidget() {
    return MyCommonUtil.textFormField(
      obscureText: _confirmPwdClickEye,
      onSaved: (String value) => _confirmPwd = value,
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
      _onPressed(context),
    );
  }

  Function _onPressed(BuildContext context) {
    return () {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        if (_setPwd != _confirmPwd) {
          MyCommonUtil.showToast('${MyLocaleKey.commonConfirmPwdError.tr}');
        } else {
          _submit(context).then((val) {
            if (val == true) {
              MyCommonUtil.showToast('${MyLocaleKey.commonUpdateSuccess.tr}');
              Navigator.pop(context);
            } else {
              MyCommonUtil.showToast('${MyLocaleKey.commonExecuteFail.tr}');
            }
          });
        }
      }
    };
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

  Future<bool> _submit(BuildContext context) async {
    return await GlobalService.to.updatePwd(widget.index, _setPwd);
  }
}
