
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    String pwd = Provider.of<HomeProvider>(context).pwd;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '修改密码',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(35),
          ),
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(15),
            children: <Widget>[
              _descWidget(),
              SizedBox(height: ScreenUtil().setHeight(15)),
              _oldPwdWidget(pwd),
              SizedBox(height: ScreenUtil().setHeight(15)),
              _setPwdWidget(),
              SizedBox(height: ScreenUtil().setHeight(15)),
              _confirmPwdWidget(),
              SizedBox(height: ScreenUtil().setHeight(50)),
              _submitButton(context),
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
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            labelText: '输入旧密码',
            labelStyle: TextStyle(fontSize: ScreenUtil().setSp(28)),
            suffixIcon: IconButton(
              icon: Icon(_oldPwdClickEye ? Icons.visibility_off : Icons.remove_red_eye,
                color: _oldPwdEyeColor, size: ScreenUtil().setSp(38),),
              onPressed: () {
                setState(() {
                  _oldPwdClickEye = !_oldPwdClickEye;
                  _oldPwdEyeColor = _oldPwdClickEye ? Colors.grey : Colors.blue[900];
                });
              },
            )
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '旧密码不能为空';
          } else if (value.trim().length != 6) {
            return '需要6位';
          } else if (value.trim() != pwd) {
            return '旧密码不正确';
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
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            labelText: '设置新密码',
            labelStyle: TextStyle(fontSize: ScreenUtil().setSp(28)),
            suffixIcon: IconButton(
              icon: Icon(_setPwdClickEye ? Icons.visibility_off : Icons.remove_red_eye,
                  color: _setPwdEyeColor, size: ScreenUtil().setSp(38),),
              onPressed: () {
                setState(() {
                  _setPwdClickEye = !_setPwdClickEye;
                  _setPwdEyeColor = _setPwdClickEye ? Colors.grey : Colors.blue[900];
                });
              },
            )
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '设置新密码不能为空';
          } else if (value.trim().length != 6) {
            return '需要6位';
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
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: '确认新密码',
            labelStyle: TextStyle(fontSize: ScreenUtil().setSp(28)),
            suffixIcon: IconButton(
              icon: Icon(_confirmPwdClickEye ? Icons.visibility_off :Icons.remove_red_eye, 
                color: _confirmPwdEyeColor, size: ScreenUtil().setSp(38),),
              onPressed: () {
                setState(() {
                  _confirmPwdClickEye = !_confirmPwdClickEye;
                  _confirmPwdEyeColor = _confirmPwdClickEye ? Colors.grey : Colors.blue[900];
                });
              },
            )
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '确认新密码不能为空';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Container(
      child: Align(
        child: SizedBox(
          width: ScreenUtil().setWidth(400),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text('提交', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(31))),
            ),
            color: Colors.blue[900],
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (_setPwd != _confirmPwd) {
                  Util.showToast('两次输入新密码不一致');
                } else {
                  _submit().then((val) {
                    if (val == true) {
                      Util.showToast('修改成功');
                      Navigator.pop(context);
                    } else {
                      Util.showToast('执行出错，请再尝试');
                    }
                  });
                }
              }
            },
            shape: StadiumBorder(side: BorderSide(color: Colors.blue[900])),
          ),
        ),
      ),
    );
  }


  Widget _descWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.blue[900],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(40, 15, 10, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '1. 需要设置6位数字的密码，用于钱包管理和交易授权',
              style: TextStyle(fontSize: ScreenUtil().setSp(22), color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 5, 10, 15),
            alignment: Alignment.centerLeft,
            child: Text(
              '2. 平台不存储密码，也无法找回，请务必妥善保管',
              style: TextStyle(fontSize: ScreenUtil().setSp(22), color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _submit() async {
    return await Provider.of<HomeProvider>(context, listen: false).updatePwd(_setPwd);
  }

}
