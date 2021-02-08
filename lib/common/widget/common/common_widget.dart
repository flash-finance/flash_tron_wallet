import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flutter/material.dart';

///title组件
class TitleWidget extends StatelessWidget {
  final String name;

  TitleWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$name',
        style: MyTextUtil.textStyle(2,
            color: MyColorUtil.title(), spacing: 0.0, size: 32),
      ),
    );
  }
}

///间隔组件
class IntervalWidget extends StatelessWidget {
  final double value;
  IntervalWidget(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyScreenUtil.height(value),
      color: MyColorUtil.background(),
    );
  }
}

///MyPreferredSize
class MyPreferredSize extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final Brightness brightness;
  @override
  final Size preferredSize;

  MyPreferredSize(this.backgroundColor, this.brightness, this.preferredSize);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: AppBar(
        backgroundColor: backgroundColor,
        brightness: brightness,
        elevation: 0,
      ),
      preferredSize: preferredSize,
    );
  }
}

///页面跳转标示组件
class ForwardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.arrow_forward_ios,
        size: MyScreenUtil.sp(27),
        color: MyColorUtil.subTitle(),
      ),
    );
  }
}
