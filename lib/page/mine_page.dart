import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'mine/asset/asset_page.dart';
import 'mine/biz_top_page.dart';
import 'mine/manage/manage_page.dart';


class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    //print('MinePage 000');
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          color: Colors.blue[800],
        ),
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(0)),
      ),
      body: Column(
        children: <Widget>[
          BizTopPage(),
          Expanded(
            child: MineSubPage(),
          ),
        ],
      ),
    );
  }
}


class MineSubPage extends StatefulWidget {
  @override
  _MineSubPageState createState() => _MineSubPageState();
}

class _MineSubPageState extends State<MineSubPage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('MinePage 000');
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 0.3, color: Colors.black12)),
              ),
              child: TabBar(
                indicatorColor: Colors.blue[800],
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.grey[800],
                unselectedLabelColor: Colors.grey[500],
                indicatorWeight: 2.5,
                tabs: <Widget>[
                  _nameWidget('资产'),
                  _nameWidget('管理'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: <Widget>[
                  AssetPage(),
                  ManagePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _nameWidget(String name) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      color: Colors.white,
      child: Text(
        '$name',
        style: TextStyle(
          letterSpacing: 0.5,
          fontSize: ScreenUtil().setSp(29),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

}
