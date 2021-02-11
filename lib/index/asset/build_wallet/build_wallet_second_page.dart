import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/icon_util.dart';
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
                MyCommonUtil.sizedBox(height: 20),
                _descWidget(),
                MyCommonUtil.sizedBox(height: 10),
                Container(
                  margin: MyCommonUtil.edge(left: 30, right: 30),
                  child: Column(
                    children: <Widget>[
                      MyCommonUtil.sizedBox(height: 10),
                      _tipsWidget(wallet.mnemonic),
                      MyCommonUtil.sizedBox(height: 10),
                      _dataWidget(wallet.mnemonic),
                      MyCommonUtil.sizedBox(height: 80),
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
      margin: MyCommonUtil.edge(left: 30, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColorUtil.theme,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: MyCommonUtil.edge(left: 60, right: 60, top: 30, bottom: 0),
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
            padding: MyCommonUtil.edge(left: 60, right: 60, top: 5, bottom: 20),
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
                    color: MyColorUtil.biz(), spacing: 0.4, size: 26),
              ),
            ),
            Container(
              padding: MyCommonUtil.edge(left: 30),
              child: MyCommonUtil.icon(
                MyIconUtil.copyExt,
                size: 30,
                color: MyColorUtil.biz(),
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
      margin: MyCommonUtil.edge(right: 5, top: 5, bottom: 5),
      decoration: BoxDecoration(
        //color: Color(0x80EEEEEE),
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: MyCommonUtil.edge(left: 15, top: 10),
            child: Text(
              '$index',
              style:
                  MyTextUtil.textStyle4Num(color: MyColorUtil.subBiz(), size: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: MyCommonUtil.edge(bottom: 26),
            child: Text(
              '$value',
              style:
                  MyTextUtil.textStyle4En(2, color: MyColorUtil.biz(), size: 27),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitWidget(BuildContext context) {
    return MyCommonUtil.submit(context, 320,
        '${MyLocaleKey.commonSavedSafely.tr}', _onPressed(context));
  }

  Function _onPressed(BuildContext context) {
    return () {
      if (widget.type == '1') {
        Navigator.of(context)..pop()..pop();
      } else if (widget.type == '2') {
        Navigator.of(context)..pop()..pop()..pop();
      }
    };
  }
}
