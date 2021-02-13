import 'package:fixnum/fixnum.dart';
import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/common/widget/scaffold/scaffold_widget.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flash_tron_wallet/route/app_route.dart';
import 'package:flash_tron_wallet/tron/service/tron_transaction.dart';
import 'package:flash_tron_wallet/tron/service/tron_wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SendTokenPage extends StatefulWidget {
  final String value = Get.parameters['value'];

  @override
  _SendTokenPageState createState() => _SendTokenPageState();
}

class _SendTokenPageState extends State<SendTokenPage> {
  final _formKey = GlobalKey<FormState>();
  bool _langType = true;

  TextEditingController _receiveAddressController;
  TextEditingController _assetAmountController;
  String _receiveAddress = '';
  String _assetAmount = '';
  final _sendFormKey = GlobalKey<FormState>();
  String _sendPwd;
  bool transferLoading;

  @override
  void initState() {
    super.initState();
    transferLoading = false;
    _receiveAddress = widget.value;
    _receiveAddressController = TextEditingController.fromValue(
        TextEditingValue(
            text: _receiveAddress,
            selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: _receiveAddress.length))));
    _assetAmountController = TextEditingController.fromValue(TextEditingValue(
        text: _assetAmount,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream,
            offset: _receiveAddress.length))));
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      hasAppBar: true,
      hasBack: true,
      title: '${MyLocaleKey.assetTransfer.tr}',
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    List<AssetEntity> assetFilterConList = GlobalService.to.assetList;
    int selectAssetFilterIndex = GlobalService.to.selectAssetFilterIndex;
    WalletEntity wallet = GlobalService.to.selectWalletEntity;
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            MyCommonUtil.interval(value: 20),
            _sendWidget(context, wallet),
            MyCommonUtil.interval(value: 20),
            _receiveWidget(context),
            MyCommonUtil.interval(value: 20),
            _amountWidget(context, assetFilterConList, selectAssetFilterIndex),
            _balanceWidget(context, assetFilterConList, selectAssetFilterIndex),
            MyCommonUtil.interval(value: 20),
            MyCommonUtil.sizedBox(height: 120),
            _submitWidget(context, wallet),
          ],
        ),
      ),
    );
  }

  Widget _sendWidget(BuildContext context, WalletEntity wallet) {
    return Container(
      margin: MyCommonUtil.edge(left: 40, right: 40, top: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '${MyLocaleKey.assetTransferAddress.tr}',
              style: MyTextUtil.textStyle(2,
                  color: Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          MyCommonUtil.sizedBox(height: 15),
          Container(
            child: Text(
              '${wallet.tronAddress}',
              style: MyTextUtil.textStyle4En(2,
                  color: Colors.grey[800], spacing: 0.0, size: 27),
            ),
          ),
        ],
      ),
    );
  }

  Widget _receiveWidget(BuildContext context) {
    return Container(
      margin: MyCommonUtil.edge(left: 40, right: 40, top: 30, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '${MyLocaleKey.assetReceivingAddress.tr}',
              style: MyTextUtil.textStyle(2,
                  color: Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          MyCommonUtil.sizedBox(height: 5),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MyScreenUtil.width(600),
                  child: TextFormField(
                    controller: _receiveAddressController,
                    cursorColor: Colors.grey[850],
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '${MyLocaleKey.assetTransferTip1.tr}',
                      hintStyle: MyTextUtil.textStyle(1,
                          color: Colors.grey[400], spacing: 0.2, size: 25),
                      border: InputBorder.none,
                    ),
                    style: MyTextUtil.textStyle4En(2,
                        color: Colors.grey[850], spacing: 0.0, size: 28),
                    maxLines: 1,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z]|[0-9]"))
                    ],
                    onSaved: (String value) => _receiveAddress = value,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.assetQrScan + '/2');
                  },
                  child: Container(
                    child: Icon(
                      IconData(0xe606, fontFamily: 'ICON'),
                      size: MyScreenUtil.sp(52),
                      color: Colors.grey[850],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _amountWidget(
      BuildContext context, List<AssetEntity> assetFilterConList, int index) {
    bool flag = assetFilterConList.length == 0 ? true : false;
    return Container(
      padding: EdgeInsets.only(bottom: MyScreenUtil.height(10)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: MyCommonUtil.edge(left: 40, right: 35, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MyScreenUtil.width(200),
                  child: Text(
                    '${MyLocaleKey.assetTransferAmount.tr}',
                    style: MyTextUtil.textStyle(2,
                        color: Colors.grey[850], spacing: 0.2, size: 26),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      _showSelectTokenDialLog(context, assetFilterConList);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: MyCommonUtil.edge(top: 1.5),
                          child: Text(
                            !flag ? '${assetFilterConList[index].name} ' : '',
                            style: GoogleFonts.roboto(
                              letterSpacing: 0.0,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500,
                              fontSize: MyScreenUtil.sp(26),
                            ),
                          ),
                        ),
                        Container(
                          padding: MyCommonUtil.edge(top: 1.8),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: MyScreenUtil.sp(25),
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          MyCommonUtil.sizedBox(height: 10),
          Container(
            margin: MyCommonUtil.edge(left: 40, right: 40, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MyScreenUtil.width(500),
                  child: TextFormField(
                    controller: _assetAmountController,
                    cursorColor: Colors.grey[850],
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '${MyLocaleKey.assetTransferTip2.tr}',
                      hintStyle: MyTextUtil.textStyle(1,
                          color: Colors.grey[400], spacing: 0.2, size: 25),
                      border: InputBorder.none,
                    ),
                    style: MyTextUtil.textStyle4Num(
                        color: Colors.grey[850],
                        spacing: 0.2,
                        size: 32,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      DoubleFormat(
                          decimalRange: assetFilterConList[index].precision)
                    ],
                    onSaved: (String value) => _assetAmount = value,
                  ),
                ),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _assetAmount = !flag
                        ? assetFilterConList[index].balance.toString()
                        : '';
                    _assetAmountController.text = !flag
                        ? assetFilterConList[index].balance.toString()
                        : '';
                  },
                  child: Container(
                    width: MyScreenUtil.width(80),
                    padding: _langType
                        ? MyCommonUtil.edge(top: 5, bottom: 5)
                        : MyCommonUtil.edge(top: 7.5, bottom: 7.5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: MyColorUtil.theme,
                    ),
                    child: Text(
                      '${MyLocaleKey.commonMax.tr}',
                      style: MyTextUtil.textStyle(2,
                          color: MyColorUtil.white, spacing: 0.2, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _balanceWidget(
      BuildContext context, List<AssetEntity> assetFilterConList, int index) {
    return Container(
      margin: MyCommonUtil.edge(left: 40, right: 40, top: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              '${MyLocaleKey.assetBalance.tr}',
              style: MyTextUtil.textStyle(2,
                  color: Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          Container(
            child: Text(
              '${MyCommonUtil.formatNum(assetFilterConList[index].balance, 4)}  ${assetFilterConList[index].name}',
              style: GoogleFonts.roboto(
                letterSpacing: 0.0,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
                fontSize: MyScreenUtil.sp(28),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showSelectTokenDialLog(BuildContext context, List<AssetEntity> list) {
    showDialog(
      context: context,
      child: AlertDialog(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: Container(
          width: MyScreenUtil.width(600),
          height: MyScreenUtil.height(500),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return _selectTokenWidget(context, index, list[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectTokenWidget(BuildContext context, int index, AssetEntity item) {
    int selectAssetFilterIndex = GlobalService.to.selectAssetFilterIndex;
    bool flag = index == selectAssetFilterIndex;

    return InkWell(
      onTap: () {
        GlobalService.to.changeSelectAssetFilterIndex(index);
        Navigator.pop(context);
        _assetAmountController.text = '';
      },
      child: Container(
        width: MyScreenUtil.width(600),
        padding: MyCommonUtil.edge(top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MyScreenUtil.width(300),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: MyScreenUtil.width(10)),
              child: Row(
                children: <Widget>[
                  Container(
                    child: ClipOval(
                      child: Image.network(
                        '${item.logoUrl}',
                        width: MyScreenUtil.width(40),
                        height: MyScreenUtil.width(40),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: MyCommonUtil.edge(left: 30),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${item.name}',
                      style: MyTextUtil.textStyle4En(2,
                          color: Colors.grey[850], spacing: 0.0, size: 29),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MyScreenUtil.width(60),
              padding: MyCommonUtil.edge(right: 10),
              alignment: Alignment.centerRight,
              child: !flag
                  ? Container()
                  : Icon(
                      Icons.check,
                      color: Colors.grey[850],
                      size: MyScreenUtil.sp(42),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitWidget(BuildContext context, WalletEntity wallet) {
    List<AssetEntity> assetList = GlobalService.to.assetList;
    int index = GlobalService.to.selectAssetFilterIndex;
    return MyCommonUtil.submit(
      context,
      320,
      '${MyLocaleKey.commonSend.tr}',
      onPressed(context, wallet, assetList, index),
    );
  }

  Function onPressed(BuildContext context, WalletEntity wallet,
      List<AssetEntity> assetList, int index) {
    return () {
      FocusScope.of(context).requestFocus(FocusNode());
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        if (_receiveAddress.isEmpty) {
          MyCommonUtil.showToast('${MyLocaleKey.assetTransferError1.tr}');
        } else if (!TronWallet().checkTronAddress(_receiveAddress.trim())) {
          MyCommonUtil.showToast('${MyLocaleKey.assetTransferError2.tr}');
        } else if (_receiveAddress.trim() == wallet.tronAddress) {
          MyCommonUtil.showToast('${MyLocaleKey.assetTransferError3.tr}');
        } else if (_assetAmount.isEmpty) {
          MyCommonUtil.showToast('${MyLocaleKey.assetTransferError4.tr}');
        } else if (double.parse(_assetAmount) <= 0.0) {
          MyCommonUtil.showToast('${MyLocaleKey.assetTransferError5.tr}');
        } else if (double.parse(_assetAmount) > assetList[index].balance) {
          MyCommonUtil.showToast('${MyLocaleKey.assetTransferError6.tr}');
        } else {
          _showPwdDialog(
              context, wallet.tronAddress, wallet.pwd, assetList[index]);
        }
      }
    };
  }

  void _showPwdDialog(BuildContext context, String ownerAddress, String userPwd,
      AssetEntity item) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      '${MyLocaleKey.assetTransfer.tr} ',
                      style: MyTextUtil.textStyle(2,
                          color: Colors.grey[850], spacing: 0.0, size: 30),
                    ),
                  ),
                  Container(
                    child: Text(
                      '$_assetAmount ${item.name} ',
                      style: MyTextUtil.textStyle4Num(
                          color: Colors.grey[850], spacing: 0.0, size: 30),
                    ),
                  ),
                ],
              ),
              content: Card(
                elevation: 0.0,
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _sendFormKey,
                      child: TextFormField(
                        onSaved: (String value) {
                          if (value.length > 6) {
                            value = value.substring(0, 6);
                          }
                          _sendPwd = value;
                        },
                        decoration: InputDecoration(
                          hintText: '',
                          filled: true,
                          fillColor: MyColorUtil.white,
                        ),
                        style: MyTextUtil.textStyle4Num(
                            color: Colors.grey[800],
                            spacing: 0.2,
                            size: 32,
                            fontWeight: FontWeight.w500),
                        obscureText: true,
                        maxLength: 6,
                        maxLengthEnforced: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        validator: (String value) {
                          if (value.isEmpty) {
                            return '${MyLocaleKey.commonError1.tr}';
                          } else if (value.length < 6) {
                            return '${MyLocaleKey.commonError2.tr}';
                          } else if (value.substring(0, 6) != userPwd) {
                            return '${MyLocaleKey.commonError3.tr}';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    '${MyLocaleKey.commonCancel.tr}',
                    style: MyTextUtil.textStyle(2,
                        color: MyColorUtil.theme, spacing: 0.5, size: 30),
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!transferLoading) {
                      Navigator.of(context)..pop();
                    } else {
                      MyCommonUtil.showToast(
                          '${MyLocaleKey.assetTransferTip3.tr}');
                    }
                  },
                ),
                FlatButton(
                    child: Text(
                      '${MyLocaleKey.commonConfirm.tr}',
                      style: MyTextUtil.textStyle(2,
                          color: MyColorUtil.theme, spacing: 0.5, size: 30),
                    ),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (_sendFormKey.currentState.validate()) {
                        _sendFormKey.currentState.save();
                        if (_sendPwd.trim() != userPwd) {
                          MyCommonUtil.showToast(
                              '${MyLocaleKey.commonError3.tr}');
                        } else {
                          if (transferLoading) {
                            MyCommonUtil.showToast(
                                '${MyLocaleKey.assetTransferTip4.tr}');
                          } else {
                            MyCommonUtil.showToast(
                                '${MyLocaleKey.assetTransferTip3.tr}');
                            _transHandle(context, item, ownerAddress)
                                .then((result) {
                              if (result == 0) {
                                setState(() {
                                  transferLoading = false;
                                });
                                Navigator.of(context)..pop()..pop();
                                MyCommonUtil.showToast(
                                    '${MyLocaleKey.assetTransferSuccess.tr}');
                                GlobalService.to.getAsset4ReloadAsync();
                              } else if (result == 1) {
                                Navigator.of(context)..pop()..pop();
                                MyCommonUtil.showToast(
                                    '${MyLocaleKey.assetTransferTip5.tr}');
                              } else if (result == -1) {
                                //Util.showToast('转账处理中，请勿重复操作');
                              }
                            });
                          }
                        }
                      }
                    }),
              ],
            ));
  }

  double _getPrecision(int precision) {
    double result = 1;
    double baseValue = 10;
    for (int i = 0; i < precision; i++) {
      result = result * baseValue;
    }
    return result;
  }

  Future<int> _transHandle(
      BuildContext context, AssetEntity item, String ownerAddress) async {
    if (transferLoading) {
      return -1;
    }
    setState(() {
      transferLoading = true;
    });
    double amount = double.parse(_assetAmount) * _getPrecision(item.precision);
    if (item.type == 1) {
      bool result = await TronTransaction().transTrx(
          context, ownerAddress, _receiveAddress, Int64(amount.toInt()));
      return result ? 0 : 1;
    } else if (item.type == 2) {
      bool result = await TronTransaction().transTrc20(context, item.address,
          ownerAddress, _receiveAddress, amount.toStringAsFixed(0));
      return result ? 0 : 1;
    }
    return 0;
  }
}
