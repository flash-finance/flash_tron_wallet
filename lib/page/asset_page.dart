import 'dart:async';

import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/model/tron_info_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/router/router.dart';
import 'package:flash_tron_wallet/tron/service/tron_asset.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:scan/scan.dart';

class AssetPage extends StatefulWidget {
  @override
  _AssetPageState createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> with WidgetsBindingObserver {
  Timer _timer;
  ScanController controller = ScanController();
  bool _langType = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //_reloadAsset();
      _reloadAssetSub();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('didChangeAppLifecycleState:${state.toString()}');
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        Provider.of<HomeProvider>(context, listen: false)
            .changeBackgroundFlag(false);
        // 无法关闭 会重新唤醒?
        controller.pause();
        break;
      case AppLifecycleState.paused:
        Provider.of<HomeProvider>(context, listen: false)
            .changeBackgroundFlag(true);
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
    _langType = Provider.of<IndexProvider>(context, listen: true).langType;
    WalletEntity wallet =
        Provider.of<HomeProvider>(context, listen: true).selectWalletEntity;
    if (wallet != null && wallet.tronAddress != null) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(Util.height(0)),
        ),
        body: _logInWidget(context),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: Util.width(750),
              height: Util.height(500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Util.themeColor,
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
                margin: EdgeInsets.only(top: Util.height(0)),
                child: _logOutBodyWidget(context),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _logInWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      child: Column(
        children: <Widget>[
          _headWidget(context),
          SizedBox(height: Util.height(15)),
          Expanded(
            child: _bodyWidget(context),
          ),
        ],
      ),
    );
  }

  Widget _headWidget(BuildContext context) {
    WalletEntity item =
        Provider.of<HomeProvider>(context, listen: true).selectWalletEntity;
    List<WalletEntity> walletList =
        Provider.of<HomeProvider>(context, listen: true).walletList;
    return Container(
      margin: EdgeInsets.only(top: Util.height(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              _showBottomSheet(context, walletList);
            },
            child: Container(
              child: Chip(
                padding:
                    EdgeInsets.only(left: Util.width(8), right: Util.width(0)),
                backgroundColor: Util.themeColor,
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${item.name}',
                        style: Util.textStyle(context, 1,
                            color: Colors.white, spacing: 0.2, size: 23),
                      ),
                    ),
                    SizedBox(width: Util.width(5)),
                    Container(
                      alignment: Alignment.center,
                      height: Util.height(40),
                      width: Util.height(40),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('icons/circle.png'),
                              fit: BoxFit.fill)),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: Util.sp(22),
                        color: Util.themeColor,
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
                    Application.router.navigateTo(
                        context, Routes.assetAddWallet,
                        transition: TransitionType.cupertino);
                  },
                  child: Container(
                    child: Icon(
                      IconData(0xe7b8, fontFamily: 'ICON'),
                      size: Util.sp(55),
                      color: Colors.grey[850],
                    ),
                  ),
                ),
                SizedBox(width: Util.width(30)),
                InkWell(
                  onTap: () {
                    Provider.of<HomeProvider>(context, listen: false)
                        .changeSelectAssetFilterIndex(0);
                    Application.router.navigateTo(
                        context, Routes.assetQrScan + '/1',
                        transition: TransitionType.fadeIn);
                  },
                  child: Container(
                    child: Icon(
                      IconData(0xe606, fontFamily: 'ICON'),
                      size: Util.sp(60),
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
              SizedBox(height: Util.height(30)),
              _assetTitleWidget(context),
              SizedBox(height: Util.height(5)),
              _assetDataWidget(context),
            ],
          ),
        ),
      ),
      onRefresh: () async {
        _getAsset();
      },
    );
  }

  Widget _cardWidget(BuildContext context) {
    List<AssetEntity> assetList =
        Provider.of<HomeProvider>(context, listen: true).assetList;
    double totalAssetUsd = 0.0;

    int selectIndex =
        Provider.of<HomeProvider>(context, listen: true).selectWalletIndex;

    if (assetList != null && assetList.length > 0) {
      for (AssetEntity item in assetList) {
        totalAssetUsd += item.usd;
      }
    }
    return InkWell(
      onTap: () {
        Application.router.navigateTo(
            context, Routes.assetWalletDetail + '/$selectIndex',
            transition: TransitionType.cupertino);
      },
      child: Container(
        padding: EdgeInsets.only(
            left: Util.width(40), top: Util.height(30), right: Util.width(40)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          image: DecorationImage(
            image: AssetImage('images/bg01.png'),
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
                      '${S.of(context).assetMyAssets} （\$）',
                      style: Util.textStyle(context, 1,
                          color: Colors.white, spacing: 0.5, size: 25),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '${S.of(context).assetDetails}',
                            style: Util.textStyle(context, 1,
                                color: Colors.white, spacing: 0.5, size: 25),
                          ),
                        ),
                        SizedBox(width: Util.width(10)),
                        Container(
                          padding: EdgeInsets.only(
                              top:
                                  _langType ? Util.height(0) : Util.height(1.5),
                              bottom:
                                  _langType ? Util.height(1) : Util.height(0)),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: Util.sp(23),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Util.height(10)),
            InkWell(
              onTap: () {
                Application.router.navigateTo(
                    context, Routes.assetWalletDetail + '/$selectIndex',
                    transition: TransitionType.cupertino);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    top: Util.height(20), bottom: Util.height(20)),
                child: Text(
                  '${Util.formatNum(totalAssetUsd, 2)}',
                  style: Util.textStyle4Num(context,
                      color: Colors.white,
                      spacing: 0.2,
                      size: 45,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: Util.height(10)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Provider.of<HomeProvider>(context, listen: false)
                          .changeSelectAssetFilterIndex(0);
                      String value = '';
                      Application.router.navigateTo(
                          context, Routes.assetSendToken + '/$value',
                          transition: TransitionType.cupertino);
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: Util.height(20)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.transit_enterexit_sharp,
                              size: Util.sp(35),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: Util.width(10)),
                          Container(
                            child: Text(
                              '${S.of(context).assetTransfer}',
                              style: Util.textStyle(context, 1,
                                  color: Colors.white, spacing: 0.6, size: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Application.router.navigateTo(
                          context, Routes.assetReceiveToken,
                          transition: TransitionType.cupertino);
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: Util.height(20)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: Util.height(2.5)),
                            child: Icon(
                              Icons.download_sharp,
                              size: Util.sp(33),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: Util.width(10)),
                          Container(
                            child: Text(
                              '${S.of(context).assetReceive}',
                              style: Util.textStyle(context, 1,
                                  color: Colors.white, spacing: 0.6, size: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<IndexProvider>(context, listen: false)
                          .changeCurrentIndex(1);
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: Util.height(20)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.sync_rounded,
                              size: Util.sp(33),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: Util.width(10)),
                          Container(
                            child: Text(
                              '${S.of(context).assetTrade}',
                              style: Util.textStyle(context, 1,
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
        margin: EdgeInsets.only(left: Util.width(10), right: Util.width(10)),
        alignment: Alignment.centerLeft,
        child: Text(
          '${S.of(context).assetAssets}',
          style: Util.textStyle(context, 2,
              color: Colors.grey[800], spacing: 0.5, size: 32),
        ));
  }

  Widget _assetDataWidget(BuildContext context) {
    List<AssetEntity> assetList = Provider.of<HomeProvider>(context).assetList;
    return Container(
      margin: EdgeInsets.only(left: Util.width(10), right: Util.width(10)),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: assetList.length,
          itemBuilder: (context, index) {
            return _assetDataItemWidget(context, assetList, index);
          }),
    );
  }

  Widget _assetDataItemWidget(
      BuildContext context, List<AssetEntity> assetList, int index) {
    AssetEntity item = assetList[index];
    bool flag = index != assetList.length - 1;
    return InkWell(
      onTap: () {
        Provider.of<HomeProvider>(context, listen: false)
            .changeSelectAssetFilterIndex(index);
        String value = '';
        Application.router.navigateTo(context, 'asset/sendToken/$value',
            transition: TransitionType.cupertino);
      },
      child: Container(
        padding: EdgeInsets.only(top: Util.height(20), bottom: Util.height(20)),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: flag ? Colors.black45 : Colors.white, width: 0.3)),
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
                      width: Util.width(50),
                      height: Util.width(50),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: Util.width(30)),
                  Container(
                      child: Text(
                    '${item.name}',
                    style: Util.textStyle4En(context, 2,
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
                      '${Util.formatNum(item.balance, 4)}',
                      style: Util.textStyle4Num(context,
                          color: Colors.grey[800],
                          spacing: 0.1,
                          size: 30,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: Util.height(8)),
                  Container(
                    child: Text(
                      '≈  \$ ${Util.formatNum(item.usd, 2)}',
                      style: Util.textStyle4Num(context,
                          color: Colors.grey[600],
                          spacing: 0.0,
                          size: 23,
                          fontWeight: FontWeight.w400),
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
      margin: EdgeInsets.only(top: Util.height(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Opacity(
                    opacity: 1.0,
                    child: Image.asset(
                      'images/flash-logo.png',
                      width: Util.width(150),
                      height: Util.width(150),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: Util.height(20)),
                Container(
                  child: Text(
                    'Flash  Wallet',
                    style: Util.textStyle4En(context, 1,
                        color: Colors.white, spacing: 0.0, size: 40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _logOutBodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Util.width(30), top: Util.height(30), right: Util.width(30)),
      child: Column(
        children: <Widget>[
          SizedBox(height: Util.height(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(
                  context, Routes.assetImportKey + '/1',
                  transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: Util.height(30)),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[350], width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: Util.width(10)),
                      Container(
                        child: Text(
                          '${S.of(context).assetImportPrivateKey}',
                          style: Util.textStyle(context, 2,
                              color: Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: Util.sp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: Util.width(10)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Util.height(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(
                  context, Routes.assetImportMnemonic + '/1',
                  transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: Util.height(30)),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[350], width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: Util.width(10)),
                      Container(
                        child: Text(
                          '${S.of(context).assetImportMnemonic}',
                          style: Util.textStyle(context, 2,
                              color: Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: Util.sp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: Util.width(10)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Util.height(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(
                  context, Routes.assetBuildFirstWallet + '/1',
                  transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: Util.height(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: Util.width(10)),
                      Container(
                        child: Text(
                          '${S.of(context).assetCreateWallet}',
                          style: Util.textStyle(context, 2,
                              color: Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: Util.sp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: Util.width(10)),
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

  bool _reloadTokenBalanceFlag = true;

  _reloadAsset() async {
    _timer = Timer.periodic(Duration(milliseconds: 3000), (timer) async {
      bool backgroundFlag =
          Provider.of<HomeProvider>(context, listen: false).backgroundFlag;
      if (!backgroundFlag && _reloadTokenBalanceFlag) {
        await _reloadAssetSub();
      }
    });
  }

  _reloadAssetSub() async {
    try {
      _reloadTokenBalanceFlag = false;
      await Provider.of<HomeProvider>(context, listen: false)
          .getAsset4ReloadSync();
    } catch (e) {
      print('_reloadAssetSub error: ${e.toString()}');
    } finally {
      _reloadTokenBalanceFlag = true;
    }
  }

  _getAsset() async {
    WalletEntity wallet =
        Provider.of<HomeProvider>(context, listen: false).selectWalletEntity;
    if (wallet != null && wallet.tronAddress != null) {
      List<TokenRows> tokenList =
          Provider.of<HomeProvider>(context, listen: false).tokenList;
      TronAsset().getAsset(context, wallet.tronAddress, tokenList);
    }
  }

  _showBottomSheet(BuildContext context, List<WalletEntity> walletList) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        //barrierColor: Colors.grey[850].withOpacity(0.98),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        builder: (BuildContext context) {
          return Container(
            height: Util.height(800),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: Util.height(20), bottom: Util.height(20)),
                  margin: EdgeInsets.only(bottom: Util.height(25)),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[400], width: 0.3)),
                  ),
                  child: Text(
                    '${S.of(context).assetWalletList}',
                    style: Util.textStyle(context, 2,
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
    int selectIndex =
        Provider.of<HomeProvider>(context, listen: false).selectWalletIndex;
    String name = list[index].name;
    String tronAddress = list[index].tronAddress.substring(0, 10) +
        '...' +
        list[index].tronAddress.substring(list[index].tronAddress.length - 10,
            list[index].tronAddress.length);
    return Container(
      margin: EdgeInsets.only(
          left: Util.width(30), right: Util.width(30), bottom: Util.height(20)),
      padding: EdgeInsets.only(
          left: Util.width(40),
          top: Util.height(30),
          right: Util.width(40),
          bottom: Util.height(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //color: Util.themeColor,
        image: DecorationImage(
          image: AssetImage('images/bg02.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: () async {
          Navigator.pop(context);
          await Provider.of<HomeProvider>(context, listen: false)
              .changeSelectWallet(index);
          Provider.of<HomeProvider>(context, listen: false)
              .getAsset4ReloadAsync();
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
                    style: Util.textStyle(context, 1,
                        color: Colors.white, spacing: 0.5, size: 30),
                  ),
                ),
                SizedBox(height: Util.height(15)),
                InkWell(
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: list[index].tronAddress));
                    Util.showToast('${S.of(context).commonCopySuccess}');
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '$tronAddress',
                            style: Util.textStyle4En(context, 1,
                                color: Colors.white, spacing: 0.0, size: 26),
                          ),
                        ),
                        SizedBox(width: Util.width(50)),
                        Container(
                          child: Image.asset(
                            'icons/copy.png',
                            width: Util.width(28),
                            height: Util.width(28),
                            color: Colors.white,
                            fit: BoxFit.fill,
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
                      size: Util.sp(40),
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
