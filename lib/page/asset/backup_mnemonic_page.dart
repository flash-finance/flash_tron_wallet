import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class BackupMnemonicPage extends StatefulWidget {
  @override
  _BackupMnemonicPageState createState() => _BackupMnemonicPageState();
}

class _BackupMnemonicPageState extends State<BackupMnemonicPage> {
  @override
  Widget build(BuildContext context) {
    WalletEntity wallet = Provider.of<HomeProvider>(context, listen: false).selectWalletEntity;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '${S.of(context).assetBackupMnemonic}',
          style: Util.textStyle(context, 2, Colors.grey[900], spacing: 0.2, size: 34),
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
        child: ListView(
          children: <Widget>[
            SizedBox(height: ScreenUtil().setHeight(20)),
            _descWidget(),
            SizedBox(height: ScreenUtil().setHeight(20)),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
              child: Column(
                children: <Widget>[
                  _dataWidget(context, wallet.mnemonic),
                  SizedBox(height: ScreenUtil().setHeight(150)),
                  _submitButton(context),
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
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  MyColors.themeColor,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            alignment: Alignment.center,
            child: Text(
              '${S.of(context).backupWalletTip1}',
              style: Util.textStyle(context, 1, Colors.white, spacing: 0.1, size: 22.5),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataWidget(BuildContext context, String mnemonic) {
    return Container(
      width: ScreenUtil().setWidth(700),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.6, color: Colors.black12)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(600),
            padding: EdgeInsets.fromLTRB(5, 15, 0, 10),
            child: Text(
              '$mnemonic',
              style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
              maxLines: 3, overflow: TextOverflow.ellipsis,
            ),
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: mnemonic));
              Util.showToast('${S.of(context).commonCopySuccess}');
            },
            child: Container(
              width: ScreenUtil().setWidth(80),
              alignment: Alignment.centerRight,
              child: Image.asset(
                'icons/copy.png',
                width: ScreenUtil().setWidth(40),
                height: ScreenUtil().setWidth(40),
                color: Colors.grey[800],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Container(
      child: Align(
        child: SizedBox(
          width: ScreenUtil().setWidth(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                  '${S.of(context).commonDone}',
                style: Util.textStyle(context, 1, Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color:  MyColors.themeColor,
            onPressed: () {
              Navigator.pop(context);
            },
            shape: StadiumBorder(side: BorderSide(color:  MyColors.themeColor)),
          ),
        ),
      ),
    );
  }

}

