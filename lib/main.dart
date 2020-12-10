import 'dart:io';
import 'package:flash_tron_wallet/provider/home_provider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'common/common_util.dart';
import 'generated/l10n.dart';
import 'page/index_page.dart';
import 'provider/index_provider.dart';
import 'router/application.dart';
import 'router/router.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRouter(router);
  Application.router = router;

  Provider.debugCheckInvalidValueType = null;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => IndexProvider()..init()),
      ChangeNotifierProvider(create: (_) => HomeProvider()..init()),
    ],
    child: MyApp(),
  ));

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Flash钱包',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Util.themeColor,
          accentColor: Util.themeColor,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          fontFamily: 'ZH-M',
        ),
        home: IndexPage(),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        localeListResolutionCallback: (locales, supportedLocales) {
          print(locales);
          return;
        },
      ),
    );
  }
}
