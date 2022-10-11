//package
//flutter
import 'dart:io';

import 'package:astrotalk/l10n/l10n.dart';
import 'package:astrotalk/provider/local_provider.dart';
import 'package:astrotalk/theme/nativeTheme.dart';
import 'package:astrotalk/utils/binding/networkBinding.dart';
import 'package:astrotalk/utils/global.dart' as global;
import 'package:astrotalk/views/bottomNavigationBarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        return GetMaterialApp(
          navigatorKey: Get.key,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          theme: nativeTheme(),
          initialBinding: NetworkBinding(),
          title: global.appName,
          initialRoute: "SplashScreen",
          locale: provider.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: BottomNavigationBarScreen(),
        );
      });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
