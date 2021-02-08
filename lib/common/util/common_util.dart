import 'dart:math';

import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyCommonUtil {
  static flag() {
    int themeModeValue = GlobalService.to.themeModeValue;
    print('flag: $themeModeValue');
    return themeModeValue == 0;
  }

  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      textColor: flag() ? Colors.white : Colors.grey[850],
      fontSize: MyScreenUtil.sp(25),
      backgroundColor: flag() ? Colors.grey[850] : Colors.white,
    );
  }

  static bottomBorder() {
    return Border(
        bottom: BorderSide(color: MyColorUtil.bottomBorder(), width: 0.5));
  }

  static edge({double left, double right, double top, double bottom}) {
    left = left ?? 30;
    right = right ?? 30;
    top = top ?? 30;
    bottom = bottom ?? 30;
    return EdgeInsets.only(
      left: MyScreenUtil.width(left),
      right: MyScreenUtil.width(right),
      top: MyScreenUtil.height(top),
      bottom: MyScreenUtil.height(bottom),
    );
  }

  static sizedBox({double width, double height}) {
    return SizedBox(
      width: MyScreenUtil.width(width ?? 0),
      height: MyScreenUtil.height(height ?? 0),
    );
  }

  static arrowForward() {
    return Container(
      child: Icon(
        Icons.arrow_forward_ios,
        size: MyScreenUtil.sp(27),
        color: Colors.grey[700],
      ),
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
