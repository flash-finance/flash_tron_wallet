import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/common/page.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class WalletDetailPage extends StatefulWidget {
  @override
  _WalletDetailPageState createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _mnemonic;

  @override
  Widget build(BuildContext context) {
    WalletEntity wallet = Provider.of<HomeProvider>(context, listen: false).selectWalletEntity;
    bool flag = wallet.mnemonic != null;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '钱包详情',
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
            color: Colors.grey[800],
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
           IntervalPage(ScreenUtil().setHeight(25)),
            _topWidget(context, wallet),
            IntervalPage(ScreenUtil().setHeight(25)),
            flag ? _backupMnemonicWidget(context, wallet.pwd) : Container(),
            _backupKeyWidget(context, wallet.pwd),
            _updatePwdWidget(context),
            _delWalletWidget(context),
            IntervalPage(ScreenUtil().setHeight(25)),
          ],
        ),
      ),
    );
  }

  Widget _topWidget(BuildContext context, WalletEntity wallet) {
    String temp = wallet.tronAddress;
    String tronAddress = temp.substring(0, 8) + '...' + temp.substring(temp.length-8, temp.length);
    return Container(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(30), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(30), bottom: ScreenUtil().setHeight(30)),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset(
              'images/trx.png',
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setWidth(80),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(30)),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '${wallet.name}',
                          style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.1, size: 28),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(30)),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'icons/pen.png',
                          width: ScreenUtil().setWidth(30),
                          height: ScreenUtil().setWidth(30),
                          color: Colors.grey[800],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '$tronAddress',
                          style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.1, size: 28),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(30)),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'icons/copy.png',
                          width: ScreenUtil().setWidth(30),
                          height: ScreenUtil().setWidth(30),
                          color: Colors.grey[700],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
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
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(40)),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '备份助记词',
                style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
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
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(40)),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '备份私钥',
                style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
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
        Application.router.navigateTo(context, 'asset/updatePwd', transition: TransitionType.cupertino);
      },
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(40)),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '修改密码',
                style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
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
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(40)),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '删除钱包',
                style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
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
            '请输入密码',
            style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 30),
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
                    obscureText: true,
                    maxLength: 6,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                    validator: (String value) {
                      if (value.length < 6) {
                        return '密码为6位';
                      } else if (value.substring(0, 6) != pwd) {
                        return '密码不正确';
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
                '取消',
                style: Util.textStyle(context, 2,  MyColors.themeColor, spacing: 0.5, size: 30),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
                child: Text(
                  '确定',
                  style: Util.textStyle(context, 2,  MyColors.themeColor, spacing: 0.5, size: 30),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _backupKey(context).then((val) {
                      if (val == true) {
                        Navigator.pop(context);
                        if (type == 1) {
                          Application.router.navigateTo(context, 'asset/backupMnemonic', transition: TransitionType.cupertino);
                        } else if (type == 2) {
                          Application.router.navigateTo(context, 'asset/backupKey', transition: TransitionType.cupertino);
                        }
                      } else {
                        Util.showToast('执行出错，请再尝试');
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
            '请确保私钥或助记词已备份，确定删除?',
            style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 28),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                '取消',
                style: Util.textStyle(context, 2,  MyColors.themeColor, spacing: 0.5, size: 30),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
                child: Text(
                  '确定',
                  style: Util.textStyle(context, 2,  MyColors.themeColor, spacing: 0.5, size: 30),
                ),
                onPressed: () {
                  _delWallet(context).then((val) {
                    if (val == true) {
                      Navigator.of(context)..pop()..pop();
                    } else {
                      Util.showToast('执行出错，请再尝试');
                    }
                  });
                }
            ),
          ],
        ));
  }

  Future<bool> _backupKey(BuildContext context) async {
    return true;
  }

  Future<bool> _delWallet(BuildContext context) async {
    int index = Provider.of<HomeProvider>(context, listen: false).selectWalletIndex;
    return await Provider.of<HomeProvider>(context, listen: false).delWallet(index);
  }

}
