import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:flash_tron_wallet/common/common_config.dart';
import 'package:flash_tron_wallet/common/common_service.dart';
import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flash_tron_wallet/model/swap_model.dart';
import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwapPage extends StatefulWidget {
  @override
  _SwapPageState createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {
  bool _langType = true;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  String _account = '';
  String _leftKey = '';
  String _rightKey = '';
  bool _tronFlag = false;
  Timer _timer1;
  Timer _timer2;
  Timer _timer3;

  bool _flag1 = false;
  bool _flag2 = false;

  int _leftSelectIndex = 0;
  int _rightSelectIndex = 1;

  String _leftPrice = '0.0';
  String _rightPrice = '0.0';
  String _leftBalanceAmount = '0.0';
  String _rightBalanceAmount = '0.0';

  String _leftSwapAmount = '';
  String _rightSwapAmount = '';

  String _leftSwapValue = '0';
  String _rightSwapValue = '0';

  TextEditingController _leftSwapAmountController;
  TextEditingController _rightSwapAmountController;

  bool _swapFlag = true;

  bool _loadFlag = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reloadSwapData();
    });
  }

  @override
  void dispose() {
    print('SwapPcPage dispose');
    if (_timer1 != null) {
      if (_timer1.isActive) {
        _timer1.cancel();
      }
    }
    if (_timer2 != null) {
      if (_timer2.isActive) {
        _timer2.cancel();
      }
    }
    if (_timer3 != null) {
      if (_timer3.isActive) {
        _timer3.cancel();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _langType = Provider.of<IndexProvider>(context, listen: true).langType;
    _leftSwapAmountController = TextEditingController.fromValue(
        TextEditingValue(
            text: _leftSwapAmount,
            selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: _leftSwapAmount.length))));
    _rightSwapAmountController = TextEditingController.fromValue(
        TextEditingValue(
            text: _rightSwapAmount,
            selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: _rightSwapAmount.length))));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(Util.height(0)),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _mainWidget(context),
        ],
      ),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return Container(
      width: Util.width(750),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(height: Util.height(20)),
          _topWidget(context),
          SizedBox(height: Util.height(30)),
          Expanded(
            child: _bodyWidget(context),
          ),
        ],
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      width: Util.width(750),
      child: ListView(
        children: <Widget>[
          _bizWidget(context),
        ],
      ),
    );
  }

  Widget _topWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        image: DecorationImage(
          image: AssetImage('images/bg01.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                  top: Util.height(30), bottom: Util.height(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Flash  Swap',
                      style: Util.textStyle4En(context, 1,
                          color: Colors.white, spacing: 0.0, size: 37),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Util.height(5)),
                    child: Text(
                      '${S.of(context).swapTips01}',
                      style: Util.textStyle(context, 1,
                          color: Colors.white, spacing: 0.0, size: 20),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _bizWidget(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Container(
        padding: EdgeInsets.only(top: Util.height(20), bottom: Util.height(20)),
        child: Column(
          children: <Widget>[
            SizedBox(height: Util.height(50)),
            _dataWidget(context),
            SizedBox(height: Util.height(10)),
            _poolWidget(context),
            SizedBox(height: Util.height(50)),
            _swapWidget(context),
            SizedBox(height: Util.height(50)),
          ],
        ),
      ),
    );
  }

  Widget _dataWidget(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        _dataLeftWidget(context),
        SizedBox(height: Util.height(0)),
        _dataMidWidget(context),
        SizedBox(height: Util.height(0)),
        _dataRightWidget(context),
      ],
    ));
  }

  Widget _dataLeftWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: Util.width(2)),
                  child: Text(
                    '${S.of(context).swapSend}',
                    style: Util.textStyle(context, 2,
                        color: Colors.grey[800], spacing: 0.0, size: 26),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: Util.width(2)),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${S.of(context).swapBalance}:  ',
                          style: Util.textStyle(context, 2,
                              color: Colors.grey[600], spacing: 0.0, size: 26),
                        ),
                        TextSpan(
                          text:
                              '${Util.formatNum(double.parse(_leftBalanceAmount), 4)}',
                          style: Util.textStyle4Num(context,
                              color: Colors.grey[800],
                              spacing: 0.0,
                              size: 28,
                              fontWeight: FontWeight.w500),
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
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(width: 0.5, color: Colors.black12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    //_showSwapTokenDialLog(context, 1);
                    _showBottomSheetWidget(context, 1);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Util.height(5), bottom: Util.height(5)),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: Util.width(15)),
                          Container(
                            child: ClipOval(
                              child: _flag1
                                  ? Image.network(
                                      '${_swapRows[_leftSelectIndex].swapPicUrl}',
                                      width: Util.width(42),
                                      height: Util.width(42),
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      width: Util.width(42),
                                      height: Util.width(42),
                                    ),
                            ),
                          ),
                          SizedBox(width: Util.width(10)),
                          Container(
                            width: Util.width(90),
                            alignment: Alignment.center,
                            child: Text(
                              _flag1
                                  ? '${_swapRows[_leftSelectIndex].swapTokenName}'
                                  : '',
                              style: Util.textStyle4En(context, 2,
                                  color: Colors.grey[800],
                                  spacing: 0.0,
                                  size: 27),
                            ),
                          ),
                          SizedBox(width: Util.width(5)),
                          Container(
                            child: Icon(Icons.arrow_drop_down,
                                size: Util.sp(35), color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    width: Util.width(350),
                    padding: EdgeInsets.only(
                        left: Util.width(20),
                        top: Util.height(3),
                        bottom: Util.height(3)),
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: _leftSwapAmountController,
                      enableInteractiveSelection: false,
                      cursorColor: Colors.grey[850],
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle: TextStyle(),
                        border: InputBorder.none,
                      ),
                      style: Util.textStyle4Num(context,
                          color: Colors.grey[800],
                          size: 30,
                          fontWeight: FontWeight.w500),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [DoubleFormat(decimalRange: 6)],
                      onChanged: (String value) {
                        if (value != null &&
                            value != '' &&
                            double.parse(value) >= 0) {
                          _leftSwapAmount = value;
                          double leftAmount =
                              Decimal.tryParse(_leftSwapAmount).toDouble();
                          _leftSwapValue = (Decimal.tryParse(_leftSwapAmount) *
                                  Decimal.fromInt(10).pow(
                                      _swapRows[_leftSelectIndex]
                                          .swapTokenPrecision))
                              .toStringAsFixed(0);

                          if (_flag1 &&
                              _flag2 &&
                              _swapRows[_rightSelectIndex].swapTokenPrice1 >
                                  0) {
                            double rightAmount = leftAmount *
                                _swapRows[_leftSelectIndex].swapTokenPrice1 /
                                _swapRows[_rightSelectIndex].swapTokenPrice1;
                            _rightSwapAmount = Util.formatNum(rightAmount, 6);
                            _rightSwapValue =
                                (Decimal.tryParse(rightAmount.toString()) *
                                        Decimal.fromInt(10).pow(
                                            _swapRows[_rightSelectIndex]
                                                .swapTokenPrecision))
                                    .toStringAsFixed(0);

                            if (leftAmount > double.parse(_leftBalanceAmount)) {
                              _swapFlag = false;
                            } else {
                              _swapFlag = true;
                            }
                            setState(() {});
                          }
                        } else {
                          _leftSwapAmount = '';
                          _leftSwapValue = '';
                          _rightSwapAmount = '';
                          _rightSwapValue = '';
                          _swapFlag = true;
                          setState(() {});
                        }
                      },
                      onSaved: (String value) {},
                      onEditingComplete: () {},
                    )),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _leftSwapAmount =
                          Util.formatNum(double.parse(_leftBalanceAmount), 6);
                      double leftAmount =
                          Decimal.tryParse(_leftBalanceAmount).toDouble();

                      if (_flag1 && _flag2) {
                        if (_balanceMap[_leftKey] != null) {
                          _leftSwapValue = _balanceMap[_leftKey];
                        }

                        if (_swapRows[_rightSelectIndex].swapTokenPrice1 > 0) {
                          double rightAmount = leftAmount *
                              _swapRows[_leftSelectIndex].swapTokenPrice1 /
                              _swapRows[_rightSelectIndex].swapTokenPrice1;
                          _rightSwapAmount = Util.formatNum(rightAmount, 6);
                          _rightSwapValue =
                              (Decimal.tryParse(rightAmount.toString()) *
                                      Decimal.fromInt(10).pow(
                                          _swapRows[_rightSelectIndex]
                                              .swapTokenPrecision))
                                  .toStringAsFixed(0);

                          if (leftAmount > double.parse(_leftBalanceAmount)) {
                            _swapFlag = false;
                          } else {
                            _swapFlag = true;
                          }
                          setState(() {});
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Util.height(3), bottom: Util.height(3)),
                      alignment: Alignment.center,
                      child: Text(
                        'MAX',
                        style: Util.textStyle4En(context, 2,
                            color: Colors.grey[800], spacing: 0.0, size: 25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Util.height(10)),
          _flag1 && _flag2
              ? Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: Util.width(5)),
                        child: Text(
                          '1  ${_swapRows[_leftSelectIndex].swapTokenName} ≈ ${Util.formatNum(double.parse(_leftPrice), 4)}  ${_swapRows[_rightSelectIndex].swapTokenName}',
                          style: Util.textStyle4En(context, 2,
                              color: Colors.grey[600], spacing: 0.0, size: 21),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(right: Util.width(5)),
                        child: Text(
                          ' ≈ ${Util.formatNum(_swapRows[_leftSelectIndex].swapTokenPrice2, 4)}  USD',
                          style: Util.textStyle4En(context, 2,
                              color: Colors.grey[600], spacing: 0.0, size: 21),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: Util.width(5)),
                  child: Text(
                    '1 USDT ≈ 1 USD',
                    style: Util.textStyle4En(context, 2,
                        color: Colors.white, spacing: 0.0, size: 21),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _dataMidWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: Util.height(20), bottom: Util.height(0)),
      child: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            int temp1 = _leftSelectIndex;
            _leftSelectIndex = _rightSelectIndex;
            _rightSelectIndex = temp1;

            String temp2 = _leftSwapAmount;
            _leftSwapAmount = _rightSwapAmount;
            _rightSwapAmount = temp2;
            String temp3 = _leftSwapValue;
            _leftSwapValue = _rightSwapValue;
            _rightSwapValue = temp3;

            String temp4 = _leftBalanceAmount;
            _leftBalanceAmount = _rightBalanceAmount;
            _rightBalanceAmount = temp4;

            String temp5 = _leftPrice;
            _leftPrice = _rightPrice;
            _rightPrice = temp5;

            if (_leftSwapAmount != '' && _leftBalanceAmount != '') {
              double value1 = double.parse(_leftSwapAmount);
              double value2 = double.parse(_leftBalanceAmount);
              if (value1 > value2) {
                _swapFlag = false;
              } else {
                _swapFlag = true;
              }
            }

            setState(() {});
          },
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Icon(
              Icons.sync_rounded,
              size: Util.sp(45),
              color: Colors.grey[700],
            ),
          )),
    );
  }

  Widget _dataRightWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: Util.width(2)),
                  child: Text(
                    '${S.of(context).swapReceive}',
                    style: Util.textStyle(context, 2,
                        color: Colors.grey[800], spacing: 0.0, size: 26),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: Util.width(2)),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${S.of(context).swapBalance}:  ',
                          style: Util.textStyle(context, 2,
                              color: Colors.grey[600], spacing: 0.0, size: 26),
                        ),
                        TextSpan(
                          text:
                              '${Util.formatNum(double.parse(_rightBalanceAmount), 4)}',
                          style: Util.textStyle4Num(context,
                              color: Colors.grey[800],
                              spacing: 0.0,
                              size: 28,
                              fontWeight: FontWeight.w500),
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
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(width: 0.5, color: Colors.black12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    //_showSwapTokenDialLog(context, 2);
                    _showBottomSheetWidget(context, 2);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Util.height(5), bottom: Util.height(5)),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: Util.width(15)),
                          Container(
                            child: ClipOval(
                              child: _flag2
                                  ? Image.network(
                                      '${_swapRows[_rightSelectIndex].swapPicUrl}',
                                      width: Util.width(42),
                                      height: Util.width(42),
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      width: Util.width(42),
                                      height: Util.width(42),
                                    ),
                            ),
                          ),
                          SizedBox(width: Util.width(10)),
                          Container(
                            width: Util.width(90),
                            alignment: Alignment.center,
                            child: Text(
                              _flag2
                                  ? '${_swapRows[_rightSelectIndex].swapTokenName}'
                                  : '',
                              style: Util.textStyle4En(context, 2,
                                  color: Colors.grey[800],
                                  spacing: 0.0,
                                  size: 27),
                            ),
                          ),
                          SizedBox(width: Util.width(5)),
                          Container(
                            child: Icon(Icons.arrow_drop_down,
                                size: Util.sp(35), color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    width: Util.width(350),
                    padding: EdgeInsets.only(
                        left: Util.width(20),
                        top: Util.height(3),
                        bottom: Util.height(3)),
                    color: Colors.white,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: _rightSwapAmountController,
                      enableInteractiveSelection: false,
                      cursorColor: Colors.grey[850],
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle: TextStyle(),
                        border: InputBorder.none,
                      ),
                      style: Util.textStyle4Num(context,
                          color: Colors.grey[800],
                          size: 30,
                          fontWeight: FontWeight.w500),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [DoubleFormat(decimalRange: 6)],
                      onChanged: (String value) {
                        if (value != null &&
                            value != '' &&
                            double.parse(value) >= 0) {
                          _rightSwapAmount = value;
                          double rightAmount =
                              Decimal.tryParse(_rightSwapAmount).toDouble();
                          _rightSwapValue =
                              (Decimal.tryParse(_rightSwapAmount) *
                                      Decimal.fromInt(10).pow(
                                          _swapRows[_rightSelectIndex]
                                              .swapTokenPrecision))
                                  .toStringAsFixed(0);

                          if (_flag1 &&
                              _flag2 &&
                              _swapRows[_leftSelectIndex].swapTokenPrice1 > 0) {
                            double leftAmount = rightAmount *
                                _swapRows[_rightSelectIndex].swapTokenPrice1 /
                                _swapRows[_leftSelectIndex].swapTokenPrice1;
                            _leftSwapAmount = Util.formatNum(leftAmount, 6);
                            _leftSwapValue =
                                (Decimal.tryParse(leftAmount.toString()) *
                                        Decimal.fromInt(10).pow(
                                            _swapRows[_leftSelectIndex]
                                                .swapTokenPrecision))
                                    .toStringAsFixed(0);

                            if (_balanceMap[_leftKey] != null &&
                                double.parse(_leftSwapValue) >
                                    double.parse(_balanceMap[_leftKey])) {
                              _swapFlag = false;
                            } else {
                              _swapFlag = true;
                            }
                            setState(() {});
                          }
                        } else {
                          _rightSwapAmount = '';
                          _rightSwapValue = '';
                          _leftSwapAmount = '';
                          _leftSwapValue = '';
                          _swapFlag = true;
                          setState(() {});
                        }
                      },
                      onSaved: (String value) {},
                      onEditingComplete: () {},
                    )),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (_flag1 && _flag2) {
                        _rightSwapAmount = Util.formatNum(
                            double.parse(_rightBalanceAmount), 6);
                        double rightAmount =
                            Decimal.tryParse(_rightBalanceAmount).toDouble();

                        if (_flag1 && _flag2) {
                          if (_balanceMap[_rightKey] != null) {
                            _rightSwapValue = _balanceMap[_rightKey];
                          }

                          if (_swapRows[_leftSelectIndex].swapTokenPrice1 > 0) {
                            double leftAmount = rightAmount *
                                _swapRows[_rightSelectIndex].swapTokenPrice1 /
                                _swapRows[_leftSelectIndex].swapTokenPrice1;
                            _leftSwapAmount = Util.formatNum(leftAmount, 4);
                            _leftSwapValue =
                                (Decimal.tryParse(leftAmount.toString()) *
                                        Decimal.fromInt(10).pow(
                                            _swapRows[_leftSelectIndex]
                                                .swapTokenPrecision))
                                    .toStringAsFixed(0);

                            if (_balanceMap[_leftKey] != null &&
                                double.parse(_leftSwapValue) >
                                    double.parse(_balanceMap[_leftKey])) {
                              _swapFlag = false;
                            } else {
                              _swapFlag = true;
                            }
                            setState(() {});
                          }
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Util.height(3), bottom: Util.height(3)),
                      alignment: Alignment.center,
                      child: Text(
                        'MAX',
                        style: Util.textStyle4En(context, 2,
                            color: Colors.grey[800], spacing: 0.0, size: 25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Util.height(10)),
          _flag1 && _flag2
              ? Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: Util.width(5)),
                        child: Text(
                          '1  ${_swapRows[_rightSelectIndex].swapTokenName} ≈ ${Util.formatNum(double.parse(_rightPrice), 4)}  ${_swapRows[_leftSelectIndex].swapTokenName}',
                          style: Util.textStyle4En(context, 2,
                              color: Colors.grey[600], spacing: 0.0, size: 21),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(right: Util.width(5)),
                        child: Text(
                          ' ≈ ${Util.formatNum(_swapRows[_rightSelectIndex].swapTokenPrice2, 4)}  USD',
                          style: Util.textStyle4En(context, 2,
                              color: Colors.grey[600], spacing: 0.0, size: 21),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: Util.width(5)),
                  child: Text(
                    '1 USDT ≈ 1 USD',
                    style: Util.textStyle4En(context, 2,
                        color: Colors.white, spacing: 0.0, size: 21),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _poolWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Util.width(30), right: Util.width(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () {
              if (_flag1 &&
                  _flag2 &&
                  (_swapRows[_leftSelectIndex].swapTokenType == 1 ||
                      _swapRows[_rightSelectIndex].swapTokenType == 1)) {
                _showPoolTokenOneDialLog(context);
              } else if (_flag1 &&
                  _flag2 &&
                  (_swapRows[_leftSelectIndex].swapTokenType != 1 &&
                      _swapRows[_rightSelectIndex].swapTokenType != 1)) {
                _showPoolTokenTwoDialLog(context);
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Util.themeColor,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: EdgeInsets.only(
                  left: Util.width(18),
                  top: Util.height(8),
                  bottom: Util.height(8),
                  right: Util.width(18)),
              child: Text(
                '${S.of(context).swapPooledTokens}',
                style: Util.textStyle(context, 1,
                    color: Colors.white, spacing: 0.0, size: 21),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showPoolTokenOneDialLog(BuildContext context) {
    showDialog(
      context: context,
      child: AlertDialog(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        content: Container(
          width: Util.width(600),
          height: Util.height(380),
          padding: EdgeInsets.only(top: Util.height(10)),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: Util.height(10), bottom: Util.height(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${_swapRows[_leftSelectIndex].swapTokenName}/${_swapRows[_rightSelectIndex].swapTokenName}',
                        style: Util.textStyle4En(context, 2,
                            color: Colors.grey[800], spacing: 0.0, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0),
              Container(
                padding: EdgeInsets.only(
                    left: Util.width(20),
                    top: Util.height(20),
                    bottom: Util.height(20),
                    right: Util.width(20)),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${S.of(context).swapTotalLiquidity}',
                        style: Util.textStyle(context, 2,
                            color: Colors.grey[700], spacing: 0.2, size: 26),
                      ),
                    ),
                    SizedBox(height: Util.height(15)),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: ClipOval(
                              child: Image.asset(
                                'images/usd.png',
                                width: Util.width(38),
                                height: Util.width(38),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: Util.width(15)),
                            child: Text(
                              _swapRows[_leftSelectIndex].swapTokenType == 2
                                  ? '${_swapRows[_leftSelectIndex].totalLiquidity.toStringAsFixed(0)}'
                                  : '${_swapRows[_rightSelectIndex].totalLiquidity.toStringAsFixed(0)}',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: Util.sp(26),
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Container(
                            child: Text(
                              '  USD',
                              style: Util.textStyle4En(context, 2,
                                  color: Colors.grey[800],
                                  spacing: 0.2,
                                  size: 26),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Util.height(40)),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${S.of(context).swapToken}',
                        style: Util.textStyle4En(context, 2,
                            color: Colors.grey[700], spacing: 0.2, size: 26),
                      ),
                    ),
                    SizedBox(height: Util.height(15)),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: ClipOval(
                              child: Image.network(
                                '${_swapRows[_leftSelectIndex].swapPicUrl}',
                                width: Util.width(35),
                                height: Util.width(35),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: Util.width(15)),
                            child: Text(
                              _swapRows[_leftSelectIndex].swapTokenType == 2
                                  ? '${_swapRows[_leftSelectIndex].swapTokenAmount.toStringAsFixed(0)}'
                                  : '${_swapRows[_rightSelectIndex].baseTokenAmount.toStringAsFixed(0)}',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: Util.sp(26),
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Container(
                            child: Text(
                              '  ${_swapRows[_leftSelectIndex].swapTokenName}',
                              style: Util.textStyle4En(context, 2,
                                  color: Colors.grey[800],
                                  spacing: 0.0,
                                  size: 26),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Util.height(15)),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: ClipOval(
                              child: Image.network(
                                '${_swapRows[_rightSelectIndex].swapPicUrl}',
                                width: Util.width(35),
                                height: Util.width(35),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: Util.width(15)),
                            child: Text(
                              _swapRows[_leftSelectIndex].swapTokenType == 2
                                  ? '${_swapRows[_leftSelectIndex].baseTokenAmount.toStringAsFixed(0)}'
                                  : '${_swapRows[_rightSelectIndex].swapTokenAmount.toStringAsFixed(0)}',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: Util.sp(26),
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Container(
                            child: Text(
                              '  ${_swapRows[_rightSelectIndex].swapTokenName}',
                              style: Util.textStyle4En(context, 2,
                                  color: Colors.grey[800],
                                  spacing: 0.2,
                                  size: 26),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showPoolTokenTwoDialLog(BuildContext context) {
    showDialog(
      context: context,
      child: AlertDialog(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: Container(
          width: Util.width(600),
          height: Util.height(700),
          padding: EdgeInsets.only(top: Util.height(10)),
          child: ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: Util.height(10), bottom: Util.height(0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              '${_swapRows[_leftSelectIndex].swapTokenName}/${_swapRows[_leftSelectIndex].baseTokenName}',
                              style: Util.textStyle4En(context, 2,
                                  color: Colors.grey[800],
                                  spacing: 0.0,
                                  size: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0),
                    Container(
                      padding: EdgeInsets.only(
                          left: Util.width(20),
                          top: Util.height(20),
                          bottom: Util.height(20),
                          right: Util.width(20)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${S.of(context).swapTotalLiquidity}',
                              style: Util.textStyle(context, 2,
                                  color: Colors.grey[700],
                                  spacing: 0.2,
                                  size: 26),
                            ),
                          ),
                          SizedBox(height: Util.height(15)),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'images/usd.png',
                                      width: Util.width(38),
                                      height: Util.width(38),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: Util.width(15)),
                                  child: Text(
                                    '${_swapRows[_leftSelectIndex].totalLiquidity.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: Util.sp(26),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '  USD',
                                    style: Util.textStyle4En(context, 2,
                                        color: Colors.grey[800],
                                        spacing: 0.0,
                                        size: 26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Util.height(20)),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${S.of(context).swapToken}',
                              style: Util.textStyle4En(context, 2,
                                  color: Colors.grey[700],
                                  spacing: 0.0,
                                  size: 26),
                            ),
                          ),
                          SizedBox(height: Util.height(15)),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: ClipOval(
                                    child: Image.network(
                                      '${_swapRows[_leftSelectIndex].swapPicUrl}',
                                      width: Util.width(35),
                                      height: Util.width(35),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: Util.width(15)),
                                  child: Text(
                                    '${_swapRows[_leftSelectIndex].swapTokenAmount.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: Util.sp(26),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '  ${_swapRows[_leftSelectIndex].swapTokenName}',
                                    style: Util.textStyle4En(context, 2,
                                        color: Colors.grey[800],
                                        spacing: 0.0,
                                        size: 26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Util.height(15)),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: ClipOval(
                                    child: Image.network(
                                      '${_swapRows[_leftSelectIndex].basePicUrl}',
                                      width: Util.width(35),
                                      height: Util.width(35),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: Util.width(15)),
                                  child: Text(
                                    '${_swapRows[_leftSelectIndex].baseTokenAmount.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: Util.sp(26),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '  ${_swapRows[_leftSelectIndex].baseTokenName}',
                                    style: Util.textStyle4En(context, 2,
                                        color: Colors.grey[800],
                                        spacing: 0.0,
                                        size: 26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Util.height(20)),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: Util.height(10), bottom: Util.height(0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              '${_swapRows[_rightSelectIndex].baseTokenName}/${_swapRows[_rightSelectIndex].swapTokenName}',
                              style: Util.textStyle4En(context, 2,
                                  color: Colors.grey[800],
                                  spacing: 0.0,
                                  size: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0),
                    Container(
                      padding: EdgeInsets.only(
                          left: Util.width(20),
                          top: Util.height(20),
                          bottom: Util.height(20),
                          right: Util.width(20)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${S.of(context).swapTotalLiquidity}',
                              style: Util.textStyle(context, 2,
                                  color: Colors.grey[700],
                                  spacing: 0.0,
                                  size: 26),
                            ),
                          ),
                          SizedBox(height: Util.height(15)),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'images/usd.png',
                                      width: Util.width(38),
                                      height: Util.width(38),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: Util.width(15)),
                                  child: Text(
                                    '${_swapRows[_rightSelectIndex].totalLiquidity.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: Util.sp(26),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '  USD',
                                    style: Util.textStyle4En(context, 2,
                                        color: Colors.grey[800],
                                        spacing: 0.0,
                                        size: 26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Util.height(20)),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${S.of(context).swapToken}',
                              style: Util.textStyle(context, 2,
                                  color: Colors.grey[700],
                                  spacing: 0.0,
                                  size: 26),
                            ),
                          ),
                          SizedBox(height: Util.height(15)),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: ClipOval(
                                    child: Image.network(
                                      '${_swapRows[_rightSelectIndex].basePicUrl}',
                                      width: Util.width(35),
                                      height: Util.width(35),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: Util.width(15)),
                                  child: Text(
                                    '${_swapRows[_rightSelectIndex].baseTokenAmount.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: Util.sp(26),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '  ${_swapRows[_rightSelectIndex].baseTokenName}',
                                    style: Util.textStyle4En(context, 2,
                                        color: Colors.grey[800],
                                        spacing: 0.0,
                                        size: 26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Util.height(15)),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: ClipOval(
                                    child: Image.network(
                                      '${_swapRows[_rightSelectIndex].swapPicUrl}',
                                      width: Util.width(35),
                                      height: Util.width(35),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: Util.width(15)),
                                  child: Text(
                                    '${_swapRows[_rightSelectIndex].swapTokenAmount.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: Util.sp(26),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '  ${_swapRows[_rightSelectIndex].swapTokenName}',
                                    style: Util.textStyle4En(context, 2,
                                        color: Colors.grey[800],
                                        spacing: 0.0,
                                        size: 26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _swapWidget(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Align(
          child: SizedBox(
            width: _langType ? Util.width(320) : Util.width(350),
            child: RaisedButton(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  _swapFlag
                      ? '${S.of(context).swapSwap}'
                      : '${S.of(context).swapTokenNotEnough}',
                  style: Util.textStyle(context, 1,
                      color: Colors.white, spacing: 0.6, size: 28),
                ),
              ),
              color: Util.themeColor,
              onPressed: () {
                //Navigator.pop(context);
              },
              shape: StadiumBorder(side: BorderSide(color: Util.themeColor)),
            ),
          ),
        ),
      ),
    );
  }

  SwapData _swapData;

  List<SwapRow> _swapRows = [];

  bool _reloadSwapDataFlag = false;

  var _balanceMap = Map<String, String>();

  _reloadSwapData() async {
    _getSwapData();
    _timer1 = Timer.periodic(Duration(milliseconds: 2000), (timer) async {
      if (_reloadSwapDataFlag) {
        _getSwapData();
      }
    });
  }

  void _getSwapData() async {
    _reloadSwapDataFlag = false;
    try {
      String url = servicePath['swapQuery'];
      await requestGet(url).then((value) {
        var respData = Map<String, dynamic>.from(value);
        SwapRespModel respModel = SwapRespModel.fromJson(respData);
        if (respModel != null && respModel.code == 0) {
          _swapData = respModel.data;
          if (_swapData != null &&
              _swapData.rows != null &&
              _swapData.rows.length > 0) {
            _swapRows = _swapData.rows;
          }
        }
      });
      _flag1 = _swapRows.length > 0 ? true : false;
      _flag2 = _swapRows.length > 1 ? true : false;
      _reloadSub();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
    _reloadSwapDataFlag = true;
  }

  void _reloadSub() {
    if (_flag1 && _flag2) {
      _leftKey = '$_account+${_swapRows[_leftSelectIndex].swapTokenAddress}';
      _rightKey = '$_account+${_swapRows[_rightSelectIndex].swapTokenAddress}';
    }

    if (_flag1 &&
        _flag2 &&
        _swapRows[_leftSelectIndex].swapTokenPrecision > 0 &&
        _balanceMap[_leftKey] != null) {
      _leftBalanceAmount = (Decimal.tryParse(_balanceMap[_leftKey]) /
              Decimal.fromInt(10)
                  .pow(_swapRows[_leftSelectIndex].swapTokenPrecision))
          .toString();
    }
    if (_flag1 &&
        _flag2 &&
        _swapRows[_rightSelectIndex].swapTokenPrecision > 0 &&
        _balanceMap[_rightKey] != null) {
      _rightBalanceAmount = (Decimal.tryParse(_balanceMap[_rightKey]) /
              Decimal.fromInt(10)
                  .pow(_swapRows[_rightSelectIndex].swapTokenPrecision))
          .toString();
    }

    if (_flag1 && _flag2 && _swapRows[_rightSelectIndex].swapTokenPrice1 > 0) {
      _leftPrice = (_swapRows[_leftSelectIndex].swapTokenPrice1 /
              _swapRows[_rightSelectIndex].swapTokenPrice1)
          .toString();
    }
    if (_flag1 && _flag2 && _swapRows[_leftSelectIndex].swapTokenPrice1 > 0) {
      _rightPrice = (_swapRows[_rightSelectIndex].swapTokenPrice1 /
              _swapRows[_leftSelectIndex].swapTokenPrice1)
          .toString();
    }
  }

  bool _reloadTokenBalanceFlag = false;

  _showBottomSheetWidget(BuildContext context, int type) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        //barrierColor: Colors.grey[850].withOpacity(0.98),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        )),
        builder: (BuildContext context) {
          return Container(
            height: Util.height(800),
            child: Column(
              children: <Widget>[
                _selectTokenTitleWidget(context),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: _swapRows.length,
                        itemBuilder: (context, index) {
                          return _selectTokenItemWidget(
                              context, index, _swapRows[index], type);
                        }),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _selectTokenTitleWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Util.width(40),
          right: Util.width(40),
          top: Util.height(20),
          bottom: Util.height(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: Util.width(200),
            child: Text(
              '${S.of(context).swapName}',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[500], spacing: 0.2, size: 22),
            ),
          ),
          Container(
            width: Util.width(250),
            alignment: Alignment.centerLeft,
            child: Text(
              '${S.of(context).swapMarketPrice}（\$）',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[500], spacing: 0.2, size: 22),
            ),
          ),
          Container(
            width: Util.width(140),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: Util.width(3)),
            child: Text(
              '${S.of(context).swapChange}',
              style: Util.textStyle(context, 2,
                  color: Colors.grey[500], spacing: 0.2, size: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectTokenItemWidget(
      BuildContext context, int index, SwapRow item, int type) {
    bool flag = false;
    if (type == 1) {
      flag = index == _leftSelectIndex ? true : false;
    } else if (type == 2) {
      flag = index == _rightSelectIndex ? true : false;
    }
    double change = item.swapTokenChange2 * 100;
    return InkWell(
      onTap: () {
        if (type == 1 && index != _rightSelectIndex) {
          _leftSelectIndex = index;
          _leftSwapAmount = '';
          _leftSwapValue = '';
          _rightSwapAmount = '';
          _rightSwapValue = '';
          //_reloadSub();
          setState(() {});
          Navigator.pop(context);
        } else if (type == 2 && index != _leftSelectIndex) {
          _rightSelectIndex = index;
          _leftSwapAmount = '';
          _leftSwapValue = '';
          _rightSwapAmount = '';
          _rightSwapValue = '';
          //_reloadSub();
          setState(() {});
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            left: Util.width(40),
            right: Util.width(40),
            top: Util.height(20),
            bottom: Util.height(20)),
        decoration: BoxDecoration(
          color: flag ? Util.themeColor.withOpacity(0.10) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: Util.width(200),
              child: Text(
                '${item.swapTokenName}',
                style: Util.textStyle4En(context, 2,
                    color: type == 1
                        ? (index != _rightSelectIndex
                            ? Colors.grey[850]
                            : Colors.grey[400])
                        : (index != _leftSelectIndex
                            ? Colors.grey[850]
                            : Colors.grey[400]),
                    spacing: 0.0,
                    size: 27),
              ),
            ),
            Container(
              width: Util.width(250),
              alignment: Alignment.centerLeft,
              child: Text(
                '${item.swapTokenPrice2}',
                style: Util.textStyle4Num(context,
                    color: type == 1
                        ? (index != _rightSelectIndex
                            ? Colors.grey[850]
                            : Colors.grey[400])
                        : (index != _leftSelectIndex
                            ? Colors.grey[850]
                            : Colors.grey[400]),
                    spacing: 0.0,
                    size: 28,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: Util.width(140),
              padding: EdgeInsets.only(
                  top: Util.height(14),
                  bottom: Util.height(14),
                  left: Util.width(13),
                  right: Util.width(13)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: change >= 0 ? Color(0xFF05B791) : Color(0xFFF6465D),
              ),
              child: Text(
                change >= 0
                    ? '+${change.toStringAsFixed(2)}%'
                    : '${change.toStringAsFixed(2)}%',
                style: Util.textStyle4Num(context,
                    color: Colors.white,
                    spacing: 0.0,
                    size: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
