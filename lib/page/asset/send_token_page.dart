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

class SendTokenPage extends StatefulWidget {
  @override
  _SendTokenPageState createState() => _SendTokenPageState();
}

class _SendTokenPageState extends State<SendTokenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightBg,
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        brightness: Brightness.light,
        title: Text(
          '转账',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: ScreenUtil().setSp(32),
            letterSpacing: 1.0,
            fontWeight: FontWeight.w600,
          ),
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
            color: Colors.grey[800],
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
      child: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(15),
              children: <Widget>[
                _sendWidget(context),
                SizedBox(height: ScreenUtil().setHeight(50)),
                _receiveWidget(context),
                SizedBox(height: ScreenUtil().setHeight(50)),
                Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        _selectAssetWidget(context, assetFilterShowHide, assetFilterConList, selectAssetFilterIndex),
                        SizedBox(height: ScreenUtil().setHeight(50)),
                        _amountWidget(context, assetFilterConList, selectAssetFilterIndex),
                        SizedBox(height: ScreenUtil().setHeight(100)),
                        _submitButton(context),
                      ],
                    ),
                    assetFilterShowHide ? Container() : _dropDownWidget(context, assetFilterConList, selectAssetFilterIndex),
                  ],

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sendWidget(BuildContext context) {
    String tronAddress = Provider.of<HomeProvider>(context).tronAddress;
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(600),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text(
              '发送地址',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Colors.grey[700],
              ),),
          ),
          Container(
            width: ScreenUtil().setWidth(600),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              color: Color(0x80EEEEEE),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 13, bottom: 13),
              child: Text(
                '$tronAddress',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenUtil().setSp(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _receiveWidget(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(600),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text(
                '接收地址',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: Colors.grey[700],
                )),
          ),
          Container(
            width: ScreenUtil().setWidth(600),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              color: Color(0x80EEEEEE),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              child: TextFormField(
                readOnly: !transferLoading ? false : true,
                controller: _receiveAddressController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(top: 13, bottom: 13),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.black87, fontSize: ScreenUtil().setSp(26),),
                onSaved: (String value) => _receiveAddress = value,
                maxLines: 1,
                inputFormatters: [
                  WhitelistingTextInputFormatter(RegExp("[a-zA-Z]|[0-9]")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectAssetWidget(BuildContext context, bool assetFilterShowHide, List<AssetEntity> assetFilterConList, int index) {
    bool flag = assetFilterConList.length == 0 ? true : false;
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(600),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text(
              '选择资产',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Colors.grey[700],
              ),),
          ),
          Container(
            width: ScreenUtil().setWidth(600),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            decoration: BoxDecoration(
              color: Color(0x80EEEEEE),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: InkWell(
              onTap: () {
                if (!transferLoading && assetFilterShowHide) {
                  Provider.of<HomeProvider>(context, listen: false).changeAssetFilterShowHide(false);
                } else {
                  Provider.of<HomeProvider>(context, listen: false).changeAssetFilterShowHide(true);
                }
              },
              child: Row(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(400),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      !flag ? '${assetFilterConList[index].name}' : '',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil().setSp(26),
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(150),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      assetFilterShowHide ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      size: ScreenUtil().setSp(45), color: Colors.black87,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _amountWidget(BuildContext context, List<AssetEntity> assetFilterConList, int index) {
    bool flag = assetFilterConList.length == 0 ? true : false;
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(600),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text(
              !flag ? '可转账数额  ${assetFilterConList[index].balance}' : '可转账数额',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Colors.black87,
              ),),
          ),
          Container(
            width: ScreenUtil().setWidth(600),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            decoration: BoxDecoration(
              color: Color(0x80EEEEEE),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(480),
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    readOnly: !transferLoading ? false : true,
                    controller: _assetAmountController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 13, bottom: 13),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.black87, fontSize: ScreenUtil().setSp(28),),
                    onSaved: (String value) => _assetAmount = value,
                    maxLines: 1,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [DoubleFormat()],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _assetAmountController.text = !flag ? assetFilterConList[index].balance.toString() : '';
                    });
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(70),
                    alignment: Alignment.centerRight,
                    child: Text('MAX', style: TextStyle(color: Colors.black87,
                        fontSize: ScreenUtil().setSp(28)),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropDownWidget(BuildContext context, List<AssetEntity> assetFilterConList, int selectAssetFilterIndex) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.fromLTRB(23, 88, 23, 0),
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(2.0),
        border: Border.all(color: Colors.black12, width: 0.3),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: assetFilterConList.length,
        itemBuilder: (context, index) {
          return _itemWidget(context, index, assetFilterConList[index], selectAssetFilterIndex);
        },
      ),
    );
  }

  Widget _itemWidget(BuildContext context, int index, AssetEntity item, int selectAssetFilterIndex) {
    bool flag = index == selectAssetFilterIndex ? true : false;
    String address = item.address;
    if (item.type == 0) {
      address = '';
    }
    if (item.type == 2) {
      address = address.substring(0, 4) + '****' + address.substring(address.length - 4, address.length);
    }
    return InkWell(
      onTap: () {
        Provider.of<HomeProvider>(context, listen: false).changeSelectAssetFilterIndex(index);
        Provider.of<HomeProvider>(context, listen: false).changeAssetFilterShowHide(true);
      },
      child: Container(
        width: ScreenUtil().setWidth(600),
        padding: EdgeInsets.only(top: 6, bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(130),
              padding: EdgeInsets.fromLTRB(10, 6, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                '${item.name}',
                style: TextStyle(
                  color: !flag ? Colors.black87 : Colors.blue[800],
                  fontSize: ScreenUtil().setSp(26),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(400),
              padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                address != '' ? '$address' : '',
                style: TextStyle(
                  color: !flag ? Colors.grey : Colors.blue[800],
                  fontSize: ScreenUtil().setSp(26),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(60),
              padding: EdgeInsets.fromLTRB(0, 6, 10, 0),
              alignment: Alignment.centerRight,
              child: !flag ? Container() : Icon(
                Icons.check,
                color: Colors.blue[800],
                size: ScreenUtil().setSp(30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    List<AssetEntity> assetList = Provider.of<HomeProvider>(context).assetList;
    int index = Provider.of<HomeProvider>(context).selectAssetFilterIndex;
    String ownerAddress = Provider.of<HomeProvider>(context).tronAddress;
    String userPwd = Provider.of<HomeProvider>(context).pwd;
    return Container(
      child: Align(
        child: SizedBox(
          width: ScreenUtil().setWidth(400),
          child: RaisedButton(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text('发送', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(31))),
            ),
            color: Colors.blue[900],
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
            shape: StadiumBorder(side: BorderSide(color: Colors.blue[900])),
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
