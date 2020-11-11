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
            Expanded(
              child: _bodyWidget(context),
            ),
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

  Widget _bodyWidget(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _cardWidget(context),
            SizedBox(height: ScreenUtil().setHeight(30)),
            _assetTitleWidget(context),
            SizedBox(height: ScreenUtil().setHeight(10)),
            _assetDataWidget(context),
          ],
        ),
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
                  fontWeight: FontWeight.w500,
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
                          fontSize: ScreenUtil().setSp(26),
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
                          fontSize: ScreenUtil().setSp(26),
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
                          fontSize: ScreenUtil().setSp(26),
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
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(10), right: ScreenUtil().setWidth(10)),
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

  Widget _assetDataWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(10), right: ScreenUtil().setWidth(10)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 20,
          itemBuilder: (context, index) {
            return _assetDataItemWidget(context);
          }),
    );
  }

  Widget _assetDataItemWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(20), bottom: ScreenUtil().setHeight(20)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black45, width: 0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                  Container(
                    child: Image.asset(
                      'images/trx.png',
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setWidth(50),
                      fit: BoxFit.fill,
                    ),
                  ),
                SizedBox(width: ScreenUtil().setWidth(30)),
                Container(
                    child: Text(
                      'TRX',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: ScreenUtil().setSp(31),
                        fontWeight: FontWeight.w500,
                      ),
                    )
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '78665.98',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: ScreenUtil().setSp(29),
                        fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '≈  258.34',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: ScreenUtil().setSp(24),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
