import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BackupMnemonicPage extends StatefulWidget {
  @override
  _BackupMnemonicPageState createState() => _BackupMnemonicPageState();
}

class _BackupMnemonicPageState extends State<BackupMnemonicPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasAppBar: true,
      hasBack: true,
      title: '${MyLocaleKey.assetBackupMnemonic.tr}',
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    WalletEntity wallet = GlobalService.to.selectWalletEntity;
    return Container(
      child: ListView(
        children: <Widget>[
          MyCommonUtil.sizedBox(height: 20),
          _descWidget(),
          MyCommonUtil.sizedBox(height: 20),
          Container(
            margin: MyCommonUtil.edge(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                _dataWidget(context, wallet.mnemonic),
                MyCommonUtil.sizedBox(height: 150),
                _submitButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _descWidget() {
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColorUtil.theme,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding:
                MyCommonUtil.edge(left: 60, right: 60, top: 30, bottom: 20),
            alignment: Alignment.center,
            child: Text(
              '${MyLocaleKey.backupWalletTip1.tr}',
              style: MyTextUtil.textStyle(1,
                  color: MyColorUtil.white, spacing: 0.1, size: 21),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataWidget(BuildContext context, String mnemonic) {
    return InkWell(
        onTap: () {
          Clipboard.setData(ClipboardData(text: mnemonic));
          MyCommonUtil.showToast('${MyLocaleKey.commonCopySuccess.tr}');
        },
        child: Container(
          width: MyScreenUtil.width(700),
          decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 0.6, color: Colors.black12)),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: MyScreenUtil.width(600),
                padding: MyCommonUtil.edge(left: 10, top: 25, bottom: 20),
                child: Text(
                  '$mnemonic',
                  style: MyTextUtil.textStyle4En(2,
                      color: MyColorUtil.biz(), spacing: 0.0, size: 30),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: MyScreenUtil.width(80),
                alignment: Alignment.centerRight,
                child: Icon(
                  IconData(0xe618, fontFamily: 'ICON'),
                  size: MyScreenUtil.sp(30),
                  color: MyColorUtil.biz(),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _submitButton(BuildContext context) {
    return MyCommonUtil.submit(
      context,
      320,
      '${MyLocaleKey.commonDone.tr}',
      () {
        Navigator.pop(context);
      },
    );
  }
}
