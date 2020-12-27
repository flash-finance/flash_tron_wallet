import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BackupKeyPage extends StatefulWidget {
  @override
  _BackupKeyPageState createState() => _BackupKeyPageState();
}

class _BackupKeyPageState extends State<BackupKeyPage> {
  @override
  Widget build(BuildContext context) {
    WalletEntity wallet =
        Provider.of<HomeProvider>(context, listen: false).selectWalletEntity;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '${S.of(context).assetBackupPrivateKey}',
          style: Util.textStyle(context, 2,
              color: Colors.grey[850], spacing: 0.2, size: 34),
        ),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context)..pop();
          },
          child: Icon(
            Icons.arrow_back,
            size: Util.sp(45),
            color: Colors.grey[850],
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: Util.height(20)),
            _descWidget(),
            SizedBox(height: Util.height(20)),
            Container(
              margin:
                  EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
              child: Column(
                children: <Widget>[
                  _dataWidget(context, wallet.privateKey),
                  SizedBox(height: Util.height(150)),
                  _submitWidget(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _descWidget() {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Util.themeColor,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 12),
            alignment: Alignment.center,
            child: Text(
              '${S.of(context).backupWalletTip2}',
              style: Util.textStyle(context, 1,
                  color: Colors.white, spacing: 0.1, size: 21),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataWidget(BuildContext context, String key) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: key));
        Util.showToast('${S.of(context).commonCopySuccess}');
      },
      child: Container(
        width: Util.width(700),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.6, color: Colors.black12)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: Util.width(600),
              padding: EdgeInsets.fromLTRB(5, 15, 0, 10),
              child: Text(
                '$key',
                style: Util.textStyle4En(context, 2,
                    color: Colors.grey[800], spacing: 0.0, size: 28),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: Util.width(80),
              alignment: Alignment.centerRight,
              child: Icon(
                IconData(0xe618, fontFamily: 'ICON'),
                size: Util.sp(30),
                color: Colors.grey[850],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitWidget(BuildContext context) {
    return Container(
      child: Align(
        child: SizedBox(
          width: Util.width(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                '${S.of(context).commonDone}',
                style: Util.textStyle(context, 1,
                    color: Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color: Util.themeColor,
            onPressed: () {
              Navigator.pop(context);
            },
            shape: StadiumBorder(side: BorderSide(color: Util.themeColor)),
          ),
        ),
      ),
    );
  }
}
