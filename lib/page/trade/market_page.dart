import 'dart:async';

import 'package:flash_tron_wallet/common/config/common_config.dart';
import 'package:flash_tron_wallet/common/util/http_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/model/swap_model.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

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
    return MyScaffold(
      hasAppBar: false,
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: MyScreenUtil.height(15)),
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
                return _itemWidget(context, _swapRows[index], index);
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
      margin: EdgeInsets.only(
          left: MyScreenUtil.width(30), right: MyScreenUtil.width(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MyScreenUtil.width(200),
            child: Text(
              '${MyLocaleKey.swapName.tr}',
              style: MyTextUtil.textStyle(2,
                  color: Colors.grey[600], spacing: 0.2, size: 24),
            ),
          ),
          Container(
            width: MyScreenUtil.width(250),
            alignment: Alignment.centerLeft,
            child: Text(
              '${MyLocaleKey.swapMarketPrice.tr}（\$）',
              style: MyTextUtil.textStyle(2,
                  color: Colors.grey[600], spacing: 0.2, size: 24),
            ),
          ),
          Container(
            width: MyScreenUtil.width(140),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: MyScreenUtil.width(3)),
            child: Text(
              '${MyLocaleKey.swapChange.tr}',
              style: MyTextUtil.textStyle(2,
                  color: Colors.grey[600], spacing: 0.2, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemWidget(BuildContext context, SwapRow item, int index) {
    double change = item.swapTokenChange2 * 100;
    return InkWell(
      onTap: () {
        int _swapLeftIndex = index == 0 ? 0 : index;
        int _swapRightIndex = index == 0 ? 1 : 0;
        GlobalService.to.changeSwapLeftIndex(_swapLeftIndex);
        GlobalService.to.changeSwapRightIndex(_swapRightIndex);
        widget.tabController.index = 1;
      },
      child: Container(
        padding: EdgeInsets.only(
          left: MyScreenUtil.width(30),
          right: MyScreenUtil.width(30),
          top: MyScreenUtil.height(20),
          bottom: MyScreenUtil.height(20),
        ),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[350], width: 0.25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MyScreenUtil.width(200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                          child: Image.network(
                            '${item.swapPicUrl}',
                            width: MyScreenUtil.width(35),
                            height: MyScreenUtil.width(35),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: MyScreenUtil.width(10)),
                        Container(
                            child: Text(
                          '${item.swapTokenName}',
                          style: MyTextUtil.textStyle4En(2,
                              color: Colors.grey[850], spacing: 0.0, size: 28),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: MyScreenUtil.height(8)),
                  Container(
                    padding: EdgeInsets.only(left: MyScreenUtil.width(2)),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'TL: ',
                            style: MyTextUtil.textStyle4En(
                              2,
                              color: Colors.grey[600],
                              spacing: 0.1,
                              size: 18,
                            ),
                          ),
                          TextSpan(
                            text: '\$${item.totalLiquidity.toStringAsFixed(0)}',
                            style: MyTextUtil.textStyle4En(
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
              width: MyScreenUtil.width(250),
              alignment: Alignment.centerLeft,
              child: Text(
                '${item.swapTokenPrice2}',
                style: MyTextUtil.textStyle4Num(
                    color: Colors.grey[800],
                    spacing: 0.0,
                    size: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: MyScreenUtil.width(140),
              padding: EdgeInsets.only(
                  top: MyScreenUtil.height(14),
                  bottom: MyScreenUtil.height(14),
                  left: MyScreenUtil.width(13),
                  right: MyScreenUtil.width(13)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: change >= 0 ? Color(0xFF05B791) : Color(0xFFF6465D),
              ),
              child: Text(
                change >= 0
                    ? '+${change.toStringAsFixed(2)}%'
                    : '${change.toStringAsFixed(2)}%',
                style: MyTextUtil.textStyle4Num(
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
      bool backgroundFlag = GlobalService.to.backgroundFlag;
      if (!backgroundFlag && _reloadSwapDataFlag) {
        _getSwapData();
      }
    });
  }

  void _getSwapData() async {
    _reloadSwapDataFlag = false;
    try {
      String url = CommonConfig.servicePath[CommonConfig.swapQueryUrl];
      await HttpUtil.get(url).then((value) {
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
