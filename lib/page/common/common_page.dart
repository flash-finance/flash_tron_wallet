import 'package:flash_tron_wallet/common/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class IntervalPage extends StatelessWidget {
  final double value;
  IntervalPage(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Util.height(value),
      color: Colors.grey[100],
    );
  }
}


