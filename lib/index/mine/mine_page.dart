import 'dart:io';

import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/index/mine/download/download_page.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/model/tron_info_model.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flash_tron_wallet/route/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  bool _langType = true;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasAppBar: true,
      title: '${MyLocaleKey.bottomTab3.tr}',
      body: Obx(() => _bodyWidget(context)),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          MyCommonUtil.interval(value: 20),
          _walletManageWidget(context),
          _langWidget(context),
          _versionWidget(context),
          MyCommonUtil.interval(value: 20),
        ],
      ),
    );
  }

  Widget _walletManageWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.mineWalletManage);
      },
      child: Container(
        margin: MyCommonUtil.edge(left: 40, right: 40, top: 30),
        padding: MyCommonUtil.edge(bottom: 30),
        decoration: BoxDecoration(
          border: MyCommonUtil.bottomBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    IconData(0xe6e0, fontFamily: 'ICON'),
                    size: MyScreenUtil.sp(42),
                    color: Colors.grey[800],
                  ),
                ),
                MyCommonUtil.sizedBox(width: 50),
                Container(
                  child: Text(
                    '${MyLocaleKey.mineManageWallet.tr}',
                    style: MyTextUtil.textStyle(2,
                        color: Colors.grey[800], spacing: 0.0, size: 30),
                  ),
                ),
              ],
            ),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                size: MyScreenUtil.sp(27),
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
        margin: MyCommonUtil.edge(left: 40, right: 40, top: 30),
        padding: MyCommonUtil.edge(bottom: 30),
        decoration: BoxDecoration(
          border: MyCommonUtil.bottomBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    IconData(0xe676, fontFamily: 'ICON'),
                    size: MyScreenUtil.sp(40),
                    color: Colors.grey[800],
                  ),
                ),
                MyCommonUtil.sizedBox(width: 50),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'English/',
                        style: MyTextUtil.textStyle4En(2,
                            color: Colors.grey[800], spacing: 0.0, size: 30),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: MyScreenUtil.height(1)),
                      child: Text(
                        '中文',
                        style: MyTextUtil.textStyle4Zh(2,
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
                size: MyScreenUtil.sp(27),
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _versionWidget(BuildContext context) {
    TronInfo tronInfo = GlobalService.to.tronInfo;
    String currentVersion = GlobalService.to.currentVersion;

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
            MyCommonUtil.showToast('${MyLocaleKey.mineVersionTips1.tr}');
          } else if (androidNeedUpdateType == 1) {
            return showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                      title: Container(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '${MyLocaleKey.mineVersionNew.tr}',
                                style: MyTextUtil.textStyle(2,
                                    color: Colors.grey[800],
                                    spacing: 0.0,
                                    size: 30),
                              ),
                              TextSpan(
                                text: ' V${tronInfo.androidVersionNum}',
                                style: MyTextUtil.textStyle4En(
                                  2,
                                  color: Colors.grey[800],
                                  spacing: 0.0,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      content: Container(
                        padding: MyCommonUtil.edge(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _langType
                              ? '${tronInfo.androidUpdateInfo1.replaceAll('\\n', '\n')}'
                              : '${tronInfo.androidUpdateInfo2.replaceAll('\\n', '\n')}',
                          textAlign: TextAlign.left,
                          style: MyTextUtil.textStyle4Update(1,
                              color: Colors.grey[850], spacing: 0.0, size: 25),
                        ),
                      ),
                      actions: <Widget>[
                        MyCommonUtil.flatButton(
                          '${MyLocaleKey.mineVersionTips2.tr}',
                          () => Navigator.pop(context),
                        ),
                        MyCommonUtil.flatButton(
                          '${MyLocaleKey.mineVersionTips3.tr}',
                          () {
                            Navigator.pop(context);
                            return showDialog(
                                context: context,
                                barrierDismissible: false,
                                child:
                                    DownloadPage(tronInfo.androidDownloadUrl));
                          },
                        ),
                      ],
                    ));
          }
        }
        if (Platform.isIOS &&
            tronInfo != null &&
            tronInfo.iosVersionNum != null) {
          if (iosNeedUpdateType == 0) {
            MyCommonUtil.showToast('${MyLocaleKey.mineVersionTips1.tr}');
          } else if (iosNeedUpdateType == 1) {
            return showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                      title: Container(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '${MyLocaleKey.mineVersionNew.tr}',
                                style: MyTextUtil.textStyle(2,
                                    color: Colors.grey[800],
                                    spacing: 0.0,
                                    size: 30),
                              ),
                              TextSpan(
                                text: ' V${tronInfo.iosVersionNum}',
                                style: MyTextUtil.textStyle4En(
                                  2,
                                  color: Colors.grey[800],
                                  spacing: 0.0,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      content: Container(
                        padding: MyCommonUtil.edge(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _langType
                              ? '${tronInfo.iosUpdateInfo1.replaceAll('\\n', '\n')}'
                              : '${tronInfo.iosUpdateInfo2.replaceAll('\\n', '\n')}',
                          textAlign: TextAlign.left,
                          style: MyTextUtil.textStyle4Update(1,
                              color: Colors.grey[850], spacing: 0.0, size: 25),
                        ),
                      ),
                      actions: <Widget>[
                        MyCommonUtil.flatButton(
                          '${MyLocaleKey.mineVersionTips2.tr}',
                          () => Navigator.pop(context),
                        ),
                        MyCommonUtil.flatButton(
                          '${MyLocaleKey.mineVersionTips3.tr}',
                          () async {
                            if (await canLaunch(tronInfo.iosDownloadUrl)) {
                              await launch(tronInfo.iosDownloadUrl);
                            } else {
                              print(
                                  'could not launch ${tronInfo.iosDownloadUrl}');
                            }
                          },
                        ),
                      ],
                    ));
          }
        }
      },
      child: Container(
        margin: MyCommonUtil.edge(left: 40, right: 40, top: 30),
        padding: MyCommonUtil.edge(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    IconData(0xe6db, fontFamily: 'ICON'),
                    size: MyScreenUtil.sp(42),
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(width: MyScreenUtil.width(50)),
                Container(
                  child: Text(
                    '${MyLocaleKey.mineCurrentVersion.tr}',
                    style: MyTextUtil.textStyle(2,
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
                      size: MyScreenUtil.sp(27),
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
            padding: MyCommonUtil.edge(right: 5),
            alignment: Alignment.centerRight,
            child: Text(
              '$currentVersion',
              style:
                  MyTextUtil.textStyle4En(2, color: Colors.grey[700], size: 27),
            ),
          ),
          flag
              ? Container(
                  padding: MyCommonUtil.edge(left: 5, right: 10),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.brightness_1,
                      size: MyScreenUtil.sp(15), color: MyColorUtil.theme),
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
                '${MyLocaleKey.mineLangTip1.tr}',
                style: MyTextUtil.textStyle(2,
                    color: Colors.grey[850], spacing: 0.2, size: 30),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    '${MyLocaleKey.commonCancel.tr}',
                    style: MyTextUtil.textStyle(2,
                        color: MyColorUtil.theme, spacing: 0.5, size: 30),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text(
                      '${MyLocaleKey.commonConfirm.tr}',
                      style: MyTextUtil.textStyle(2,
                          color: MyColorUtil.theme, spacing: 0.5, size: 30),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      GlobalService.to.changeLangType();
                    }),
              ],
            ));
  }
}
