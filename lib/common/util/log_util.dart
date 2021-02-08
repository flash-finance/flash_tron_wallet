import 'package:common_utils/common_utils.dart';

class MyLogUtil {
  static const String _defTag = "common_utils";
  // static const bool _debugMode = false; //是否是debug模式,true: log v 不输出.
  // static int _maxLen = 128;
  // static String _tagValue = _defTag;

  static void init({
    String tag = _defTag,
    int maxLen = 128,
  }) {
    LogUtil.init(tag: tag, isDebug: true, maxLen: maxLen);
  }

  static debug(Object object, {String tag}) {
    LogUtil.v(object, tag: tag);
  }

  static error(Object object, {String tag}) {
    LogUtil.e(object, tag: tag);
  }
}
