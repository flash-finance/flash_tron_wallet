import 'dart:io';

import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/model/tron_info_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/router/router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common/common_page.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '${S.of(context).bottomTab3}',
          style: Util.textStyle(context, 2,
              color: Colors.grey[850], spacing: 0.2, size: 34),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            IntervalPage(Util.height(25)),
            _walletManageWidget(context),
            _langWidget(context),
            _versionWidget(context),
            IntervalPage(Util.height(25)),
          ],
        ),
      ),
    );
  }

  Widget _walletManageWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, Routes.mineWalletManage,
            transition: TransitionType.cupertino);
      },
      child: Container(
        margin: EdgeInsets.only(
            left: Util.width(40), top: Util.height(30), right: Util.width(40)),
        padding: EdgeInsets.only(bottom: Util.height(30)),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    IconData(0xe6e0, fontFamily: 'ICON'),
                    size: Util.sp(42),
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(width: Util.width(50)),
                Container(
                  child: Text(
                    '${S.of(context).mineManageWallet}',
                    style: Util.textStyle(context, 2,
                        color: Colors.grey[800], spacing: 0.0, size: 30),
                  ),
                ),
              ],
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: Util.sp(27),
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
        _showSwitchLangDialLog(context);
      },
      child: Container(
        margin: EdgeInsets.only(
            left: Util.width(40), top: Util.height(30), right: Util.width(40)),
        padding: EdgeInsets.only(bottom: Util.height(30)),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    IconData(0xe676, fontFamily: 'ICON'),
                    size: Util.sp(40),
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(width: Util.width(50)),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'English/',
                        style: Util.textStyle4En(context, 2,
                            color: Colors.grey[800], spacing: 0.0, size: 30),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: Util.height(1)),
                      child: Text(
                        '中文',
                        style: Util.textStyle4Zh(context, 2,
                            color: Colors.grey[800], spacing: 0.0, size: 30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: Util.sp(27),
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _versionWidget(BuildContext context) {
    TronInfo tronInfo =
        Provider.of<HomeProvider>(context, listen: true).tronInfo;
    String currentVersion =
        Provider.of<HomeProvider>(context, listen: true).currentVersion;

    int androidNeedUpdateType = 0;
    int iosNeedUpdateType = 0;

    if (Platform.isAndroid &&
        tronInfo != null &&
        tronInfo.androidVersionNum != null) {
      if (currentVersion.compareTo(tronInfo.androidVersionNum) == -1) {
        androidNeedUpdateType = tronInfo.androidUpdateType;
      }
    }
    if (Platform.isIOS && tronInfo != null && tronInfo.iosVersionNum != null) {
      if (currentVersion.compareTo(tronInfo.iosVersionNum) == -1) {
        iosNeedUpdateType = tronInfo.iosUpdateType;
      }
    }

    return InkWell(
      onTap: () async {
        if (Platform.isAndroid &&
            tronInfo != null &&
            tronInfo.androidVersionNum != null) {
          if (androidNeedUpdateType == 0) {
            Util.showToast('已经是最新版本');
          } else if (androidNeedUpdateType == 1) {
            return showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                      title: Text(
                        '新版本 V${tronInfo.androidVersionNum}',
                        style: Util.textStyle(context, 2,
                            color: Colors.grey[800], spacing: 0.0, size: 30),
                      ),
                      content: Container(
                        padding: EdgeInsets.only(top: Util.height(10)),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${tronInfo.androidUpdateInfo1.replaceAll('\\n', '\n')}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SHS-R',
                            letterSpacing: 0.1,
                            color: Colors.grey[850],
                            fontSize: Util.sp(25),
                            height: Util.sp(3.2),
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            '以后再说',
                            style: Util.textStyle(context, 2,
                                color: Util.themeColor, spacing: 0.1, size: 30),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                            child: Text(
                              '立即体验',
                              style: Util.textStyle(context, 2,
                                  color: Util.themeColor,
                                  spacing: 0.1,
                                  size: 30),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              return showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  child: DownloadPage(
                                      tronInfo.androidDownloadUrl));
                            }),
                      ],
                    ));
          }
        }
        if (Platform.isIOS &&
            tronInfo != null &&
            tronInfo.iosVersionNum != null) {
          if (iosNeedUpdateType == 0) {
            Util.showToast('已经是最新版本');
          } else if (iosNeedUpdateType == 1) {
            return showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                      title: Text(
                        '新版本 V${tronInfo.iosVersionNum}',
                        style: Util.textStyle(context, 2,
                            color: Colors.grey[800], spacing: 0.0, size: 30),
                      ),
                      content: Container(
                        padding: EdgeInsets.only(top: Util.height(10)),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${tronInfo.iosUpdateInfo1.replaceAll('\\n', '\n')}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SHS-R',
                            letterSpacing: 0.1,
                            color: Colors.grey[850],
                            fontSize: Util.sp(25),
                            height: Util.sp(3.2),
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            '以后再说',
                            style: Util.textStyle(context, 2,
                                color: Util.themeColor, spacing: 0.0, size: 30),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                            child: Text(
                              '立即体验',
                              style: Util.textStyle(context, 2,
                                  color: Util.themeColor,
                                  spacing: 0.0,
                                  size: 30),
                            ),
                            onPressed: () async {
                              if (await canLaunch(tronInfo.iosDownloadUrl)) {
                                await launch(tronInfo.iosDownloadUrl);
                              } else {
                                print(
                                    'could not launch ${tronInfo.iosDownloadUrl}');
                              }
                            }),
                      ],
                    ));
          }
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            left: Util.width(40), top: Util.height(30), right: Util.width(40)),
        padding: EdgeInsets.only(bottom: Util.height(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    IconData(0xe6db, fontFamily: 'ICON'),
                    size: Util.sp(42),
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(width: Util.width(50)),
                Container(
                  child: Text(
                    '${S.of(context).mineCurrentVersion}',
                    style: Util.textStyle(context, 2,
                        color: Colors.grey[800], spacing: 0.0, size: 30),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: versionSubWidget(currentVersion,
                        androidNeedUpdateType, iosNeedUpdateType),
                  ),
                  Container(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: Util.sp(27),
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

  Widget versionSubWidget(
      String currentVersion, int androidNeedUpdateType, int iosNeedUpdateType) {
    bool flag = androidNeedUpdateType == 1 || iosNeedUpdateType == 1;
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: Util.width(5)),
            alignment: Alignment.centerRight,
            child: Text(
              '$currentVersion',
              style: Util.textStyle4En(context, 2,
                  color: Colors.grey[700], size: 27),
            ),
          ),
          flag
              ? Container(
                  padding: EdgeInsets.only(
                      left: Util.width(5), right: Util.width(10)),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.brightness_1,
                      size: Util.sp(15), color: Util.themeColor),
                )
              : Container(),
        ],
      ),
    );
  }

  _showSwitchLangDialLog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Text(
                '${S.of(context).mineLangTip1}',
                style: Util.textStyle(context, 2,
                    color: Colors.grey[850], spacing: 0.2, size: 30),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    '${S.of(context).commonCancel}',
                    style: Util.textStyle(context, 2,
                        color: Util.themeColor, spacing: 0.5, size: 30),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text(
                      '${S.of(context).commonConfirm}',
                      style: Util.textStyle(context, 2,
                          color: Util.themeColor, spacing: 0.5, size: 30),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Provider.of<IndexProvider>(context, listen: false)
                          .changeLangType();
                    }),
              ],
            ));
  }
}
