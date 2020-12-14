import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/page/trade/market_page.dart';
import 'package:flash_tron_wallet/page/trade/swap_page.dart';
import 'package:flutter/material.dart';

import 'common/common_page.dart';


class TradePage extends StatefulWidget {
  @override
  _TradePageState createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> with SingleTickerProviderStateMixin {
  TabController tabController;

  final List<Tab> titleTabs = <Tab>[
    Tab(text: '行情'),
    Tab(text: '兑换'),
  ];


  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: titleTabs.length)
      ..addListener(() {
        switch (tabController.index) {
          case 0:
            print(0);
            break;
          case 1:
            print(1);
            break;
        }
      });
  }
  @override
  Widget build(BuildContext context) {
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
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: Util.height(20), bottom: Util.height(10)),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: TabBar(
                indicatorPadding: EdgeInsets.only(bottom: Util.width(20)),
                controller: tabController,
                indicatorColor: Colors.grey[900],
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: Util.textStyle(context, 2, spacing: 0.2, size: 31),
                labelColor: Colors.grey[900],
                unselectedLabelColor: Colors.grey[500],
                indicatorWeight: 2.0,
                tabs: titleTabs,
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  MarketPage(tabController),
                  SwapPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
