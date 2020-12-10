import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/tron/service/tron_wallet.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class BuildWalletFirstPage extends StatefulWidget {
  final String type;
  BuildWalletFirstPage(this.type);

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

  bool buildWalletLoading = false;

  @override
  Widget build(BuildContext context) {
    buildWalletLoading = Provider.of<HomeProvider>(context).buildWalletLoading;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '${S.of(context).assetCreateWallet}',
          style: Util.textStyle(context, 2, Colors.grey[900], spacing: 0.2, size: 34),
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
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  _descWidget(),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
                    child: Column(
                      children: <Widget>[
                        _nameWidget(),
                        SizedBox(height: ScreenUtil().setHeight(0)),
                        _setPwdWidget(),
                        SizedBox(height: ScreenUtil().setHeight(0)),
                        _confirmPwdWidget(),
                        SizedBox(height: ScreenUtil().setHeight(50)),
                        _submitWidget(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            buildWalletLoading ? Container(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(300), left: ScreenUtil().setWidth(350)),
              child: CupertinoActivityIndicator(),
            ) : Container(),
          ],
        ),
      ),

    );
  }

  Widget _nameWidget() {
    return Container(
      child: TextFormField(
        readOnly: !buildWalletLoading ? false : true,
        onSaved: (String value) => _name = value,
        maxLength: 10,
        inputFormatters: [],
        decoration: InputDecoration(
          labelText: '${S.of(context).assetWalletName}',
          labelStyle: Util.textStyle(context, 2, Colors.grey[700], spacing: 0.1, size: 26),
        ),
        style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 30),
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

  Widget _setPwdWidget() {
    return Container(
      child: TextFormField(
        readOnly: !buildWalletLoading ? false : true,
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
        decoration: InputDecoration(
            labelText: '${S.of(context).assetSetPassword}',
            labelStyle: Util.textStyle(context, 2, Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(_setPwdClickEye ? Icons.visibility_off : Icons.remove_red_eye,
                color: _setPwdEyeColor, size: ScreenUtil().setSp(38),),
              onPressed: () {
                setState(() {
                  _setPwdClickEye = !_setPwdClickEye;
                  _setPwdEyeColor = _setPwdClickEye ? Colors.grey :  Util.themeColor;
                });
              },
            )
        ),
        style: Util.textStyle4Num(context, Colors.grey[800], spacing: 0.2, size: 32, fontWeight: FontWeight.w500),
        validator: (String value) {
          if (value.isEmpty) {
            return '${S.of(context).commonCanNotBeEmpty}';
          } else if (value.trim().length < 6) {
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
        readOnly: !buildWalletLoading ? false : true,
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
        decoration: InputDecoration(
            labelText: '${S.of(context).assetConfirmPassword}',
            labelStyle: Util.textStyle(context, 2, Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(_confirmPwdClickEye ? Icons.visibility_off : Icons.remove_red_eye,
                color: _confirmPwdEyeColor, size: ScreenUtil().setSp(38),),
              onPressed: () {
                setState(() {
                  _confirmPwdClickEye = !_confirmPwdClickEye;
                  _confirmPwdEyeColor = _confirmPwdClickEye ? Colors.grey :  Util.themeColor;
                });
              },
            )
        ),
        style: Util.textStyle4Num(context, Colors.grey[800], spacing: 0.2, size: 32, fontWeight: FontWeight.w500),
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
          width: ScreenUtil().setWidth(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                '${S.of(context).commonSubmit}',
                style: Util.textStyle(context, 1, Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color:  Util.themeColor,
            onPressed: !buildWalletLoading ? () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (_setPwd != _confirmPwd) {
                  Util.showToast('${S.of(context).commonConfirmPwdError}');
                } else {
                  _submit(context).then((val) {
                    Provider.of<HomeProvider>(context, listen: false).changeBuildWalletLoading(false);
                    if (val == true) {
                      Application.router.navigateTo(context, 'asset/buildSecondWallet/${widget.type}', transition: TransitionType.cupertino);
                    } else {
                      Util.showToast('${S.of(context).commonCreateFail}');
                    }
                  });
                }
              }
            } : () {},
            shape: StadiumBorder(side: BorderSide(color:  Util.themeColor)),
          ),
        ),
      ),
    );
  }

  Widget _descWidget() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  Util.themeColor,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).addWalletTip1}',
              style: Util.textStyle(context, 1, Colors.white, spacing: 0.1, size: 22.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 15),
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).addWalletTip2}',
              style: Util.textStyle(context, 1, Colors.white, spacing: 0.1, size: 22.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _submit(BuildContext context) async {
    Provider.of<HomeProvider>(context, listen: false).changeBuildWalletLoading(true);
    WalletEntity entity = TronWallet().createWallet(_name, _setPwd);
    bool result =  await Provider.of<HomeProvider>(context, listen: false).addWallet(entity);
    if (result) {
      await _getAsset(context);
    }
    await Future.delayed(Duration(milliseconds: 1500), () {
    });

    return result;
  }

  Future<bool> _getAsset(BuildContext context) async {
    //String tronAddress = Provider.of<HomeProvider>(context, listen: false).selectWalletEntity.tronAddress;
    //List<TokenRows> tokenList = Provider.of<HomeProvider>(context, listen: false).tokenList;
    //return await TronAsset().getAsset(context, tronAddress, tokenList);
    Provider.of<HomeProvider>(context, listen: false).getAsset4Init();
    return true;
  }
}
