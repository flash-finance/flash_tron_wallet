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
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveTokenPage extends StatefulWidget {
  @override
  _ReceiveTokenPageState createState() => _ReceiveTokenPageState();
}

class _ReceiveTokenPageState extends State<ReceiveTokenPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasAppBar: true,
      hasBack: true,
      title: '${MyLocaleKey.assetReceivingQrCode.tr}',
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    WalletEntity wallet = GlobalService.to.selectWalletEntity;
    return Container(
      margin: EdgeInsets.only(
          left: MyScreenUtil.width(30), right: MyScreenUtil.width(30)),
      child: ListView(
        children: <Widget>[
          SizedBox(height: MyScreenUtil.height(30)),
          _qrCodeWidget(context, wallet.tronAddress.trim()),
          SizedBox(height: MyScreenUtil.height(20)),
          _nameWidget(context, wallet.name),
          SizedBox(height: MyScreenUtil.height(10)),
          _addressWidget(context, wallet.tronAddress),
          SizedBox(height: MyScreenUtil.height(80)),
          _copyButtonWidget(context, wallet.tronAddress),
        ],
      ),
    );
  }

  Widget _qrCodeWidget(BuildContext context, String address) {
    return Container(
      margin: EdgeInsets.only(
          left: MyScreenUtil.width(50), right: MyScreenUtil.width(50)),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Container(
          padding: EdgeInsets.only(
              top: MyScreenUtil.width(75), bottom: MyScreenUtil.width(75)),
          alignment: Alignment.center,
          child: QrImage(
            data: address,
            size: MyScreenUtil.width(400),
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
              style: MyTextUtil.textStyle(2,
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
              style: MyTextUtil.textStyle4En(2,
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
          width: MyScreenUtil.width(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                '${MyLocaleKey.assetCopyAddress.tr}',
                style: MyTextUtil.textStyle(1,
                    color: Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color: MyColorUtil.themeColor,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: address));
              MyCommonUtil.showToast('${MyLocaleKey.commonCopySuccess.tr}');
            },
            shape:
                StadiumBorder(side: BorderSide(color: MyColorUtil.themeColor)),
          ),
        ),
      ),
    );
  }
}
