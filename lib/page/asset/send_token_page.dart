import 'package:fixnum/fixnum.dart';
import 'package:flash_tron_wallet/common/color.dart';
import 'package:flash_tron_wallet/entity/tron/asset_entity.dart';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:flash_tron_wallet/tron/service/tron_transaction.dart';
import 'package:flash_tron_wallet/tron/service/tron_wallet.dart';
import 'package:flash_tron_wallet/util/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

import '../common_page.dart';

class SendTokenPage extends StatefulWidget {
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
          '转账',
          style: Util.textStyle(context, 2, Colors.grey[900], spacing: 0.2, size: 32),
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
        child: SendTokenSubPage(),
      ),
    );
  }
}


class SendTokenSubPage extends StatefulWidget {
  @override
  _SendTokenSubPageState createState() => _SendTokenSubPageState();
}

class _SendTokenSubPageState extends State<SendTokenSubPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _receiveAddressController = new TextEditingController();

  String _receiveAddress;

  final TextEditingController _assetAmountController = new TextEditingController();


  String _assetAmount;

  final _sendFormKey = GlobalKey<FormState>();

  String _sendPwd;

  bool transferLoading;


  @override
  void initState() {
    super.initState();
    transferLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    bool assetFilterShowHide = Provider.of<HomeProvider>(context).assetFilterShowHide;
    List<AssetEntity> assetFilterConList = Provider.of<HomeProvider>(context).assetList;
    int selectAssetFilterIndex = Provider.of<HomeProvider>(context).selectAssetFilterIndex;
    return Container(
      child: ListView(
        children: <Widget>[
          IntervalPage(ScreenUtil().setHeight(25)),
          _sendWidget(context),
          IntervalPage(ScreenUtil().setHeight(25)),
          _receiveWidget(context),
          IntervalPage(ScreenUtil().setHeight(25)),
          _amountWidget(context, assetFilterConList, selectAssetFilterIndex),
          _balanceWidget(context),
          IntervalPage(ScreenUtil().setHeight(25)),
          SizedBox(height: ScreenUtil().setHeight(120)),
          _submitButtonWidget(context),
        ],
      ),
    );
  }

  Widget _sendWidget(BuildContext context) {
    String tronAddress = Provider.of<HomeProvider>(context).tronAddress;
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(25), right: ScreenUtil().setWidth(40), bottom: ScreenUtil().setHeight(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '转出地址',
              style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(15)),
          Container(
            child: Text(
              '$tronAddress',
              style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.0, size: 27),
            ),
          ),
        ],
      ),
    );
  }

  Widget _receiveWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(25), right: ScreenUtil().setWidth(40), bottom: ScreenUtil().setHeight(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '收款地址',
              style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(15)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    '输入或粘贴钱包地址',
                    style: Util.textStyle(context, 2, Colors.grey[500], spacing: 0.2, size: 27),
                  ),
                ),
                Container(
                  child: Image.asset(
                    'icons/scan.png',
                    width: ScreenUtil().setWidth(45),
                    height: ScreenUtil().setWidth(45),
                    color: Colors.grey[850],
                    fit: BoxFit.fill,
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
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(25), right: ScreenUtil().setWidth(40)),
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '转账数量',
              style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(15)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    '输入转出金额',
                    style: Util.textStyle(context, 2, Colors.grey[500], spacing: 0.2, size: 27),
                  ),
                ),
                Container(
                  child: Text(
                    '最大',
                    style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 27),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _balanceWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(25), right: ScreenUtil().setWidth(40), bottom: ScreenUtil().setHeight(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              '余额',
              style: Util.textStyle(context, 2, Colors.grey[850], spacing: 0.2, size: 26),
            ),
          ),
          Container(
            child: Text(
              '4711.432  TRX',
              style: Util.textStyle(context, 2, Colors.grey[800], spacing: 0.2, size: 26),
            ),
          ),
        ],
      ),
    );
  }


  Widget _submitButtonWidget(BuildContext context) {
    List<AssetEntity> assetList = Provider.of<HomeProvider>(context).assetList;
    int index = Provider.of<HomeProvider>(context).selectAssetFilterIndex;
    String ownerAddress = Provider.of<HomeProvider>(context).tronAddress;
    String userPwd = Provider.of<HomeProvider>(context).pwd;
    return Container(
      child: Align(
        child: SizedBox(
          width: ScreenUtil().setWidth(350),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                  '发送',
                style: Util.textStyle(context, 1, Colors.white, spacing: 0.6, size: 31),
              ),
            ),
            color: Colors.blue[800],
            onPressed:() {
              FocusScope.of(context).requestFocus(FocusNode());
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                if (_receiveAddress.isEmpty) {
                  Util.showToast('接收地址不能为空');
                } else if (!TronWallet().checkTronAddress(_receiveAddress.trim())) {
                  Util.showToast('接收地址格式不正确');
                } else if (_receiveAddress.trim() == ownerAddress) {
                  Util.showToast('接收地址和发送地址不能相同');
                } else if (_assetAmount.isEmpty) {
                  Util.showToast('转账数量不能为空');
                } else if (double.parse(_assetAmount) <= 0.0) {
                  Util.showToast('转账数量需大于0');
                } else
                if (double.parse(_assetAmount) > assetList[index].balance) {
                  Util.showToast('转账数量不足');
                } else {
                  _showPwdDialog(context, ownerAddress, userPwd, assetList[index]);
                }
              }
            },
            shape: StadiumBorder(side: BorderSide(color: Colors.blue[800])),
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
              title: Text('转账$_assetAmount${item.name}，请输入密码', style: TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.grey[800]),),
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
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        validator: (String value) {
                          if (value.isEmpty) {
                            return '密码不能为空';
                          }
                          else if (value.length < 6) {
                            return '密码为6位';
                          } else if (value.substring(0, 6) != userPwd) {
                            return '密码错误';
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
                  child: Text('取消', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!transferLoading) {
                      Navigator.of(context)..pop();
                    } else {
                      Util.showToast('转账处理中...');
                    }
                  },
                ),
                FlatButton(
                    child: Text('确定', style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.blue[800]),),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (_sendFormKey.currentState.validate()){
                        _sendFormKey.currentState.save();
                        if (_sendPwd.trim() != userPwd) {
                          Util.showToast('密码错误');
                        } else {
                          if (transferLoading) {
                            Util.showToast('转账处理中，请勿重复操作');
                          } else {
                            Util.showToast('转账处理中...');
                            _transHandle(context, item, ownerAddress).then((result) {
                              if (result == 0) {
                                setState(() {
                                  transferLoading = false;
                                });
                                Navigator.of(context)..pop()..pop();
                                Util.showToast('转账成功');
                              } else if (result == 1) {
                                Navigator.of(context)..pop()..pop();
                                Util.showToast('转账失败，请稍后再试');
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
