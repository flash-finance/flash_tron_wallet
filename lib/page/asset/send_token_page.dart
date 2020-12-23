import 'package:fixnum/fixnum.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/page/common/common_page.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/router/router.dart';
import 'package:flash_tron_wallet/tron/service/tron_transaction.dart';
import 'package:flash_tron_wallet/tron/service/tron_wallet.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SendTokenPage extends StatefulWidget {
  final String value;

  SendTokenPage(this.value);

  @override
  _SendTokenPageState createState() => _SendTokenPageState();
}

class _SendTokenPageState extends State<SendTokenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          '${S.of(context).assetTransfer}',
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SendTokenSubPage(widget.value),
      ),
    );
  }
}

class SendTokenSubPage extends StatefulWidget {
  final String value;

  SendTokenSubPage(this.value);

  @override
  _SendTokenSubPageState createState() => _SendTokenSubPageState();
}

class _SendTokenSubPageState extends State<SendTokenSubPage> {
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
    _langType = Provider.of<IndexProvider>(context, listen: false).langType;
    List<AssetEntity> assetFilterConList =
        Provider.of<HomeProvider>(context, listen: true).assetList;
    int selectAssetFilterIndex =
        Provider.of<HomeProvider>(context, listen: true).selectAssetFilterIndex;
    WalletEntity wallet =
        Provider.of<HomeProvider>(context, listen: false).selectWalletEntity;
    return Container(
      child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                IntervalPage(Util.height(25)),
                _sendWidget(context, wallet),
                IntervalPage(Util.height(25)),
                _receiveWidget(context),
                IntervalPage(Util.height(25)),
                _amountWidget(
                    context, assetFilterConList, selectAssetFilterIndex),
                _balanceWidget(
                    context, assetFilterConList, selectAssetFilterIndex),
                IntervalPage(Util.height(25)),
                SizedBox(height: Util.height(120)),
                _submitWidget(context, wallet),
              ],
            ),
          )),
    );
  }

  Widget _sendWidget(BuildContext context, WalletEntity wallet) {
    return Container(
      margin: EdgeInsets.only(
          left: Util.width(40),
          top: Util.height(25),
          right: Util.width(40),
          bottom: Util.height(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '${S.of(context).assetTransferAddress}',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          SizedBox(height: Util.height(15)),
          Container(
            child: Text(
              '${wallet.tronAddress}',
              style: Util.textStyle4En(context, 2,
                  color: Colors.grey[800], spacing: 0.0, size: 27),
            ),
          ),
        ],
      ),
    );
  }

  Widget _receiveWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Util.width(40),
          top: Util.height(25),
          right: Util.width(40),
          bottom: Util.height(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '${S.of(context).assetReceivingAddress}',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          SizedBox(height: Util.height(5)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: Util.width(600),
                  child: TextFormField(
                    controller: _receiveAddressController,
                    cursorColor: Colors.grey[850],
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '${S.of(context).assetTransferTip1}',
                      hintStyle: Util.textStyle(context, 1,
                          color: Colors.grey[400], spacing: 0.2, size: 25),
                      border: InputBorder.none,
                    ),
                    style: Util.textStyle4En(context, 2,
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
                    Application.router.navigateTo(
                        context, Routes.assetQrScan + '/2',
                        transition: TransitionType.fadeIn);
                  },
                  child: Container(
                    child: Icon(
                      IconData(0xe606, fontFamily: 'ICON'),
                      size: Util.sp(52),
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
      padding: EdgeInsets.only(bottom: Util.height(10)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: Util.width(40),
                top: Util.height(25),
                right: Util.width(35)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: Util.width(200),
                  child: Text(
                    '${S.of(context).assetTransferAmount}',
                    style: Util.textStyle(context, 2,
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
                          padding: EdgeInsets.only(top: Util.height(1.5)),
                          child: Text(
                            !flag ? '${assetFilterConList[index].name} ' : '',
                            style: GoogleFonts.roboto(
                              letterSpacing: 0.0,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500,
                              fontSize: Util.sp(26),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: Util.height(1.8)),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: Util.sp(25),
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
          SizedBox(height: Util.height(10)),
          Container(
            margin:
                EdgeInsets.only(left: Util.width(40), right: Util.width(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: Util.width(500),
                  child: TextFormField(
                    controller: _assetAmountController,
                    cursorColor: Colors.grey[850],
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '${S.of(context).assetTransferTip2}',
                      hintStyle: Util.textStyle(context, 1,
                          color: Colors.grey[400], spacing: 0.2, size: 25),
                      border: InputBorder.none,
                    ),
                    style: Util.textStyle4Num(context,
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
                    width: Util.width(80),
                    padding: _langType
                        ? EdgeInsets.only(
                            top: Util.height(5), bottom: Util.height(5))
                        : EdgeInsets.only(
                            top: Util.height(7.5), bottom: Util.height(7.5)),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Util.themeColor,
                    ),
                    child: Text(
                      '${S.of(context).commonMax}',
                      style: Util.textStyle(context, 2,
                          color: Colors.white, spacing: 0.2, size: 20),
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
      margin: EdgeInsets.only(
          left: Util.width(40),
          top: Util.height(25),
          right: Util.width(40),
          bottom: Util.height(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              '${S.of(context).assetBalance}',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          Container(
            child: Text(
              '${Util.formatNum(assetFilterConList[index].balance, 4)}  ${assetFilterConList[index].name}',
              style: GoogleFonts.roboto(
                letterSpacing: 0.0,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
                fontSize: Util.sp(28),
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
          width: Util.width(600),
          height: Util.height(500),
          padding: EdgeInsets.only(top: Util.height(0)),
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
    int selectAssetFilterIndex =
        Provider.of<HomeProvider>(context, listen: true).selectAssetFilterIndex;
    bool flag = index == selectAssetFilterIndex;

    return InkWell(
      onTap: () {
        Provider.of<HomeProvider>(context, listen: false)
            .changeSelectAssetFilterIndex(index);
        Navigator.pop(context);
        _assetAmountController.text = '';
      },
      child: Container(
        width: Util.width(600),
        padding: EdgeInsets.only(top: Util.height(16), bottom: Util.height(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: Util.width(300),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: Util.width(10)),
              child: Row(
                children: <Widget>[
                  Container(
                    child: ClipOval(
                      child: Image.network(
                        '${item.logoUrl}',
                        width: Util.width(40),
                        height: Util.width(40),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: Util.width(30)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${item.name}',
                      style: Util.textStyle4En(context, 2,
                          color: Colors.grey[850], spacing: 0.0, size: 29),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Util.width(60),
              padding: EdgeInsets.only(right: Util.width(10)),
              alignment: Alignment.centerRight,
              child: !flag
                  ? Container()
                  : Icon(
                      Icons.check,
                      color: Colors.grey[850],
                      size: Util.sp(42),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitWidget(BuildContext context, WalletEntity wallet) {
    List<AssetEntity> assetList = Provider.of<HomeProvider>(context).assetList;
    int index = Provider.of<HomeProvider>(context).selectAssetFilterIndex;
    return Container(
      child: Align(
        child: SizedBox(
          width: Util.width(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                '${S.of(context).commonSend}',
                style: Util.textStyle(context, 1,
                    color: Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color: Util.themeColor,
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (_receiveAddress.isEmpty) {
                  Util.showToast('${S.of(context).assetTransferError1}');
                } else if (!TronWallet()
                    .checkTronAddress(_receiveAddress.trim())) {
                  Util.showToast('${S.of(context).assetTransferError2}');
                } else if (_receiveAddress.trim() == wallet.tronAddress) {
                  Util.showToast('${S.of(context).assetTransferError3}');
                } else if (_assetAmount.isEmpty) {
                  Util.showToast('${S.of(context).assetTransferError4}');
                } else if (double.parse(_assetAmount) <= 0.0) {
                  Util.showToast('${S.of(context).assetTransferError5}');
                } else if (double.parse(_assetAmount) >
                    assetList[index].balance) {
                  Util.showToast('${S.of(context).assetTransferError6}');
                } else {
                  _showPwdDialog(context, wallet.tronAddress, wallet.pwd,
                      assetList[index]);
                }
              }
            },
            shape: StadiumBorder(side: BorderSide(color: Util.themeColor)),
          ),
        ),
      ),
    );
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
                      '${S.of(context).assetTransfer} ',
                      style: Util.textStyle(context, 2,
                          color: Colors.grey[850], spacing: 0.0, size: 30),
                    ),
                  ),
                  Container(
                    child: Text(
                      '$_assetAmount ${item.name} ',
                      style: Util.textStyle4Num(context,
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
                          fillColor: Colors.white,
                        ),
                        style: Util.textStyle4Num(context,
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
                            return '${S.of(context).commonError1}';
                          } else if (value.length < 6) {
                            return '${S.of(context).commonError2}';
                          } else if (value.substring(0, 6) != userPwd) {
                            return '${S.of(context).commonError3}';
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
                    '${S.of(context).commonCancel}',
                    style: Util.textStyle(context, 2,
                        color: Util.themeColor, spacing: 0.5, size: 30),
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!transferLoading) {
                      Navigator.of(context)..pop();
                    } else {
                      Util.showToast('${S.of(context).assetTransferTip3}');
                    }
                  },
                ),
                FlatButton(
                    child: Text(
                      '${S.of(context).commonConfirm}',
                      style: Util.textStyle(context, 2,
                          color: Util.themeColor, spacing: 0.5, size: 30),
                    ),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (_sendFormKey.currentState.validate()) {
                        _sendFormKey.currentState.save();
                        if (_sendPwd.trim() != userPwd) {
                          Util.showToast('${S.of(context).commonError3}');
                        } else {
                          if (transferLoading) {
                            Util.showToast(
                                '${S.of(context).assetTransferTip4}');
                          } else {
                            Util.showToast(
                                '${S.of(context).assetTransferTip3}');
                            _transHandle(context, item, ownerAddress)
                                .then((result) {
                              if (result == 0) {
                                setState(() {
                                  transferLoading = false;
                                });
                                Navigator.of(context)..pop()..pop();
                                Util.showToast(
                                    '${S.of(context).assetTransferSuccess}');
                              } else if (result == 1) {
                                Navigator.of(context)..pop()..pop();
                                Util.showToast(
                                    '${S.of(context).assetTransferTip5}');
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
      bool result = await TronTransaction().transTrc20(
          context, item.address, ownerAddress, _receiveAddress, amount.toInt());
      return result ? 0 : 1;
    }
    return 0;
  }
}
