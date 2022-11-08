//package
//flutter
import 'dart:io';

import 'package:cashbackapp/controllers/themeController.dart';
import 'package:cashbackapp/l10n/l10n.dart';
import 'package:cashbackapp/provider/local_provider.dart';
import 'package:cashbackapp/theme/nativeTheme.dart';
import 'package:cashbackapp/utils/binding/networkBinding.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/views/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as webview;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = new MyHttpOverrides();
  await Firebase.initializeApp();
  if (Platform.isAndroid) {
    await webview.AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await webview.AndroidWebViewFeature.isFeatureSupported(webview.AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await webview.AndroidWebViewFeature.isFeatureSupported(webview.AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      webview.AndroidServiceWorkerController serviceWorkerController = webview.AndroidServiceWorkerController.instance();

      await serviceWorkerController.setServiceWorkerClient(webview.AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      ));
    }
  }
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          return GetBuilder<ThemeController>(builder: (themeController) {
            return GetMaterialApp(
              navigatorKey: Get.key,
              debugShowCheckedModeBanner: false,
              enableLog: true,
              theme: nativeTheme(),
              initialBinding: NetworkBinding(),
              title: global.appName,
              locale: provider.locale,
              supportedLocales: L10n.all,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: SplashScreen(),
            );
          });
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
