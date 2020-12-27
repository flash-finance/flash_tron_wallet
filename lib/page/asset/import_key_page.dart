import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/tron/service/tron_wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ImportKeyPage extends StatefulWidget {
  final String type;

  ImportKeyPage(this.type);

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

  bool _importKeyLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '${S.of(context).assetImportPrivateKey}',
          style: Util.textStyle(context, 2,
              color: Colors.grey[850], spacing: 0.2, size: 34),
        ),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context)..pop();
          },
          child: Icon(
            Icons.arrow_back,
            size: Util.sp(45),
            color: Colors.grey[850],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: Util.height(20)),
                  _descWidget(),
                  SizedBox(height: Util.height(20)),
                  Container(
                    margin: EdgeInsets.only(
                        left: Util.width(30), right: Util.width(30)),
                    child: Column(
                      children: <Widget>[
                        _nameWidget(),
                        SizedBox(height: Util.height(0)),
                        _keyWidget(),
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
            _importKeyLoading
                ? Container(
                    padding: EdgeInsets.only(
                        top: Util.height(300), left: Util.width(350)),
                    child: CupertinoActivityIndicator(),
                  )
                : Container(),
          ],
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
            padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).addWalletTip1}',
              style: Util.textStyle(context, 1,
                  color: Colors.white, spacing: 0.1, size: 21),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 12),
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).addWalletTip2}',
              style: Util.textStyle(context, 1,
                  color: Colors.white, spacing: 0.1, size: 21),
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
        readOnly: !_importKeyLoading ? false : true,
        onSaved: (String value) => _name = value,
        maxLength: 10,
        inputFormatters: [],
        cursorColor: Util.themeColor,
        decoration: InputDecoration(
          labelText: '${S.of(context).assetWalletName}',
          labelStyle: Util.textStyle(context, 2,
              color: Colors.grey[700], spacing: 0.1, size: 26),
        ),
        style: Util.textStyle(context, 2,
            color: Colors.grey[850], spacing: 0.2, size: 30),
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

  Widget _keyWidget() {
    return Container(
      child: TextFormField(
        readOnly: !_importKeyLoading ? false : true,
        onSaved: (String value) => _key = value,
        maxLines: 2,
        maxLength: 64,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]|[0-9]"))
        ],
        cursorColor: Util.themeColor,
        decoration: InputDecoration(
          labelText: '${S.of(context).assetPrivateKey}',
          labelStyle: Util.textStyle(context, 2,
              color: Colors.grey[700], spacing: 0.1, size: 26),
        ),
        style: Util.textStyle4En(context, 2,
            color: Colors.grey[850], spacing: 0.0, size: 28),
        validator: (String value) {
          if (value.isEmpty) {
            return '${S.of(context).commonCanNotBeEmpty}';
          } else if (value.trim().length != 64) {
            return '${S.of(context).commonIncorrectFormat}';
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
        readOnly: !_importKeyLoading ? false : true,
        obscureText: _setPwdClickEye,
        onSaved: (String value) {
          if (value.length > 6) {
            value = value.substring(0, 6);
          }
          _setPwd = value;
        },
        maxLength: 6,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        cursorColor: Util.themeColor,
        decoration: InputDecoration(
            labelText: '${S.of(context).assetSetPassword}',
            labelStyle: Util.textStyle(context, 2,
                color: Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _setPwdEyeColor,
                size: Util.sp(38),
              ),
              onPressed: () {
                setState(() {
                  _setPwdClickEye = !_setPwdClickEye;
                  _setPwdEyeColor =
                      _setPwdClickEye ? Colors.grey : Util.themeColor;
                });
              },
            )),
        style: Util.textStyle4Num(context,
            color: Colors.grey[800],
            spacing: 0.2,
            size: 32,
            fontWeight: FontWeight.w500),
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
        readOnly: !_importKeyLoading ? false : true,
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
        cursorColor: Util.themeColor,
        decoration: InputDecoration(
            labelText: '${S.of(context).assetConfirmPassword}',
            labelStyle: Util.textStyle(context, 2,
                color: Colors.grey[700], spacing: 0.1, size: 26),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _confirmPwdEyeColor,
                size: Util.sp(38),
              ),
              onPressed: () {
                setState(() {
                  _confirmPwdClickEye = !_confirmPwdClickEye;
                  _confirmPwdEyeColor =
                      _confirmPwdClickEye ? Colors.grey : Util.themeColor;
                });
              },
            )),
        style: Util.textStyle4Num(context,
            color: Colors.grey[800],
            spacing: 0.2,
            size: 32,
            fontWeight: FontWeight.w500),
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
                style: Util.textStyle(context, 1,
                    color: Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color: Util.themeColor,
            onPressed: !_importKeyLoading
                ? () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      if (_setPwd != _confirmPwd) {
                        Util.showToast(
                            '${S.of(context).commonConfirmPwdError}');
                      } else {
                        _submit().then((val) {
                          setState(() {
                            _importKeyLoading = false;
                          });
                          if (val == true) {
                            Util.showToast(
                                '${S.of(context).commonImportSuccess}');
                            if (widget.type == '1') {
                              Navigator.of(context)..pop();
                            } else if (widget.type == '2') {
                              Navigator.of(context)..pop()..pop();
                            }
                          } else {
                            Util.showToast('${S.of(context).commonImportFail}');
                          }
                        });
                      }
                    }
                  }
                : () {},
            shape: StadiumBorder(side: BorderSide(color: Util.themeColor)),
          ),
        ),
      ),
    );
  }

  Future<bool> _submit() async {
    setState(() {
      _importKeyLoading = true;
    });
    WalletEntity entity = TronWallet().importWalletByKey(_name, _setPwd, _key);
    bool result = await Provider.of<HomeProvider>(context, listen: false)
        .addWallet(entity);
    if (result) {
      _getAsset();
    }
    return result;
  }

  Future<bool> _getAsset() async {
    await Provider.of<HomeProvider>(context, listen: false).getAsset4Init();
    Provider.of<HomeProvider>(context, listen: false).getAsset4ReloadAsync();
    return true;
  }
}
