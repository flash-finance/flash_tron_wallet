import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveTokenPage extends StatefulWidget {
  @override
  _ReceiveTokenPageState createState() => _ReceiveTokenPageState();
}

class _ReceiveTokenPageState extends State<ReceiveTokenPage> {
  @override
  Widget build(BuildContext context) {
    String address = Provider.of<HomeProvider>(context).tronAddress;
    return Scaffold(
      backgroundColor: MyColors.lightBg,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        brightness: Brightness.light,
        title: Text(
          '收款',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: ScreenUtil().setSp(32),
            letterSpacing: 1.0,
            fontWeight: FontWeight.w600,
          ),
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
            color: Colors.grey[800],
          ),
        ),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: <Widget>[
            _descWidget(),
            _qrCodeWidget(context, address.trim()),
            _addressWidget(address),
            SizedBox(height: ScreenUtil().setHeight(50)),
            _copyButton(address.trim()),
          ],
        ),
      ),
    );
  }


  Widget _descWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
            alignment: Alignment.center,
            child: Text(
              '收款二维码',
              style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _qrCodeWidget(BuildContext context, String address) {
    return Container(
      width: ScreenUtil().setWidth(750),
      alignment: Alignment.center,
      child: QrImage(
        data: address,
        size: ScreenUtil().setWidth(400),
      ),
    );
  }

  Widget _addressWidget(String address) {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
            alignment: Alignment.center,
            child: Text(
              '$address',
              style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.black87),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _copyButton(String address) {
    return Container(
      child: Align(
        child: SizedBox(
          width: ScreenUtil().setWidth(400),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text('复制地址', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(31))),
            ),
            color: Colors.blue[800],
            onPressed: () {
              Clipboard.setData(ClipboardData(text: address));
              Util.showToast('复制成功');
            },
            shape: StadiumBorder(side: BorderSide(color: Colors.blue[800])),
          ),
        ),
      ),
    );
  }

}
