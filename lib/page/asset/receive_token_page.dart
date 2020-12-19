import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveTokenPage extends StatefulWidget {
  @override
  _ReceiveTokenPageState createState() => _ReceiveTokenPageState();
}

class _ReceiveTokenPageState extends State<ReceiveTokenPage> {
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
          '${S.of(context).assetReceivingQrCode}',
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
        margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
        child: ListView(
          children: <Widget>[
            SizedBox(height: Util.height(30)),
            _qrCodeWidget(context, wallet.tronAddress.trim()),
            SizedBox(height: Util.height(20)),
            _nameWidget(context, wallet.name),
            SizedBox(height: Util.height(10)),
            _addressWidget(context, wallet.tronAddress),
            SizedBox(height: Util.height(80)),
            _copyButtonWidget(context, wallet.tronAddress),
          ],
        ),
      ),
    );
  }

  Widget _qrCodeWidget(BuildContext context, String address) {
    return Container(
      margin: EdgeInsets.only(left: Util.width(50), right: Util.width(50)),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Container(
          padding: EdgeInsets.only(top: Util.width(75), bottom: Util.width(75)),
          alignment: Alignment.center,
          child: QrImage(
            data: address,
            size: Util.width(400),
          ),
        ),
      ),
    );
  }

  Widget _nameWidget(BuildContext context, String name) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              '$name',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[800], spacing: 0.2, size: 30),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _addressWidget(BuildContext context, String address) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              '$address',
              style: Util.textStyle4En(context, 2,
                  color: Colors.grey[850], spacing: 0.0, size: 27),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _copyButtonWidget(BuildContext context, String address) {
    return Container(
      child: Align(
        child: SizedBox(
          width: Util.width(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                '${S.of(context).assetCopyAddress}',
                style: Util.textStyle(context, 1,
                    color: Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color: Util.themeColor,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: address));
              Util.showToast('${S.of(context).commonCopySuccess}');
            },
            shape: StadiumBorder(side: BorderSide(color: Util.themeColor)),
          ),
        ),
      ),
    );
  }
}
