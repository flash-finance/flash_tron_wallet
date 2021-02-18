import 'dart:math';

import 'package:flash_tron_wallet/common/enum/text_type.dart';
import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyCommonUtil {
  static isLightTheme() {
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
      textColor: isLightTheme() ? Colors.white : MyColorUtil.biz(),
      fontSize: MyScreenUtil.sp(25),
      backgroundColor: isLightTheme() ? MyColorUtil.biz() : Colors.white,
    );
  }

  static bottomBorder() {
    return Border(
        bottom: BorderSide(color: MyColorUtil.dividerLine(), width: 0.5));
  }

  static edge({double left, double right, double top, double bottom}) {
    left = left ?? 0;
    right = right ?? 0;
    top = top ?? 0;
    bottom = bottom ?? 0;
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

  static flatButton(String name, Function onPressed) {
    return FlatButton(
      child: Text(
        '$name',
        style: MyTextUtil.textStyle(2,
            color: MyColorUtil.theme, spacing: 0.5, size: 30),
      ),
      onPressed: onPressed,
    );
  }

  static arrowForward() {
    return Container(
      child: Icon(
        Icons.arrow_forward_ios,
        size: MyScreenUtil.sp(27),
        color: MyColorUtil.subBiz(),
      ),
    );
  }

  static defaultLoading({double top, double bottom}) {
    return Container(
      margin: MyCommonUtil.edge(top: top ?? 0, bottom: bottom ?? 0),
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  static submit(
      BuildContext context, double width, String name, Function onPressed) {
    return Container(
      child: Align(
        child: SizedBox(
          width: MyScreenUtil.width(width ?? 320),
          child: RaisedButton(
            child: Container(
              padding:
                  MyCommonUtil.edge(left: 10, right: 10, top: 18, bottom: 18),
              child: Text(
                '$name',
                style: MyTextUtil.textStyle(1,
                    color: MyColorUtil.white, spacing: 0.6, size: 31),
              ),
            ),
            color: MyColorUtil.theme,
            onPressed: onPressed,
            shape: StadiumBorder(side: BorderSide(color: MyColorUtil.theme)),
          ),
        ),
      ),
    );
  }

  static interval({double value}) {
    return Container(
      height: MyScreenUtil.height(value ?? 20),
      color: MyColorUtil.secondary(),
    );
  }

  static icon(IconData iconData, {double size, color}) {
    return Icon(
      iconData,
      size: MyScreenUtil.sp(size ?? 32),
      color: color ?? MyColorUtil.subBiz(),
    );
  }

  static textFormField({
    bool readOnly,
    bool obscureText,
    Widget suffixIcon,
    Function onSaved,
    int maxLine,
    int maxLength,
    List<TextInputFormatter> inputFormatter,
    TextInputType keyboardType,
    String labelText,
    TextType textType = TextType.normal,
    Function validator,
  }) {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      onSaved: onSaved,
      maxLines: maxLine ?? 1,
      maxLength: maxLength ?? 0,
      inputFormatters: inputFormatter ?? [],
      keyboardType: keyboardType,
      cursorColor: MyColorUtil.theme,
      decoration: InputDecoration(
        labelText: '$labelText',
        labelStyle: MyTextUtil.textStyle(
          2,
          color: MyColorUtil.biz(),
          spacing: 0.1,
          size: 26,
        ),
        suffixIcon: suffixIcon,
      ),
      style: textType == TextType.normal
          ? MyTextUtil.textStyle(2,
              color: MyColorUtil.biz(), spacing: 0.2, size: 30)
          : textType == TextType.onlyEn
              ? MyTextUtil.textStyle4En(2,
                  color: MyColorUtil.biz(), spacing: 0.0, size: 28)
              : MyTextUtil.textStyle4Num(
                  color: MyColorUtil.biz(),
                  spacing: 0.2,
                  size: 32,
                  //fontWeight: FontWeight.w500,
                ),
      validator: validator,
    );
  }

  static bottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        builder: (BuildContext context) {
          return child;
        });
  }

  static tabBar({
    List<Widget> tabs,
    TabController controller,
    Color indicatorColor,
    Color labelColor,
    Color unselectedLabelColor,
    Function onTap,
  }) {
    return TabBar(
      controller: controller,
      indicatorPadding: MyCommonUtil.edge(bottom: 15),
      indicatorColor: indicatorColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: MyTextUtil.textStyle(2, spacing: 0.2, size: 32),
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      indicatorWeight: 2.0,
      tabs: tabs,
      onTap: onTap,
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

  static double getPrecision(int precision) {
    double result = 1;
    double baseValue = 10;
    for (int i = 0; i < precision; i++) {
      result = result * baseValue;
    }
    return result;
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
