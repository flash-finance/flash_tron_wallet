import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/index/asset/asset_page.dart';
import 'package:flash_tron_wallet/index/mine/mine_page.dart';
import 'package:flash_tron_wallet/index/trade/trade_page.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<Widget> tabBodies = [
    AssetPage(),
    TradePage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1624), allowFontScaling: false);
    return Scaffold(
      body: _bodyWidget(context),
      bottomNavigationBar: Obx(
        () => _bottomNavigationBarWidget(context),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: GlobalService.to.pvController,
      onPageChanged: (index) {
        GlobalService.to.changeCurrentIndex(index);
      },
      children: tabBodies,
    );
  }

  Widget _bottomNavigationBarWidget(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: GlobalService.to.currentIndex,
      backgroundColor: MyColorUtil.bottomAppBar(),
      items: _bottomTabs(context),
      selectedFontSize: MyScreenUtil.sp(22),
      unselectedFontSize: MyScreenUtil.sp(22),
      onTap: (value) {
        GlobalService.to.changeCurrentIndex(value);
      },
    );
  }

  List<BottomNavigationBarItem> _bottomTabs(BuildContext context) {
    List<BottomNavigationBarItem> _bottomTabs = [
      BottomNavigationBarItem(
        icon: Icon(Icons.donut_small),
        title: Text(
          '资产',
          style: MyTextUtil.textStyle4Index(2),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.explore),
        title: Text(
          '交易',
          style: MyTextUtil.textStyle4Index(2),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: Text(
          '我的',
          style: MyTextUtil.textStyle4Index(2),
        ),
      ),
    ];
    return _bottomTabs;
  }
}
