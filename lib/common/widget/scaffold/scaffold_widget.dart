import 'package:flash_tron_wallet/common/util/color_util.dart';
import 'package:flash_tron_wallet/common/util/screen_util.dart';
import 'package:flash_tron_wallet/common/util/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyScaffold extends StatelessWidget {
  String title;
  bool hasAppBar;
  bool hasBack;
  Widget body;
  Widget floatingActionButton;
  Widget bottomNavigationBar;

  MyScaffold({
    this.title = '',
    this.hasAppBar = true,
    this.hasBack = false,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: MyColorUtil.background(),
        appBar:
            hasAppBar ? _appBarWidget(context) : _preferredSizeWidget(context),
        body: body,
        floatingActionButtonLocation: floatingActionButton != null
            ? FloatingActionButtonLocation.centerDocked
            : null,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  Widget _appBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: MyColorUtil.whiteColor,
      brightness: Brightness.light,
      title: Text(
        '$title',
        style: MyTextUtil.textStyle(2,
            color: MyColorUtil.title(), spacing: 0.0, size: 32),
      ),
      centerTitle: true,
      elevation: 0,
      leading: hasBack
          ? InkWell(
              onTap: () {
                Navigator.of(context)..pop();
              },
              child: Icon(
                Icons.arrow_back,
                size: MyScreenUtil.sp(45),
                color: MyColorUtil.title(),
              ),
            )
          : Container(),
    );
  }

  PreferredSize _preferredSizeWidget(BuildContext context) {
    return PreferredSize(
      child: AppBar(
        backgroundColor: MyColorUtil.whiteColor,
        brightness: Brightness.light,
        elevation: 0,
      ),
      preferredSize: Size.fromHeight(MyScreenUtil.height(0)),
    );
  }
}
