import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
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
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), top: ScreenUtil().setHeight(20), right: ScreenUtil().setWidth(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context)..pop();
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_back,
                      size: ScreenUtil().setSp(45),
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '扫一扫',
                    style: Util.textStyle(context, 2, Colors.white, spacing: 0.2, size: 32),
                  ),
                ),
                Container(
                  child: Text(
                    '相册',
                    style: Util.textStyle(context, 2, Colors.white, spacing: 0.2, size: 32),
                  ),
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
