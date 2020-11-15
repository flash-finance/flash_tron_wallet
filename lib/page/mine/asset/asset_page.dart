import 'dart:async';

import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'asset_data_page.dart';

class AssetPage extends StatefulWidget {
  @override
  _AssetPageState createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _reloadAsset();
  }

  @override
  void dispose() {
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
    String tronAddress = Provider.of<HomeProvider>(context).tronAddress;
    if (tronAddress != null) {
      return Container(
        child: Column(
          children: <Widget>[
            AssetSubPage(),
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 20),
        alignment: Alignment.topCenter,
        child: Text(
          '导入或者创建钱包，方便管理资产',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: ScreenUtil().setSp(26),
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
  }

  Future _reloadAsset() async {
    _timer = Timer.periodic(Duration(milliseconds: 3000), (timer) async{
      bool backgroundFlag = Provider.of<HomeProvider>(context, listen: false).backgroundFlag;
      if (!backgroundFlag) {
        await Provider.of<HomeProvider>(context, listen: false).getWalletEntity();
        await  Provider.of<HomeProvider>(context, listen: false).getAsset4Reload();
      }
    });
  }

}

class AssetSubPage extends StatefulWidget {

  @override
  _AssetSubPageState createState() => _AssetSubPageState();
}


class _AssetSubPageState extends State<AssetSubPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AssetDataPage(),
    );
  }
}

