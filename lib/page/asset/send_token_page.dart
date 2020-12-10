import 'package:fixnum/fixnum.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/page/common/common_page.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/router/application.dart';
import 'package:flash_tron_wallet/tron/service/tron_transaction.dart';
import 'package:flash_tron_wallet/tron/service/tron_wallet.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
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
      body: GestureDetector(
        onTap: (){
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
    _receiveAddressController =  TextEditingController.fromValue(TextEditingValue(text: _receiveAddress,
        selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: _receiveAddress.length))));
    _assetAmountController =  TextEditingController.fromValue(TextEditingValue(text: _assetAmount,
        selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: _receiveAddress.length))));

  }

  @override
  Widget build(BuildContext context) {
    List<AssetEntity> assetFilterConList = Provider.of<HomeProvider>(context, listen: true).assetList;
    int selectAssetFilterIndex = Provider.of<HomeProvider>(context, listen: true).selectAssetFilterIndex;
    WalletEntity wallet = Provider.of<HomeProvider>(context, listen: false).selectWalletEntity;
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            IntervalPage(ScreenUtil().setHeight(25)),
            _sendWidget(context,wallet),
            IntervalPage(ScreenUtil().setHeight(25)),
            _receiveWidget(context),
            IntervalPage(ScreenUtil().setHeight(25)),
            _amountWidget(context, assetFilterConList, selectAssetFilterIndex),
            _balanceWidget(context, assetFilterConList, selectAssetFilterIndex),
            IntervalPage(ScreenUtil().setHeight(25)),
            SizedBox(height: ScreenUtil().setHeight(120)),
            _submitWidget(context, wallet),
          ],
        ),
      ),
    );
  }

  Widget _sendWidget(BuildContext context, WalletEntity wallet) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(25), right: ScreenUtil().setWidth(40), bottom: ScreenUtil().setHeight(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '${S.of(context).assetTransferAddress}',
              style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(15)),
          Container(
            child: Text(
              '${wallet.tronAddress}',
              style: Util.textStyle4En(context, 2, Colors.grey[800], spacing: 0.0, size: 27),
            ),
          ),
        ],
      ),
    );
  }

  Widget _receiveWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(25), right: ScreenUtil().setWidth(40), bottom: ScreenUtil().setHeight(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '${S.of(context).assetReceivingAddress}',
              style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(5)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(600),
                  child: TextFormField(
                    controller: _receiveAddressController,
                    enableInteractiveSelection: false,
                    cursorColor: Colors.grey[850],
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '${S.of(context).assetTransferTip1}',
                      hintStyle: Util.textStyle(context, 1, Colors.grey[400], spacing: 0.2, size: 25),
                      border: InputBorder.none,
                    ),
                    style: Util.textStyle4En(context, 2, Colors.grey[850], spacing: 0.0, size: 28),
                    maxLines: 1,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]|[0-9]"))],
                    onSaved: (String value) => _receiveAddress = value,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Application.router.navigateTo(context, 'asset/qrScan/2', transition: TransitionType.fadeIn);
                  },
                  child: Container(
                    child: Icon(
                      IconData(0xe606, fontFamily: 'ICON'),
                      size: ScreenUtil().setSp(52),
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

  Widget _amountWidget(BuildContext context, List<AssetEntity> assetFilterConList, int index) {
    bool flag = assetFilterConList.length == 0 ? true : false;
    return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(25), right: ScreenUtil().setWidth(35)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width:ScreenUtil().setWidth(200),
                  child: Text(
                    '${S.of(context).assetTransferAmount}',
                    style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 26),
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
                            padding: EdgeInsets.only(top: ScreenUtil().setHeight(1.5)),
                            child: Text(
                              !flag ? '${assetFilterConList[index].name} ' : '',
                              style: Util.textStyle4En(context, 2, Colors.grey[850], spacing: 0.2, size: 26),
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: ScreenUtil().setSp(25),
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
          SizedBox(height: ScreenUtil().setHeight(10)),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), right: ScreenUtil().setWidth(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(500),
                  child: TextFormField(
                    controller: _assetAmountController,
                    enableInteractiveSelection: false,
                    cursorColor: Colors.grey[850],
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '${S.of(context).assetTransferTip2}',
                      hintStyle: Util.textStyle(context, 1, Colors.grey[400], spacing: 0.2, size: 25),
                      border: InputBorder.none,
                    ),
                    style: GoogleFonts.roboto(
                      letterSpacing: 0.2,
                      color: Colors.grey[850],
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(32),
                    ),
                    maxLines: 1,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [DoubleFormat(decimalRange: assetFilterConList[index].precision)],
                    onSaved: (String value) => _assetAmount = value,
                  ),
                ),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _assetAmount = !flag ? assetFilterConList[index].balance.toString() : '';
                    _assetAmountController.text = !flag ? assetFilterConList[index].balance.toString() : '';
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(80),
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(5), bottom: ScreenUtil().setHeight(5)),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Util.themeColor,
                    ),
                    child: Text(
                      '${S.of(context).commonMax}',
                      style: Util.textStyle(context, 2, Colors.white, spacing: 0.2, size: 20),
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

  Widget _balanceWidget(BuildContext context, List<AssetEntity> assetFilterConList, int index) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(25), right: ScreenUtil().setWidth(40), bottom: ScreenUtil().setHeight(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              '${S.of(context).assetBalance}',
              style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          Container(
            child: Text(
              '${assetFilterConList[index].balance}  ${assetFilterConList[index].name}',
              style: GoogleFonts.roboto(
                letterSpacing: 0.0,
                color: Colors.grey[850],
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(28),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        content: Container(
          width: ScreenUtil().setWidth(600),
          height: ScreenUtil().setHeight(500),
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(0)),
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
    int selectAssetFilterIndex = Provider.of<HomeProvider>(context, listen: true).selectAssetFilterIndex;
    bool flag = index == selectAssetFilterIndex;

    return InkWell(
      onTap: () {
        Provider.of<HomeProvider>(context, listen: false).changeSelectAssetFilterIndex(index);
        Navigator.pop(context);
        _assetAmountController.text = '';
      },
      child: Container(
        width: ScreenUtil().setWidth(600),
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(16), bottom: ScreenUtil().setHeight(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(300),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: Row(
                children: <Widget>[
                  Container(
                    child: ClipOval(
                      child: Image.network(
                        '${item.logoUrl}',
                        width: ScreenUtil().setWidth(40),
                        height: ScreenUtil().setWidth(40),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${item.name}',
                      style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 28),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(60),
              padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
              alignment: Alignment.centerRight,
              child: !flag ? Container() : Icon(
                Icons.check,
                color: Colors.grey[850],
                size: ScreenUtil().setSp(40),
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
          width: ScreenUtil().setWidth(320),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                  '${S.of(context).commonSend}',
                style: Util.textStyle(context, 1, Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color:  Util.themeColor,
            onPressed:() {
              FocusScope.of(context).requestFocus(FocusNode());
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (_receiveAddress.isEmpty) {
                  Util.showToast('${S.of(context).assetTransferError1}');
                } else if (!TronWallet().checkTronAddress(_receiveAddress.trim())) {
                  Util.showToast('${S.of(context).assetTransferError2}');
                } else if (_receiveAddress.trim() == wallet.tronAddress) {
                  Util.showToast('${S.of(context).assetTransferError3}');
                } else if (_assetAmount.isEmpty) {
                  Util.showToast('${S.of(context).assetTransferError4}');
                } else if (double.parse(_assetAmount) <= 0.0) {
                  Util.showToast('${S.of(context).assetTransferError5}');
                } else
                if (double.parse(_assetAmount) > assetList[index].balance) {
                  Util.showToast('${S.of(context).assetTransferError6}');
                } else {
                  _showPwdDialog(context, wallet.tronAddress, wallet.pwd, assetList[index]);
                }
              }
            },
            shape: StadiumBorder(side: BorderSide(color:  Util.themeColor)),
          ),
        ),
      ),
    );
  }


  void _showPwdDialog(BuildContext context, String ownerAddress, String userPwd, AssetEntity item) {
    showCupertinoDialog(
        context: context,
        builder: (context) =>
            CupertinoAlertDialog(
              title: Text(
                '转账$_assetAmount${item.name}，请输入密码',
                style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.0, size: 30),
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
                        obscureText: true,
                        maxLength: 6,
                        maxLengthEnforced: true,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                        validator: (String value) {
                          if (value.isEmpty) {
                            return '${S.of(context).commonError1}';
                          }
                          else if (value.length < 6) {
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
                    style: Util.textStyle(context, 2,  Util.themeColor, spacing: 0.5, size: 30),
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
                      style: Util.textStyle(context, 2,  Util.themeColor, spacing: 0.5, size: 30),
                    ),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (_sendFormKey.currentState.validate()){
                        _sendFormKey.currentState.save();
                        if (_sendPwd.trim() != userPwd) {
                          Util.showToast('${S.of(context).commonError3}');
                        } else {
                          if (transferLoading) {
                            Util.showToast('${S.of(context).assetTransferTip4}');
                          } else {
                            Util.showToast('${S.of(context).assetTransferTip3}');
                            _transHandle(context, item, ownerAddress).then((result) {
                              if (result == 0) {
                                setState(() {
                                  transferLoading = false;
                                });
                                Navigator.of(context)..pop()..pop();
                                Util.showToast('${S.of(context).assetTransferSuccess}');
                              } else if (result == 1) {
                                Navigator.of(context)..pop()..pop();
                                Util.showToast('${S.of(context).assetTransferTip5}');
                              } else if (result == -1) {
                                //Util.showToast('转账处理中，请勿重复操作');
                              }
                            });
                          }
                        }
                      }
                    }
                ),
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

  Future<int> _transHandle(BuildContext context, AssetEntity item, String ownerAddress) async {
    if (transferLoading) {
      return -1;
    }
    setState(() {
      transferLoading = true;
    });
    double amount = double.parse(_assetAmount) * _getPrecision(item.precision);
    if (item.type == 0) {
      bool result =  await TronTransaction().transTrx(context, ownerAddress, _receiveAddress, Int64(amount.toInt()));
      return result ? 0 : 1;
    } else if (item.type == 1) {
      bool result =  await TronTransaction().transTrc10(context, item.address, ownerAddress, _receiveAddress, Int64(amount.toInt()));
      return result ? 0 : 1;
    } else {
      bool result =  await TronTransaction().transTrc20(context, item.address, ownerAddress, _receiveAddress, amount.toInt());
      return result ? 0 : 1;
    }
  }

}
