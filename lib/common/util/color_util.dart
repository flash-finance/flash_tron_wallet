import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flutter/material.dart';

class MyColorUtil {
  ///主题颜色
  static final Color themeColor = Color(0xFF1677FF);

  ///主题颜色(浅 接近蓝色背景下的白色)
  static final Color themeColorLight = Color(0xFFE7F1FF);

  ///白色
  static final Color whiteColor = Colors.white;

  ///背景主要颜色
  static final Color backgroundColorLight = Color(0xFFF5F5F5);
  static final Color backgroundColorDark = Color(0xFF071724);
  static Color backgroundColor() {
    return MyCommonUtil.flag() ? backgroundColorLight : backgroundColorDark;
  }

  ///中间提示背景主要颜色
  static final Color toastBgColorLight = Colors.grey[100].withAlpha(204);
  static final Color toastBgColorDark = Color(0xCC082734);
  static Color toastBgColor() {
    return MyCommonUtil.flag() ? toastBgColorLight : toastBgColorDark;
  }

  ///弹窗菜单背景主要颜色
  static final Color popupMenuBgColorLight = Colors.grey[100].withAlpha(204);
  static final Color popupMenuBgColorDark = Color(0xCC082734);
  static Color popupMenuBgColor() {
    return MyCommonUtil.flag() ? popupMenuBgColorLight : popupMenuBgColorDark;
  }

  ///背景次要颜色
  static final Color secondaryColorLight = Colors.white;
  static final Color secondaryColorDark = Color(0xFF131E30);
  static Color secondaryColor() {
    return MyCommonUtil.flag() ? secondaryColorLight : secondaryColorDark;
  }

  ///底部导航栏颜色
  static final Color bottomAppBarColorLight = Colors.white;
  static final Color bottomAppBarColorDark = Color(0xFF131E30);
  static Color bottomAppBarColor() {
    return MyCommonUtil.flag() ? bottomAppBarColorLight : bottomAppBarColorDark;
  }

  ///主要字体颜色
  static final Color titleColorLight = Color(0xFF333333);
  static final Color titleColorDark = Colors.white;
  static Color titleColor() {
    return MyCommonUtil.flag() ? titleColorLight : titleColorDark;
  }

  static Color toastTextColor() {
    return MyCommonUtil.flag() ? titleColorLight : titleColorDark;
  }

  static Color popupMenuTextColor() {
    return MyCommonUtil.flag() ? titleColorLight : titleColorDark;
  }

  static Color popupMenuIconColor() {
    return MyCommonUtil.flag() ? titleColorLight : titleColorDark;
  }

  static Color toastIconColor() {
    return MyCommonUtil.flag() ? titleColorLight : titleColorDark;
  }

  static Color cursorColor() {
    return MyCommonUtil.flag() ? titleColorLight : titleColorDark;
  }

  ///次要字体颜色
  static final Color subTitleColorLight = Color(0xFF999999);
  static final Color subTitleColorDark = Color(0xFF999999);
  static Color subTitleColor() {
    return MyCommonUtil.flag() ? subTitleColorLight : subTitleColorDark;
  }

  ///弱文案字体颜色
  static final Color weakTitleColorLight = Color(0xFFFFFFFF);
  static final Color weakTitleColorDark = Color(0xFFFFFFFF);
  static Color weakTitleColor() {
    return MyCommonUtil.flag() ? weakTitleColorLight : weakTitleColorDark;
  }

  ///页面返回标识颜色
  static final Color arrowBackColorLight = Color(0xFF333333);
  static final Color arrowBackColorDark = Colors.white;
  static Color arrowBackColor() {
    return MyCommonUtil.flag() ? arrowBackColorLight : arrowBackColorDark;
  }

  ///页面跳转标识颜色
  static final Color arrowForwardColorLight = Color(0xFF999999);
  static final Color arrowForwardColorDark = Colors.grey[600];
  static Color arrowForwardColor() {
    return MyCommonUtil.flag() ? arrowForwardColorLight : arrowForwardColorDark;
  }

  ///底部细线分割颜色
  static final Color bottomBorderColorLight = Color(0xFF999999);
  static final Color bottomBorderColorDark = Colors.grey[500];
  static Color bottomBorderColor() {
    return MyCommonUtil.flag() ? bottomBorderColorLight : bottomBorderColorDark;
  }

  ///组件之间间隔颜色
  static Color intervalColor() {
    return backgroundColor();
  }

  ///蓝色背景下的次要字体颜色
  static final Color subTitleColor4Blue = Color(0xFFE0F7FF);

  ///icon标示默认颜色
  static final Color iconColorLight = Color(0xFF999999);
  static final Color iconColorDark = Colors.grey[700];
  static Color iconColor() {
    return MyCommonUtil.flag() ? iconColorLight : iconColorDark;
  }
}
