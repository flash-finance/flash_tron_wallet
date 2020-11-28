import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scan/scan.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  ScanController controller = ScanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.dark,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(0)),
      ),
      body: _qrCodeWidget(context),
    );
  }

  Widget _qrCodeWidget(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: ScanView(
              controller: controller,
              scanAreaScale: 0.7,
              //scanLineColor: Colors.green.shade400,
              scanLineColor: MyColors.themeColor,
              onCapture: (data) {
                Provider.of<IndexProvider>(context, listen: false).changeQrCode(data);
                Navigator.pop(context);
                Application.router.navigateTo(context, 'asset/sendToken', transition: TransitionType.cupertino);
              },
            ),
          ),
          Container(
            child: Text('bbb'),
          ),
        ],
      ),
    );
  }
}
