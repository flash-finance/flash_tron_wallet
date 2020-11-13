

import 'package:flash_tron_wallet/page/defi_page.dart';
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
      //icon: Icon(Icons.sync),
      icon: Icon(Icons.donut_small),
      label: '资产',
    ),
    BottomNavigationBarItem(
      //icon: Icon(Icons.photo_filter),
      icon: Icon(Icons.explore),
      label: 'DeFi',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: '我的',
    ),
  ];

  final List<Widget> tabBodies = [
    AssetPage(),
    DeFiPage(),
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
        items: bottomTabs,
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
