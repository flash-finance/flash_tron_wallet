import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flutter/material.dart';

class MyColorUtil {
  ///主题颜色
  static final Color theme = Color(0xFF2676f8);

  ///主题颜色(浅 接近蓝色背景下的白色)
  static final Color themeColorLight = Color(0xFFE7F1FF);

  ///白色
  static final Color whiteColor = Colors.white;

  ///背景主要颜色
  static final Color backgroundColorLight = Color(0xFFFFFFFF);
  static final Color backgroundColorDark = Color(0xFF071724);
  static Color background() {
    return MyCommonUtil.flag() ? backgroundColorLight : backgroundColorDark;
  }

  ///背景次要颜色
  static final Color secondaryColorLight = Colors.white;
  static final Color secondaryColorDark = Color(0xFF131E30);
  static Color secondary() {
    return MyCommonUtil.flag() ? secondaryColorLight : secondaryColorDark;
  }

  ///底部导航栏颜色
  static final Color bottomAppBarColorLight = Colors.white;
  static final Color bottomAppBarColorDark = Color(0xFF131E30);
  static Color bottomAppBar() {
    return MyCommonUtil.flag() ? bottomAppBarColorLight : bottomAppBarColorDark;
  }

  ///主要字体颜色
  static final Color titleColorLight = Color(0xFF333333);
  static final Color titleColorDark = Colors.white;
  static Color title() {
    return MyCommonUtil.flag() ? titleColorLight : titleColorDark;
  }

  ///次要字体颜色
  static final Color subTitleColorLight = Color(0xFF999999);
  static final Color subTitleColorDark = Color(0xFF999999);
  static Color subTitle() {
    return MyCommonUtil.flag() ? subTitleColorLight : subTitleColorDark;
  }

  ///弱文案字体颜色
  static final Color weakTitleColorLight = Color(0xFFFFFFFF);
  static final Color weakTitleColorDark = Color(0xFFFFFFFF);
  static Color weakTitle() {
    return MyCommonUtil.flag() ? weakTitleColorLight : weakTitleColorDark;
  }

  ///底部细线分割颜色
  static final Color bottomBorderColorLight = Color(0xFF999999);
  static final Color bottomBorderColorDark = Colors.grey[500];
  static Color bottomBorder() {
    return MyCommonUtil.flag() ? bottomBorderColorLight : bottomBorderColorDark;
  }
}
