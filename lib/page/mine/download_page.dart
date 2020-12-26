import 'dart:io';

import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        '${S.of(context).mineAppUpdating}',
        style: Util.textStyle(context, 2,
            color: Colors.grey[800], spacing: 0.0, size: 32),
      ),
      content: Container(
        padding: EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        child: progress != ''
            ? RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '${S.of(context).mineAppDownloadProgress}',
                      style: Util.textStyle4Update(context, 2,
                          color: Colors.grey[850], spacing: 0.0, size: 28),
                    ),
                    TextSpan(
                      text: '$progress%',
                      style: TextStyle(
                        fontFamily: 'EN-M',
                        letterSpacing: 0.0,
                        color: Colors.grey[850],
                        fontSize: Util.sp(32),
                        height: Util.sp(3.2),
                      ),
                    ),
                  ],
                ),
              )
            : Text(
                '${S.of(context).mineAppReadyToDownload}',
                style: Util.textStyle4Update(context, 2,
                    color: Colors.grey[850], spacing: 0.0, size: 28),
              ),
      ),
    ));
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
              Util.showToast('${S.of(context).mineAppDownloadFail}');
              break;
            default:
              Navigator.pop(context);
              Util.showToast('${S.of(context).mineAppDownloadFail}');
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
