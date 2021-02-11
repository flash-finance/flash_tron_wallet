import 'dart:io';

import 'package:flash_tron_wallet/index/index_page.dart';
import 'package:flash_tron_wallet/locale/app_Locale.dart';
import 'package:flash_tron_wallet/provider/global_injection.dart';
import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:flash_tron_wallet/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalInjection.init();
  runApp(MyApp());

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flash Wallet',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      getPages: AppRoute.pages,
      defaultTransition: Transition.cupertino,
      //locale:  Locale('zh', 'CN'),
      locale:
          GlobalService.to.langType ? Locale('zh', 'CN') : Locale('en', 'US'),
      translationsKeys: AppLocale.translations,
      builder: (context, child) => Scaffold(
        body: GestureDetector(
          onTap: () {
            hideKeyboard(context);
          },
          child: child,
        ),
      ),
      home: IndexPage(),
    );
  }
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus.unfocus();
  }
}
