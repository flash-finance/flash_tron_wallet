
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BackupKeyPage extends StatefulWidget {
  @override
  _BackupKeyPageState createState() => _BackupKeyPageState();
}

class _BackupKeyPageState extends State<BackupKeyPage> {
  @override
  Widget build(BuildContext context) {
    String privateKey = Provider.of<HomeProvider>(context).privateKey;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '备份私钥',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(35),
          ),
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: <Widget>[
            _descWidget(),
            SizedBox(height: ScreenUtil().setHeight(20)),
            _dataWidget(context, privateKey),
            SizedBox(height: ScreenUtil().setHeight(150)),
            _submitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _descWidget() {
    return Container(
      width: ScreenUtil().setWidth(700),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.blue[900],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 15, 10, 15),
            alignment: Alignment.center,
            child: Text(
              '请将私钥备份到安全的地方, 私钥一旦丢失，无法找回',
              style: TextStyle(fontSize: ScreenUtil().setSp(22), color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _dataWidget(BuildContext context, String key) {
    return Container(
      width: ScreenUtil().setWidth(700),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.6, color: Colors.black12)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(600),
            padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
            child: Text('$key', style: TextStyle(color: Colors.black87, fontSize: ScreenUtil().setSp(28)),
              maxLines: 3, overflow: TextOverflow.ellipsis,),
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: key));
              Util.showToast('复制成功');
            },
            child: Container(
              width: ScreenUtil().setWidth(80),
              alignment: Alignment.centerRight,
              child: Icon(Icons.content_copy, size: ScreenUtil().setSp(42), color: Colors.black87,),
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
              child: Text('完成', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(31))),
            ),
            color: Colors.blue[900],
            onPressed: () {
              Navigator.pop(context);
            },
            shape: StadiumBorder(side: BorderSide(color: Colors.blue[900])),
          ),
        ),
      ),
    );
  }
}
