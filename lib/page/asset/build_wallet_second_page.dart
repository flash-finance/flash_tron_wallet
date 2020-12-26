import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BuildWalletSecondPage extends StatefulWidget {
  final String type;
  BuildWalletSecondPage(this.type);

  @override
  _BackupMnemonicSecondPageState createState() =>
      _BackupMnemonicSecondPageState();
}

class _BackupMnemonicSecondPageState extends State<BuildWalletSecondPage> {
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
          '${S.of(context).assetCreateWallet}',
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
      body: wallet != null && wallet.mnemonic != null
          ? Container(
              width: Util.width(750),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: Util.height(20)),
                  _descWidget(),
                  SizedBox(height: Util.height(10)),
                  Container(
                    margin: EdgeInsets.only(
                        left: Util.width(30), right: Util.width(30)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: Util.height(10)),
                        _tipsWidget(wallet.mnemonic),
                        SizedBox(height: Util.height(10)),
                        _dataWidget(wallet.mnemonic),
                        SizedBox(height: Util.height(80)),
                        _submitWidget(context),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }

  Widget _descWidget() {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Util.themeColor,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 10, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).addWalletTip3}',
              style: Util.textStyle(context, 1,
                  color: Colors.white, spacing: 0.1, size: 21),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 5, 10, 12),
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).addWalletTip4}',
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

  Widget _tipsWidget(String mnemonic) {
    return Container(
      width: Util.width(750),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              '${S.of(context).commonBackupMnemonic}',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[800], spacing: 0.4, size: 26),
            ),
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: mnemonic));
              Util.showToast('${S.of(context).commonCopySuccess}');
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Icon(
                IconData(0xe618, fontFamily: 'ICON'),
                size: Util.sp(28),
                color: Colors.white,
              ),
            ),
          ),
        ],
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
      width: Util.width(200),
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
              style: Util.textStyle4Num(context,
                  color: Colors.grey[500], size: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 13),
            child: Text(
              '$value',
              style: Util.textStyle4En(context, 2,
                  color: Colors.grey[800], size: 27),
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
          width: Util.width(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                '${S.of(context).commonSavedSafely}',
                style: Util.textStyle(context, 1,
                    color: Colors.white, spacing: 0.2, size: 30),
              ),
            ),
            color: Util.themeColor,
            onPressed: () {
              if (widget.type == '1') {
                Navigator.of(context)..pop()..pop();
              } else if (widget.type == '2') {
                Navigator.of(context)..pop()..pop()..pop();
              }
            },
            shape: StadiumBorder(side: BorderSide(color: Util.themeColor)),
          ),
        ),
      ),
    );
  }
}
