import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../common_page.dart';

class AddWalletPage extends StatefulWidget {
  @override
  _AddWalletPageState createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '添加钱包',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: ScreenUtil().setSp(32),
            letterSpacing: 0.6,
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
            color: Colors.grey[900],
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            IntervalPage(ScreenUtil().setHeight(25)),
            _bodyWidget(context),
            IntervalPage(ScreenUtil().setHeight(25)),
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
      child: Column(
        children: <Widget>[
          SizedBox(height: ScreenUtil().setHeight(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'asset/importKey', transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      Container(
                        child: Image.asset(
                          'icons/key.png',
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setWidth(40),
                          color: Colors.black,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(30)),
                      Container(
                        child: Text(
                          '导入私钥',
                          style: Util.textStyle(context, Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setSp(27),
                          color: Colors.grey[900],
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                    ],
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'asset/importMnemonic', transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      Container(
                        child: Image.asset(
                          'icons/panel.png',
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setWidth(40),
                          color: Colors.black,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(30)),
                      Container(
                        child: Text(
                          '导入助记词',
                          style: Util.textStyle(context, Colors.grey[850], spacing: 0.0, size: 30),
                        ),

                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setSp(27),
                          color: Colors.grey[900],
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                    ],
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'asset/buildFirstWallet', transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      Container(
                        child: Image.asset(
                          'icons/wallet.png',
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setWidth(40),
                          color: Colors.black,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(30)),
                      Container(
                        child: Text(
                          '创建钱包',
                          style: Util.textStyle(context, Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setSp(27),
                          color: Colors.grey[900],
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
