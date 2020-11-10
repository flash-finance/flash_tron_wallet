import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Util {

  //static const Color greenColor = Colors.teal;
  //static const Color redColor = Color(0xffC15466);
  static const Color greenColor = Color(0xE6009688);
  static const Color redColor = Color(0xF5C15466);


  static const Color greenColor4Kline = Color(0xE6009688);
  static const Color redColor4Kline = Color(0xF5C15466);
  static const Color greyColor4Kline = Color(0xff60738E);


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

  static String removeDecimalZeroFormat(double x){
    int i = x.truncate() ;
    if(x == i){
      return i.toString();
    }
    return x.toString();
  }

  static String formatNumber4CN(double n) {
    if (n >= 10000 && n < 100000000) {
      double d = n / 10000;
      return '${formatNumberSub(d, 3)}万';
    } else if (n >= 100000000) {
      double d = n / 100000000;
      return '${formatNumberSub(d, 3)}亿';
    }
    return formatNumberSub(n, 3);
  }

  static String formatNumber(double n, position) {
    if (n >= 1000 && n < 1000000) {
      double d = n / 1000;
      return '${formatNumberSub(d, position)}K';
    } else if (n >= 1000000 && n < 1000000000) {
      double d = n / 1000000;
      return '${formatNumberSub(d, position)}M';
    } else if (n >= 1000000000) {
      double d = n / 1000000000;
      return '${formatNumberSub(d, position)}B';
    }
    return formatNumberSub(n, position);
  }


  static String formatNumberSub(double num, int position) {
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) < position) {
      return num.toStringAsFixed(position).substring(0, num.toString().lastIndexOf(".") + position + 1).toString();
    } else {
      return num.toString().substring(0, num.toString().lastIndexOf(".") + position + 1).toString();
    }
  }

  static int integerRange = 8;
  static int decimalRange = 6;

  static String repData4Trade(String oldValue, String nValue) {
    Pattern p = RegExp(r'(\d+\.?)|(\.?\d+)|(\.?)');
    nValue = p.allMatches(nValue).map<String>((Match match) => match.group(0)).join();
    // 用匹配完的字符判断
    if (nValue.startsWith('.')) { //如果小数点开头，我们给他补个0
      nValue = '0.';
    } else if (nValue.contains('.')) {
      //来验证小数点位置
      if (nValue.substring(nValue.indexOf('.') + 1).length > decimalRange) {
        nValue = oldValue;
      } else {
        if (nValue.split('.').length > 2) { //多个小数点，去掉后面的
          List<String> split = nValue.split('.');
          nValue = split[0] + '.' + split[1];
        }
      }

      if (nValue.split('.').length >= 2) {
        List<String> split = nValue.split('.');
        String integer = split[0];
        String decimal = split[1];
        if (split[0].length > integerRange) {
          integer = split[0].substring(0, integerRange);
        }
        if (split[1].length > decimalRange) {
          decimal = split[1].substring(0, decimalRange);
        }
        nValue = integer + "." + decimal;
      }

    } else {
      if (nValue.length > integerRange) {
        nValue = nValue.substring(0, integerRange);
      }
    }
    return nValue;
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

class DoubleFormat4Trade extends TextInputFormatter {

  DoubleFormat4Trade({this.integerRange = 8, this.decimalRange = 6});

  final int integerRange;

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
    nValue = p.allMatches(nValue).map<String>((Match match) => match.group(0)).join();

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

      if (nValue.split('.').length >= 2) {
        List<String> split = nValue.split('.');
        String integer = split[0];
        String decimal = split[1];
        if (split[0].length > integerRange) {
          integer = split[0].substring(0, integerRange);
        }
        if (split[1].length > decimalRange) {
          decimal = split[1].substring(0, decimalRange);
        }
        nValue = integer + "." + decimal;
      }

    } else {
      if (nValue.length > integerRange) {
        nValue = nValue.substring(0, integerRange);
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