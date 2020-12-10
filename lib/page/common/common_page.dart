import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class IntervalPage extends StatelessWidget {
  final double value;
  IntervalPage(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(value),
      color: Colors.grey[100],
    );
  }
}


