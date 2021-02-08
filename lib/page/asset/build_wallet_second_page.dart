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

class BuildWalletSecondPage extends StatefulWidget {
  final String type = Get.parameters['type'];

  @override
  _BackupMnemonicSecondPageState createState() =>
      _BackupMnemonicSecondPageState();
}

class _BackupMnemonicSecondPageState extends State<BuildWalletSecondPage> {
  @override
  Widget build(BuildContext context) {
    WalletEntity wallet = GlobalService.to.selectWalletEntity;
    return MyScaffold(
      hasAppBar: true,
      hasBack: true,
      title: '${MyLocaleKey.assetCreateWallet.tr}',
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    WalletEntity wallet = GlobalService.to.selectWalletEntity;
    return wallet != null && wallet.mnemonic != null
        ? Container(
            width: MyScreenUtil.width(750),
            child: ListView(
              children: <Widget>[
                SizedBox(height: MyScreenUtil.height(20)),
                _descWidget(),
                SizedBox(height: MyScreenUtil.height(10)),
                Container(
                  margin: EdgeInsets.only(
                      left: MyScreenUtil.width(30),
                      right: MyScreenUtil.width(30)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: MyScreenUtil.height(10)),
                      _tipsWidget(wallet.mnemonic),
                      SizedBox(height: MyScreenUtil.height(10)),
                      _dataWidget(wallet.mnemonic),
                      SizedBox(height: MyScreenUtil.height(80)),
                      _submitWidget(context),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container();
  }

  Widget _descWidget() {
    return Container(
      margin: EdgeInsets.only(
          left: MyScreenUtil.width(30), right: MyScreenUtil.width(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColorUtil.themeColor,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 10, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '${MyLocaleKey.addWalletTip3.tr}',
              style: MyTextUtil.textStyle(1,
                  color: Colors.white, spacing: 0.1, size: 21),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 10, 12),
            alignment: Alignment.centerLeft,
            child: Text(
              '${MyLocaleKey.addWalletTip4.tr}',
              style: MyTextUtil.textStyle(1,
                  color: Colors.white, spacing: 0.1, size: 21),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tipsWidget(String mnemonic) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: mnemonic));
        MyCommonUtil.showToast('${MyLocaleKey.commonCopySuccess.tr}');
      },
      child: Container(
        width: MyScreenUtil.width(750),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                '${MyLocaleKey.commonBackupMnemonic.tr}',
                style: MyTextUtil.textStyle(2,
                    color: Colors.grey[800], spacing: 0.4, size: 26),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Icon(
                IconData(0xe618, fontFamily: 'ICON'),
                size: MyScreenUtil.sp(30),
                color: Colors.grey[850],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dataWidget(String mnemonic) {
    List<String> _list = mnemonic.trim().split(' ');
    List<Widget> _listWidget = [];
    if (_list.length > 0) {
      for (int i = 0; i < _list.length; i++) {
        _listWidget.add(_itemWidget(i + 1, _list[i]));
      }
      return Container(
        child: Wrap(
          spacing: 3,
          children: _listWidget,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _itemWidget(int index, String value) {
    return Container(
      width: MyScreenUtil.width(200),
      margin: EdgeInsets.fromLTRB(0, 3, 3, 3),
      decoration: BoxDecoration(
        color: Color(0x80EEEEEE),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Text(
              '$index',
              style:
                  MyTextUtil.textStyle4Num(color: Colors.grey[500], size: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 13),
            child: Text(
              '$value',
              style:
                  MyTextUtil.textStyle4En(2, color: Colors.grey[800], size: 27),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitWidget(BuildContext context) {
    return Container(
      child: Align(
        child: SizedBox(
          width: MyScreenUtil.width(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                '${MyLocaleKey.commonSavedSafely.tr}',
                style: MyTextUtil.textStyle(1,
                    color: Colors.white, spacing: 0.2, size: 30),
              ),
            ),
            color: MyColorUtil.themeColor,
            onPressed: () {
              if (widget.type == '1') {
                Navigator.of(context)..pop()..pop();
              } else if (widget.type == '2') {
                Navigator.of(context)..pop()..pop()..pop();
              }
            },
            shape:
                StadiumBorder(side: BorderSide(color: MyColorUtil.themeColor)),
          ),
        ),
      ),
    );
  }
}
