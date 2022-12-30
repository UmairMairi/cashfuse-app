import 'dart:async';

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/services/apiHelper.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();

  FacebookBannerAd fbBannerAd1;
  FacebookBannerAd fbBannerAd2;
  FacebookBannerAd fbBannerAd3;

  bool isfbBannerAdLoaed1 = false;
  bool isfbBannerAdLoaed2 = false;
  bool isfbBannerAdLoaed3 = false;

  List<BannerAd> bannerAdList = [];

  InterstitialAd interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  int maxFailedLoadAttempts = 3;

  StreamSubscription _subscription;
  double adheight = 0;

  bool admobNativeAdLoaded = false;
  NativeAd myNative;

  bool fbBannerAdLoaded = false;
  FacebookBannerAd fbBannerAd;

  FacebookNativeAd facebookNativeAd;
  bool isFbNativeAdLoaded = false;

  void setNativeAdLoaded(bool val) {
    admobNativeAdLoaded = val;
    update();
  }

  @override
  void onInit() async {
    if (!GetPlatform.isWeb) {
      try {
        FacebookAudienceNetwork.init(
          //testingId: '468FD9C0CF496815189B2FE63C8EFA31',
          iOSAdvertiserTrackingEnabled: false,
        );

        //AdSettings.addTestDevice("328404cebf50ec1fdb05795c0007a8a7");
      } catch (e) {
        print("Exception - main.dart - main():" + e.toString());
      }
      if (global.appInfo.admob == "1") {
        await getAdmobSettings();

        //await createAdmobBannerAd();
        //await loadNativeAd();
        await createInterstitialAd();
      }
      if (global.appInfo.facebookAd == "1") {
        await getFaceBookAdSetting();
        await createFbBannerAd();
        // await loadfbBannerAd();
        // await loadFaceBookNativeAd();
        await loadFacebookInterstitialAd();
      }
    }

    super.onInit();
  }

  Future createFbBannerAd() async {
    try {
      if (global.facebookAdSetting.bannerAdList != null && global.facebookAdSetting.bannerAdList.length > 0) {
        if (global.facebookAdSetting.bannerAdList[0] != null && global.facebookAdSetting.bannerAdList[0].status == 1) {
          fbBannerAd1 = new FacebookBannerAd(
            placementId: 'IMG_16_9_LINK#536153035214384_536898305139857',
            bannerSize: BannerSize.STANDARD,
            keepAlive: true,
            listener: (result, value) {
              if (result == BannerAdResult.ERROR) {
                isfbBannerAdLoaed1 = false;
                update();
              }
              if (result == BannerAdResult.LOGGING_IMPRESSION) {
                isfbBannerAdLoaed1 = true;
                update();
              }
              if (result == BannerAdResult.LOADED) {
                isfbBannerAdLoaed1 = true;
                update();
              }
            },
          );
        }

        if (global.facebookAdSetting.bannerAdList[1] != null && global.facebookAdSetting.bannerAdList[1].status == 1) {
          fbBannerAd2 = new FacebookBannerAd(
            placementId: 'IMG_16_9_LINK#536153035214384_536898305139857',
            bannerSize: BannerSize.STANDARD,
            keepAlive: true,
            listener: (result, value) {
              if (result == BannerAdResult.ERROR) {
                isfbBannerAdLoaed2 = false;
                update();
              }
              if (result == BannerAdResult.LOGGING_IMPRESSION) {
                isfbBannerAdLoaed2 = true;
                update();
              }
              if (result == BannerAdResult.LOADED) {
                isfbBannerAdLoaed2 = true;
                update();
              }
            },
          );
        }

        if (global.facebookAdSetting.bannerAdList[2] != null && global.facebookAdSetting.bannerAdList[2].status == 1) {
          fbBannerAd3 = new FacebookBannerAd(
            placementId: 'IMG_16_9_LINK#536153035214384_536898305139857',
            bannerSize: BannerSize.STANDARD,
            keepAlive: true,
            listener: (result, value) {
              if (result == BannerAdResult.ERROR) {
                isfbBannerAdLoaed3 = false;
                update();
              }
              if (result == BannerAdResult.LOGGING_IMPRESSION) {
                isfbBannerAdLoaed3 = true;
                update();
              }
              if (result == BannerAdResult.LOADED) {
                isfbBannerAdLoaed3 = true;
                update();
              }
            },
          );
        }
      }
    } catch (e) {
      print("Exception - HomeScreen.dart - createFbBannerAd():" + e.toString());
    }
  }

  Future loadNativeAd() async {
    try {
      final NativeAdListener listener = NativeAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) => print('+++++++++++++++++++Ad loaded.'),
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          update();
          print('Ad failed to load:++++++++ $error');
        },
        onAdWillDismissScreen: (ad) {
          ad.dispose();
          admobNativeAdLoaded = false;
          update();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {
          print('+++++++++++++++++++Ad opened.');
          admobNativeAdLoaded = true;
          update();
        },
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('+++++++++++++++++Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {
          //setNativeAdLoaded(true);
          admobNativeAdLoaded = true;
          update();
        },
        // Called when a click is recorded for a NativeAd.
        onAdClicked: (Ad ad) => print('+++++++++++++Ad clicked.'),
      );

      // const String viewType = '<platform-view-type>';
      // // Pass parameters to the platform side.
      // final Map<String, dynamic> creationParams = <String, dynamic>{};

      // AndroidView(
      //   viewType: viewType,
      //   layoutDirection: TextDirection.ltr,
      //   creationParams: creationParams,
      //   creationParamsCodec: const StandardMessageCodec(),
      // );

      myNative = new NativeAd(
          adUnitId: 'ca-app-pub-3940256099942544/2247696110',
          factoryId: 'adFactoryExample',
          request: AdRequest(),
          listener: listener,
          nativeAdOptions: NativeAdOptions(
            shouldRequestMultipleImages: true,
          ))
        ..load();
      update();
      myNative.load();
      update();
    } catch (e) {
      print("Exception - HomeScreen.dart - _loadNativeAd():" + e.toString());
    }
  }

  Future loadFaceBookNativeAd() async {
    try {
      facebookNativeAd = new FacebookNativeAd(
        keepAlive: true,
        placementId: "VID_HD_16_9_46S_APP_INSTALL#536153035214384_536880055141682",
        adType: NativeAdType.NATIVE_AD,
        // width: Get.width,
        // height: 300,
        backgroundColor: Colors.blue,
        titleColor: Colors.white,
        descriptionColor: Colors.white,
        buttonColor: Colors.deepPurple,
        buttonTitleColor: Colors.white,
        buttonBorderColor: Colors.white,
        listener: (result, value) {
          if (result == NativeAdResult.LOGGING_IMPRESSION) {
            isFbNativeAdLoaded = true;
          }
        },
        keepExpandedWhileLoading: true,
        // expandAnimationDuraion: 1000,
      );
      update();
    } catch (e) {
      print("Exception - HomeScreen.dart - loadFaceBookNativeAd():" + e.toString());
    }
  }

  Future loadfbBannerAd() async {
    try {
      fbBannerAd = FacebookBannerAd(
        placementId: 'IMG_16_9_LINK#536153035214384_536898305139857',
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          switch (result) {
            case BannerAdResult.ERROR:
              print("-----------------------Error: $value");
              break;
            case BannerAdResult.LOADED:
              print("------------------Loaded: $value");
              break;
            case BannerAdResult.CLICKED:
              print("---------------Clicked: $value");
              break;
            case BannerAdResult.LOGGING_IMPRESSION:
              print("------------------Logging Impression: $value");
              fbBannerAdLoaded = true;
              update();
              break;
          }
        },
      );
    } catch (e) {
      print("Exception - AdController.dart - loadfbBannerAd():" + e.toString());
    }
  }

  Future getAdmobSettings() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getAdmobSettings().then((response) async {
          if (response.statusCode == 200) {
            global.admobSetting = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - SplashController.dart - getAdmobSettings():" + e.toString());
    }
  }

  Future getFaceBookAdSetting() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getFaceBookAdSetting().then((response) async {
          if (response.statusCode == 200) {
            global.facebookAdSetting = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - SplashController.dart - getFaceBookAdSetting():" + e.toString());
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    myNative.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Future createAdmobBannerAd() async {
  //   try {
  //     if (global.admobSetting.bannerAdList != null && global.admobSetting.bannerAdList.length > 0) {
  //       if (global.admobSetting.bannerAdList[0] != null && global.admobSetting.bannerAdList[0].status == 1) {
  //         admobBannerAd1 = new BannerAd(
  //           adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
  //           size: AdSize.banner,
  //           request: AdRequest(),
  //           listener: BannerAdListener(
  //             onAdLoaded: (_) {
  //               isAdmobBannerAdLoaed1 = true;
  //               update();
  //               log("+++++++++++++++++++++++@onAdLoaded");
  //             },
  //             onAdFailedToLoad: (ad, error) {
  //               ad.dispose();
  //               log("+++++++++++++++++++++++@onAdFailedToLoad");
  //             },
  //             onAdImpression: (ad) {
  //               log("+++++++++++++++++++++++@onAdImpression");
  //             },
  //           ),
  //         )..load();
  //       }

  //       if (global.admobSetting.bannerAdList[1] != null && global.admobSetting.bannerAdList[1].status == 1) {
  //         admobBannerAd2 = new BannerAd(
  //           adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
  //           size: AdSize.banner,
  //           request: AdRequest(),
  //           listener: BannerAdListener(
  //             onAdLoaded: (_) {
  //               isAdmobBannerAdLoaed2 = true;
  //               update();
  //             },
  //             onAdFailedToLoad: (ad, error) {
  //               ad.dispose();
  //             },
  //           ),
  //         )..load();
  //       }

  //       if (global.admobSetting.bannerAdList[2] != null && global.admobSetting.bannerAdList[2].status == 1) {
  //         admobBannerAd3 = new BannerAd(
  //           adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
  //           size: AdSize.banner,
  //           request: AdRequest(),
  //           listener: BannerAdListener(
  //             onAdLoaded: (_) {
  //               isAdmobBannerAdLoaed3 = true;
  //               update();
  //             },
  //             onAdFailedToLoad: (ad, error) {
  //               ad.dispose();
  //             },
  //           ),
  //         )..load();
  //       }
  //     }
  // for (var i = 0; i < global.admobSetting.bannerAdList.length; i++) {
  //   _bannerAd = new BannerAd(
  //     adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
  //     size: AdSize.banner,
  //     request: AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) {
  //         isAdmobBannerAdLoaed = true;
  //         update();
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //       },
  //     ),
  //   );
  //   bannerAdList.add(_bannerAd);
  //   bannerAdList[i].load();
  //}
  //   } catch (e) {
  //     print("Exception - AdController.dart - createAdmobBannerAd():" + e.toString());
  //   }
  // }

  Future createInterstitialAd() async {
    try {
      InterstitialAd.load(
          adUnitId: "ca-app-pub-3940256099942544/1033173712",
          request: AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              print('$ad loaded');
              interstitialAd = ad;
              _numInterstitialLoadAttempts = 0;
              interstitialAd.setImmersiveMode(true);
            },
            onAdFailedToLoad: (LoadAdError error) {
              print('InterstitialAd failed to load: $error.');
              _numInterstitialLoadAttempts += 1;
              interstitialAd = null;
              if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
                createInterstitialAd();
              }
            },
          ));
    } catch (e) {
      print("Exception - AdController.dart - createInterstitialAd():" + e.toString());
    }
  }

  void showInterstitialAd() {
    try {
      interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) => print('ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          createInterstitialAd();
          global.admobclickCount = 0;
          update();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          createInterstitialAd();
          global.admobclickCount = 0;
          update();
        },
      );
      interstitialAd.show();
    } catch (e) {
      print("Exception - AdController.dart - showInterstitialAd():" + e.toString());
    }

    //interstitialAd = null;
  }

  Future loadFacebookInterstitialAd() async {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "IMG_16_9_APP_INSTALL#536153035214384_536898488473172",
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED) {}
        if (result == InterstitialAdResult.DISMISSED) {
          loadFacebookInterstitialAd();
          global.fbclickCount = 0;
          update();
        }
        if (result == InterstitialAdResult.LOGGING_IMPRESSION) {
          loadFacebookInterstitialAd();
          global.fbclickCount = 0;
          update();
        }
        if (result == InterstitialAdResult.ERROR) {
          global.fbclickCount = 0;
          update();
        }
      },
    );
  }
}
