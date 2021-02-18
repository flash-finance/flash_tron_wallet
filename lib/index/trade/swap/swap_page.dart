import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:flash_tron_wallet/common/config/common_config.dart';
import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/http_util.dart';
import 'package:flash_tron_wallet/common/util/icon_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/entity/tron/wallet_entity.dart';
import 'package:flash_tron_wallet/index/trade/trade_controller.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/model/swap_model.dart';
import 'package:flash_tron_wallet/model/tron_info_model.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flash_tron_wallet/tron/service/tron_swap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwapPage extends StatefulWidget {
  @override
  _SwapPageState createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  TradeController _tronController;

  bool _langType = true;
  String _account = '';
  String _leftKey = '';
  String _rightKey = '';
  Timer _timer;

  bool _flag1 = false;
  bool _flag2 = false;

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
    if (_timer != null) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _tronController = Get.find<TradeController>();
    return Obx(() => _bodyWidget(context));
  }

  Widget _bodyWidget(BuildContext context) {
    initData();
    return Container(
      width: MyScreenUtil.width(750),
      color: MyColorUtil.white,
      child: Column(
        children: <Widget>[
          MyCommonUtil.sizedBox(height: 20),
          _topWidget(context),
          MyCommonUtil.sizedBox(height: 30),
          Expanded(
            child: _mainWidget(context),
          ),
        ],
      ),
    );
  }

  void initData() {
    _langType = GlobalService.to.langType;
    WalletEntity wallet = GlobalService.to.selectWalletEntity;
    if (wallet != null && wallet.tronAddress != null) {
      _account = wallet.tronAddress;
    }
    _balanceMap = GlobalService.to.balanceMap;
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
  }

  Widget _mainWidget(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          _bizWidget(context),
        ],
      ),
    );
  }

  Widget _topWidget(BuildContext context) {
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        image: DecorationImage(
          image: AssetImage('asset/image/bg01.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: MyCommonUtil.edge(top: 30, bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Flash  Swap',
                      style: MyTextUtil.textStyle4En(1,
                          color: MyColorUtil.white, spacing: 0.0, size: 37),
                    ),
                  ),
                  Container(
                    margin: MyCommonUtil.edge(top: 5),
                    child: Text(
                      '${MyLocaleKey.swapTips01.tr}',
                      style: MyTextUtil.textStyle(1,
                          color: MyColorUtil.white, spacing: 0.0, size: 20),
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
      margin: MyCommonUtil.edge(left: 30, right: 30),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Container(
        padding: MyCommonUtil.edge(top: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            MyCommonUtil.sizedBox(height: 50),
            _dataWidget(context),
            MyCommonUtil.sizedBox(height: 10),
            _poolWidget(context),
            MyCommonUtil.sizedBox(height: 50),
            _swapWidget(context),
            MyCommonUtil.sizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _dataWidget(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        _itemWidget(context, true),
        _dataMidWidget(context),
        _itemWidget(context, false),
      ],
    ));
  }

  Widget _itemWidget(BuildContext context, bool isLeft) {
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: MyCommonUtil.edge(left: 2),
                  child: Text(
                    isLeft
                        ? '${MyLocaleKey.swapSend.tr}'
                        : '${MyLocaleKey.swapReceive.tr}',
                    style: MyTextUtil.textStyle(2,
                        color: MyColorUtil.biz(), spacing: 0.0, size: 26),
                  ),
                ),
                Container(
                  padding: MyCommonUtil.edge(right: 2),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: isLeft
                              ? '${MyLocaleKey.swapBalance.tr}:  '
                              : '${MyLocaleKey.swapBalance.tr}:  ',
                          style: MyTextUtil.textStyle(
                            2,
                            color: MyColorUtil.subBiz(),
                            spacing: 0.0,
                            size: 26,
                          ),
                        ),
                        TextSpan(
                          text: isLeft
                              ? '${MyCommonUtil.formatNum(double.parse(_leftBalanceAmount), 4)}'
                              : '${MyCommonUtil.formatNum(double.parse(_rightBalanceAmount), 4)}',
                          style: MyTextUtil.textStyle4Num(
                            color: MyColorUtil.biz(),
                            spacing: 0.0,
                            size: 28,
                            fontWeight: FontWeight.w500,
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
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(width: 0.5, color: Colors.black12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    MyCommonUtil.bottomSheet(
                      context,
                      _tokenBottomSheetWidget(context, isLeft),
                    );
                  },
                  child: Container(
                    padding: MyCommonUtil.edge(top: 5, bottom: 5),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          MyCommonUtil.sizedBox(width: 15),
                          Container(
                            child: ClipOval(
                              child: _flag1
                                  ? Image.network(
                                      isLeft
                                          ? '${_swapRows[_tronController.swapLeftIndex].swapPicUrl}'
                                          : '${_swapRows[_tronController.swapRightIndex].swapPicUrl}',
                                      width: MyScreenUtil.width(42),
                                      height: MyScreenUtil.width(42),
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      width: MyScreenUtil.width(42),
                                      height: MyScreenUtil.width(42),
                                    ),
                            ),
                          ),
                          MyCommonUtil.sizedBox(width: 10),
                          Container(
                            width: MyScreenUtil.width(90),
                            alignment: Alignment.center,
                            child: Text(
                              _flag1
                                  ? isLeft
                                      ? '${_swapRows[_tronController.swapLeftIndex].swapTokenName}'
                                      : '${_swapRows[_tronController.swapRightIndex].swapTokenName}'
                                  : '',
                              style: MyTextUtil.textStyle4En(2,
                                  color: MyColorUtil.biz(),
                                  spacing: 0.0,
                                  size: 27),
                            ),
                          ),
                          MyCommonUtil.sizedBox(width: 5),
                          Container(
                            child: MyCommonUtil.icon(
                              MyIconUtil.arrowDropDown,
                              size: 35,
                              color: MyColorUtil.biz(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    width: MyScreenUtil.width(350),
                    padding: MyCommonUtil.edge(left: 20, top: 3, bottom: 3),
                    color: MyColorUtil.white,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      keyboardAppearance: Brightness.light,
                      controller: isLeft
                          ? _leftSwapAmountController
                          : _rightSwapAmountController,
                      enableInteractiveSelection: false,
                      cursorColor: MyColorUtil.biz(),
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle: TextStyle(),
                        border: InputBorder.none,
                      ),
                      style: MyTextUtil.textStyle4Num(
                        color: MyColorUtil.biz(),
                        size: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [DoubleFormat(decimalRange: 6)],
                      onChanged: (String value) {
                        isLeft ? _leftOnChange(value) : _rightOnChange(value);
                      },
                      onSaved: (String value) {},
                      onEditingComplete: () {},
                    )),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      isLeft ? _leftMax() : _rightMax();
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MyScreenUtil.height(3),
                          bottom: MyScreenUtil.height(3)),
                      alignment: Alignment.center,
                      child: Text(
                        'MAX',
                        style: MyTextUtil.textStyle4En(2,
                            color: MyColorUtil.biz(), spacing: 0.0, size: 25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MyCommonUtil.sizedBox(height: 10),
          _flag1 && _flag2
              ? Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: MyScreenUtil.width(5)),
                        child: Text(
                          isLeft
                              ? '1  ${_swapRows[_tronController.swapLeftIndex].swapTokenName} ≈ ${MyCommonUtil.formatNum(double.parse(_leftPrice), 4)}  ${_swapRows[_tronController.swapRightIndex].swapTokenName}'
                              : '1  ${_swapRows[_tronController.swapRightIndex].swapTokenName} ≈ ${MyCommonUtil.formatNum(double.parse(_rightPrice), 4)}  ${_swapRows[_tronController.swapLeftIndex].swapTokenName}',
                          style: MyTextUtil.textStyle4En(2,
                              color: MyColorUtil.subBiz(),
                              spacing: 0.0,
                              size: 21),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(right: MyScreenUtil.width(5)),
                        child: Text(
                          isLeft
                              ? ' ≈ ${MyCommonUtil.formatNum(_swapRows[_tronController.swapLeftIndex].swapTokenPrice2, 4)}  USD'
                              : ' ≈ ${MyCommonUtil.formatNum(_swapRows[_tronController.swapRightIndex].swapTokenPrice2, 4)}  USD',
                          style: MyTextUtil.textStyle4En(2,
                              color: MyColorUtil.subBiz(),
                              spacing: 0.0,
                              size: 21),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  alignment: Alignment.centerLeft,
                  padding: MyCommonUtil.edge(left: 5),
                  child: Text(
                    '1 USDT ≈ 1 USD',
                    style: MyTextUtil.textStyle4En(2,
                        color: MyColorUtil.white, spacing: 0.0, size: 21),
                  ),
                ),
        ],
      ),
    );
  }

  void _leftMax() {
    _leftSwapAmount =
        MyCommonUtil.formatNum(double.parse(_leftBalanceAmount), 6);
    double leftAmount = Decimal.tryParse(_leftBalanceAmount).toDouble();

    if (_flag1 && _flag2) {
      if (_balanceMap[_leftKey] != null) {
        _leftSwapValue = _balanceMap[_leftKey];
      }

      if (_swapRows[_tronController.swapRightIndex].swapTokenPrice1 > 0) {
        double rightAmount = leftAmount *
            _swapRows[_tronController.swapLeftIndex].swapTokenPrice1 /
            _swapRows[_tronController.swapRightIndex].swapTokenPrice1;
        _rightSwapAmount = MyCommonUtil.formatNum(rightAmount, 6);
        _rightSwapValue = (Decimal.tryParse(rightAmount.toString()) *
                Decimal.fromInt(10).pow(
                    _swapRows[_tronController.swapRightIndex]
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
  }

  void _leftOnChange(String value) {
    if (value != null && value != '' && double.parse(value) >= 0) {
      _leftSwapAmount = value;
      double leftAmount = Decimal.tryParse(_leftSwapAmount).toDouble();
      _leftSwapValue = (Decimal.tryParse(_leftSwapAmount) *
              Decimal.fromInt(10).pow(
                  _swapRows[_tronController.swapLeftIndex].swapTokenPrecision))
          .toStringAsFixed(0);

      if (_flag1 &&
          _flag2 &&
          _swapRows[_tronController.swapRightIndex].swapTokenPrice1 > 0) {
        double rightAmount = leftAmount *
            _swapRows[_tronController.swapLeftIndex].swapTokenPrice1 /
            _swapRows[_tronController.swapRightIndex].swapTokenPrice1;
        _rightSwapAmount = MyCommonUtil.formatNum(rightAmount, 6);
        _rightSwapValue = (Decimal.tryParse(rightAmount.toString()) *
                Decimal.fromInt(10).pow(
                    _swapRows[_tronController.swapRightIndex]
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
  }

  Widget _dataMidWidget(BuildContext context) {
    return Container(
      color: MyColorUtil.white,
      margin: MyCommonUtil.edge(top: 20, bottom: 0),
      child: InkWell(
          onTap: () {
            _midOnTap(context);
          },
          child: Container(
            color: MyColorUtil.white,
            alignment: Alignment.center,
            width: MyScreenUtil.width(150),
            child: MyCommonUtil.icon(
              MyIconUtil.sync,
              size: 45,
              color: MyColorUtil.biz().withOpacity(0.7),
            ),
          )),
    );
  }

  void _rightMax() {
    if (_flag1 && _flag2) {
      _rightSwapAmount =
          MyCommonUtil.formatNum(double.parse(_rightBalanceAmount), 6);
      double rightAmount = Decimal.tryParse(_rightBalanceAmount).toDouble();

      if (_flag1 && _flag2) {
        if (_balanceMap[_rightKey] != null) {
          _rightSwapValue = _balanceMap[_rightKey];
        }

        if (_swapRows[_tronController.swapLeftIndex].swapTokenPrice1 > 0) {
          double leftAmount = rightAmount *
              _swapRows[_tronController.swapRightIndex].swapTokenPrice1 /
              _swapRows[_tronController.swapLeftIndex].swapTokenPrice1;
          _leftSwapAmount = MyCommonUtil.formatNum(leftAmount, 4);
          _leftSwapValue = (Decimal.tryParse(leftAmount.toString()) *
                  Decimal.fromInt(10).pow(
                      _swapRows[_tronController.swapLeftIndex]
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
  }

  void _rightOnChange(String value) {
    if (value != null && value != '' && double.parse(value) >= 0) {
      _rightSwapAmount = value;
      double rightAmount = Decimal.tryParse(_rightSwapAmount).toDouble();
      _rightSwapValue = (Decimal.tryParse(_rightSwapAmount) *
              Decimal.fromInt(10).pow(
                  _swapRows[_tronController.swapRightIndex].swapTokenPrecision))
          .toStringAsFixed(0);

      if (_flag1 &&
          _flag2 &&
          _swapRows[_tronController.swapLeftIndex].swapTokenPrice1 > 0) {
        double leftAmount = rightAmount *
            _swapRows[_tronController.swapRightIndex].swapTokenPrice1 /
            _swapRows[_tronController.swapLeftIndex].swapTokenPrice1;
        _leftSwapAmount = MyCommonUtil.formatNum(leftAmount, 6);
        _leftSwapValue = (Decimal.tryParse(leftAmount.toString()) *
                Decimal.fromInt(10).pow(_swapRows[_tronController.swapLeftIndex]
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
  }

  Widget _poolWidget(BuildContext context) {
    return Container(
      margin: MyCommonUtil.edge(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () {
              if (_flag1 &&
                  _flag2 &&
                  (_swapRows[_tronController.swapLeftIndex].swapTokenType ==
                          1 ||
                      _swapRows[_tronController.swapRightIndex].swapTokenType ==
                          1)) {
                MyCommonUtil.bottomSheet(
                  context,
                  _poolTokenOneWidget(context),
                );
              } else if (_flag1 &&
                  _flag2 &&
                  (_swapRows[_tronController.swapLeftIndex].swapTokenType !=
                          1 &&
                      _swapRows[_tronController.swapRightIndex].swapTokenType !=
                          1)) {
                MyCommonUtil.bottomSheet(
                  context,
                  _poolTokenTwoWidget(context),
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyColorUtil.theme,
                borderRadius: BorderRadius.circular(6),
              ),
              padding:
                  MyCommonUtil.edge(left: 18, right: 18, top: 8, bottom: 8),
              child: Text(
                '${MyLocaleKey.swapPooledTokens.tr}',
                style: MyTextUtil.textStyle(1,
                    color: MyColorUtil.white, spacing: 0.0, size: 21),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _midOnTap(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    int temp11 = _tronController.swapLeftIndex;
    int temp12 = _tronController.swapRightIndex;
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
    _tronController.changeSwapLeftIndex(temp12);
    _tronController.changeSwapRightIndex(temp11);
  }

  Widget _poolTokenOneWidget(BuildContext context) {
    return Container(
      height: MyScreenUtil.height(460),
      alignment: Alignment.center,
      padding: MyCommonUtil.edge(left: 40, right: 40, top: 30, bottom: 30),
      margin: MyCommonUtil.edge(bottom: 25),
      child: ListView(
        children: <Widget>[
          _poolItemWidget(
            context,
            '${_swapRows[_tronController.swapLeftIndex].swapTokenName}/${_swapRows[_tronController.swapRightIndex].swapTokenName}',
            _swapRows[_tronController.swapLeftIndex].swapTokenType == 2
                ? '${_swapRows[_tronController.swapLeftIndex].totalLiquidity.toStringAsFixed(0)}'
                : '${_swapRows[_tronController.swapRightIndex].totalLiquidity.toStringAsFixed(0)}',
            '${_swapRows[_tronController.swapLeftIndex].swapPicUrl}',
            _swapRows[_tronController.swapLeftIndex].swapTokenType == 2
                ? '${_swapRows[_tronController.swapLeftIndex].swapTokenAmount.toStringAsFixed(0)}'
                : '${_swapRows[_tronController.swapRightIndex].baseTokenAmount.toStringAsFixed(0)}',
            '  ${_swapRows[_tronController.swapLeftIndex].swapTokenName}',
            '${_swapRows[_tronController.swapRightIndex].swapPicUrl}',
            _swapRows[_tronController.swapLeftIndex].swapTokenType == 2
                ? '${_swapRows[_tronController.swapLeftIndex].baseTokenAmount.toStringAsFixed(0)}'
                : '${_swapRows[_tronController.swapRightIndex].swapTokenAmount.toStringAsFixed(0)}',
            '  ${_swapRows[_tronController.swapRightIndex].swapTokenName}',
          )
        ],
      ),
    );
  }

  Widget _poolTokenTwoWidget(BuildContext context) {
    return Container(
      height: MyScreenUtil.height(860),
      alignment: Alignment.center,
      padding: MyCommonUtil.edge(left: 40, right: 40, top: 30, bottom: 30),
      margin: MyCommonUtil.edge(bottom: 25),
      child: ListView(
        children: <Widget>[
          _poolItemWidget(
            context,
            '${_swapRows[_tronController.swapLeftIndex].swapTokenName}/${_swapRows[_tronController.swapLeftIndex].baseTokenName}',
            '${_swapRows[_tronController.swapLeftIndex].totalLiquidity.toStringAsFixed(0)}',
            '${_swapRows[_tronController.swapLeftIndex].swapPicUrl}',
            '${_swapRows[_tronController.swapLeftIndex].swapTokenAmount.toStringAsFixed(0)}',
            '  ${_swapRows[_tronController.swapLeftIndex].swapTokenName}',
            '${_swapRows[_tronController.swapLeftIndex].basePicUrl}',
            '${_swapRows[_tronController.swapLeftIndex].baseTokenAmount.toStringAsFixed(0)}',
            '  ${_swapRows[_tronController.swapLeftIndex].baseTokenName}',
          ),
          MyCommonUtil.sizedBox(height: 30),
          _poolItemWidget(
            context,
            '${_swapRows[_tronController.swapRightIndex].baseTokenName}/${_swapRows[_tronController.swapRightIndex].swapTokenName}',
            '${_swapRows[_tronController.swapRightIndex].totalLiquidity.toStringAsFixed(0)}',
            '${_swapRows[_tronController.swapRightIndex].basePicUrl}',
            '${_swapRows[_tronController.swapRightIndex].baseTokenAmount.toStringAsFixed(0)}',
            '  ${_swapRows[_tronController.swapRightIndex].baseTokenName}',
            '${_swapRows[_tronController.swapRightIndex].swapPicUrl}',
            '${_swapRows[_tronController.swapRightIndex].swapTokenAmount.toStringAsFixed(0)}',
            '  ${_swapRows[_tronController.swapRightIndex].swapTokenName}',
          ),
        ],
      ),
    );
  }

  Widget _poolItemWidget(
      BuildContext context,
      String title,
      String usdValue,
      String pic1,
      String value1,
      String name1,
      String pic2,
      String value2,
      String name2) {
    return Column(
      children: <Widget>[
        Container(
          padding: MyCommonUtil.edge(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  '$title',
                  style: MyTextUtil.textStyle4En(2,
                      color: MyColorUtil.biz(), spacing: 0.0, size: 30),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: MyCommonUtil.edge(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${MyLocaleKey.swapTotalLiquidity.tr}',
                  style: MyTextUtil.textStyle(2,
                      color: MyColorUtil.subBiz(), spacing: 0.2, size: 26),
                ),
              ),
              MyCommonUtil.sizedBox(height: 15),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: ClipOval(
                        child: Image.asset(
                          'asset/image/usd.png',
                          width: MyScreenUtil.width(38),
                          height: MyScreenUtil.width(38),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: MyCommonUtil.edge(left: 15),
                      child: Text(
                        '$usdValue',
                        style: MyTextUtil.textStyle4Num(
                          color: MyColorUtil.biz(),
                          size: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Container(
                      child: Text(
                        '  USD',
                        style: MyTextUtil.textStyle4En(2,
                            color: MyColorUtil.biz(), spacing: 0.2, size: 28),
                      ),
                    ),
                  ],
                ),
              ),
              MyCommonUtil.sizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${MyLocaleKey.swapToken.tr}',
                  style: MyTextUtil.textStyle(2,
                      color: MyColorUtil.subBiz(), spacing: 0.2, size: 26),
                ),
              ),
              MyCommonUtil.sizedBox(height: 15),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: ClipOval(
                        child: Image.network(
                          '$pic1',
                          width: MyScreenUtil.width(35),
                          height: MyScreenUtil.width(35),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: MyCommonUtil.edge(left: 15),
                      child: Text(
                        '$value1',
                        style: MyTextUtil.textStyle4Num(
                          color: MyColorUtil.biz(),
                          size: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Container(
                      child: Text(
                        '  $name1',
                        style: MyTextUtil.textStyle4En(2,
                            color: MyColorUtil.biz(), spacing: 0.0, size: 28),
                      ),
                    ),
                  ],
                ),
              ),
              MyCommonUtil.sizedBox(height: 15),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: ClipOval(
                        child: Image.network(
                          '$pic2',
                          width: MyScreenUtil.width(35),
                          height: MyScreenUtil.width(35),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: MyCommonUtil.edge(left: 15),
                      child: Text(
                        '$value2',
                        style: MyTextUtil.textStyle4Num(
                          color: MyColorUtil.biz(),
                          size: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Container(
                      child: Text(
                        '  $name2',
                        style: MyTextUtil.textStyle4En(2,
                            color: MyColorUtil.biz(), spacing: 0.2, size: 28),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _swapWidget(BuildContext context) {
    return Container(
      child: Align(
        child: SizedBox(
          width: _langType ? MyScreenUtil.width(320) : MyScreenUtil.width(350),
          child: RaisedButton(
            child: Container(
              padding:
                  MyCommonUtil.edge(left: 10, right: 10, top: 18, bottom: 18),
              child: !_loadFlag
                  ? Text(
                      _swapFlag
                          ? '${MyLocaleKey.swapSwap.tr}'
                          : '${MyLocaleKey.swapTokenNotEnough.tr}',
                      style: MyTextUtil.textStyle(1,
                          color: MyColorUtil.white, spacing: 0.6, size: 28),
                    )
                  : Container(
                      child: CupertinoActivityIndicator(),
                    ),
            ),
            color: MyColorUtil.theme,
            onPressed: _swapOnPressed(),
            shape: StadiumBorder(side: BorderSide(color: MyColorUtil.theme)),
          ),
        ),
      ),
    );
  }

  Function _swapOnPressed() {
    return () async {
      try {
        if (_account != '' && _flag1 && _flag2 && _swapFlag) {
          double value1 = double.parse(_leftSwapValue);
          double value2 = double.parse(_rightSwapValue);
          if (value1 > 0 && value2 > 0) {
            setState(() {
              _loadFlag = true;
            });
            String tronGrpcIP = GlobalService.to.tronGrpcIP;
            String userAddress = _account;
            String flashSwapAddress = GlobalService.to.swapAddress;

            WalletEntity wallet = GlobalService.to.selectWalletEntity;
            String privateKey = '';
            if (wallet != null && wallet.privateKey != null) {
              privateKey = wallet.privateKey;
            }

            if (_swapRows[_tronController.swapLeftIndex].swapTokenType == 2) {
              String swapTokenAddress =
                  _swapRows[_tronController.swapLeftIndex].swapTokenAddress;
              String lpTokenAddress =
                  _swapRows[_tronController.swapLeftIndex].lpTokenAddress;
              String tokensSold = _leftSwapValue;

              String targetTokenAddress =
                  _swapRows[_tronController.swapRightIndex].swapTokenAddress;

              int baseTokenType =
                  _swapRows[_tronController.swapRightIndex].swapTokenType;
              String allowanceAmount = await TronSwap().allowance(
                  tronGrpcIP, userAddress, swapTokenAddress, flashSwapAddress);
              if (allowanceAmount == '') {
                MyCommonUtil.showToast('${MyLocaleKey.swapTip1.tr}');
                return;
              }
              double allowanceValue =
                  Decimal.tryParse(allowanceAmount).toDouble();
              double swapValue = double.parse(_leftSwapValue);
              if (swapValue > allowanceValue) {
                bool approveFlag = await TronSwap().approve(
                    tronGrpcIP,
                    userAddress,
                    privateKey,
                    swapTokenAddress,
                    flashSwapAddress);
                if (!approveFlag) {
                  MyCommonUtil.showToast('${MyLocaleKey.swapTip1.tr}');
                  return;
                }
              }
              if (_account != '' && baseTokenType == 1) {
                /// tokenToTrxSwap
                bool result = await TronSwap().tokenToTrxSwap(
                    tronGrpcIP,
                    userAddress,
                    privateKey,
                    flashSwapAddress,
                    swapTokenAddress,
                    lpTokenAddress,
                    tokensSold);
                if (result) {
                  MyCommonUtil.showToast('${MyLocaleKey.swapSuccess.tr}');
                } else {
                  MyCommonUtil.showToast('${MyLocaleKey.swapTip1.tr}');
                }
                return;
              } else if (_account != '' && baseTokenType == 2) {
                /// tokenToTokenSwap
                bool result = await TronSwap().tokenToTokenSwap(
                    tronGrpcIP,
                    userAddress,
                    privateKey,
                    flashSwapAddress,
                    swapTokenAddress,
                    lpTokenAddress,
                    tokensSold,
                    targetTokenAddress);
                if (result) {
                  MyCommonUtil.showToast('${MyLocaleKey.swapSuccess.tr}');
                } else {
                  MyCommonUtil.showToast('${MyLocaleKey.swapTip1.tr}');
                }
                return;
              }
            } else if (_swapRows[_tronController.swapLeftIndex].swapTokenType ==
                    1 &&
                _swapRows[_tronController.swapRightIndex].swapTokenType == 2) {
              String swapTokenAddress =
                  _swapRows[_tronController.swapRightIndex].swapTokenAddress;
              String lpTokenAddress =
                  _swapRows[_tronController.swapRightIndex].lpTokenAddress;
              String trxSold = _leftSwapValue;

              /// trxToTokenSwap
              bool result = await TronSwap().trxToTokenSwap(
                  tronGrpcIP,
                  userAddress,
                  privateKey,
                  flashSwapAddress,
                  swapTokenAddress,
                  lpTokenAddress,
                  trxSold);
              if (result) {
                MyCommonUtil.showToast('${MyLocaleKey.swapSuccess.tr}');
              } else {
                MyCommonUtil.showToast('${MyLocaleKey.swapTip1.tr}');
              }
              return;
            }
          }
        }
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          _loadFlag = false;
          _leftSwapAmount = '';
          _leftSwapValue = '';
          _rightSwapAmount = '';
          _rightSwapValue = '';
        });
        List<TokenRows> tokenList = GlobalService.to.tokenList;
        for (int i = 0; i < 5; i++) {
          await Future.delayed(Duration(milliseconds: 1000), () {
            if (_swapRows[_tronController.swapLeftIndex].swapTokenType == 1 &&
                tokenList.length > _tronController.swapLeftIndex) {
              GlobalService.to.getTrxBalance4Async(
                  _account, tokenList[_tronController.swapLeftIndex]);
            }
            if (_swapRows[_tronController.swapLeftIndex].swapTokenType == 2 &&
                tokenList.length > _tronController.swapLeftIndex) {
              GlobalService.to.getTrc20Balance4Async(
                  _account, tokenList[_tronController.swapLeftIndex]);
            }
            if (_swapRows[_tronController.swapRightIndex].swapTokenType == 1 &&
                tokenList.length > _tronController.swapRightIndex) {
              GlobalService.to.getTrxBalance4Async(
                  _account, tokenList[_tronController.swapRightIndex]);
            }
            if (_swapRows[_tronController.swapRightIndex].swapTokenType == 2 &&
                tokenList.length > _tronController.swapRightIndex) {
              GlobalService.to.getTrc20Balance4Async(
                  _account, tokenList[_tronController.swapRightIndex]);
            }
            GlobalService.to.getTrxBalance4Async(_account, tokenList[0]);
          });
        }
      }
    };
  }

  Widget _tokenBottomSheetWidget(BuildContext context, bool isLeft) {
    return Container(
      height: MyScreenUtil.height(800),
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
                        context, index, _swapRows[index], isLeft);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectTokenTitleWidget(BuildContext context) {
    return Container(
      padding: MyCommonUtil.edge(left: 40, right: 40, top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MyScreenUtil.width(200),
            child: Text(
              '${MyLocaleKey.swapName.tr}',
              style: MyTextUtil.textStyle(2,
                  color: MyColorUtil.subBiz(), spacing: 0.2, size: 24),
            ),
          ),
          Container(
            width: MyScreenUtil.width(250),
            alignment: Alignment.centerLeft,
            child: Text(
              '${MyLocaleKey.swapMarketPrice.tr}（\$）',
              style: MyTextUtil.textStyle(2,
                  color: MyColorUtil.subBiz(), spacing: 0.2, size: 24),
            ),
          ),
          Container(
            width: MyScreenUtil.width(140),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: MyScreenUtil.width(3)),
            child: Text(
              '${MyLocaleKey.swapChange.tr}',
              style: MyTextUtil.textStyle(2,
                  color: MyColorUtil.subBiz(), spacing: 0.2, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectTokenItemWidget(
      BuildContext context, int index, SwapRow item, isLeft) {
    bool flag = false;
    if (isLeft) {
      flag = index == _tronController.swapLeftIndex ? true : false;
    } else {
      flag = index == _tronController.swapRightIndex ? true : false;
    }
    double change = item.swapTokenChange2 * 100;
    return InkWell(
      onTap: () async {
        if (isLeft && index != _tronController.swapRightIndex) {
          print('1111');
          _leftSwapAmount = '';
          _leftSwapValue = '';
          _rightSwapAmount = '';
          _rightSwapValue = '';
          _reloadSub(index, _tronController.swapRightIndex);
          setState(() {});
          Navigator.pop(context);
          await _tronController.changeSwapLeftIndex(index);
        } else if (index != _tronController.swapLeftIndex) {
          print('222');
          _leftSwapAmount = '';
          _leftSwapValue = '';
          _rightSwapAmount = '';
          _rightSwapValue = '';
          _reloadSub(_tronController.swapLeftIndex, index);
          setState(() {});
          Navigator.pop(context);
          await _tronController.changeSwapRightIndex(index);
        }
      },
      child: Container(
        padding: MyCommonUtil.edge(left: 40, right: 40, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: flag ? MyColorUtil.theme.withOpacity(0.10) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MyScreenUtil.width(200),
              child: Text(
                '${item.swapTokenName}',
                style: MyTextUtil.textStyle4En(2,
                    color: isLeft
                        ? (index != _tronController.swapRightIndex
                            ? MyColorUtil.biz()
                            : Colors.grey[400])
                        : (index != _tronController.swapLeftIndex
                            ? MyColorUtil.biz()
                            : Colors.grey[400]),
                    spacing: 0.0,
                    size: 27),
              ),
            ),
            Container(
              width: MyScreenUtil.width(250),
              alignment: Alignment.centerLeft,
              child: Text(
                '${item.swapTokenPrice2}',
                style: MyTextUtil.textStyle4Num(
                    color: isLeft
                        ? (index != _tronController.swapRightIndex
                            ? MyColorUtil.biz()
                            : Colors.grey[400])
                        : (index != _tronController.swapLeftIndex
                            ? MyColorUtil.biz()
                            : Colors.grey[400]),
                    spacing: 0.0,
                    size: 28,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: MyScreenUtil.width(140),
              padding:
                  MyCommonUtil.edge(left: 13, right: 13, top: 14, bottom: 14),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: change >= 0 ? Color(0xFF05B791) : Color(0xFFF6465D),
              ),
              child: Text(
                change >= 0
                    ? '+${change.toStringAsFixed(2)}%'
                    : '${change.toStringAsFixed(2)}%',
                style: MyTextUtil.textStyle4Num(
                    color: MyColorUtil.white,
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

  SwapData _swapData;

  List<SwapRow> _swapRows = [];

  bool _reloadSwapDataFlag = false;

  Map<String, String> _balanceMap = Map<String, String>();

  _reloadSwapData() async {
    _getSwapData();
    _timer = Timer.periodic(Duration(milliseconds: 2000), (timer) async {
      bool backgroundFlag = GlobalService.to.backgroundFlag;
      if (!backgroundFlag && _reloadSwapDataFlag) {
        _getSwapData();
      }
    });
  }

  void _getSwapData() async {
    _reloadSwapDataFlag = false;
    try {
      String url = CommonConfig.servicePath[CommonConfig.swapQueryUrl];
      await HttpUtil.get(url).then((value) {
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
      _reloadSub(_tronController.swapLeftIndex, _tronController.swapRightIndex);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print(e);
    } finally {
      _reloadSwapDataFlag = true;
    }
  }

  void _reloadSub(int _leftSelectIndex, int _rightSelectIndex) {
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
}
