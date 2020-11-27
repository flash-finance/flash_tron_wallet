import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
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
    WalletEntity wallet = Provider.of<HomeProvider>(context, listen: false).selectWalletEntity;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '收款二维码',
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
      body: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
        child: ListView(
          children: <Widget>[
            SizedBox(height: ScreenUtil().setHeight(30)),
            _qrCodeWidget(context, wallet.tronAddress.trim()),
            SizedBox(height: ScreenUtil().setHeight(20)),
            _nameWidget(context, wallet.name),
            SizedBox(height: ScreenUtil().setHeight(10)),
            _addressWidget(context, wallet.tronAddress),
            SizedBox(height: ScreenUtil().setHeight(80)),
            _copyButtonWidget(context, wallet.tronAddress),
          ],
        ),
      ),
    );
  }


  Widget _qrCodeWidget(BuildContext context, String address) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(50), right: ScreenUtil().setWidth(50)),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Container(
          padding: EdgeInsets.only(top: ScreenUtil().setWidth(75), bottom: ScreenUtil().setWidth(75)),
          alignment: Alignment.center,
          child: QrImage(
            data: address,
            size: ScreenUtil().setWidth(400),
          ),
        ),
      ),
    );
  }

  Widget _nameWidget(BuildContext context, String name) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              '$name',
              style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.2, size: 30),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _addressWidget(BuildContext context, String address) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              '$address',
              style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 27),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _copyButtonWidget(BuildContext context, String address) {
    return Container(
      child: Align(
        child: SizedBox(
          width: ScreenUtil().setWidth(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                  '复制地址',
                  style: Util.textStyle(context, 1, Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color:  MyColors.themeColor,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: address));
              Util.showToast('复制成功');
            },
            shape: StadiumBorder(side: BorderSide(color:  MyColors.themeColor)),
          ),
        ),
      ),
    );
  }

}
