
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BuildWalletSecondPage extends StatefulWidget {
  @override
  _BackupMnemonicSecondPageState createState() => _BackupMnemonicSecondPageState();
}

class _BackupMnemonicSecondPageState extends State<BuildWalletSecondPage> {
  @override
  Widget build(BuildContext context) {
    String mnemonic = Provider.of<HomeProvider>(context).mnemonic;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(135)),
        child: _topWidget(context),
      ),
      body: mnemonic != null ? Container(
        width: ScreenUtil().setWidth(750),
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            _descWidget(),
            SizedBox(height: ScreenUtil().setHeight(10)),
            _tipsWidget(mnemonic),
            SizedBox(height: ScreenUtil().setHeight(10)),
            _dataWidget(mnemonic),
            SizedBox(height: ScreenUtil().setHeight(50)),
            _submitButton(context),
          ],
        ),
      ) : Container(),
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
              Navigator.of(context)..pop()..pop();
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
            padding: EdgeInsets.fromLTRB(40, 15, 10, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '1. 助记词即私钥，用于恢复钱包，请备份到安全的地方',
              style: TextStyle(fontSize: ScreenUtil().setSp(22), color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 5, 10, 15),
            alignment: Alignment.centerLeft,
            child: Text(
              '2. 请勿截图，如有人获取助记词，可直接获取您的资产',
              style: TextStyle(fontSize: ScreenUtil().setSp(22), color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _tipsWidget(String mnemonic) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(110, 0, 0, 0),
            child: Text(
              '请备份您的助记词',
              style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(30)),
            ),
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: mnemonic));
              Util.showToast('复制成功');
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Icon(Icons.content_copy, size: ScreenUtil().setSp(40), color: Colors.black87,),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataWidget(String mnemonic) {
    List<String> _list = mnemonic.trim().split(' ');
    List<Widget> _listWidget = [];
    if (_list.length > 0) {
      for (int i = 0; i < _list.length; i++) {
        _listWidget.add(_itemWidget(i+1, _list[i]));
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

  Widget _itemWidget(int index, String value) {
    return Container(
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
              '$index',
              style: TextStyle(color: Colors.grey[500], fontSize: ScreenUtil().setSp(20)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 13),
            child: Text(
              '$value',
              style: TextStyle(color: Colors.grey[900], fontSize: ScreenUtil().setSp(27)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
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
              child: Text('已安全保存', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(31))),
            ),
            color: Colors.blue[900],
            onPressed: () {
              // 受重复刷新的影响 BuildWalletThirdPage页面有问题(闪退)
              //Provider.of<HomeProvider>(context, listen: false).changeFirstRandom('');
              //Provider.of<HomeProvider>(context, listen: false).changeSecondRandom('');
              //Provider.of<HomeProvider>(context, listen: false).changeThirdRandom('');
              //Application.router.navigateTo(context, 'mine/buildThirdWallet', transition: TransitionType.cupertino);
              Navigator.of(context)..pop()..pop();
            },
            shape: StadiumBorder(side: BorderSide(color: Colors.blue[900])),
          ),
        ),
      ),
    );
  }

}

