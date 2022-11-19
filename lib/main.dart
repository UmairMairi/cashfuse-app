//package
//flutter
// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cashfuse/controllers/couponController.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/controllers/splashController.dart';
import 'package:cashfuse/controllers/themeController.dart';
import 'package:cashfuse/l10n/l10n.dart';
import 'package:cashfuse/provider/local_provider.dart';
import 'package:cashfuse/theme/nativeTheme.dart';
import 'package:cashfuse/utils/binding/networkBinding.dart';
import 'package:cashfuse/utils/firebaseoption.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/utils/notificationHelper.dart';
import 'package:cashfuse/views/homeScreen.dart';
import 'package:cashfuse/views/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as webview;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = new MyHttpOverrides();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationHelper.initialize();
  if (GetPlatform.isAndroid) {
    await fetchLinkData();
  }

  if (GetPlatform.isAndroid) {
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

Future fetchLinkData() async {
  // FirebaseDynamicLinks.getInitialLInk does a call to firebase to get us the real link because we have shortened it.
  var link = await FirebaseDynamicLinks.instance.getInitialLink();

  // This link may exist if the app was opened fresh so we'll want to handle it the same way onLink will.
  handleLinkData(link);

  //This will handle incoming links if the application is already opened
  dynamicLinks.onLink.listen((dynamicLinkData) {
    handleLinkData(dynamicLinkData);
  }).onError((error) {
    print('onLink error');
    print(error.message);
  });
  // FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData dynamicLink) async {
  //   handleLinkData(dynamicLink);
  // });
}

void handleLinkData(PendingDynamicLinkData data) {
  final Uri uri = data?.link;
  if (uri != null) {
    final queryParams = uri.queryParameters;
    if (queryParams.length > 0) {
      global.referralUserId = queryParams["userId"];
      // verify the username is parsed correctly
      print("My user id is: ${global.referralUserId}");
    }
  }
}

class MyApp extends StatelessWidget {
  ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isWeb) {
      Get.put(NetworkController());
      Get.put(SplashController());
      Get.put(HomeController());
      Get.put(CouponController());
    }
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
              home: GetPlatform.isAndroid ? SplashScreen() : HomeScreen(),
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
