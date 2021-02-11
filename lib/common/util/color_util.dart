import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flutter/material.dart';

class MyColorUtil {
  static final Color theme = Color(0xFF2676f8);

  static final Color white = Colors.white;

  static final Color transparent = Colors.transparent;

  static final Color backgroundLight = Color(0xFFFFFFFF);
  static final Color backgroundDark = Color(0xFF071724);
  static Color background() {
    return MyCommonUtil.isLightTheme() ? backgroundLight : backgroundDark;
  }

  static final Color secondaryLight = Color(0xFFF5F5F5);
  static final Color secondaryDark = Color(0xFF131E30);
  static Color secondary() {
    return MyCommonUtil.isLightTheme() ? secondaryLight : secondaryDark;
  }

  static Color bottomAppBar() {
    return secondary();
  }

  static final Color bizLight = Color(0xFF333333);
  static final Color bizDark = Colors.white;
  static Color biz() {
    return MyCommonUtil.isLightTheme() ? bizLight : bizDark;
  }

  static final Color subBizLight = Color(0xFF999999);
  static final Color subBizDark = Color(0xFF757575);
  static Color subBiz() {
    return MyCommonUtil.isLightTheme() ? subBizLight : subBizDark;
  }

  static final Color dividerLineLight = Color(0xFFEEEEEE);
  static final Color dividerLineDark = Color(0xFF757575);
  static Color dividerLine() {
    return MyCommonUtil.isLightTheme() ? dividerLineLight : dividerLineDark;
  }

  static dividerBg() {
    return secondary();
  }
}
