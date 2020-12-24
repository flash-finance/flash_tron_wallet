import 'dart:async';

import 'package:flash_tron_wallet/common/common_config.dart';
import 'package:flash_tron_wallet/common/common_service.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/model/swap_model.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';

class MarketPage extends StatefulWidget {
  final TabController tabController;

  MarketPage(this.tabController);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage>
    with AutomaticKeepAliveClientMixin {
  bool _langType = true;
  Timer _timer1;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _reloadSwapData();
  }

  @override
  void dispose() {
    if (_timer1 != null) {
      if (_timer1.isActive) {
        _timer1.cancel();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
      child: Column(
        children: <Widget>[
          SizedBox(height: Util.height(15)),
          _titleWidget(context),
          Expanded(
            child: _assetDataWidget(context),
          ),
        ],
      ),
    );
  }

  Widget _assetDataWidget(BuildContext context) {
    return _swapRows.length > 0
        ? EasyRefresh(
            header: MaterialHeader(enableHapticFeedback: true),
            footer: MaterialFooter(
                enableHapticFeedback: true, enableInfiniteLoad: false),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _swapRows.length,
              itemBuilder: (context, index) {
                return _itemWidget(context, _swapRows[index]);
              },
            ),
            onRefresh: () async {
              _getSwapData();
            },
          )
        : Container(
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
  }

  Widget _titleWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: Util.width(200),
            child: Text(
              '${S.of(context).swapName}',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[600], spacing: 0.2, size: 24),
            ),
          ),
          Container(
            width: Util.width(250),
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).swapMarketPrice}（\$）',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[600], spacing: 0.2, size: 24),
            ),
          ),
          Container(
            width: Util.width(140),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: Util.width(3)),
            child: Text(
              '${S.of(context).swapChange}',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[600], spacing: 0.2, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemWidget(BuildContext context, SwapRow item) {
    double change = item.swapTokenChange2 * 100;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(
            left: Util.width(30),
            right: Util.width(30),
            top: Util.height(20),
            bottom: Util.height(20)),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[350], width: 0.25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: Util.width(200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                          child: Image.network(
                            '${item.swapPicUrl}',
                            width: Util.width(35),
                            height: Util.width(35),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: Util.width(10)),
                        Container(
                            child: Text(
                          '${item.swapTokenName}',
                          style: Util.textStyle4En(context, 2,
                              color: Colors.grey[850], spacing: 0.0, size: 28),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: Util.height(8)),
                  Container(
                    padding: EdgeInsets.only(left: Util.width(2)),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'TL: ',
                            style: Util.textStyle4En(
                              context,
                              2,
                              color: Colors.grey[600],
                              spacing: 0.1,
                              size: 18,
                            ),
                          ),
                          TextSpan(
                            text: '\$${item.totalLiquidity.toStringAsFixed(0)}',
                            style: Util.textStyle4En(
                              context,
                              2,
                              color: Colors.grey[600],
                              spacing: 0.1,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Util.width(250),
              alignment: Alignment.centerLeft,
              child: Text(
                '${item.swapTokenPrice2}',
                style: Util.textStyle4Num(context,
                    color: Colors.grey[800],
                    spacing: 0.0,
                    size: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: Util.width(140),
              padding: EdgeInsets.only(
                  top: Util.height(14),
                  bottom: Util.height(14),
                  left: Util.width(13),
                  right: Util.width(13)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: change >= 0 ? Color(0xFF05B791) : Color(0xFFF6465D),
              ),
              child: Text(
                change >= 0
                    ? '+${change.toStringAsFixed(2)}%'
                    : '${change.toStringAsFixed(2)}%',
                style: Util.textStyle4Num(context,
                    color: Colors.white,
                    spacing: 0.0,
                    size: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SwapData _swapData;

  List<SwapRow> _swapRows = [];

  bool _reloadSwapDataFlag = false;

  _reloadSwapData() async {
    _getSwapData();
    _timer1 = Timer.periodic(Duration(milliseconds: 2000), (timer) async {
      bool backgroundFlag =
          Provider.of<HomeProvider>(context, listen: false).backgroundFlag;
      if (!backgroundFlag && _reloadSwapDataFlag) {
        _getSwapData();
      }
    });
  }

  void _getSwapData() async {
    _reloadSwapDataFlag = false;
    try {
      String url = servicePath['swapQuery'];
      await requestGet(url).then((value) {
        var respData = Map<String, dynamic>.from(value);
        SwapRespModel respModel = SwapRespModel.fromJson(respData);
        if (respModel != null && respModel.code == 0) {
          _swapData = respModel.data;
          if (_swapData != null &&
              _swapData.rows != null &&
              _swapData.rows.length > 0) {
            _swapRows = _swapData.rows;
          }
        }
      });
      setState(() {});
    } catch (e) {
      print(e);
    } finally {
      _reloadSwapDataFlag = true;
    }
  }
}
