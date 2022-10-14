import 'dart:async';

import 'package:cashbackapp/views/getStartedScreen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    init();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void init() {
    try {
      Timer(Duration(seconds: 5), () {
        Get.to(() => GetStartedScreen());
      });
    } catch (e) {
      print("Exception - SplashScreen.dart - init():" + e.toString());
    }
  }
}
