import 'dart:async';

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/services/apiHelper.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
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

  String currentPlatform() {
    if (GetPlatform.isAndroid) {
      return 'android';
    } else if (GetPlatform.isIOS) {
      return 'ios';
    }
    return '';
  }

  @override
  void onInit() async {
    if (!GetPlatform.isWeb) {
      try {
        FacebookAudienceNetwork.init(
          iOSAdvertiserTrackingEnabled: false,
        );
      } catch (e) {
        print("Exception - main.dart - main():" + e.toString());
      }
      if (global.appInfo.admob == "1") {
        await getAdmobSettings();

        await createInterstitialAd();
      }
      if (global.appInfo.facebookAd == "1") {
        await getFaceBookAdSetting();
        await createFbBannerAd();

        await loadFacebookInterstitialAd();
      }
    }

    super.onInit();
  }

  Future createFbBannerAd() async {
    try {
      if (global.facebookAdSetting.bannerAdList != null && global.facebookAdSetting.bannerAdList.length > 0) {
        if (global.facebookAdSetting.bannerAdList[0] != null && global.facebookAdSetting.bannerAdList[0].status == 1 && global.admobSetting.bannerAdList[0].platform == currentPlatform()) {
          fbBannerAd1 = new FacebookBannerAd(
            placementId: global.facebookAdSetting.bannerAdList[0].placementId,
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

        if (global.facebookAdSetting.bannerAdList[1] != null && global.facebookAdSetting.bannerAdList[1].status == 1 && global.admobSetting.bannerAdList[1].platform == currentPlatform()) {
          fbBannerAd2 = new FacebookBannerAd(
            placementId: global.facebookAdSetting.bannerAdList[1].placementId,
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

        if (global.facebookAdSetting.bannerAdList[2] != null && global.facebookAdSetting.bannerAdList[2].status == 1 && global.admobSetting.bannerAdList[2].platform == currentPlatform()) {
          fbBannerAd3 = new FacebookBannerAd(
            placementId: global.facebookAdSetting.bannerAdList[2].placementId,
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

  Future createInterstitialAd() async {
    try {
      if (global.admobSetting.interstitialAdList[0] != null && global.admobSetting.interstitialAdList[0].status == 1 && global.admobSetting.interstitialAdList[0].platform == currentPlatform()) {
        InterstitialAd.load(
            adUnitId: global.admobSetting.interstitialAdList[0].adId,
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
      }
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
  }

  Future loadFacebookInterstitialAd() async {
    if (global.facebookAdSetting.interstitialAdList[0] != null && global.facebookAdSetting.interstitialAdList[0].status == 1 && global.facebookAdSetting.interstitialAdList[0].platform == currentPlatform()) {
      FacebookInterstitialAd.loadInterstitialAd(
        placementId: global.facebookAdSetting.interstitialAdList[0].placementId,
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
}
