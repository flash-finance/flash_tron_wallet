import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

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
    WalletEntity wallet = Provider.of<HomeProvider>(context, listen: false).selectWalletEntity;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      brightness: Brightness.light,
      title: Text(
        '${S.of(context).assetUpdatePassword}',
        style: Util.textStyle(context, 2, color: Colors.grey[900], spacing: 0.2, size: 34),
      ),
      centerTitle: true,
      elevation: 0,
      leading: InkWell(
        onTap: (){
          Navigator.of(context)..pop();
        },
        child: Icon(
          Icons.arrow_back,
          size: ScreenUtil().setSp(45),
          color: Colors.grey[900],
        ),
      ),
    ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: Util.height(20)),
              _descWidget(),
              SizedBox(height: Util.height(20)),
              Container(
                margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
                child: Column(
                  children: <Widget>[
                    _oldPwdWidget(wallet.pwd),
                    SizedBox(height: Util.height(0)),
                    _setPwdWidget(),
                    SizedBox(height: Util.height(0)),
                    _confirmPwdWidget(),
                    SizedBox(height: Util.height(50)),
                    _submitWidget(context),
                  ],
                ),
              ),
            ],
          ),
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
        decoration: InputDecoration(
            labelText: '${S.of(context).commonEnterOldPwd}',
            labelStyle: Util.textStyle(context, 2, color: Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _oldPwdEyeColor,
                size: ScreenUtil().setSp(38),
              ),
              onPressed: () {
                setState(() {
                  _oldPwdClickEye = !_oldPwdClickEye;
                  _oldPwdEyeColor = _oldPwdClickEye ? Colors.grey :  Util.themeColor;
                });
              },
            )
        ),
        style: Util.textStyle4Num(context, color: Colors.grey[850], spacing: 0.2, size: 32, fontWeight: FontWeight.w500),
        validator: (String value) {
          if (value.isEmpty) {
            return '${S.of(context).commonCanNotBeEmpty}';
          } else if (value.trim().length != 6) {
            return '${S.of(context).commonNeed6Digit}';
          } else if (value.trim() != pwd) {
            return '${S.of(context).commonPwdIncorrect}';
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
        decoration: InputDecoration(
            labelText: '${S.of(context).commonSetNewPwd}',
            labelStyle: Util.textStyle(context, 2, color: Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _setPwdEyeColor,
                size: ScreenUtil().setSp(38),)
              ,
              onPressed: () {
                setState(() {
                  _setPwdClickEye = !_setPwdClickEye;
                  _setPwdEyeColor = _setPwdClickEye ? Colors.grey :  Util.themeColor;
                });
              },
            )
        ),
        style: Util.textStyle4Num(context, color: Colors.grey[850], spacing: 0.2, size: 32, fontWeight: FontWeight.w500),
        validator: (String value) {
          if (value.isEmpty) {
            return '${S.of(context).commonCanNotBeEmpty}';
          } else if (value.trim().length != 6) {
            return '${S.of(context).commonNeed6Digit}';
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
        decoration: InputDecoration(
            labelText: '${S.of(context).commonConfirmNewPwd}',
            labelStyle: Util.textStyle(context, 2, color: Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _confirmPwdEyeColor,
                size: ScreenUtil().setSp(38),
              ),
              onPressed: () {
                setState(() {
                  _confirmPwdClickEye = !_confirmPwdClickEye;
                  _confirmPwdEyeColor = _confirmPwdClickEye ? Colors.grey :  Util.themeColor;
                });
              },
            )
        ),
        style: Util.textStyle4Num(context, color: Colors.grey[850], spacing: 0.2, size: 32, fontWeight: FontWeight.w500),
        validator: (String value) {
          if (value.isEmpty) {
            return '${S.of(context).commonCanNotBeEmpty}';
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
          width: Util.width(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                '${S.of(context).commonSubmit}',
                style: Util.textStyle(context, 1, color:Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color:  Util.themeColor,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (_setPwd != _confirmPwd) {
                  Util.showToast('${S.of(context).commonConfirmPwdError}');
                } else {
                  _submit(context).then((val) {
                    if (val == true) {
                      Util.showToast('${S.of(context).commonUpdateSuccess}');
                      Navigator.pop(context);
                    } else {
                      Util.showToast('${S.of(context).commonExecuteFail}');
                    }
                  });
                }
              }
            },
            shape: StadiumBorder(side: BorderSide(color:  Util.themeColor)),
          ),
        ),
      ),
    );
  }


  Widget _descWidget() {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Util.themeColor,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 10, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).addWalletTip1}',
              style: Util.textStyle(context, 1, color:Colors.white, spacing: 0.1, size: 22.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 10, 15),
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).addWalletTip2}',
              style: Util.textStyle(context, 1, color:Colors.white, spacing: 0.1, size: 22.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _submit(BuildContext context) async {
    int index = Provider.of<HomeProvider>(context, listen: false).selectWalletIndex;
    return await Provider.of<HomeProvider>(context, listen: false).updatePwd(index, _setPwd);
  }

}
