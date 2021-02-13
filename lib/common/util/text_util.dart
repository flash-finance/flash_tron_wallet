import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextUtil {
  static String textRegular4Zh = 'ZH-R';
  static String textMedium4Zh = 'ZH-M';

  static String textRegular4En = 'EN-R';
  static String textMedium4En = 'EN-M';

  static TextStyle textStyle(int type,
      {Color color, double spacing, double size}) {
    double letterSpacing = spacing != null ? spacing : 0.0;
    double fontSize = size != null ? size : 20.0;
    bool langType = GlobalService.to.langType;
    return langType
        ? TextStyle(
            fontFamily: type == 1 ? textRegular4Zh : textMedium4Zh,
            letterSpacing: letterSpacing,
            color: color,
            fontSize: MyScreenUtil.sp(fontSize + 4),
          )
        : TextStyle(
            fontFamily: type == 1 ? textRegular4En : textMedium4En,
            letterSpacing: 0.0,
            color: color,
            fontSize: MyScreenUtil.sp(fontSize + 1),
          );
  }

  static TextStyle textStyle4En(int type,
      {Color color, double spacing, double size}) {
    return TextStyle(
      fontFamily: type == 1 ? textRegular4En : textMedium4En,
      letterSpacing: 0.0,
      color: color,
      fontSize: MyScreenUtil.sp(size ?? 20.0 + 1),
    );
  }

  static TextStyle textStyle4Zh(int type,
      {Color color, double spacing, double size}) {
    return TextStyle(
      fontFamily: type == 1 ? textRegular4Zh : textMedium4Zh,
      letterSpacing: spacing ?? 0.0,
      color: color,
      fontSize: MyScreenUtil.sp(size ?? 23.0 + 4),
    );
  }

  static TextStyle textStyle4Num(
      {Color color, double spacing, double size, FontWeight fontWeight}) {
    return GoogleFonts.roboto(
      letterSpacing: spacing ?? 0.0,
      color: color,
      fontWeight: fontWeight,
      fontSize: MyScreenUtil.sp(size ?? 23.0),
    );
  }

  static TextStyle textStyle4Index(int type, {Color color, double spacing}) {
    bool langType = GlobalService.to.langType;
    return langType
        ? TextStyle(
            fontFamily: type == 1 ? textRegular4Zh : textMedium4Zh,
            letterSpacing: spacing ?? 0.0,
            color: color,
          )
        : TextStyle(
            fontFamily: type == 1 ? textRegular4En : textMedium4En,
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
            fontFamily: type == 1 ? textRegular4Zh : textMedium4Zh,
            letterSpacing: letterSpacing,
            color: color,
            fontSize: MyScreenUtil.sp(fontSize + 4),
            height: MyScreenUtil.sp(3.2),
          )
        : TextStyle(
            fontFamily: type == 1 ? textRegular4En : textMedium4En,
            letterSpacing: 0.0,
            color: color,
            fontSize: MyScreenUtil.sp(fontSize + 1),
            height: MyScreenUtil.sp(3.2),
          );
  }
}
