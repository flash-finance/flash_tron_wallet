import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
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
  bool _langType = true;

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
    _langType = Provider.of<IndexProvider>(context, listen: false).langType;
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          width: double.infinity,
          child: _qrCodeWidget(context),
        ),
        preferredSize: Size(double.infinity, Util.height(1334)),
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
              scanLineColor: Util.themeColor,
              onCapture: (data) {
                if (widget.type == '1') {
                  Navigator.of(context)..pop();
                } else {
                  Navigator.of(context)..pop()..pop();
                }
                Application.router.navigateTo(context, 'asset/sendToken/$data',
                    transition: TransitionType.cupertino);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: Util.width(30),
                top: Util.height(65),
                right: Util.width(30)),
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
                      size: Util.sp(45),
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: _langType ? Util.width(20) : Util.width(130)),
                  child: Text(
                    '${S.of(context).commonScan}',
                    style: Util.textStyle(context, 2,
                        color: Colors.white, spacing: 0.2, size: 32),
                  ),
                ),
                Container(
                  child: Text(
                    '${S.of(context).commonPhotoAlbum}',
                    style: Util.textStyle(context, 2,
                        color: Colors.white.withOpacity(0),
                        spacing: 0.2,
                        size: 32),
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
