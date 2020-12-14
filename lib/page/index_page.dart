import 'package:flash_tron_wallet/page/trade_page.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

import 'asset_page.dart';
import 'mine_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.donut_small),
      title: Text('资产'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      title: Text('交易'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text('我的'),
    ),
  ];

  final List<Widget> tabBodies = [
    AssetPage(),
    TradePage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: false);
    IndexProvider provider = Provider.of<IndexProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        backgroundColor: Colors.white,
        items: bottomTabs,
        selectedFontSize: 12.5,
        unselectedFontSize: 12.5,
        onTap: (int index) {
          provider.changeCurrentIndex(index);
        },
      ),
      body: IndexedStack(
        index: provider.currentIndex,
        children: tabBodies,
      ),
    );
  }
}
