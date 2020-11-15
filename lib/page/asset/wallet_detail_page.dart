import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../common_page.dart';

class WalletDetailPage extends StatefulWidget {
  @override
  _WalletDetailPageState createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightBg,
      appBar: AppBar(
        backgroundColor: MyColors.lightBg,
        brightness: Brightness.light,
        title: Text(
          '钱包详情',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: ScreenUtil().setSp(32),
            letterSpacing: 1.0,
            fontWeight: FontWeight.w600,
          ),
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
            _topWidget(context),
            IntervalPage(ScreenUtil().setHeight(25)),
            _backupMnemonicWidget(context),
            _backupKeyWidget(context),
            _updatePwdWidget(context),
            _delWalletWidget(context),
            IntervalPage(ScreenUtil().setHeight(25)),
          ],
        ),
      ),
    );
  }

  Widget _topWidget(BuildContext context) {
    String name = Provider.of<HomeProvider>(context, listen: false).name;
    String temp = Provider.of<HomeProvider>(context, listen: false).tronAddress;
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
                          '$name',
                          style: GoogleFonts.lato(
                            letterSpacing: 0.2,
                            color: Colors.grey[700],
                            fontSize: ScreenUtil().setSp(28),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(20)),
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
                          style: GoogleFonts.lato(
                            letterSpacing: 0.2,
                            color: Colors.grey[800],
                            fontSize: ScreenUtil().setSp(28),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(20)),
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

  Widget _backupKeyWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, 'asset/backupKey', transition: TransitionType.cupertino);
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
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(29),
                    color: Colors.grey[900],
                    letterSpacing: 0.5,
                ),
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

  Widget _backupMnemonicWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, 'asset/backupMnemonic', transition: TransitionType.cupertino);
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
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(29),
                  color: Colors.grey[900],
                  letterSpacing: 0.5,
                ),
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
      onTap: () {},
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
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(29),
                  color: Colors.grey[900],
                  letterSpacing: 0.5,
                ),
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
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(40)),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '删除钱包',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(29),
                  color: Colors.grey[900],
                  letterSpacing: 0.5,
                ),
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
}
