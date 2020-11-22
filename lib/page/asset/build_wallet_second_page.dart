
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
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
    WalletEntity wallet = Provider.of<HomeProvider>(context, listen: false).selectWalletEntity;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '创建钱包',
          style: Util.textStyle(context, 2, Colors.grey[900], spacing: 0.2, size: 32),
        ),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.of(context)..pop();
          },
          child: Icon(
            Icons.arrow_back,
            size: ScreenUtil().setSp(45),
            color: Colors.grey[900],
          ),
        ),
      ),
      body: wallet != null && wallet.mnemonic != null ? Container(
        width: ScreenUtil().setWidth(750),
        child: ListView(
          children: <Widget>[
            _descWidget(),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Container(
             margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
             child: Column(
               children: <Widget>[
                 SizedBox(height: ScreenUtil().setHeight(10)),
                 _tipsWidget(wallet.mnemonic),
                 SizedBox(height: ScreenUtil().setHeight(10)),
                 _dataWidget(wallet.mnemonic),
                 SizedBox(height: ScreenUtil().setHeight(60)),
                 _submitButton(context),
               ],
             ),
           ),
          ],
        ),
      ) : Container(),
    );
  }


  Widget _descWidget() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[800],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 10, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '1. 助记词即私钥，用于恢复钱包，请备份到安全的地方',
              style: Util.textStyle(context, 1, Colors.white, spacing: 0.1, size: 22.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 10, 15),
            alignment: Alignment.centerLeft,
            child: Text(
              '2. 请勿截图，如有人获取助记词，可直接获取您的资产',
              style: Util.textStyle(context, 1, Colors.white, spacing: 0.1, size: 22.5),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              '请备份您的助记词',
              style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.4, size: 30),
            ),
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: mnemonic));
              Util.showToast('复制成功');
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Icon(Icons.content_copy, size: ScreenUtil().setSp(38), color: Colors.grey[800],),
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
          width: ScreenUtil().setWidth(350),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                  '已安全保存',
                style: Util.textStyle(context, 1, Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color: Colors.blue[800],
            onPressed: () {
              Navigator.of(context)..pop()..pop();
            },
            shape: StadiumBorder(side: BorderSide(color: Colors.blue[800])),
          ),
        ),
      ),
    );
  }

}

