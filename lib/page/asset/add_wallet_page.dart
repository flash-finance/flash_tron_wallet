import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/common/common_widget.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWalletPage extends StatefulWidget {
  @override
  _AddWalletPageState createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasAppBar: true,
      hasBack: true,
      title: '${MyLocaleKey.assetAddWallet.tr}',
      body: Obx(
        () => _bodyWidget(context),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          IntervalWidget(25),
          _bizWidget(context),
          IntervalWidget(25),
        ],
      ),
    );
  }

  Widget _bizWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MyScreenUtil.width(30), right: MyScreenUtil.width(30)),
      child: Column(
        children: <Widget>[
          SizedBox(height: MyScreenUtil.height(30)),
          InkWell(
            onTap: () {
              /*Application.router.navigateTo(
                  context, Routes.assetImportKey + '/2',
                  transition: TransitionType.cupertino);*/
              Get.toNamed(AppRoute.assetImportKey + '/2');
            },
            child: Container(
              padding: EdgeInsets.only(bottom: MyScreenUtil.height(30)),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: MyScreenUtil.width(10)),
                      Container(
                        child: Text(
                          '${MyLocaleKey.assetImportPrivateKey.tr}',
                          style: MyTextUtil.textStyle(2,
                              color: Colors.grey[800], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: MyScreenUtil.sp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: MyScreenUtil.width(10)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MyScreenUtil.height(30)),
          InkWell(
            onTap: () {
              /*Application.router.navigateTo(
                  context, Routes.assetImportMnemonic + '/2',
                  transition: TransitionType.cupertino);*/
              Get.toNamed(AppRoute.assetImportMnemonic + '/2');
            },
            child: Container(
              padding: EdgeInsets.only(bottom: MyScreenUtil.height(30)),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: MyScreenUtil.width(10)),
                      Container(
                        child: Text(
                          '${MyLocaleKey.assetImportMnemonic}',
                          style: MyTextUtil.textStyle(2,
                              color: Colors.grey[800], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: MyScreenUtil.sp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: MyScreenUtil.width(10)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MyScreenUtil.height(30)),
          InkWell(
            onTap: () {
              /*Application.router.navigateTo(
                  context, Routes.assetBuildFirstWallet + '/2',
                  transition: TransitionType.cupertino);*/
              Get.toNamed(AppRoute.assetBuildFirstWallet + '/2');
            },
            child: Container(
              padding: EdgeInsets.only(bottom: MyScreenUtil.height(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: MyScreenUtil.width(10)),
                      Container(
                        child: Text(
                          '${MyLocaleKey.assetCreateWallet}',
                          style: MyTextUtil.textStyle(2,
                              color: Colors.grey[800], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: MyScreenUtil.sp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: MyScreenUtil.width(10)),
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
