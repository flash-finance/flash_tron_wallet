import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/index/trade/market/market_page.dart';
import 'package:flash_tron_wallet/index/trade/swap/swap_page.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradePage extends StatefulWidget {
  @override
  _TradePageState createState() => _TradePageState();
}

class _TradePageState extends State<TradePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2)
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasAppBar: false,
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
              padding:
                  MyCommonUtil.edge(left: 150, right: 150, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: MyColorUtil.white,
              ),
              child: TabBar(
                controller: _tabController,
                isScrollable: false,
                indicatorPadding:
                    EdgeInsets.only(bottom: MyScreenUtil.width(15)),
                indicatorColor: Colors.grey[850],
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: MyTextUtil.textStyle(2, spacing: 0.2, size: 32),
                labelColor: Colors.grey[850],
                unselectedLabelColor: Colors.grey[600],
                indicatorWeight: 2.0,
                tabs: <Tab>[
                  Tab(text: '${MyLocaleKey.swapMarket.tr}'),
                  Tab(text: '${MyLocaleKey.swapSwap.tr}'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  MarketPage(_tabController),
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
