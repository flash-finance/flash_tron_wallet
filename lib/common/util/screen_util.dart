import 'package:flutter_screenutil/screenutil.dart';

class MyScreenUtil {
  ///屏幕适配宽度
  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  ///屏幕适配宽度
  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  ///屏幕适配字体大小
  static sp(double value) {
    return ScreenUtil().setSp(value);
  }
}
