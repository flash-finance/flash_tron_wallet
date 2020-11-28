import 'dart:io';

import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/common/page.dart';
import 'package:flash_tron_wallet/model/dex_info_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'mine/download_page.dart';


class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '我的',
          style: Util.textStyle(
              context, 2, Colors.grey[900], spacing: 0.2, size: 32),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            IntervalPage(ScreenUtil().setHeight(25)),
            _walletManageWidget(context),
            _langWidget(context),
            _versionWidget(context),
            IntervalPage(ScreenUtil().setHeight(25)),
          ],
        ),
      ),
    );
  }

  Widget _walletManageWidget(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(40),
            top: ScreenUtil().setHeight(30),
            right: ScreenUtil().setWidth(40)),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '钱包管理',
                style: Util.textStyle(
                    context, 2, Colors.grey[850], spacing: 0.0, size: 30),
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

  Widget _langWidget(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(40),
            top: ScreenUtil().setHeight(30),
            right: ScreenUtil().setWidth(40)),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                'English/中文',
                style: Util.textStyle(
                    context, 2, Colors.grey[850], spacing: 0.0, size: 30),
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

  Widget _versionWidget(BuildContext context) {
    DexInfo dexInfo = Provider.of<HomeProvider>(context, listen: true).dexInfo;
    String currentVersion = Provider.of<HomeProvider>(context, listen: true).currentVersion;

    int androidNeedUpdateType = 0;
    int iosNeedUpdateType = 0;

    if (Platform.isAndroid && dexInfo.androidVersionNum != null) {
      if (currentVersion.compareTo(dexInfo.androidVersionNum) == -1) {
        androidNeedUpdateType = dexInfo.androidUpdateType;
      }
    }
    if (Platform.isIOS && dexInfo.iosVersionNum != null) {
      if (currentVersion.compareTo(dexInfo.iosVersionNum) == -1) {
        iosNeedUpdateType = dexInfo.iosUpdateType;
      }
    }

    return InkWell(
      onTap: () async {
        if (Platform.isAndroid && dexInfo.androidVersionNum != null) {
          if (androidNeedUpdateType == 0) {
            Util.showToast('已经是最新版本');
          } else if (androidNeedUpdateType == 1) {
            return showCupertinoDialog(context: context, builder: (context) =>
                    CupertinoAlertDialog(
                      title: Text(
                        '新版本 V${dexInfo.androidVersionNum}',
                        style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.0, size: 30),
                      ),
                      content: Container(
                        padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${dexInfo.androidUpdateInfo.replaceAll('\\n', '\n')}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'SHS-R',
                              letterSpacing: 0.1,
                              color: Colors.grey[900],
                              fontSize: ScreenUtil().setSp(25),
                              height: ScreenUtil().setSp(3.2),
                            ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            '以后再说',
                            style: Util.textStyle(context, 2,  MyColors.themeColor, spacing: 0.2, size: 30),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                            child: Text(
                              '立即体验',
                              style: Util.textStyle(context, 2,  MyColors.themeColor, spacing: 0.2, size: 30),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              return showDialog(
                                context: context,
                                barrierDismissible: false,
                                child: DownloadPage(dexInfo.androidDownloadUrl)
                              );
                            }
                        ),
                      ],
                    ));
          }
        }
        if (Platform.isIOS && dexInfo.iosVersionNum != null) {
          if (iosNeedUpdateType == 0) {
            Util.showToast('已经是最新版本');
          } else if (iosNeedUpdateType == 1) {
            return showCupertinoDialog(context: context, builder: (context) =>
                CupertinoAlertDialog(
                      title: Text(
                        '新版本 V${dexInfo.iosVersionNum}',
                        style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.0, size: 30),
                      ),
                      content: Container(
                        padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${dexInfo.iosUpdateInfo.replaceAll('\\n', '\n')}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SHS-R',
                            letterSpacing: 0.1,
                            color: Colors.grey[900],
                            fontSize: ScreenUtil().setSp(25),
                            height: ScreenUtil().setSp(3.2),
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            '以后再说',
                            style: Util.textStyle(context, 2,  MyColors.themeColor, spacing: 0.2, size: 30),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                            child: Text(
                              '立即体验',
                              style: Util.textStyle(context, 2,  MyColors.themeColor, spacing: 0.2, size: 30),
                            ),
                            onPressed: () async {
                              if (await canLaunch(dexInfo.iosDownloadUrl)) {
                                await launch(dexInfo.iosDownloadUrl);
                              } else {
                                print('could not launch ${dexInfo.iosDownloadUrl}');
                              }
                            }
                        ),
                      ],
                    ));
          }
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(40)),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '当前版本',
                style: Util.textStyle(
                    context, 2, Colors.grey[850], spacing: 0.0, size: 30),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: versionSubWidget(currentVersion, androidNeedUpdateType, iosNeedUpdateType),
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
          ],
        ),
      ),
    );
  }

  Widget versionSubWidget(String currentVersion, int androidNeedUpdateType, int iosNeedUpdateType) {
    bool flag = androidNeedUpdateType == 1 || iosNeedUpdateType == 1;
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(5), bottom: ScreenUtil().setHeight(3)),
            alignment: Alignment.centerRight,
            child: Text(
              '$currentVersion',
              style: GoogleFonts.roboto(
                letterSpacing: 0.0,
                color: Colors.grey[700],
                fontSize: ScreenUtil().setSp(30),
              ),
            ),
          ),
          flag ? Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(5), right: ScreenUtil().setWidth(10)),
            alignment: Alignment.centerRight,
            child: Icon(Icons.brightness_1, size: ScreenUtil().setSp(15), color: MyColors.themeColor),
          ) :Container(),
        ],
      ),
    );
  }

}
