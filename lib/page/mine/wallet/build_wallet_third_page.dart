import 'dart:collection';
import 'dart:math';

import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BuildWalletThirdPage extends StatefulWidget {
  @override
  _BuildWalletThirdPageState createState() => _BuildWalletThirdPageState();
}

class _BuildWalletThirdPageState extends State<BuildWalletThirdPage> {

  String mnemonic;
  List<_RandomData> _randomTotalList = [];
  List<_RandomData> _randomConfirmList = [];

  @override
  void initState() {
    super.initState();
    mnemonic = Provider.of<HomeProvider>(context, listen: false).mnemonic;
    List<String> _list = mnemonic.trim().split(' ');
    _randomTotalList = [];
    for (int i = 0; i < _list.length;  i++) {
      _randomTotalList.add(_RandomData(i+1, _list[i]));
    }
    _randomTotalList.shuffle();
    _randomConfirmList = _getRandomThreeList(_randomTotalList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(135)),
        child: _topWidget(context),
      ),
      body: _SubBuildWalletThirdPage(_randomTotalList, _randomConfirmList),
    );
  }

  Widget _topWidget(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(135),
      decoration: BoxDecoration(
        color: Colors.blue[900],
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: Icon(Icons.arrow_back, color: Colors.white,
                size: ScreenUtil().setSp(47),),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(120, 30, 0, 0),
            alignment: Alignment.center,
            child: Text(
              '创建钱包',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(36),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubBuildWalletThirdPage extends StatefulWidget {
  final List<_RandomData> _randomTotalList;
  final List<_RandomData> _randomConfirmList;

  _SubBuildWalletThirdPage(this._randomTotalList, this._randomConfirmList);

  @override
  _SubBuildWalletThirdPageState createState() => _SubBuildWalletThirdPageState(_randomTotalList, _randomConfirmList);
}

class _SubBuildWalletThirdPageState extends State<_SubBuildWalletThirdPage> {
  final List<_RandomData> _randomTotalList;
  final List<_RandomData> _randomConfirmList;

  _SubBuildWalletThirdPageState(this._randomTotalList, this._randomConfirmList);

  String _firstRandom;
  String _secondRandom;
  String _thirdRandom;

  @override
  Widget build(BuildContext context) {
    print('_SubPage 000');
    _firstRandom = Provider.of<HomeProvider>(context).firstRandom;
    _secondRandom = Provider.of<HomeProvider>(context).secondRandom;
    _thirdRandom = Provider.of<HomeProvider>(context).thirdRandom;
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(15),
      child: ListView(
        children: <Widget>[
          _descWidget(),
          SizedBox(height: ScreenUtil().setHeight(20)),
          _tips1Widget(),
          _dataWidget4Confirm(_randomConfirmList),
          SizedBox(height: ScreenUtil().setHeight(25)),
          _tips2Widget(),
          _dataWidget4Total(_randomTotalList),
          SizedBox(height: ScreenUtil().setHeight(50)),
          _submitButton(context),
          //_submitButton(context),
        ],
      ),
    );
  }

  Widget _descWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.blue[900],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(40, 15, 10, 15),
            alignment: Alignment.centerLeft,
            child: Text(
              '为了确保您已把助记词安全备份，请选择对应序号的单词',
              style: TextStyle(fontSize: ScreenUtil().setSp(22), color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tips1Widget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Container(
        padding: EdgeInsets.fromLTRB(120, 10, 0, 15),
        child: Text(
          '请确认您的助记词',
          style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(30)),
        ),
      ),
    );
  }

  Widget _tips2Widget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Container(
        padding: EdgeInsets.fromLTRB(85, 10, 0, 15),
        child: Text(
          '请按以上序号顺序点击助记词',
          style: TextStyle(color: Colors.grey[500], fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }

  Widget _dataWidget4Confirm( List<_RandomData> list) {
    List<Widget> _listWidget = [];
    if (list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        _listWidget.add(_itemWidget4Confirm(i+1, list[i].index, list[i].value));
      }
      return Container(
        padding: EdgeInsets.only(left: 18),
        child: Wrap(
          spacing: 3,
          children: _listWidget,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _itemWidget4Confirm(int index, int randomIndex, String value) {
    String desc = '';
    if (index == 1) {
      desc = _firstRandom;
    } else if (index == 2) {
      desc = _secondRandom;
    } else if (index == 3) {
      desc = _thirdRandom;
    }
    return InkWell(
      onTap: () {
        if (index == 1) {
          Provider.of<HomeProvider>(context, listen: false).changeFirstRandom('');
        } else if (index == 2) {
          Provider.of<HomeProvider>(context, listen: false).changeSecondRandom('');
        } else if (index == 3) {
          Provider.of<HomeProvider>(context, listen: false).changeThirdRandom('');
        }
      },
      child: Container(
        width: ScreenUtil().setWidth(200),
        margin: EdgeInsets.fromLTRB(0, 3, 3, 3),
        decoration: BoxDecoration(
          color: Color(0x80EEEEEE),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Text(
                '$randomIndex',
                style: TextStyle(color: Colors.grey[600], fontSize: ScreenUtil().setSp(20)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 13),
              child: Text(
                '$desc',
                style: TextStyle(color: Colors.grey[900], fontSize: ScreenUtil().setSp(27)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dataWidget4Total( List<_RandomData> list) {
    List<Widget> _listWidget = [];
    if (list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        _listWidget.add(_itemWidget4Total(i, list[i].value));
      }
      return Container(
        padding: EdgeInsets.only(left: 18),
        child: Wrap(
          spacing: 3,
          children: _listWidget,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _itemWidget4Total(int index, String value) {
    return InkWell(
      onTap: () {
        if (_firstRandom == '') {
          Provider.of<HomeProvider>(context, listen: false).changeFirstRandom(value);
        } else if (_secondRandom == '') {
          Provider.of<HomeProvider>(context, listen: false).changeSecondRandom(value);
        } else if (_thirdRandom == '') {
          Provider.of<HomeProvider>(context, listen: false).changeThirdRandom(value);
        }
      },
      child: Container(
        width: ScreenUtil().setWidth(200),
        margin: EdgeInsets.fromLTRB(0, 0, 3, 3),
        decoration: BoxDecoration(
          color: Color(0x80EEEEEE),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 13, bottom: 13),
          child: Text(
            '$value',
            style: TextStyle(color: Colors.grey[900], fontSize: ScreenUtil().setSp(27)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Container(
      child: Align(
        child: SizedBox(
          width: ScreenUtil().setWidth(400),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text('验证', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(31))),
            ),
            color: Colors.blue[900],
            onPressed: () {
              if(_randomConfirmList[0].value != _firstRandom || _randomConfirmList[1].value != _secondRandom
                  || _randomConfirmList[2].value != _thirdRandom) {
                Util.showToast('验证失败，请重试');
              } else {
                Util.showToast('验证成功');
                Navigator.of(context)..pop()..pop()..pop();
              }
            },
            shape: StadiumBorder(side: BorderSide(color: Colors.blue[900])),
          ),
        ),
      ),
    );
  }
}



class _RandomData {
  int index;
  String value;

  _RandomData(this.index, this.value);
}


List<_RandomData> _getRandomThreeList(List<_RandomData> list) {
  Set<_RandomData> set = HashSet<_RandomData>();
  while(set.length < 3) {
    int randomIndex = Random().nextInt(list.length);
    set.add(list[randomIndex]);
  }
  List<_RandomData> resultList = [];
  for(_RandomData item in set) {
    resultList.add(item);
  }
  return resultList;
}