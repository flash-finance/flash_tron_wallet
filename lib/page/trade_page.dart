import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/page/trade/market_page.dart';
import 'package:flash_tron_wallet/page/trade/swap_page.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradePage extends StatefulWidget {
  @override
  _TradePageState createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> with SingleTickerProviderStateMixin {
  bool _langType = true;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2)
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
    _langType = Provider.of<IndexProvider>(context, listen: true).langType;
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
              padding: EdgeInsets.only(top: Util.height(10), left: Util.width(150), right: Util.width(150), bottom: Util.height(10)),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: TabBar(
                controller: tabController,
                isScrollable: false,
                indicatorPadding: EdgeInsets.only(bottom: Util.width(15)),
                indicatorColor: Colors.grey[850],
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: Util.textStyle(context, 2, spacing: 0.2, size: 32),
                labelColor: Colors.grey[850],
                unselectedLabelColor: Colors.grey[500],
                indicatorWeight: 2.0,
                tabs: <Tab>[
                  Tab(text: '${S.of(context).swapMarket}'),
                  Tab(text: '${S.of(context).swapSwap}'),
                ],
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
