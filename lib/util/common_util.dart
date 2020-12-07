import 'dart:math';

import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Util {

  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: ScreenUtil().setSp(25),
      backgroundColor: Colors.grey[850],
    );
  }

  static TextStyle textStyle(BuildContext context, int type, Color color, {double spacing, double size}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    double fontSize = size != null ? size : 23.0;
    bool langType = Provider.of<IndexProvider>(context, listen: false).langType;
    return langType ? TextStyle(
      fontFamily: type == 1 ? 'ZH-R' : 'ZH-M',
      letterSpacing: letterSpacing,
      color: color,
      fontSize: ScreenUtil().setSp(fontSize+2),
    ) : TextStyle(
      fontFamily: type == 1 ? 'EN-R' : 'EN-M',
      letterSpacing: 0.0,
      color: color,
      fontSize: ScreenUtil().setSp(fontSize+2),
    );
  }

  static String formatNumberSub(double num, int position) {
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) < position) {
      return num.toStringAsFixed(position).substring(0, num.toString().lastIndexOf(".") + position + 1).toString();
    } else {
      return num.toString().substring(0, num.toString().lastIndexOf(".") + position + 1).toString();
    }
  }
}

class DoubleFormat extends TextInputFormatter {

  DoubleFormat({this.decimalRange = 6});

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // 拿到录入后的字符
    String nValue = newValue.text;
    //当前所选择的文字区域
    TextSelection nSelection = newValue.selection;

    // 先来一波过滤，过滤出数字及小数点
    // 匹配包含数字和小数点的字符
    Pattern p = RegExp(r'(\d+\.?)|(\.?\d+)|(\.?)');
    nValue = p.allMatches(nValue)
        .map<String>((Match match) => match.group(0))
        .join();

    // 用匹配完的字符判断
    if (nValue.startsWith('.')) { //如果小数点开头，我们给他补个0
      nValue = '0.';
    } else if (nValue.contains('.')) {
      //来验证小数点位置
      if (nValue.substring(nValue.indexOf('.') + 1).length > decimalRange) {
        nValue = oldValue.text;
      } else {
        if (nValue.split('.').length > 2) { //多个小数点，去掉后面的
          List<String> split = nValue.split('.');
          nValue = split[0] + '.' + split[1];
        }
      }
    }

    //使光标定位到最后一个字符后面
    nSelection = newValue.selection.copyWith(
      baseOffset: min(nValue.length, nValue.length + 1),
      extentOffset: min(nValue.length, nValue.length + 1),
    );

    return TextEditingValue(
        text: nValue,
        selection: nSelection,
        composing: TextRange.empty
    );
  }
}