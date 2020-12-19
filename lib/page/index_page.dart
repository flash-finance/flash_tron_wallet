import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
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
  bool _langType = true;
  final List<Widget> tabBodies = [
    AssetPage(),
    TradePage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    IndexProvider provider = Provider.of<IndexProvider>(context, listen: true);
    _langType = provider.langType;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.donut_small),
            title: Text(
              '${S.of(context).bottomTab1}',
              style: Util.textStyle(context, 2),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text(
              '${S.of(context).bottomTab2}',
              style: Util.textStyle(context, 2),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(
              '${S.of(context).bottomTab3}',
              style: Util.textStyle(context, 2),
            ),
          ),
        ],
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
