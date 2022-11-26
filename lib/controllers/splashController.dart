import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/authController.dart';
import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/models/userModel.dart';
import 'package:cashfuse/services/apiHelper.dart';
import 'package:cashfuse/utils/date_converter.dart';
import 'package:cashfuse/views/bottomNavigationBarScreen.dart';
import 'package:cashfuse/views/getStartedScreen.dart';
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();
  VideoPlayerController videoPlayerController;

  @override
  void onInit() async {
    init();
    videoPlayerController = VideoPlayerController.network(
      global.earningVideoUrl,
    )..initialize().then((_) {
        videoPlayerController.pause();
        videoPlayerController.setLooping(true);

        update();
      });
    super.onInit();
  }

  void playPauseVideo() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      update();
    } else {
      videoPlayerController.play();
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void init() {
    try {
      Timer(Duration.zero, () async {
        //if (!GetPlatform.isWeb) {
        global.appDeviceId = await FirebaseMessaging.instance.getToken();
        //}
        global.sp = await SharedPreferences.getInstance();

        log(global.appDeviceId);
        if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
          await apiHelper.getAppInfo().then((response) async {
            if (response.statusCode == 200) {
              global.appInfo = response.data;
              if (global.sp.getString('currentUser') != null) {
                global.currentUser = UserModel.fromJson(json.decode(global.sp.getString("currentUser")));
                await Get.find<AuthController>().getProfile();

                Get.off(() => BottomNavigationBarScreen(
                      pageIndex: 0,
                    ));
              } else {
                if (GetPlatform.isWeb) {
                  Get.to(() => BottomNavigationBarScreen(
                        pageIndex: 0,
                      ));
                } else {
                  Get.off(() => GetStartedScreen(
                        fromSplash: true,
                      ));
                }
              }

              await apiHelper.getBannerNotification().then((result) {
                if (result.statusCode == 200) {
                  global.bannerImage = result.data['image'];
                }
              });
              await bannerShow();
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

  Future bannerShow() async {
    try {
      if (global.sp.getString('isBannerDate') != null) {
        if (DateConverter.dateTimeToDateOnly(DateTime.now()) == global.sp.getString('isBannerDate')) {
          global.isBannerShow = false;
          print('+++++ in bannerdate exist');
        } else {
          print('+++++ in bannerdate exist but not same');
          global.isBannerShow = true;
          global.isBannerDate = DateConverter.dateTimeToDateOnly(DateTime.now());
          global.sp.setString('isBannerDate', global.isBannerDate);
        }
      } else {
        print('+++++ in bannerdate not exist');
        global.isBannerShow = true;
        global.isBannerDate = DateConverter.dateTimeToDateOnly(DateTime.now());
        global.sp.setString('isBannerDate', global.isBannerDate);
      }
    } catch (e) {
      print("Exception - SplashController.dart - bannerShow():" + e.toString());
    }
  }
}
