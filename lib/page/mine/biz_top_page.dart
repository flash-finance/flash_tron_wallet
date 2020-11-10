import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/model/dex_info_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BizTopPage extends StatefulWidget {
  @override
  _BizTopPageState createState() => _BizTopPageState();
}

class _BizTopPageState extends State<BizTopPage> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    String name = homeProvider.name;
    String tronAddress = homeProvider.tronAddress;
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        color: Colors.blue[900],
      ),
      //child: ,
      child: name != null ? _logInWidget(context, name, tronAddress) : _logOutWidget(context),
    );

  }

  Widget _logInWidget(BuildContext context, String name, String tronAddress) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          _walletAddressWidget(context, name, tronAddress),
          _assetWidget(context),
          _operateWidget(context),
        ],
      ),
    );
  }

  Widget _logOutWidget(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(top: 20, bottom: 40),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'mine/importWallet', transition: TransitionType.cupertino);
            },
            child: Container(
              width: ScreenUtil().setWidth(310),
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(width: 0.4, color: Colors.white),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  '导入钱包',
                  style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(31),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'mine/buildFirstWallet', transition: TransitionType.cupertino);
            },
            child: Container(
              width: ScreenUtil().setWidth(310),
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(width: 0.4, color: Colors.white),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child:  Text(
                  '新建钱包',
                  style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(31),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _walletAddressWidget(BuildContext context, String name, String tronAddress) {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
            alignment: Alignment.centerLeft,
            child: Text(
              '$name',
              style: TextStyle(
                  color: Colors.grey, fontSize: ScreenUtil().setSp(32)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(650),
                padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  '$tronAddress',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: tronAddress));
                  Util.showToast('复制成功');
                },
                child: Container(
                  width: ScreenUtil().setWidth(100),
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 5),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.content_copy, size: ScreenUtil().setSp(38), color: Colors.white,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _assetWidget(BuildContext context) {
    List<AssetEntity> assetList = Provider.of<HomeProvider>(context).assetList;

    DexInfo dexInfo = Provider.of<HomeProvider>(context).dexInfo;
    double trxPrice4Cny = dexInfo.trxPriceUsdt * dexInfo.usdtPriceCny;
    double totalAssetCny = 0.0;
    double totalAssetTrx = 0.0;

    if (assetList != null && assetList.length > 0) {
      for (AssetEntity item in assetList) {
        totalAssetCny += double.parse(Util.formatNumberSub(item.cny, 2));
      }
      totalAssetTrx = totalAssetCny / trxPrice4Cny;
    }
    String assetHide = Provider.of<HomeProvider>(context).assetHide;

    return Container(
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(650),
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '总资产折合(TRX)',
                    style: TextStyle(
                        color: Colors.grey, fontSize: ScreenUtil().setSp(28)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (assetHide == '0') {
                      Provider.of<HomeProvider>(context, listen: false).updateAssetHide('1');
                    } else {
                      Provider.of<HomeProvider>(context, listen: false).updateAssetHide('0');
                    }
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(100),
                    padding: EdgeInsets.fromLTRB(0, 16, 30, 5),
                    alignment: Alignment.centerRight,
                    child: Icon( assetHide == '0' ? Icons.remove_red_eye : Icons.visibility_off, size: ScreenUtil().setSp(40), color: Colors.white,),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    assetHide != '1' ? '${Util.formatNumberSub(totalAssetTrx, 3)}' : '*****',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(34),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 2, 0, 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    assetHide != '1' ? '≈ ${Util.formatNumberSub(totalAssetCny, 2)} CNY' : '  *****',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: ScreenUtil().setSp(23),
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

  Widget _operateWidget(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.fromLTRB(15, 20, 0, 5),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'mine/sendWallet', transition: TransitionType.cupertino);
            },
            child: Container(
              width: ScreenUtil().setWidth(135),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 6, bottom: 6),
                child: Text(
                  '转账',
                  style: TextStyle(
                    color: Colors.grey[900], fontSize: ScreenUtil().setSp(28),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(150),
          ),
          InkWell(
            onTap: () {
              Application.router.navigateTo(context, 'mine/receiveWallet', transition: TransitionType.cupertino);
            },
            child: Container(
              width: ScreenUtil().setWidth(135),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  child: Text(
                  '收款',
                  style: TextStyle(
                      color: Colors.grey[900], fontSize: ScreenUtil().setSp(28),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
