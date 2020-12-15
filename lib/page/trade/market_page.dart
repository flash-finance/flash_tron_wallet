import 'package:flash_tron_wallet/common/common_config.dart';
import 'package:flash_tron_wallet/common/common_service.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/model/swap_model.dart';
import 'package:flash_tron_wallet/page/common/common_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketPage extends StatefulWidget {
  final TabController tabController;

  MarketPage(this.tabController);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {

  @override
  void initState() {
    super.initState();
    _getSwapData();
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
      child: ListView(
        children: <Widget>[
          _titleWidget(context),
          _assetDataWidget(context),
        ],
      ),
    );
  }

  Widget _assetDataWidget(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: _swapRows.length,
          itemBuilder: (context, index) {
            return _itemWidget(context, _swapRows[index]);
          }),
    );
  }

  Widget _titleWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              '名称',
              style: Util.textStyle(context, 2, color: Colors.grey[600], spacing: 0.2 , size: 22),
            ),
          ),
          Container(
            child: Text(
              '价格',
              style: Util.textStyle(context, 2, color: Colors.grey[600], spacing: 0.2, size: 22),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '涨跌幅',
              style: Util.textStyle(context, 2, color: Colors.grey[600], spacing: 0.2, size: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemWidget(BuildContext context, SwapRow item) {
    double total = 0;
    bool flag = item.swapTokenName.trim() == 'TRX';
    if (flag) {
        for(int i = 0; i < _swapRows.length; i++) {
          total += _swapRows[i].totalLiquidity;
        }
    }
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: Util.width(30), right: Util.width(30), top: Util.height(20), bottom: Util.height(20)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Image.network(
                            '${item.swapPicUrl}',
                            width: Util.width(35),
                            height: Util.width(35),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: Util.width(10)),
                        Container(
                            child: Text(
                              '${item.swapTokenName}',
                              style: Util.textStyle4En(context, 2, color: Colors.grey[850], spacing: 0.0, size: 26),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: Util.height(8)),
                  Container(
                    child: Text(
                      flag ? '\$ ${total.toStringAsFixed(0)}' : '\$ ${item.totalLiquidity.toStringAsFixed(0)}',
                      style: Util.textStyle4Num(context, color: Colors.grey[600], spacing: 0.0, size: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Text(
                '\$ ${item.swapTokenPrice2}',
                style: Util.textStyle4Num(context, color: Colors.grey[850], spacing: 0.0, size: 28, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              child: Text(
                '18.65%',
                style: Util.textStyle4Num(context, color: Colors.grey[850], spacing: 0.0, size: 28, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }


  SwapData _swapData;

  List<SwapRow> _swapRows = [];

  void _getSwapData() async {
    try {
      String url = servicePath['swapQuery'];
      await requestGet(url).then((value) {
        var respData = Map<String, dynamic>.from(value);
        SwapRespModel respModel = SwapRespModel.fromJson(respData);
        if (respModel != null && respModel.code == 0) {
          _swapData = respModel.data;
          if (_swapData != null && _swapData.rows != null && _swapData.rows.length > 0) {
            _swapRows = _swapData.rows;
          }
        }
      });
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

}