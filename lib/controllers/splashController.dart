import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/authController.dart';
import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/controllers/referEarnController.dart';
import 'package:cashfuse/controllers/searchController.dart';
import 'package:cashfuse/models/userModel.dart';
import 'package:cashfuse/services/apiHelper.dart';
import 'package:cashfuse/utils/date_converter.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/views/bottomNavigationBarScreen.dart';
import 'package:cashfuse/views/getStartedScreen.dart';
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();
  VideoPlayerController videoPlayerController;

  // InterstitialAd _interstitialAd;
  // int _numInterstitialLoadAttempts = 0;
  // int maxFailedLoadAttempts = 3;

  // RewardedAd _rewardedAd;
  // int _numRewardedLoadAttempts = 0;

  // NativeAd nativeAd;
  // StreamSubscription _subscription;
  // double adheight = 0.0;
  // List<BannerAd> bannerAdList = [];
  // List<FacebookBannerAd> facebookBannerAdList = [];
  // bool isAdLoaed = false;

  @override
  void onInit() async {
    try {
      if (GetPlatform.isWeb) {
        global.appDeviceId = await FirebaseMessaging.instance.getToken(
          vapidKey: global.webConfigurationKey,
        );
      } else {
        global.appDeviceId = await FirebaseMessaging.instance.getToken();
      }
    } catch (e) {
      print("Exception - SplashController.dart - onInit():" + e.toString());
    }

    //_subscription = nativeAdController.stateChanged.listen(_onStateChanged);

    // await createBannerAd();
    // await createInterstitialAd();
    // //createFaceBookBannerAd();
    // loadFacebookInterstitialAd();
    if (global.getPlatFrom()) {
      await webInit();
      Get.put(SearchController());
      Get.put(ReferEarnController());
    } else {
      await init();
    }

    videoPlayerController = VideoPlayerController.network(
      global.earningVideoUrl,
    )..initialize().then((_) {
        videoPlayerController.pause();
        videoPlayerController.setLooping(true);

        update();
      });

    super.onInit();
  }

  // void _onStateChanged(AdLoadState state) {
  //   switch (state) {
  //     case AdLoadState.loading:
  //       adheight = 0.0;
  //       update();
  //       break;

  //     case AdLoadState.loadCompleted:
  //       adheight = 330;
  //       update();
  //       break;

  //     default:
  //       break;
  //   }
  // }

  // Future createBannerAd() async {
  //   try {
  //     BannerAd _bannerAd;
  //     for (var i = 0; i < global.admobSetting.bannerAdList.length; i++) {
  //       _bannerAd = BannerAd(
  //         adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
  //         size: AdSize.banner,
  //         request: AdRequest(),
  //         listener: BannerAdListener(
  //           onAdLoaded: (_) {
  //             isAdLoaed = true;
  //             update();
  //           },
  //           onAdFailedToLoad: (ad, error) {
  //             ad.dispose();
  //           },
  //         ),
  //       );
  //       bannerAdList.add(_bannerAd);
  //       bannerAdList[i].load();
  //     }
  //   } catch (e) {
  //     print("Exception - HomeController.dart - createBannerAd():" + e.toString());
  //   }
  // }

  // Future createFaceBookBannerAd() async {
  //   try {
  //     FacebookBannerAd _facebookBannerAd;
  //     for (var i = 0; i < global.facebookAdSetting.bannerAdList.length; i++) {
  //       _facebookBannerAd = FacebookBannerAd(
  //         placementId: 'IMG_16_9_LINK#536153035214384_536898305139857',
  //         bannerSize: BannerSize.STANDARD,
  //         keepAlive: true,
  //         listener: (result, value) {
  //           switch (result) {
  //             case BannerAdResult.ERROR:
  //               print("Error: $value");
  //               break;
  //             case BannerAdResult.LOADED:
  //               print("Loaded: $value");
  //               break;
  //             case BannerAdResult.CLICKED:
  //               print("Clicked: $value");
  //               break;
  //             case BannerAdResult.LOGGING_IMPRESSION:
  //               print("Logging Impression: $value");
  //               break;
  //           }
  //         },
  //       );
  //       facebookBannerAdList.add(_facebookBannerAd);
  //     }
  //     update();
  //   } catch (e) {
  //     print("Exception - HomeController.dart - createFaceBookBannerAd():" + e.toString());
  //   }
  // }

  // Future createInterstitialAd() async {
  //   try {
  //     InterstitialAd.load(
  //         adUnitId: "ca-app-pub-3940256099942544/1033173712",
  //         request: AdRequest(),
  //         adLoadCallback: InterstitialAdLoadCallback(
  //           onAdLoaded: (InterstitialAd ad) {
  //             print('$ad loaded');
  //             _interstitialAd = ad;
  //             _numInterstitialLoadAttempts = 0;
  //             _interstitialAd.setImmersiveMode(true);
  //           },
  //           onAdFailedToLoad: (LoadAdError error) {
  //             print('InterstitialAd failed to load: $error.');
  //             _numInterstitialLoadAttempts += 1;
  //             _interstitialAd = null;
  //             if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
  //               createInterstitialAd();
  //             }
  //           },
  //         ));
  //   } catch (e) {
  //     print("Exception - HomeController.dart - createInterstitialAd():" + e.toString());
  //   }
  // }

  // void showInterstitialAd() {
  //   try {
  //     if (_interstitialAd == null) {
  //       print('Warning: attempt to show interstitial before loaded.');
  //       return;
  //     }
  //     _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
  //       onAdShowedFullScreenContent: (InterstitialAd ad) => print('ad onAdShowedFullScreenContent.'),
  //       onAdDismissedFullScreenContent: (InterstitialAd ad) {
  //         print('$ad onAdDismissedFullScreenContent.');
  //         ad.dispose();
  //         createInterstitialAd();
  //         global.clickCount = 0;
  //         update();
  //       },
  //       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
  //         print('$ad onAdFailedToShowFullScreenContent: $error');
  //         ad.dispose();
  //         createInterstitialAd();
  //       },
  //       onAdClicked: (ad) {
  //         log(ad.adUnitId);
  //       },
  //     );
  //     _interstitialAd.show();
  //   } catch (e) {
  //     print("Exception - HomeController.dart - showInterstitialAd():" + e.toString());
  //   }

  //   //_interstitialAd = null;
  // }

  // void createRewardedAd() {
  //   RewardedAd.load(
  //       adUnitId: 'ca-app-pub-3940256099942544/5224354917',
  //       request: AdRequest(),
  //       rewardedAdLoadCallback: RewardedAdLoadCallback(
  //         onAdLoaded: (RewardedAd ad) {
  //           print('$ad loaded.');
  //           _rewardedAd = ad;
  //           _numRewardedLoadAttempts = 0;
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           print('RewardedAd failed to load: $error');
  //           _rewardedAd = null;
  //           _numRewardedLoadAttempts += 1;
  //           if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
  //             createRewardedAd();
  //           }
  //         },
  //       ));
  // }

  // void loadFacebookInterstitialAd() {
  //   FacebookInterstitialAd.loadInterstitialAd(
  //     // placementId: "YOUR_PLACEMENT_ID",
  //     placementId: "IMG_16_9_APP_INSTALL#536153035214384_536898488473172",
  //     listener: (result, value) {
  //       print(">> FAN > Interstitial Ad: $result --> $value");
  //       if (result == InterstitialAdResult.LOADED)

  //       /// Once an Interstitial Ad has been dismissed and becomes invalidated,
  //       /// load a fresh Ad by calling this function.
  //       if (result == InterstitialAdResult.DISMISSED) {
  //         loadFacebookInterstitialAd();
  //       }
  //       if (result == InterstitialAdResult.ERROR) {
  //         loadFacebookInterstitialAd();
  //       }
  //     },
  //   );
  // }

  // void showRewardedAd() {
  //   if (_rewardedAd == null) {
  //     print('Warning: attempt to show rewarded before loaded.');
  //     return;
  //   }
  //   _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdShowedFullScreenContent: (RewardedAd ad) => print('ad onAdShowedFullScreenContent.'),
  //     onAdDismissedFullScreenContent: (RewardedAd ad) {
  //       print('$ad onAdDismissedFullScreenContent.');
  //       ad.dispose();
  //       createRewardedAd();
  //     },
  //     onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
  //       print('$ad onAdFailedToShowFullScreenContent: $error');
  //       ad.dispose();
  //       createRewardedAd();
  //     },
  //   );

  //   _rewardedAd.setImmersiveMode(true);
  //   _rewardedAd.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
  //     print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
  //   });
  //   _rewardedAd = null;
  // }

  // Future createNativeAd() async {
  //   try {
  //     nativeAd = NativeAd(
  //       adUnitId: 'ca-app-pub-3940256099942544/2247696110',
  //       factoryId: 'com.cashfuse.app',
  //       request: AdRequest(),
  //       nativeAdOptions: NativeAdOptions(
  //         mediaAspectRatio: MediaAspectRatio.portrait,
  //         adChoicesPlacement: AdChoicesPlacement.topLeftCorner,
  //         shouldRequestMultipleImages: true,
  //         videoOptions: VideoOptions(),
  //       ),
  //       listener: NativeAdListener(
  //         onAdLoaded: (_) {
  //           isAdLoaed = true;
  //           update();
  //         },
  //         onAdFailedToLoad: (ad, error) {
  //           ad.dispose();
  //         },
  //       ),
  //     );

  //     nativeAd.load();
  //   } catch (e) {
  //     print("Exception - HomeController.dart - createNativeAd():" + e.toString());
  //   }
  // }

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

  Future webInit() async {
    try {
      global.sp = await SharedPreferences.getInstance();

      log(global.appDeviceId);
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getAppInfo().then((response) async {
          if (response.statusCode == 200) {
            global.appInfo = response.data;
            if (global.sp.getString('currentUser') != null) {
              global.currentUser = UserModel.fromJson(json.decode(global.sp.getString("currentUser")));
              await Get.find<AuthController>().getProfile();

              Get.off(() => BottomNavigationBarScreen());
            } else {
              Get.off(() => BottomNavigationBarScreen());
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
    } catch (e) {
      print("Exception - SplashController.dart - webInit():" + e.toString());
    }
  }

  Future init() async {
    try {
      Timer(Duration.zero, () async {
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
