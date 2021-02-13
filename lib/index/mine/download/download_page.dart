import 'dart:io';

import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:ota_update/ota_update.dart';
import 'package:path_provider/path_provider.dart';

class DownloadPage extends StatefulWidget {
  final String url;

  DownloadPage(this.url);

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  String progress = '';

  @override
  void initState() {
    super.initState();
    tryOtaUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
            child: CupertinoAlertDialog(
          title: Text(
            '${MyLocaleKey.mineAppUpdating.tr}',
            style: MyTextUtil.textStyle(2,
                color: MyColorUtil.biz(), spacing: 0.0, size: 32),
          ),
          content: Container(
            padding: EdgeInsets.only(top: 5),
            alignment: Alignment.center,
            child: progress != ''
                ? RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${MyLocaleKey.mineAppDownloadProgress.tr}',
                          style: MyTextUtil.textStyle4Update(2,
                              color: MyColorUtil.biz(), spacing: 0.0, size: 28),
                        ),
                        TextSpan(
                          text: '$progress%',
                          style: TextStyle(
                            fontFamily: 'EN-M',
                            letterSpacing: 0.0,
                            color: MyColorUtil.biz(),
                            fontSize: MyScreenUtil.sp(32),
                            height: MyScreenUtil.sp(3.2),
                          ),
                        ),
                      ],
                    ),
                  )
                : Text(
                    '${MyLocaleKey.mineAppReadyToDownload.tr}',
                    style: MyTextUtil.textStyle4Update(2,
                        color: MyColorUtil.biz(), spacing: 0.0, size: 28),
                  ),
          ),
        )));
  }

  Future<void> tryOtaUpdate() async {
    try {
      String url = widget.url;
      List<String> list = url.split('/');
      String fileName = list[list.length - 1];

      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      OtaUpdate().execute(url, destinationFilename: fileName).listen(
        (OtaEvent event) {
          switch (event.status) {
            case OtaStatus.DOWNLOADING:
              setState(() {
                if (event.value != null) {
                  progress = event.value;
                }
              });
              break;
            case OtaStatus.INSTALLING:
              Navigator.pop(context);
              OpenFile.open("$appDocPath/$fileName");
              break;
            case OtaStatus.PERMISSION_NOT_GRANTED_ERROR:
              Navigator.pop(context);
              MyCommonUtil.showToast('${MyLocaleKey.mineAppDownloadFail.tr}');
              break;
            default:
              Navigator.pop(context);
              MyCommonUtil.showToast('${MyLocaleKey.mineAppDownloadFail.tr}');
              break;
          }
        },
      );
    } catch (e) {
      Navigator.pop(context);
      print('failed to make OTA update. Details: $e');
    }
  }
}
