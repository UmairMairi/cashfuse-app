import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cashbackapp/constants/appConstant.dart';
import 'package:cashbackapp/controllers/networkController.dart';
import 'package:cashbackapp/models/userModel.dart';
import 'package:cashbackapp/services/apiHelper.dart';
import 'package:cashbackapp/views/bottomNavigationBarScreen.dart';
import 'package:cashbackapp/views/getStartedScreen.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();

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
      Timer(Duration(seconds: 5), () async {
        global.appDeviceId = await FirebaseMessaging.instance.getToken();
        global.sp = await SharedPreferences.getInstance();
        log(global.appDeviceId);
        if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
          await apiHelper.getAppInfo().then((response) {
            if (response.statusCode == 200) {
              global.appInfo = response.data;
              if (global.sp.getString('currentUser') != null) {
                global.currentUser = UserModel.fromJson(json.decode(global.sp.getString("currentUser")));
                Get.to(() => BottomNavigationBarScreen());
              } else {
                Get.to(() => GetStartedScreen(
                      fromSplash: true,
                    ));
              }
            } else {
              showCustomSnackBar(response.message);
            }
          });
        } else {
          showCustomSnackBar(AppConstants.NO_INTERNET);
        }
      });
    } catch (e) {
      print("Exception - SplashController.dart - init():" + e.toString());
    }
  }
}
