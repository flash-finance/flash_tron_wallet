import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/page/common/common_page.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class WalletDetailPage extends StatefulWidget {
  final String selectIndex;

  WalletDetailPage(this.selectIndex);

  @override
  _WalletDetailPageState createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  
  @override
  Widget build(BuildContext context) {
    WalletEntity wallet = Provider.of<HomeProvider>(context,listen: false).selectWalletEntity;
    bool flag = wallet.mnemonic != null;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '${S.of(context).assetWalletDetails}',
          style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.2, size: 34),
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
            color: Colors.grey[800],
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            IntervalPage(Util.height(25)),
            _topWidget(context, wallet),
            IntervalPage(Util.height(25)),
            flag ? _backupMnemonicWidget(context, wallet.pwd) : Container(),
            _backupKeyWidget(context, wallet.pwd),
            _updatePwdWidget(context),
            _delWalletWidget(context),
            IntervalPage(Util.height(25)),
          ],
        ),
      ),
    );
  }

  Widget _topWidget(BuildContext context, WalletEntity wallet) {
    String temp = wallet.tronAddress;
    String tronAddress = temp.substring(0, 8) + '...' + temp.substring(temp.length-8, temp.length);
    return Container(
      padding: EdgeInsets.only(left: Util.width(30), top: Util.height(30), right: Util.width(30), bottom: Util.height(30)),
      child: Row(
        children: <Widget>[
          Container(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                'images/flash.png',
                width: Util.width(100),
                height: Util.width(100),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: Util.width(30)),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _showUpdateNameDialLog(context, int.parse(widget.selectIndex));
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '${wallet.name}',
                            style: Util.textStyle(context, 2, color: Colors.grey[800], spacing: 0.0, size: 28),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: Util.width(30)),
                        Container(
                          child: Icon(
                            IconData(0xe635, fontFamily: 'ICON'),
                            size: ScreenUtil().setSp(35),
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Util.height(15)),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: wallet.tronAddress));
                    Util.showToast('${S.of(context).commonCopySuccess}');
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '$tronAddress',
                            style: Util.textStyle4En(context, 2, color: Colors.grey[800], spacing: 0.0, size: 28),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: Util.width(30)),
                        Container(
                          child: Icon(
                            IconData(0xe618, fontFamily: 'ICON'),
                            size: ScreenUtil().setSp(30),
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _backupMnemonicWidget(BuildContext context, String pwd) {
    return InkWell(
      onTap: () {
        return _showInputPwdDialLog(context, 1, pwd);
      },
      child: Container(
        margin: EdgeInsets.only(left: Util.width(40), top: Util.height(30), right: Util.width(40)),
        padding: EdgeInsets.only(bottom: Util.height(30)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '${S.of(context).assetBackupMnemonic}',
                style: Util.textStyle(context, 2, color: Colors.grey[800], spacing: 0.0, size: 30),
              ),
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: ScreenUtil().setSp(27),
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backupKeyWidget(BuildContext context, String pwd) {
    return InkWell(
      onTap: () {
        return _showInputPwdDialLog(context, 2, pwd);
      },
      child: Container(
        margin: EdgeInsets.only(left: Util.width(40), top: Util.height(30), right: Util.width(40)),
        padding: EdgeInsets.only(bottom: Util.height(30)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '${S.of(context).assetBackupPrivateKey}',
                style: Util.textStyle(context, 2, color: Colors.grey[800], spacing: 0.0, size: 30),
              ),
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: ScreenUtil().setSp(27),
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _updatePwdWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, Routes.assetUpdatePwd, transition: TransitionType.cupertino);
      },
      child: Container(
        margin: EdgeInsets.only(left: Util.width(40), top: Util.height(30), right: Util.width(40)),
        padding: EdgeInsets.only(bottom: Util.height(30)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '${S.of(context).assetUpdatePassword}',
                style: Util.textStyle(context, 2, color: Colors.grey[800], spacing: 0.0, size: 30),
              ),
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: ScreenUtil().setSp(27),
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _delWalletWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        return _showDelWalletDialLog(context);
      },
      child: Container(
        margin: EdgeInsets.only(left: Util.width(40), top: Util.height(30), right: Util.width(40)),
        padding: EdgeInsets.only(bottom: Util.height(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '${S.of(context).assetDeleteWallet}',
                style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.0, size: 30),
              ),
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: ScreenUtil().setSp(27),
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showInputPwdDialLog(BuildContext context, int type, String pwd) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(
            '${S.of(context).commonPleaseEnterYourPassword}',
            style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.2, size: 30),
          ),
          content: Card(
            elevation: 0.0,
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: TextFormField(
                    onSaved: (String value) {
                      if (value.length > 6) {
                        value = value.substring(0, 6);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: Util.textStyle4Num(context, color: Colors.grey[800], spacing: 0.2, size: 32, fontWeight: FontWeight.w500),
                    obscureText: true,
                    maxLength: 6,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                    validator: (String value) {
                      if (value.length < 6) {
                        return '${S.of(context).commonPwd6Digit}';
                      } else if (value.substring(0, 6) != pwd) {
                        return '${S.of(context).commonPwdIncorrect}';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                '${S.of(context).commonCancel}',
                style: Util.textStyle(context, 2, color:  Util.themeColor, spacing: 0.5, size: 30),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
                child: Text(
                  '${S.of(context).commonConfirm}',
                  style: Util.textStyle(context, 2, color:  Util.themeColor, spacing: 0.5, size: 30),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _backupKey(context).then((val) {
                      if (val == true) {
                        Navigator.pop(context);
                        if (type == 1) {
                          Application.router.navigateTo(context, Routes.assetBackupMnemonic, transition: TransitionType.cupertino);
                        } else if (type == 2) {
                          Application.router.navigateTo(context, Routes.assetBackupKey, transition: TransitionType.cupertino);
                        }
                      } else {
                        Util.showToast('${S.of(context).commonExecutedError}');
                      }
                    });
                  }

                }
            ),
          ],
        ));
  }

  _showUpdateNameDialLog(BuildContext context, int index) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(
            '${S.of(context).assetUpdateWalletName}',
            style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.0, size: 30),
          ),
          content: Card(
            elevation: 0.0,
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: TextFormField(
                    onSaved: (String value) {
                      _name = value;
                    },
                    decoration: InputDecoration(
                      hintText: '',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.2, size: 30),
                    //obscureText: true,
                    maxLength: 10,
                    maxLengthEnforced: true,
                    validator: (String value) {
                      if (value.length > 10) {
                        return '${S.of(context).assetNameLong}';
                      }  else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                '${S.of(context).commonCancel}',
                style: Util.textStyle(context, 2, color:  Util.themeColor, spacing: 0.5, size: 30),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
                child: Text(
                  '${S.of(context).commonConfirm}',
                  style: Util.textStyle(context, 2, color:  Util.themeColor, spacing: 0.5, size: 30),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _updateName(context, index).then((val) {
                      if (val == true) {
                        Util.showToast('${S.of(context).commonUpdateSuccess}');
                        Navigator.pop(context);
                      } else {
                        Util.showToast('${S.of(context).commonExecutedError}');
                      }
                    });
                  }

                }
            ),
          ],
        ));
  }

  _showDelWalletDialLog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(
            '${S.of(context).commonDeleteWalletTip}',
            style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.2, size: 28),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                '${S.of(context).commonCancel}',
                style: Util.textStyle(context, 2, color:  Util.themeColor, spacing: 0.5, size: 30),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
                child: Text(
                  '${S.of(context).commonConfirm}',
                  style: Util.textStyle(context, 2, color: Util.themeColor, spacing: 0.5, size: 30),
                ),
                onPressed: () {
                  _delWallet(context).then((val) {
                    if (val == true) {
                      Navigator.of(context)..pop()..pop();
                    } else {
                      Util.showToast('${S.of(context).commonExecutedError}');
                    }
                  });
                }
            ),
          ],
        ));
  }

  Future<bool> _updateName(BuildContext context, int index) async {
    return await Provider.of<HomeProvider>(context, listen: false).updateName(index, _name);
  }

  Future<bool> _backupKey(BuildContext context) async {
    return true;
  }

  Future<bool> _delWallet(BuildContext context) async {
    int index = Provider.of<HomeProvider>(context, listen: false).selectWalletIndex;
    return await Provider.of<HomeProvider>(context, listen: false).delWallet(index);
  }

}
