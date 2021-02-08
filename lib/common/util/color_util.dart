import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flutter/material.dart';

class MyColorUtil {
  static final Color theme = Color(0xFF2676f8);

  static final Color whiteColor = Colors.white;

  static final Color backgroundColorLight = Color(0xFFFFFFFF);
  static final Color backgroundColorDark = Color(0xFF071724);
  static Color background() {
    return MyCommonUtil.flag() ? backgroundColorLight : backgroundColorDark;
  }

  static final Color secondaryColorLight = Color(0xFFF5F5F5);
  static final Color secondaryColorDark = Color(0xFF131E30);
  static Color secondary() {
    return MyCommonUtil.flag() ? secondaryColorLight : secondaryColorDark;
  }

  static final Color bottomAppBarColorLight = Colors.white;
  static final Color bottomAppBarColorDark = Color(0xFF131E30);
  static Color bottomAppBar() {
    return MyCommonUtil.flag() ? bottomAppBarColorLight : bottomAppBarColorDark;
  }

  static final Color titleColorLight = Color(0xFF333333);
  static final Color titleColorDark = Colors.white;
  static Color title() {
    return MyCommonUtil.flag() ? titleColorLight : titleColorDark;
  }

  static final Color subTitleColorLight = Color(0xFF999999);
  static final Color subTitleColorDark = Color(0xFF999999);
  static Color subTitle() {
    return MyCommonUtil.flag() ? subTitleColorLight : subTitleColorDark;
  }

  static final Color bottomBorderColorLight = Colors.grey[300];
  static final Color bottomBorderColorDark = Colors.grey[300];
  static Color bottomBorder() {
    return MyCommonUtil.flag() ? bottomBorderColorLight : bottomBorderColorDark;
  }
}
