import 'package:flash_tron_wallet/common/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetPage extends StatefulWidget {
  @override
  _AssetPageState createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightBg,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: MyColors.lightBg,
          brightness: Brightness.light,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(0)),
      ),
      body: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
        child: Column(
          children: <Widget>[
            _headWidget(context),
            SizedBox(height: ScreenUtil().setHeight(15)),
            _cardWidget(context),
            SizedBox(height: ScreenUtil().setHeight(30)),
            _assetTitleWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _headWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Chip(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(8), right: ScreenUtil().setWidth(0)),
              backgroundColor: Colors.blue[800],
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      'BG-TRON01',
                      style: GoogleFonts.lato(
                        letterSpacing: 0.2,
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(23),
                      ),
                    ),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Container(
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(40),
                      width: ScreenUtil().setHeight(40),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('icons/circle.png'),
                              fit: BoxFit.fill)),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil().setSp(22),
                        color: Colors.blue[800],
                      )
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'icons/plus.png',
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                    color: Colors.grey[800],
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(20)),
                Container(
                  child: Image.asset(
                    'icons/scan.png',
                    width: ScreenUtil().setWidth(55),
                    height: ScreenUtil().setWidth(55),
                    color: Colors.grey[800],
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), bottom: ScreenUtil().setHeight(25), right: ScreenUtil().setWidth(40)),
      decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            gradient: LinearGradient(
              colors: [Colors.blue[800], Colors.blue[800]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      '我的资产 (\$)',
                      style: GoogleFonts.lato(
                        letterSpacing: 0.2,
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(23),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '详情',
                            style: GoogleFonts.lato(
                              letterSpacing: 0.2,
                              color: Colors.grey[300],
                              fontSize: ScreenUtil().setSp(23),
                            ),
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        Container(
                          padding: EdgeInsets.only(top: ScreenUtil().setHeight(2)),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: ScreenUtil().setSp(22),
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Text(
                '7864.38',
                style: GoogleFonts.lato(
                  letterSpacing: 0.2,
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(40),
                ),
              ),
            ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(4)),
                      child: Icon(
                        Icons.transit_enterexit_sharp,
                        size: ScreenUtil().setSp(34),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Container(
                      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(6)),
                      child: Text(
                        '转账',
                        style: GoogleFonts.lato(
                          letterSpacing: 0.2,
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(28),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(2)),
                      child: Icon(
                        Icons.download_sharp,
                        size: ScreenUtil().setSp(32),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Container(
                      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(6)),
                      child: Text(
                        '收款',
                        style: GoogleFonts.lato(
                          letterSpacing: 0.2,
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(28),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(3)),
                      child: Icon(
                        Icons.sync_rounded,
                        size: ScreenUtil().setSp(32),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Container(
                      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(6)),
                      child: Text(
                        '交易',
                        style: GoogleFonts.lato(
                          letterSpacing: 0.2,
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(28),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        ),
    );
  }

  Widget _assetTitleWidget(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
        child: Text(
          '资产',
          style: TextStyle(
            letterSpacing: 1,
            color: Colors.grey[800],
            fontSize: ScreenUtil().setSp(30),
            fontWeight: FontWeight.w600,
          ),
        )
    );
  }
}
