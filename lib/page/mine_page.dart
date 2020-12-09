import 'dart:io';

import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/common/page.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/model/dex_info_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _langType = true;

  @override
  Widget build(BuildContext context) {
    _langType = Provider.of<IndexProvider>(context, listen: true).langType;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(0)),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _topWidget(context),
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

  Widget _topWidget(BuildContext context) {
    WalletEntity wallet = Provider.of<HomeProvider>(context,listen: true).selectWalletEntity;
    String name = '';
    if (wallet != null && wallet.name != null) {
      name = wallet.name;
    }
    String address = '';
    if (wallet != null && wallet.tronAddress != null) {
      address = wallet.tronAddress.substring(0, 12) + '...' + wallet.tronAddress.substring(wallet.tronAddress.length-12, wallet.tronAddress.length);
    }
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20), top: ScreenUtil().setHeight(50), right: ScreenUtil().setWidth(40), bottom: ScreenUtil().setHeight(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Image.asset(
              'images/flash.png',
              width: ScreenUtil().setWidth(110),
              height: ScreenUtil().setWidth(110),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(10)),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    '$name',
                    style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.0, size: 30),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
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
                            '$address',
                            style: Util.textStyle4En(context, 2, Colors.grey[800], spacing: 0.0, size: 28),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(30)),
                        Container(
                          child: Image.asset(
                            'icons/copy.png',
                            width: ScreenUtil().setWidth(30),
                            height: ScreenUtil().setWidth(30),
                            color: Colors.grey[800],
                            fit: BoxFit.fill,
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

  Widget _walletManageWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, 'mine/walletManage', transition: TransitionType.cupertino);
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
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    IconData(0xe6e0, fontFamily: 'ICON'),
                    size: ScreenUtil().setSp(42),
                    color: Color(0xff59dac5),
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(50)),
                Container(
                  child: Text(
                    '${S.of(context).mineManageWallet}',
                    style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
                  ),
                ),
              ],
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
      onTap: () {
        Provider.of<IndexProvider>(context, listen: false).changeLangType();
        Util.showToast("Success");
      },
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(40)),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    IconData(0xe676, fontFamily: 'ICON'),
                    size: ScreenUtil().setSp(42),
                    //color: Color(0xff9266f9).withOpacity(0.9),
                    color: MyColors.themeColor.withOpacity(0.9),
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(50)),
                Container(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'English/',
                          style: Util.textStyle4En(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                        TextSpan(
                          text: '中文',
                          style: Util.textStyle4Zh(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                            style: Util.textStyle(context, 2,  Colors.blue[700], spacing: 0.1, size: 30),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                            child: Text(
                              '立即体验',
                              style: Util.textStyle(context, 2,  Colors.blue[700], spacing: 0.1, size: 30),
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
                            style: Util.textStyle(context, 2, Colors.blue[700], spacing: 0.0, size: 30),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                            child: Text(
                              '立即体验',
                              style: Util.textStyle(context, 2,  Colors.blue[700], spacing: 0.0, size: 30),
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
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    IconData(0xe6db, fontFamily: 'ICON'),
                    size: ScreenUtil().setSp(42),
                    color: Color(0xfff84068).withOpacity(0.9),
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(50)),
                Container(
                  child: Text(
                    '${S.of(context).mineCurrentVersion}',
                    style: Util.textStyle(
                        context, 2, Colors.grey[850], spacing: 0.0, size: 30),
                  ),
                ),
              ],
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
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(5), bottom: Platform.isAndroid ? ScreenUtil().setHeight(3) : ScreenUtil().setHeight(0)),
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
            child: Icon(Icons.brightness_1, size: ScreenUtil().setSp(15), color: Color(0xfff84068).withOpacity(0.9)),
          ) :Container(),
        ],
      ),
    );
  }

}
