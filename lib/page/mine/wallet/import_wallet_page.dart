import 'package:flash_tron_wallet/router/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImportWalletPage extends StatefulWidget {
  @override
  _ImportWalletPageState createState() => _ImportWalletPageState();
}

class _ImportWalletPageState extends State<ImportWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '导入钱包',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(35),
          ),
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _privateKeyWidget(context),
            _mnemonicWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _privateKeyWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, 'mine/importKey', transition: TransitionType.cupertino);
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        child: _listTileWidget('私钥'),
      ),
    );
  }

  Widget _mnemonicWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, 'mine/importMnemonic', transition: TransitionType.cupertino);
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(top: 10),
        child: _listTileWidget('助记词'),
      ),
    );
  }

  Widget _listTileWidget(String title) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: ScreenUtil().setSp(29), color: Colors.grey[900]),),
        trailing: Icon(Icons.arrow_forward_ios, size: ScreenUtil().setSp(27), color: Colors.grey[700],),
      ),
    );
  }


}
