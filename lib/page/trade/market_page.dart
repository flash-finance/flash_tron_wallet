import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  final TabController tabController;

  MarketPage(this.tabController);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {

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
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () async {
              widget.tabController.index = 1;
            },
            color: Util.themeColor,
            child: Text(
              '行情',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}