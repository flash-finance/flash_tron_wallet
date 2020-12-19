import 'dart:math';

import 'package:flash_tron_wallet/provider/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Util {
  //static const Color themeColor = Color(0xFF4D80E6);
  static const Color themeColor = Color(0xFF2676f8);

  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  static sp(double value) {
    return ScreenUtil().setSp(value);
  }

  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: Util.sp(25),
      backgroundColor: Colors.grey[850],
    );
  }

  static TextStyle textStyle(BuildContext context, int type,
      {Color color, double spacing, double size}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    double fontSize = size != null ? size : 20.0;
    bool langType = Provider.of<IndexProvider>(context, listen: false).langType;
    return langType
        ? TextStyle(
            fontFamily: type == 1 ? 'ZH-R' : 'ZH-M',
            letterSpacing: letterSpacing,
            color: color,
            fontSize: Util.sp(fontSize + 4),
          )
        : TextStyle(
            fontFamily: type == 1 ? 'EN-R' : 'EN-M',
            letterSpacing: 0.0,
            color: color,
            fontSize: Util.sp(fontSize + 1),
          );
  }

  static TextStyle textStyle4En(BuildContext context, int type,
      {Color color, double spacing, double size}) {
    double fontSize = size != null ? size : 20.0;
    return TextStyle(
      fontFamily: type == 1 ? 'EN-R' : 'EN-M',
      letterSpacing: 0.0,
      color: color,
      fontSize: Util.sp(fontSize + 1),
    );
  }

  static TextStyle textStyle4Zh(BuildContext context, int type,
      {Color color, double spacing, double size}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    double fontSize = size != null ? size : 23.0;
    return TextStyle(
      fontFamily: type == 1 ? 'ZH-R' : 'ZH-M',
      letterSpacing: letterSpacing,
      color: color,
      fontSize: Util.sp(fontSize + 4),
    );
  }

  static TextStyle textStyle4Num(BuildContext context,
      {Color color, double spacing, double size, FontWeight fontWeight}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    double fontSize = size != null ? size : 23.0;
    return GoogleFonts.roboto(
      letterSpacing: letterSpacing,
      color: color,
      fontWeight: fontWeight,
      fontSize: Util.sp(fontSize),
    );
  }

  static TextStyle textStyle4Index(BuildContext context, int type,
      {Color color, double spacing}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    bool langType = Provider.of<IndexProvider>(context, listen: false).langType;
    return langType
        ? TextStyle(
            fontFamily: type == 1 ? 'ZH-R' : 'ZH-M',
            letterSpacing: letterSpacing,
            color: color,
          )
        : TextStyle(
            fontFamily: type == 1 ? 'EN-R' : 'EN-M',
            letterSpacing: 0.0,
            color: color,
          );
  }

  static String formatNum(double num, int position) {
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        position) {
      return num.toStringAsFixed(position)
          .substring(0, num.toString().lastIndexOf(".") + position + 1)
          .toString();
    } else {
      return num.toString()
          .substring(0, num.toString().lastIndexOf(".") + position + 1)
          .toString();
    }
  }
}

class DoubleFormat extends TextInputFormatter {
  DoubleFormat({this.decimalRange = 6});

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String nValue = newValue.text;
    TextSelection nSelection = newValue.selection;

    Pattern p = RegExp(r'(\d+\.?)|(\.?\d+)|(\.?)');
    nValue = p
        .allMatches(nValue)
        .map<String>((Match match) => match.group(0))
        .join();

    if (nValue.startsWith('.')) {
      nValue = '0.';
    } else if (nValue.contains('.')) {
      if (nValue.substring(nValue.indexOf('.') + 1).length > decimalRange) {
        nValue = oldValue.text;
      } else {
        if (nValue.split('.').length > 2) {
          List<String> split = nValue.split('.');
          nValue = split[0] + '.' + split[1];
        }
      }
    }

    nSelection = newValue.selection.copyWith(
      baseOffset: min(nValue.length, nValue.length + 1),
      extentOffset: min(nValue.length, nValue.length + 1),
    );

    return TextEditingValue(
        text: nValue, selection: nSelection, composing: TextRange.empty);
  }
}
