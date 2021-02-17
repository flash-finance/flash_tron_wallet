import 'dart:ui';

import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/common_util.dart';
import 'package:flash_tron_wallet/common/util/icon_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyScaffold extends StatelessWidget {
  String title;
  bool hasAppBar;
  bool hasBack;
  Widget body;
  Widget bottomNavigationBar;

  MyScaffold({
    this.title = '',
    this.hasAppBar = true,
    this.hasBack = false,
    this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColorUtil.background(),
        appBar:
            hasAppBar ? _appBarWidget(context) : _preferredSizeWidget(context),
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  Widget _appBarWidget(BuildContext context) {
    bool flag = MyCommonUtil.isLightTheme();
    return AppBar(
      backgroundColor: MyColorUtil.background(),
      brightness: flag ? Brightness.light : Brightness.dark,
      title: Text(
        '$title',
        style: MyTextUtil.textStyle(2,
            color: MyColorUtil.biz(), spacing: 0.0, size: 32),
      ),
      centerTitle: true,
      elevation: 0,
      leading: hasBack
          ? InkWell(
              onTap: () {
                Get.back();
              },
              child: MyCommonUtil.icon(
                MyIconUtil.arrowBack,
                size: 45,
                color: MyColorUtil.biz(),
              ),
            )
          : Container(),
    );
  }

  PreferredSize _preferredSizeWidget(BuildContext context) {
    bool flag = MyCommonUtil.isLightTheme();
    return PreferredSize(
      child: AppBar(
        backgroundColor: MyColorUtil.background(),
        brightness: flag ? Brightness.light : Brightness.dark,
        elevation: 0,
      ),
      preferredSize: Size.fromHeight(0),
    );
  }
}
