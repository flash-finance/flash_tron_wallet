import 'package:flash_tron_wallet/common/enum/import_wallet_type.dart';
import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
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
          MyCommonUtil.interval(value: 20),
          _bizWidget(context),
          MyCommonUtil.interval(value: 20),
        ],
      ),
    );
  }

  Widget _bizWidget(BuildContext context) {
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30),
      child: Column(
        children: <Widget>[
          SizedBox(height: MyScreenUtil.height(30)),
          _itemWidget(context, '${MyLocaleKey.assetImportPrivateKey.tr}',
              ImportWalletType.importKey, true),
          SizedBox(height: MyScreenUtil.height(30)),
          _itemWidget(context, '${MyLocaleKey.assetImportMnemonic.tr}',
              ImportWalletType.importMnemonic, true),
          SizedBox(height: MyScreenUtil.height(30)),
          _itemWidget(context, '${MyLocaleKey.assetCreateWallet.tr}',
              ImportWalletType.createWallet, false),
        ],
      ),
    );
  }

  Widget _itemWidget(
      BuildContext context, String name, ImportWalletType type, bool flag) {
    return InkWell(
      onTap: () {
        switch (type) {
          case ImportWalletType.importKey:
            Get.toNamed(AppRoute.assetImportKey + '/2');
            break;
          case ImportWalletType.importMnemonic:
            Get.toNamed(AppRoute.assetImportMnemonic + '/2');
            break;
          case ImportWalletType.createWallet:
            Get.toNamed(AppRoute.assetBuildFirstWallet + '/2');
            break;
        }
      },
      child: Container(
        padding: MyCommonUtil.edge(bottom: 30),
        decoration: BoxDecoration(
          border: flag ? MyCommonUtil.bottomBorder() : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                MyCommonUtil.sizedBox(width: 10),
                Container(
                  child: Text(
                    '$name',
                    style: MyTextUtil.textStyle(
                      2,
                      color: MyColorUtil.biz(),
                      spacing: 0.0,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                MyCommonUtil.arrowForward(),
                SizedBox(width: MyScreenUtil.width(10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
