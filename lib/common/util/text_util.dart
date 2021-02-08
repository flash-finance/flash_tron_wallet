import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextUtil {
  static TextStyle textStyle(int type,
      {Color color, double spacing, double size}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    double fontSize = size != null ? size : 20.0;
    bool langType = GlobalService.to.langType;
    return langType
        ? TextStyle(
            fontFamily: type == 1 ? 'ZH-R' : 'ZH-M',
            letterSpacing: letterSpacing,
            color: color,
            fontSize: MyScreenUtil.sp(fontSize + 4),
          )
        : TextStyle(
            fontFamily: type == 1 ? 'EN-R' : 'EN-M',
            letterSpacing: 0.0,
            color: color,
            fontSize: MyScreenUtil.sp(fontSize + 1),
          );
  }

  static TextStyle textStyle4En(int type,
      {Color color, double spacing, double size}) {
    double fontSize = size != null ? size : 20.0;
    return TextStyle(
      fontFamily: type == 1 ? 'EN-R' : 'EN-M',
      letterSpacing: 0.0,
      color: color,
      fontSize: MyScreenUtil.sp(fontSize + 1),
    );
  }

  static TextStyle textStyle4Zh(int type,
      {Color color, double spacing, double size}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    double fontSize = size != null ? size : 23.0;
    return TextStyle(
      fontFamily: type == 1 ? 'ZH-R' : 'ZH-M',
      letterSpacing: letterSpacing,
      color: color,
      fontSize: MyScreenUtil.sp(fontSize + 4),
    );
  }

  static TextStyle textStyle4Num(
      {Color color, double spacing, double size, FontWeight fontWeight}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    double fontSize = size != null ? size : 23.0;
    return GoogleFonts.roboto(
      letterSpacing: letterSpacing,
      color: color,
      fontWeight: fontWeight,
      fontSize: MyScreenUtil.sp(fontSize),
    );
  }

  static TextStyle textStyle4Index(int type, {Color color, double spacing}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    bool langType = GlobalService.to.langType;
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

  static TextStyle textStyle4Update(int type,
      {Color color, double spacing, double size}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    double fontSize = size != null ? size : 20.0;
    bool langType = GlobalService.to.langType;
    return langType
        ? TextStyle(
            fontFamily: type == 1 ? 'ZH-R' : 'ZH-M',
            letterSpacing: letterSpacing,
            color: color,
            fontSize: MyScreenUtil.sp(fontSize + 4),
            height: MyScreenUtil.sp(3.2),
          )
        : TextStyle(
            fontFamily: type == 1 ? 'EN-R' : 'EN-M',
            letterSpacing: 0.0,
            color: color,
            fontSize: MyScreenUtil.sp(fontSize + 1),
            height: MyScreenUtil.sp(3.2),
          );
  }
}
