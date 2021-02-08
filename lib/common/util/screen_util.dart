import 'package:flutter_screenutil/screenutil.dart';

class MyScreenUtil {
  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  static sp(double value) {
    return ScreenUtil().setSp(value);
  }
}
