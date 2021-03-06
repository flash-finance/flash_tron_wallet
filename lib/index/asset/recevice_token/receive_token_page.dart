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
      body: Obx(() => _bodyWidget(context)),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    WalletEntity wallet = GlobalService.to.selectWalletEntity;
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30),
      child: ListView(
        children: <Widget>[
          MyCommonUtil.sizedBox(height: 30),
          _qrCodeWidget(context, wallet.tronAddress.trim()),
          MyCommonUtil.sizedBox(height: 20),
          _nameWidget(context, wallet.name),
          MyCommonUtil.sizedBox(height: 10),
          _addressWidget(context, wallet.tronAddress),
          MyCommonUtil.sizedBox(height: 80),
          _copyButtonWidget(context, wallet.tronAddress),
        ],
      ),
    );
  }

  Widget _qrCodeWidget(BuildContext context, String address) {
    return Container(
      margin: MyCommonUtil.edge(left: 50, right: 50),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Container(
          margin: MyCommonUtil.edge(top: 75, bottom: 75),
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
                  color: MyColorUtil.biz(), spacing: 0.2, size: 30),
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
                  color: MyColorUtil.biz(), spacing: 0.0, size: 27),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _copyButtonWidget(BuildContext context, String address) {
    return MyCommonUtil.submit(
      context,
      320,
      '${MyLocaleKey.assetCopyAddress.tr}',
      onPressed(address),
    );
  }

  Function onPressed(String address) {
    return () {
      Clipboard.setData(ClipboardData(text: address));
      MyCommonUtil.showToast('${MyLocaleKey.commonCopySuccess.tr}');
    };
  }
}
