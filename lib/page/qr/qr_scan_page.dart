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
  final String type;

  QrScanPage(this.type);

  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  ScanController controller = ScanController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          width: double.infinity,
          child: _qrCodeWidget(context),
        ),
        preferredSize: Size(double.infinity, ScreenUtil().setHeight(1334)),
      ),
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
              scanLineColor: MyColors.themeColor,
              onCapture: (data) {
                Provider.of<IndexProvider>(context, listen: false).changeQrCode(data);
                Navigator.pop(context);
                if (widget.type == '1') {
                  Application.router.navigateTo(context, 'asset/sendToken', transition: TransitionType.cupertino);
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), top: ScreenUtil().setHeight(65), right: ScreenUtil().setWidth(30)),
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
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  child: Text(
                    '扫一扫',
                    style: Util.textStyle(context, 2, Colors.white, spacing: 0.2, size: 32),
                  ),
                ),
                Container(
                  child: Text(
                    '相册',
                    style: Util.textStyle(context, 2, Colors.white.withOpacity(0), spacing: 0.2, size: 32),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
