import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';

class QrScanPage extends StatefulWidget {
  final String type = Get.parameters['type'];

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
    /*double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          width: width,
          child: Obx(() => _qrCodeWidget(context)),
        ),
        preferredSize: Size(width, height),
      ),
    );*/
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Scaffold(
          appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.transparent,
              brightness: Brightness.dark,
              elevation: 0,
            ),
            preferredSize: Size.fromHeight(0),
          ),
          body: Obx(() => _qrCodeWidget(context)),
        ));
  }

  Widget _qrCodeWidget(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: ScanView(
              controller: controller,
              scanAreaScale: 0.7,
              scanLineColor: MyColorUtil.theme,
              onCapture: (data) {
                if (widget.type == '1') {
                  Navigator.of(context)..pop();
                } else {
                  Navigator.of(context)..pop()..pop();
                }
                Get.toNamed(AppRoute.assetSendToken + '/$data');
              },
            ),
          ),
          Container(
            margin: MyCommonUtil.edge(left: 30, right: 30, top: 65),
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
                      size: MyScreenUtil.sp(45),
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: _langType
                          ? MyScreenUtil.width(20)
                          : MyScreenUtil.width(130)),
                  child: Text(
                    '${MyLocaleKey.commonScan.tr}',
                    style: MyTextUtil.textStyle(2,
                        color: Colors.white, spacing: 0.2, size: 32),
                  ),
                ),
                Container(
                  child: Text(
                    '${MyLocaleKey.commonPhotoAlbum.tr}',
                    style: MyTextUtil.textStyle(2,
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
