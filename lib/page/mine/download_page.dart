import 'dart:io';

import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
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
    return Container(
      child: CupertinoAlertDialog(
        title: Text(
          '更新中...',
          style: Util.textStyle(context, 2, color: Colors.grey[850], spacing: 0.2, size: 32),
        ),
        content: Container(
          padding: EdgeInsets.only(top: 5),
          alignment: Alignment.center,
          child: progress != '' ?
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '下载进度:  ',
                  style: TextStyle(
                    fontFamily: 'SHS-M',
                    letterSpacing: 0.0,
                    color: Colors.grey[900],
                    fontSize: ScreenUtil().setSp(28),
                    height: ScreenUtil().setSp(3.2),
                  ),
                ),
                TextSpan(
                  text: '$progress%',
                  style: TextStyle(
                    fontFamily: 'SHS-M',
                    letterSpacing: 0.0,
                    color: Colors.grey[900],
                    fontSize: ScreenUtil().setSp(32),
                    height: ScreenUtil().setSp(3.2),
                  ),
                ),
              ],
            ),
          ) : Text(
            '准备下载...',
            style: TextStyle(
              fontFamily: 'SHS-M',
              letterSpacing: 0.0,
              color: Colors.grey[900],
              fontSize: ScreenUtil().setSp(28),
              height: ScreenUtil().setSp(3.2),
            ),
          ),
        ),
      )
    );
  }

  Future<void> tryOtaUpdate() async {
    try {
      String url = widget.url;
      List<String> list = url.split('/');
      String fileName = list[list.length -1];

      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      OtaUpdate().execute(url, destinationFilename: fileName).listen((OtaEvent event) {
        switch(event.status){
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
            Util.showToast('更新失败，请稍后再试');
            break;
          default:
            Navigator.pop(context);
            Util.showToast('更新失败，请稍后再试');
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
