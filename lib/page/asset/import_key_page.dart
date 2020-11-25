import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/model/dex_info_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/tron/service/tron_asset.dart';
import 'package:flash_tron_wallet/tron/service/tron_wallet.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class ImportKeyPage extends StatefulWidget {
  @override
  _ImportKeyPageState createState() => _ImportKeyPageState();
}

class _ImportKeyPageState extends State<ImportKeyPage> {
  final _formKey = GlobalKey<FormState>();
  Color _setPwdEyeColor = Colors.grey;
  Color _confirmPwdEyeColor = Colors.grey;

  bool _setPwdClickEye = true;
  bool _confirmPwdClickEye = true;

  String _name;
  String _key;
  String _setPwd;
  String _confirmPwd;

  bool importKeyLoading = false;

  @override
  Widget build(BuildContext context) {
    importKeyLoading = Provider.of<HomeProvider>(context).importKeyLoading;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '导入私钥',
          style: Util.textStyle(context, 2, Colors.grey[900], spacing: 0.2, size: 32),
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
        child: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  _descWidget(),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
                    child: Column(
                      children: <Widget>[
                        _nameWidget(),
                        _keyWidget(),
                        SizedBox(height: ScreenUtil().setHeight(15)),
                        _setPwdWidget(),
                        SizedBox(height: ScreenUtil().setHeight(15)),
                        _confirmPwdWidget(),
                        SizedBox(height: ScreenUtil().setHeight(50)),
                        _submitButton(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            importKeyLoading ? Container(
              padding: EdgeInsets.only(top: 250, left: 185),
              child: CupertinoActivityIndicator(),
            ) : Container(),
          ],
        ),
      ),
    );
  }

  Widget _descWidget() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  MyColors.themeColor,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 10, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '1. 需要设置6位数字的密码，用于钱包管理和交易授权',
              style: Util.textStyle(context, 1, Colors.white, spacing: 0.1, size: 22.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 10, 15),
            alignment: Alignment.centerLeft,
            child: Text(
              '2. 平台不存储密码，也无法找回，请务必妥善保管',
              style: Util.textStyle(context, 1, Colors.white, spacing: 0.1, size: 22.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _nameWidget() {
    return Container(
      child: TextFormField(
        readOnly: !importKeyLoading ? false : true,
        onSaved: (String value) => _name = value,
        maxLength: 10,
        inputFormatters: [],
        decoration: InputDecoration(
          labelText: '钱包名称',
          labelStyle: Util.textStyle(context, 1, Colors.grey[700], spacing: 0.1, size: 26),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '钱包名称不能为空';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _keyWidget() {
    return Container(
      child: TextFormField(
        readOnly: !importKeyLoading ? false : true,
        onSaved: (String value) => _key = value,
        maxLines: 2,
        maxLength: 64,
        inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]|[0-9]")),],
        decoration: InputDecoration(
          labelText: '私钥',
          labelStyle: Util.textStyle(context, 1, Colors.grey[700], spacing: 0.1, size: 26),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '私钥不能为空';
          } else if (value.trim().length != 64) {
            return '私钥格式不正确';
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
        readOnly: !importKeyLoading ? false : true,
        obscureText: _setPwdClickEye,
        onSaved: (String value) {
          if (value.length > 6) {
            value = value.substring(0, 6);
          }
          _setPwd = value;
        },
        maxLength: 6,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            labelText: '设置密码',
            labelStyle: Util.textStyle(context, 1, Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(_setPwdClickEye ? Icons.visibility_off : Icons.remove_red_eye,
                color: _setPwdEyeColor, size: ScreenUtil().setSp(38),),
              onPressed: () {
                setState(() {
                  _setPwdClickEye = !_setPwdClickEye;
                  _setPwdEyeColor = _setPwdClickEye ? Colors.grey :  MyColors.themeColor;
                });
              },
            )
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '设置密码不能为空';
          } else if (value.trim().length < 6) {
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
        readOnly: !importKeyLoading ? false : true,
        obscureText: _confirmPwdClickEye,
        onSaved: (String value) {
          if (value.length > 6) {
            value = value.substring(0, 6);
          }
          _confirmPwd = value;
        },
        maxLength: 6,
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: '确认密码',
            labelStyle: Util.textStyle(context, 1, Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(_confirmPwdClickEye ? Icons.visibility_off :Icons.remove_red_eye,
                color: _confirmPwdEyeColor, size: ScreenUtil().setSp(38),),
              onPressed: () {
                setState(() {
                  _confirmPwdClickEye = !_confirmPwdClickEye;
                  _confirmPwdEyeColor = _confirmPwdClickEye ? Colors.grey :  MyColors.themeColor;
                });
              },
            )
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return '确认密码不能为空';
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
          width: ScreenUtil().setWidth(350),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                '提交',
                style: Util.textStyle(context, 1, Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color:  MyColors.themeColor,
            onPressed: !importKeyLoading ? () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (_setPwd != _confirmPwd) {
                  Util.showToast('两次输入密码不一致');
                } else {
                  _submit().then((val) {
                    Provider.of<HomeProvider>(context, listen: false).changeImportKeyLoading(false);
                    if (val == true) {
                      Util.showToast('导入成功');
                      Navigator.of(context)..pop();
                    } else {
                      Util.showToast('导入失败，请再尝试');
                    }});
                }
              }
            } : (){},
            shape: StadiumBorder(side: BorderSide(color:  MyColors.themeColor)),
          ),
        ),
      ),
    );
  }

  Future<bool> _submit() async {
    Provider.of<HomeProvider>(context, listen: false).changeImportKeyLoading(true);
    WalletEntity entity = TronWallet().importWalletByKey(_name, _setPwd, _key);
    bool result = await Provider.of<HomeProvider>(context, listen: false).addWallet(entity);
    if (result) {
      await _getAsset();
    }
    return result;
  }

  Future<bool> _getAsset() async {
    print('_getAsset 000');
    String tronAddress = Provider.of<HomeProvider>(context, listen: false).selectWalletEntity.tronAddress;
    List<TokenRows> tokenList = Provider.of<HomeProvider>(context, listen: false).tokenList;
    return await TronAsset().getAsset(context, tronAddress, tokenList);
  }

}
