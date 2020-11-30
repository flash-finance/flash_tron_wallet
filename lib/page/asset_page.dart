import 'dart:async';
import 'dart:io';
import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/model/dex_info_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/tron/service/tron_asset.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scan/scan.dart';

class AssetPage extends StatefulWidget {
  @override
  _AssetPageState createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage>  with WidgetsBindingObserver {
  Timer _timer;
  ScanController controller = ScanController();

  @override
  void initState() {
    super.initState();
    _reloadAsset();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('didChangeAppLifecycleState:${state.toString()}');
    switch(state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        Provider.of<HomeProvider>(context, listen: false).changeBackgroundFlag(false);
        controller.pause();
        break;
      case AppLifecycleState.paused:
        Provider.of<HomeProvider>(context, listen: false).changeBackgroundFlag(true);
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
    WalletEntity wallet = Provider.of<HomeProvider>(context, listen: true).selectWalletEntity;
    if (wallet != null && wallet.tronAddress != null) {
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
        body: _logInWidget(context),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage('images/bg.png'),
                  fit: BoxFit.cover,
                ),
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
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(0)),
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
    );
  }

  Widget _headWidget(BuildContext context) {
    WalletEntity item = Provider.of<HomeProvider>(context, listen: true).selectWalletEntity;
    List<WalletEntity> walletList = Provider.of<HomeProvider>(context, listen: true).walletList;
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              _showBottomSheet(context, walletList);
            },
            child: Container(
              child: Chip(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(8), right: ScreenUtil().setWidth(0)),
                backgroundColor: MyColors.themeColor,
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${item.name}',
                        style: Util.textStyle(context, 1, Colors.white, spacing: 0.2, size: 23),
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(5)),
                    Container(
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(40),
                      width: ScreenUtil().setHeight(40),
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('icons/circle.png'), fit: BoxFit.fill)),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenUtil().setSp(22),
                        color: MyColors.themeColor,
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
                    Application.router.navigateTo(context, 'asset/addWallet', transition: TransitionType.cupertino);
                  },
                  child: Container(
                    child: Icon(
                      IconData(0xe7b8, fontFamily: 'ICON'),
                      size: ScreenUtil().setSp(55),
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(30)),
                InkWell(
                  onTap: ()  {
                    Application.router.navigateTo(context, 'asset/qrScan/1', transition: TransitionType.fadeIn);
                  },
                  child: Container(
                    child: Icon(
                      IconData(0xe606, fontFamily: 'ICON'),
                      size: ScreenUtil().setSp(60),
                      color: Colors.grey[800],
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
      footer: MaterialFooter(enableHapticFeedback: true, enableInfiniteLoad: false),
      child: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              _cardWidget(context),
              SizedBox(height: ScreenUtil().setHeight(30)),
              _assetTitleWidget(context),
              SizedBox(height: ScreenUtil().setHeight(5)),
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
    bool flag = Platform.isAndroid;
    List<AssetEntity> assetList = Provider.of<HomeProvider>(context, listen: true).assetList;
    DexInfo dexInfo = Provider.of<HomeProvider>(context).dexInfo;
    double trxPrice4Cny = dexInfo.trxPriceUsdt * dexInfo.usdtPriceCny;
    double totalAssetCny = 0.0;
    double totalAssetUsd = 0.0;

    int selectIndex = Provider.of<HomeProvider>(context, listen: true).selectWalletIndex;

    if (assetList != null && assetList.length > 0) {
      for (AssetEntity item in assetList) {
        totalAssetCny += double.parse(Util.formatNumberSub(item.cny, 2));
      }
      totalAssetUsd = totalAssetCny / 6.75;
    }
    return Container(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(40)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'asset/walletDetail/$selectIndex', transition: TransitionType.cupertino);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      '我的资产 (\$)',
                      style: Util.textStyle(context, 1, Colors.white, spacing: 0.5, size: 23),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '详情',
                            style: Util.textStyle(context, 1, Colors.white, spacing: 0.5, size: 23),
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
          ),
          SizedBox(height: ScreenUtil().setHeight(10)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'asset/walletDetail/$selectIndex', transition: TransitionType.cupertino);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(20), bottom: ScreenUtil().setHeight(20)),
              child: Text(
                '${Util.formatNumberSub(totalAssetUsd, 2)}',
                style: Util.textStyle(context, 2, Colors.white, spacing: 0.2, size: 42),
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Provider.of<IndexProvider>(context, listen: false).changeQrCode('');
                    Application.router.navigateTo(context, 'asset/sendToken', transition: TransitionType.cupertino);
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: flag ? ScreenUtil().setHeight(1) : ScreenUtil().setHeight(1.5)),
                          child: Icon(
                            Icons.transit_enterexit_sharp,
                            size: ScreenUtil().setSp(34),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        Container(
                          padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(3)),
                          child: Text(
                            '转账',
                            style: Util.textStyle(context, 1, Colors.white, spacing: 0.6, size: 26),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Application.router.navigateTo(context, 'asset/receiveToken', transition: TransitionType.cupertino);
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: flag ? ScreenUtil().setHeight(2) : ScreenUtil().setHeight(2.3)),
                          child: Icon(
                            Icons.download_sharp,
                            size: ScreenUtil().setSp(32),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        Container(
                          padding: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(6)),
                          child: Text(
                            '收款',
                            style: Util.textStyle(context, 1, Colors.white,
                                spacing: 0.6, size: 26),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                    child: Row(
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
                          padding: EdgeInsets.only(bottom: flag ? ScreenUtil().setHeight(6) : ScreenUtil().setHeight(4.5)),
                          child: Text(
                            '交易',
                            style: Util.textStyle(context, 1, Colors.white, spacing: 0.6, size: 26),
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

  Widget _assetTitleWidget(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(10), right: ScreenUtil().setWidth(10)),
        alignment: Alignment.centerLeft,
        child: Text(
          '资产',
          style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.6, size: 30),
        ));
  }

  Widget _assetDataWidget(BuildContext context) {
    List<AssetEntity> assetList = Provider.of<HomeProvider>(context).assetList;
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(10), right: ScreenUtil().setWidth(10)),
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

  Widget _assetDataItemWidget(BuildContext context, List<AssetEntity> assetList, int index) {
    AssetEntity item = assetList[index];
    bool flag = index != assetList.length - 1;
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(20), bottom: ScreenUtil().setHeight(20)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: flag ? Colors.black45 : Colors.white, width: 0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Image.network(
                    '${item.logoUrl}',
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(30)),
                Container(
                    child: Text(
                  '${item.name}',
                  style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.0, size: 31),
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
                    '${Util.formatNumberSub(item.balance, 4)}',
                    style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.1, size: 29),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  child: Text(
                    '≈  \$ ${Util.formatNumberSub(item.cny / 6.75, 2)}',
                    style: Util.textStyle(context, 2, Colors.grey[500], spacing: 0.1, size: 24),
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

  Widget _logOutHeadWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  child: Image.asset(
                    'images/flash-logo.png',
                    width: ScreenUtil().setWidth(120),
                    height: ScreenUtil().setWidth(120),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              Container(
                child: Text(
                  'Flash  Wallet',
                  style: Util.textStyle(context, 1, Colors.white, spacing: 0.2, size: 36),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _logOutBodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(30)),
      child: Column(
        children: <Widget>[
          SizedBox(height: ScreenUtil().setHeight(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'asset/importKey/1', transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[350], width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      Container(
                        child: Text(
                          '导入私钥',
                          style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setSp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'asset/importMnemonic/1', transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[350], width: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      Container(
                        child: Text(
                          '导入助记词',
                          style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setSp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(30)),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'asset/buildFirstWallet/1', transition: TransitionType.cupertino);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: ScreenUtil().setWidth(10)),
                      Container(
                        child: Text(
                          '创建钱包',
                          style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil().setSp(27),
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(10)),
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

  Future _reloadAsset() async {
    _timer = Timer.periodic(Duration(milliseconds: 3000), (timer) async {
      bool backgroundFlag = Provider.of<HomeProvider>(context, listen: false).backgroundFlag;
      if (!backgroundFlag) {
        await Provider.of<HomeProvider>(context, listen: false).getAsset4Reload();
      }
    });
  }

  Future<bool> _getAsset() async {
    WalletEntity wallet = Provider.of<HomeProvider>(context, listen: false).selectWalletEntity;
    if (wallet != null && wallet.tronAddress != null) {
      List<TokenRows> tokenList = Provider.of<HomeProvider>(context, listen: false).tokenList;
      return await TronAsset().getAsset(context, wallet.tronAddress, tokenList);
    }
  }

  _showBottomSheet(BuildContext context, List<WalletEntity> walletList) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        barrierColor: Colors.grey[900].withOpacity(0.98),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
        builder: (BuildContext context) {
          return Container(
            height: ScreenUtil().setHeight(800),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(20),
                      bottom: ScreenUtil().setHeight(20)),
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(25)),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey[400], width: 0.3)),
                  ),
                  child: Text(
                    '钱包列表',
                    style: Util.textStyle(context, 2, Colors.grey[900], spacing: 0.4, size: 32),
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

  Widget _walletItemWidget(BuildContext context, List<WalletEntity> list, int index) {
    int selectIndex = Provider.of<HomeProvider>(context, listen: false).selectWalletIndex;
    String name = list[index].name;
    String tronAddress = list[index].tronAddress.substring(0, 10) + '...' + list[index].tronAddress.substring(list[index].tronAddress.length - 10, list[index].tronAddress.length);
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30), bottom: ScreenUtil().setHeight(20)),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(30), right: ScreenUtil().setWidth(40), bottom: ScreenUtil().setHeight(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //color: Color(0xFFB22222).withOpacity(0.9),
        image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: () {
          Provider.of<HomeProvider>(context, listen: false).changeSelectWallet(index);
          Navigator.pop(context);
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
                    style: Util.textStyle(context, 1, Colors.white, spacing: 0.5, size: 30),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(15)),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: list[index].tronAddress));
                    Util.showToast('复制成功');
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '$tronAddress',
                            style: Util.textStyle(context, 1, Colors.grey[350], spacing: 0.5, size: 24),
                          ),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(50)),
                        Container(
                          child: Image.asset(
                            'icons/copy.png',
                            width: ScreenUtil().setWidth(28),
                            height: ScreenUtil().setWidth(28),
                            color: Colors.grey[350],
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
                      size: ScreenUtil().setSp(40),
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
