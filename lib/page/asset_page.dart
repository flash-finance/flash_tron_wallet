import 'dart:async';

import 'package:flash_tron_wallet/common/enum/import_wallet_type.dart';
import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flash_tron_wallet/route/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';

class AssetPage extends StatefulWidget {
  @override
  _AssetPageState createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Timer _timer;
  ScanController controller = ScanController();
  bool _langType = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        GlobalService.to.changeBackgroundFlag(false);
        // 无法关闭 会重新唤醒?
        controller.pause();
        break;
      case AppLifecycleState.paused:
        GlobalService.to.changeBackgroundFlag(true);
        controller.pause();
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_timer != null) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() => _allWidget(context));
  }

  Widget _allWidget(BuildContext context) {
    WalletEntity wallet = GlobalService.to.selectWalletEntity;
    if (wallet != null && wallet.tronAddress != null) {
      return MyScaffold(
        hasAppBar: false,
        body: _logInWidget(context),
      );
    } else {
      return _logOutWidget(context);
    }
  }

  Widget _logOutWidget(BuildContext context) {
    return Container(
      color: MyColorUtil.background(),
      child: Column(
        children: <Widget>[
          Container(
            width: MyScreenUtil.width(750),
            height: MyScreenUtil.height(500),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: MyColorUtil.theme,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: _logOutHeadWidget(context),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: MyScreenUtil.height(0)),
              child: _logOutBodyWidget(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logInWidget(BuildContext context) {
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30),
      child: Column(
        children: <Widget>[
          _headWidget(context),
          MyCommonUtil.sizedBox(height: 15),
          Expanded(
            child: _bodyWidget(context),
          ),
        ],
      ),
    );
  }

  Widget _headWidget(BuildContext context) {
    WalletEntity item = GlobalService.to.selectWalletEntity;
    List<WalletEntity> walletList = GlobalService.to.walletList;
    return Container(
      margin: MyCommonUtil.edge(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              _showBottomSheetWidget(context, walletList);
            },
            child: Container(
              child: Chip(
                padding: MyCommonUtil.edge(left: 8),
                backgroundColor: MyColorUtil.theme,
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${item.name}',
                        style: MyTextUtil.textStyle(1,
                            color: Colors.white, spacing: 0.2, size: 23),
                      ),
                    ),
                    MyCommonUtil.sizedBox(width: 5),
                    Container(
                      alignment: Alignment.center,
                      height: MyScreenUtil.height(36),
                      width: MyScreenUtil.height(36),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: MyScreenUtil.sp(22),
                        color: MyColorUtil.theme,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.assetAddWallet);
                  },
                  child: Container(
                    child: Icon(
                      IconData(0xe7b8, fontFamily: 'ICON'),
                      size: MyScreenUtil.sp(55),
                      color: Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(width: MyScreenUtil.width(30)),
                InkWell(
                  onTap: () {
                    GlobalService.to.changeSelectAssetFilterIndex(0);
                    Get.toNamed(AppRoute.assetQrScan + '/1');
                  },
                  child: Container(
                    child: Icon(
                      IconData(0xe606, fontFamily: 'ICON'),
                      size: MyScreenUtil.sp(60),
                      color: Colors.grey[850],
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

  Widget _bodyWidget(BuildContext context) {
    return EasyRefresh(
      header: MaterialHeader(enableHapticFeedback: true),
      footer:
          MaterialFooter(enableHapticFeedback: true, enableInfiniteLoad: false),
      child: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              _cardWidget(context),
              MyCommonUtil.sizedBox(height: 30),
              _assetTitleWidget(context),
              MyCommonUtil.sizedBox(height: 5),
              _assetDataWidget(context),
            ],
          ),
        ),
      ),
      onRefresh: () async {
        _getAsset4Async();
      },
    );
  }

  Widget _cardWidget(BuildContext context) {
    List<AssetEntity> assetList = GlobalService.to.assetList;
    double totalAssetUsd = 0.0;
    int selectIndex = GlobalService.to.selectWalletIndex;
    if (assetList != null && assetList.length > 0) {
      for (AssetEntity item in assetList) {
        totalAssetUsd += item.usd;
      }
    }
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.assetWalletDetail + '/$selectIndex');
      },
      child: Container(
        padding: MyCommonUtil.edge(left: 40, right: 40, top: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          image: DecorationImage(
            image: AssetImage('asset/image/bg01.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      '${MyLocaleKey.assetMyAssets.tr} （\$）',
                      style: MyTextUtil.textStyle(1,
                          color: Colors.white, spacing: 0.5, size: 25),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '${MyLocaleKey.assetDetails.tr}',
                            style: MyTextUtil.textStyle(1,
                                color: Colors.white, spacing: 0.5, size: 25),
                          ),
                        ),
                        SizedBox(width: MyScreenUtil.width(10)),
                        Container(
                          padding: MyCommonUtil.edge(
                              top: _langType ? 0 : 1.5,
                              bottom: _langType ? 1 : 0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: MyScreenUtil.sp(23),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MyScreenUtil.height(10)),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoute.assetWalletDetail + '/$selectIndex');
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: MyCommonUtil.edge(top: 20, bottom: 20),
                child: Text(
                  '${MyCommonUtil.formatNum(totalAssetUsd, 2)}',
                  style: MyTextUtil.textStyle4Num(
                      color: Colors.white,
                      spacing: 0.2,
                      size: 45,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: MyScreenUtil.height(10)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      GlobalService.to.changeSelectAssetFilterIndex(0);
                      String value = '';
                      Get.toNamed(AppRoute.assetSendToken + '/$value');
                    },
                    child: Container(
                      padding: MyCommonUtil.edge(bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.transit_enterexit_sharp,
                              size: MyScreenUtil.sp(35),
                              color: Colors.white,
                            ),
                          ),
                          MyCommonUtil.sizedBox(width: 10),
                          Container(
                            child: Text(
                              '${MyLocaleKey.assetTransfer.tr}',
                              style: MyTextUtil.textStyle(1,
                                  color: Colors.white, spacing: 0.6, size: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoute.assetReceiveToken);
                    },
                    child: Container(
                      padding: MyCommonUtil.edge(bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: MyCommonUtil.edge(top: 2.5),
                            child: Icon(
                              Icons.download_sharp,
                              size: MyScreenUtil.sp(33),
                              color: Colors.white,
                            ),
                          ),
                          MyCommonUtil.sizedBox(width: 10),
                          Container(
                            child: Text(
                              '${MyLocaleKey.assetReceive.tr}',
                              style: MyTextUtil.textStyle(1,
                                  color: Colors.white, spacing: 0.6, size: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      GlobalService.to.changeCurrentIndex(1);
                    },
                    child: Container(
                      padding: MyCommonUtil.edge(bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.sync_rounded,
                              size: MyScreenUtil.sp(33),
                              color: Colors.white,
                            ),
                          ),
                          MyCommonUtil.sizedBox(width: 10),
                          Container(
                            child: Text(
                              '${MyLocaleKey.assetTrade.tr}',
                              style: MyTextUtil.textStyle(1,
                                  color: Colors.white, spacing: 0.6, size: 25),
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
      ),
    );
  }

  Widget _assetTitleWidget(BuildContext context) {
    return Container(
        margin: MyCommonUtil.edge(left: 10, right: 10),
        alignment: Alignment.centerLeft,
        child: Text(
          '${MyLocaleKey.assetAssets.tr}',
          style: MyTextUtil.textStyle(2,
              color: Colors.grey[800], spacing: 0.5, size: 32),
        ));
  }

  Widget _assetDataWidget(BuildContext context) {
    List<AssetEntity> assetList = GlobalService.to.assetList;
    return assetList.length > 0
        ? Container(
            margin: MyCommonUtil.edge(left: 10, right: 10),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: assetList.length,
                itemBuilder: (context, index) {
                  return _assetDataItemWidget(context, assetList, index);
                }),
          )
        : Container(
            margin: MyCommonUtil.edge(top: 120),
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
  }

  Widget _assetDataItemWidget(
      BuildContext context, List<AssetEntity> assetList, int index) {
    AssetEntity item = assetList[index];
    bool flag = index != assetList.length - 1;
    return InkWell(
      onTap: () {
        GlobalService.to.changeSelectAssetFilterIndex(index);
        String value = '';
        Get.toNamed(AppRoute.assetSendToken + '/$value');
      },
      child: Container(
        padding: MyCommonUtil.edge(top: 20, bottom: 20),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: flag ? Colors.black26 : Colors.white, width: 0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  ClipOval(
                    child: Image.network(
                      '${item.logoUrl}',
                      width: MyScreenUtil.width(50),
                      height: MyScreenUtil.width(50),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: MyScreenUtil.width(30)),
                  Container(
                      child: Text(
                    '${item.name}',
                    style: MyTextUtil.textStyle4En(2,
                        color: Colors.grey[850], spacing: 0.0, size: 30),
                  )),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text(
                      '${MyCommonUtil.formatNum(item.balance, 4)}',
                      style: MyTextUtil.textStyle4Num(
                          color: Colors.grey[800],
                          spacing: 0.1,
                          size: 30,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: MyScreenUtil.height(8)),
                  Container(
                    child: Text(
                      '≈  \$ ${MyCommonUtil.formatNum(item.usd, 2)}',
                      style: MyTextUtil.textStyle4En(
                        2,
                        color: Colors.grey[600],
                        spacing: 0.0,
                        size: 21,
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
      ),
    );
  }

  Widget _logOutHeadWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            child: Opacity(
              opacity: 1.0,
              child: Image.asset(
                'asset/image/flash-logo.png',
                width: MyScreenUtil.width(150),
                height: MyScreenUtil.width(150),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: MyScreenUtil.height(20)),
          Container(
            child: Text(
              'Flash  Wallet',
              style: MyTextUtil.textStyle4En(1,
                  color: Colors.white, spacing: 0.3, size: 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logOutBodyWidget(BuildContext context) {
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30, top: 30),
      child: Column(
        children: <Widget>[
          _importWalletTypeWidget(
              context,
              '${MyLocaleKey.assetImportPrivateKey.tr}',
              ImportWalletType.importKey,
              true),
          _importWalletTypeWidget(
              context,
              '${MyLocaleKey.assetImportMnemonic.tr}',
              ImportWalletType.importMnemonic,
              true),
          _importWalletTypeWidget(
              context,
              '${MyLocaleKey.assetCreateWallet.tr}',
              ImportWalletType.createWallet,
              false),
        ],
      ),
    );
  }

  Widget _importWalletTypeWidget(
      BuildContext context, String name, ImportWalletType type, bool flag) {
    return InkWell(
      onTap: () {
        switch (type) {
          case ImportWalletType.importKey:
            Get.toNamed(AppRoute.assetImportKey + '/1');
            break;
          case ImportWalletType.importMnemonic:
            Get.toNamed(AppRoute.assetImportMnemonic + '/1');
            break;
          case ImportWalletType.createWallet:
            Get.toNamed(AppRoute.assetBuildFirstWallet + '/1');
            break;
          default:
            break;
        }
      },
      child: Container(
        padding: MyCommonUtil.edge(top: 30, bottom: 30),
        decoration: BoxDecoration(
          border: flag ? MyCommonUtil.bottomBorder() : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '$name',
                style: MyTextUtil.textStyle(2,
                    color: Colors.grey[850], spacing: 0.0, size: 30),
              ),
            ),
            MyCommonUtil.arrowForward(),
          ],
        ),
      ),
    );
  }

  _getAsset4Async() async {
    GlobalService.to.getAsset4ReloadAsync();
  }

  _showBottomSheetWidget(BuildContext context, List<WalletEntity> walletList) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        //barrierColor: Colors.grey[850].withOpacity(0.98),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            height: MyScreenUtil.height(800),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: MyCommonUtil.edge(top: 20, bottom: 20),
                  margin: MyCommonUtil.edge(bottom: 25),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[400], width: 0.3)),
                  ),
                  child: Text(
                    '${MyLocaleKey.assetWalletList}',
                    style: MyTextUtil.textStyle(2,
                        color: Colors.grey[850], spacing: 0.4, size: 32),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: walletList.length,
                        itemBuilder: (context, index) {
                          return _walletItemWidget(context, walletList, index);
                        }),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _walletItemWidget(
      BuildContext context, List<WalletEntity> list, int index) {
    int selectIndex = GlobalService.to.selectWalletIndex;
    String name = list[index].name;
    String tronAddress = list[index].tronAddress.substring(0, 10) +
        '...' +
        list[index].tronAddress.substring(list[index].tronAddress.length - 10,
            list[index].tronAddress.length);
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30, bottom: 20),
      padding: MyCommonUtil.edge(left: 40, right: 40, top: 30, bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //color: MyScreenUtil.themeColor,
        image: DecorationImage(
          image: AssetImage('images/bg02.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: () async {
          Navigator.pop(context);
          await GlobalService.to.changeSelectWallet(index);
          GlobalService.to.getAsset4ReloadAsync();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    '$name',
                    style: MyTextUtil.textStyle(1,
                        color: Colors.white, spacing: 0.5, size: 28),
                  ),
                ),
                MyCommonUtil.sizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: list[index].tronAddress));
                    MyCommonUtil.showToast('${MyLocaleKey.commonCopySuccess}');
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '$tronAddress',
                            style: MyTextUtil.textStyle4En(1,
                                color: Colors.white, spacing: 0.0, size: 26),
                          ),
                        ),
                        SizedBox(width: MyScreenUtil.width(50)),
                        Container(
                          child: Icon(
                            IconData(0xe618, fontFamily: 'ICON'),
                            size: MyScreenUtil.sp(28),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            selectIndex == index
                ? Container(
                    child: Icon(
                      Icons.done_rounded,
                      size: MyScreenUtil.sp(40),
                      color: Colors.white,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
