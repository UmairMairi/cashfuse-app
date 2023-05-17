//package
//flutter
// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cashfuse/controllers/couponController.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/controllers/localizationController.dart';
import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/controllers/splashController.dart';
import 'package:cashfuse/controllers/themeController.dart';
import 'package:cashfuse/theme/nativeTheme.dart';
import 'package:cashfuse/utils/binding/networkBinding.dart';
import 'package:cashfuse/utils/firebaseoption.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/utils/notificationHelper.dart';
import 'package:cashfuse/views/bottomNavigationBarScreen.dart';
import 'package:cashfuse/views/homeScreen.dart';
import 'package:cashfuse/views/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_translator/google_translator.dart';
import 'package:url_strategy/url_strategy.dart';

FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  HttpOverrides.global = new MyHttpOverrides();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {}

  if (!GetPlatform.isWeb) {
    await NotificationHelper.initialize();
    //MobileAds.instance.initialize();

    MobileAds.instance.initialize();
  }

  if (!GetPlatform.isWeb) {
    await fetchLinkData();
  }

  if (GetPlatform.isWeb) {
    Get.put(NetworkController());
    Get.put(SplashController());
    Get.put(HomeController());

    Get.put(CouponController());
  }

  runApp(MyApp());
}

Future fetchLinkData() async {
  var link = await FirebaseDynamicLinks.instance.getInitialLink();

  handleLinkData(link!);

  dynamicLinks.onLink.listen((dynamicLinkData) {
    handleLinkData(dynamicLinkData);
  }).onError((error) {
    print('onLink error');
    print(error.message);
  });
}

void handleLinkData(PendingDynamicLinkData data) {
  final Uri? uri = data.link;
  if (uri != null) {
    final queryParams = uri.queryParameters;
    if (queryParams.length > 0) {
      global.referralUserId = queryParams["userId"]!;
      print("My user id is: ${global.referralUserId}");
    }
  }
}

class MyApp extends StatelessWidget {
  ThemeController themeController = Get.put(ThemeController());
  LocalizationController localizationController =
      Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizationController) =>
          GetBuilder<ThemeController>(builder: (themeController) {
        return GoogleTranslatorInit(global.languageApiKey,
            translateFrom: Locale(
                localizationController.languageCode == 'en' ? 'hi' : 'en'),
            translateTo: Locale(localizationController.languageCode),
            automaticDetection: true, builder: () {
          return GetMaterialApp(
            navigatorKey: Get.key,
            textDirection: global.isRTL ? TextDirection.rtl : TextDirection.ltr,
            debugShowCheckedModeBanner: false,
            enableLog: true,
            theme: nativeTheme(),
            initialBinding: NetworkBinding(),
            title: global.appName,
            home: global.getPlatFrom()
                ? BottomNavigationBarScreen()
                : GetPlatform.isWeb
                    ? HomeScreen()
                    : SplashScreen(),
          );
        });
      }),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
