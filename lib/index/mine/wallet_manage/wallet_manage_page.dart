import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flash_tron_wallet/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WalletManagePage extends StatefulWidget {
  @override
  _WalletManagePageState createState() => _WalletManagePageState();
}

class _WalletManagePageState extends State<WalletManagePage> {
  bool _langType = true;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasBack: true,
      title: '${MyLocaleKey.mineManageWallet.tr}',
      body: Obx(() => _bodyWidget(context)),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    List<WalletEntity> walletList = GlobalService.to.walletList;
    return Container(
      child: Column(
        children: <Widget>[
          walletList.length > 0
              ? Expanded(child: _walletListWidget(context, walletList))
              : _notWalletWidget(context),
        ],
      ),
    );
  }

  Widget _notWalletWidget(BuildContext context) {
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30, top: 10, bottom: 20),
      padding: MyCommonUtil.edge(top: 50, bottom: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        image: DecorationImage(
          image: AssetImage('asset/image/bg02.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '${MyLocaleKey.mineNoWallet.tr}',
          style: MyTextUtil.textStyle(2,
              color: MyColorUtil.white, spacing: 0.5, size: 28),
        ),
      ),
    );
  }

  Widget _walletListWidget(
      BuildContext context, List<WalletEntity> walletList) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: walletList.length,
          itemBuilder: (context, index) {
            return _walletItemWidget(context, walletList, index);
          }),
    );
  }

  Widget _walletItemWidget(
      BuildContext context, List<WalletEntity> list, int index) {
    int selectIndex = GlobalService.to.selectWalletIndex;
    bool flag = selectIndex == index;
    String name = list[index].name;
    String tronAddress = list[index].tronAddress.substring(0, 10) +
        '...' +
        list[index].tronAddress.substring(list[index].tronAddress.length - 10,
            list[index].tronAddress.length);
    return Container(
      margin: MyCommonUtil.edge(
          left: 30, right: 30, top: index == 0 ? 10 : 0, bottom: 20),
      padding: MyCommonUtil.edge(left: 40, right: 40, top: 30, bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        image: DecorationImage(
          image: AssetImage('asset/image/bg02.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoute.assetWalletDetail + '/$index');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '$name',
                          style: MyTextUtil.textStyle(2,
                              color: MyColorUtil.white, spacing: 0.5, size: 28),
                        ),
                      ),
                      MyCommonUtil.sizedBox(width: 50),
                      flag
                          ? Container(
                              width: MyScreenUtil.width(80),
                              padding: _langType
                                  ? MyCommonUtil.edge(top: 2, bottom: 2)
                                  : MyCommonUtil.edge(top: 5, bottom: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                color: MyColorUtil.white,
                              ),
                              child: Text(
                                '${MyLocaleKey.commonCurrent.tr}',
                                style: MyTextUtil.textStyle(2,
                                    color: MyColorUtil.theme,
                                    spacing: 0.2,
                                    size: 20),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: MyScreenUtil.sp(28),
                    color: MyColorUtil.white,
                  ),
                ),
              ],
            ),
            MyCommonUtil.sizedBox(height: 10),
            InkWell(
              onTap: () {
                Clipboard.setData(ClipboardData(text: list[index].tronAddress));
                MyCommonUtil.showToast('${MyLocaleKey.commonCopySuccess.tr}');
              },
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '$tronAddress',
                        style: MyTextUtil.textStyle4En(1,
                            color: MyColorUtil.white, spacing: 0.5, size: 26),
                      ),
                    ),
                    MyCommonUtil.sizedBox(width: 50),
                    Container(
                      child: Icon(
                        IconData(0xe618, fontFamily: 'ICON'),
                        size: MyScreenUtil.sp(28),
                        color: MyColorUtil.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}