import 'dart:async';
import 'dart:developer';

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/authController.dart';
import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/models/adsModel.dart';
import 'package:cashfuse/models/bannerModel.dart';
import 'package:cashfuse/models/campaignModel.dart';
import 'package:cashfuse/models/categoryModel.dart';
import 'package:cashfuse/models/clickModel.dart';
import 'package:cashfuse/models/commonModel.dart';
import 'package:cashfuse/models/offerModel.dart';
import 'package:cashfuse/services/apiHelper.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/widget/customLoader.dart';
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.put(NetworkController());
  List<CategoryModel> _topCategoryList = [];
  List<CategoryModel> get topCategoryList => _topCategoryList;

  List<CategoryModel> _topCashbackList = [];
  List<CategoryModel> get topCashbackList => _topCashbackList;

  List<CategoryModel> _homeAdvList = [];
  List<CategoryModel> get homeAdvList => _homeAdvList;

  List<CategoryModel> _allAdvList = [];
  List<CategoryModel> get allAdvList => _allAdvList;

  List<OfferModel> _exclusiveOfferList = [];
  List<OfferModel> get exclusiveOfferList => _exclusiveOfferList;

  List<OfferModel> _newFlashOfferList = [];
  List<OfferModel> get newFlashOfferList => _newFlashOfferList;

  List<BannerModel> _topBannerList = [];
  List<BannerModel> get topBannerList => _topBannerList;

  List<ClickModel> _recentClickList = [];
  List<ClickModel> get recentClickList => _recentClickList;

  List<CampaignModel> _seeMoreCampaignList = [];
  List<CampaignModel> get seeMoreCampaignList => _seeMoreCampaignList;

  List<OfferModel> _seeMoreOfferList = [];
  List<OfferModel> get seeMoreOfferList => _seeMoreOfferList;

  List<AdsModel> _seeMoreAdsList = [];
  List<AdsModel> get seeMoreAdsList => _seeMoreAdsList;

  OfferModel _offer = new OfferModel();
  OfferModel get offer => _offer;

  AdsModel _ads = new AdsModel();
  AdsModel get ads => _ads;

  CampaignModel _campaign = new CampaignModel();
  CampaignModel get campaign => _campaign;

  bool isCategoryLoaded = false;
  bool isBannerLoaded = false;
  bool isTopCashbackLoaded = false;
  bool isOfferLoaded = false;
  bool isHomeAdvLoaded = false;
  bool isFlashOffersLoaded = false;

  bool isCategoryExpand = false;
  bool isRoted = true;
  bool isOffer = false;
  int webBottomIndex = 0;
  int bannerIndex = 0;
  int page = 1;
  var isMoreDataAvailable = true.obs;
  var isAllDataLoaded = false.obs;
  var isClickDataLoaded = false.obs;

  String createdLink = '';
  ScrollController scrollController = ScrollController();
  List<BannerAd> bannerAdList = [];
  List<FacebookBannerAd> facebookBannerAdList = [];
  bool isAdLoaed = false;
  InterstitialAd _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  int maxFailedLoadAttempts = 3;

  RewardedAd _rewardedAd;
  int _numRewardedLoadAttempts = 0;

  NativeAd nativeAd;
  StreamSubscription _subscription;
  double adheight = 0.0;
  final nativeAdController = NativeAdmobController();

  @override
  void onInit() async {
    _subscription = nativeAdController.stateChanged.listen(_onStateChanged);
    try {
      FacebookAudienceNetwork.init(iOSAdvertiserTrackingEnabled: false);
    } catch (e) {
      print("Exception - main.dart - main():" + e.toString());
    }
    await createBannerAd();
    await createInterstitialAd();
    //createFaceBookBannerAd();
    loadFacebookInterstitialAd();
    init();

    super.onInit();
  }

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        adheight = 0.0;
        update();
        break;

      case AdLoadState.loadCompleted:
        adheight = 330;
        update();
        break;

      default:
        break;
    }
  }

  Future createBannerAd() async {
    try {
      BannerAd _bannerAd;
      for (var i = 0; i < global.admobSetting.bannerAdList.length; i++) {
        _bannerAd = BannerAd(
          adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
          size: AdSize.banner,
          request: AdRequest(),
          listener: BannerAdListener(
            onAdLoaded: (_) {
              isAdLoaed = true;
              update();
            },
            onAdFailedToLoad: (ad, error) {
              ad.dispose();
            },
          ),
        );
        bannerAdList.add(_bannerAd);
        bannerAdList[i].load();
      }
    } catch (e) {
      print("Exception - HomeController.dart - createBannerAd():" + e.toString());
    }
  }

  Future createFaceBookBannerAd() async {
    try {
      FacebookBannerAd _facebookBannerAd;
      for (var i = 0; i < global.facebookAdSetting.bannerAdList.length; i++) {
        _facebookBannerAd = FacebookBannerAd(
          placementId: 'IMG_16_9_LINK#536153035214384_536898305139857',
          bannerSize: BannerSize.STANDARD,
          keepAlive: true,
          listener: (result, value) {
            switch (result) {
              case BannerAdResult.ERROR:
                print("Error: $value");
                break;
              case BannerAdResult.LOADED:
                print("Loaded: $value");
                break;
              case BannerAdResult.CLICKED:
                print("Clicked: $value");
                break;
              case BannerAdResult.LOGGING_IMPRESSION:
                print("Logging Impression: $value");
                break;
            }
          },
        );
        facebookBannerAdList.add(_facebookBannerAd);
      }
      update();
    } catch (e) {
      print("Exception - HomeController.dart - createFaceBookBannerAd():" + e.toString());
    }
  }

  Future createInterstitialAd() async {
    try {
      InterstitialAd.load(
          adUnitId: "ca-app-pub-3940256099942544/1033173712",
          request: AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              print('$ad loaded');
              _interstitialAd = ad;
              _numInterstitialLoadAttempts = 0;
              _interstitialAd.setImmersiveMode(true);
            },
            onAdFailedToLoad: (LoadAdError error) {
              print('InterstitialAd failed to load: $error.');
              _numInterstitialLoadAttempts += 1;
              _interstitialAd = null;
              if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
                createInterstitialAd();
              }
            },
          ));
    } catch (e) {
      print("Exception - HomeController.dart - createInterstitialAd():" + e.toString());
    }
  }

  void showInterstitialAd() {
    try {
      if (_interstitialAd == null) {
        print('Warning: attempt to show interstitial before loaded.');
        return;
      }
      _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) => print('ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          createInterstitialAd();
          global.clickCount = 0;
          update();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          createInterstitialAd();
        },
        onAdClicked: (ad) {
          log(ad.adUnitId);
        },
      );
      _interstitialAd.show();
    } catch (e) {
      print("Exception - HomeController.dart - showInterstitialAd():" + e.toString());
    }

    //_interstitialAd = null;
  }

  void createRewardedAd() {
    RewardedAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/5224354917',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              createRewardedAd();
            }
          },
        ));
  }

  void loadFacebookInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      // placementId: "YOUR_PLACEMENT_ID",
      placementId: "IMG_16_9_APP_INSTALL#536153035214384_536898488473172",
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED) {
          loadFacebookInterstitialAd();
        }
        if (result == InterstitialAdResult.ERROR) {
          loadFacebookInterstitialAd();
        }
      },
    );
  }

  void showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) => print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createRewardedAd();
      },
    );

    _rewardedAd.setImmersiveMode(true);
    _rewardedAd.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
    });
    _rewardedAd = null;
  }

  Future createNativeAd() async {
    try {
      nativeAd = NativeAd(
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        factoryId: 'com.cashfuse.app',
        request: AdRequest(),
        nativeAdOptions: NativeAdOptions(
          mediaAspectRatio: MediaAspectRatio.portrait,
          adChoicesPlacement: AdChoicesPlacement.topLeftCorner,
          shouldRequestMultipleImages: true,
          videoOptions: VideoOptions(),
        ),
        listener: NativeAdListener(
          onAdLoaded: (_) {
            isAdLoaed = true;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
      );

      nativeAd.load();
    } catch (e) {
      print("Exception - HomeController.dart - createNativeAd():" + e.toString());
    }
  }

  init() async {
    try {
      if (global.appInfo.baseUrls == null) {
        await apiHelper.getAppInfo().then((response) {
          if (response.statusCode == 200) {
            global.appInfo = response.data;
            update();
          }
        });
      }
      await getTopBanners();

      await getTopCategories();
      await getTopCashBack(page);

      await getExclusiveOffers();

      await getNewFlashOffers();
      await getHomeAdv();

      await getAllAdv();
      if (global.currentUser.id != null) {
        await getClick();
        await Get.find<AuthController>().getProfile();
      }
    } catch (e) {
      print("Exception - HomeController.dart - _init():" + e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCategoryExpand(bool val) {
    isCategoryExpand = val;
    update();
  }

  void setIsOffer(bool val) {
    isOffer = val;
    update();
  }

  void setWebBottomIndex(int val) {
    webBottomIndex = val;
    update();
  }

  void updtaeRotate(bool val) async {
    isRoted = val;
    update();
  }

  void setBannerIndex(int val) {
    bannerIndex = val;
    update();
  }

  Future getTopCategories() async {
    try {
      isCategoryLoaded = false;
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        if (_topCategoryList.length > 0) {
          page++;
        } else {
          page = 1;
        }
        await apiHelper.getTopCategories(page).then((response) {
          if (response.status == "1") {
            List<CategoryModel> _tList = response.data;
            if (_tList.isEmpty) {
              isMoreDataAvailable.value = false;
              isAllDataLoaded.value = true;
            }
            _topCategoryList.addAll(_tList);

            update();

            if (_topCategoryList != []) {
              for (var i = 0; i < _topCategoryList.length; i++) {
                if (_topCategoryList[i].ads != []) {
                  for (var j = 0; j < _topCategoryList[i].ads.length; j++) {
                    _topCategoryList[i].commonList.add(
                          CommonModel(
                            name: _topCategoryList[i].ads[j].name,
                            image: '${global.appInfo.baseUrls.offerImageUrl}/${_topCategoryList[i].ads[j].image}',
                            buttonText: _topCategoryList[i].ads[j].buttonText,
                            trackingLink: _topCategoryList[i].ads[j].landingPage,
                            adId: _topCategoryList[i].ads[j].id.toString(),
                          ),
                        );
                  }
                }

                // if (_topCategoryList[i].commonList.length > 0) {
                //   for (var t = 0; t < _topCategoryList[i].commonList.length; t++) {
                //     _topCategoryList[i].commonList.insert((t * 3) + 3, CommonModel(name: 'Ad'));
                //   }
                // }
              }
              for (var n = 0; n < _topCategoryList.length; n++) {
                if (_topCategoryList[n].cuecampaigns != []) {
                  for (var k = 0; k < _topCategoryList[n].cuecampaigns.length; k++) {
                    _topCategoryList[n].commonList.add(
                          CommonModel(
                            name: _topCategoryList[n].cuecampaigns[k].name,
                            image: '${global.appInfo.baseUrls.offerImageUrl}/${_topCategoryList[n].cuecampaigns[k].image}',
                            buttonText: _topCategoryList[n].cuecampaigns[k].buttonText,
                            trackingLink: _topCategoryList[n].cuecampaigns[k].url,
                            campaignId: _topCategoryList[n].cuecampaigns[k].id,
                          ),
                        );
                  }
                }
                // if (_topCategoryList[n].commonList.length > 0) {
                //   for (var t = 0; t < _topCategoryList[n].commonList.length; n++) {
                //     _topCategoryList[n].commonList.insert((t * 3) + 3, CommonModel(name: 'Ad'));
                //   }
                // }
              }
            }
          } else {
            showCustomSnackBar(response.message);
          }
        });
        isCategoryLoaded = true;
        update();
      } else {
        isCategoryLoaded = true;
        update();
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      isCategoryLoaded = true;
      update();
      print("Exception - HomeController.dart - getTopCategories():" + e.toString());
    }
  }

  Future getTopCashBack(int page) async {
    try {
      isTopCashbackLoaded = false;

      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        if (_topCashbackList.length > 0) {
          page = page++;
        }
        await apiHelper.getTopCashBack(page).then((response) {
          if (response.status == "1") {
            List<CategoryModel> _tList = response.data;
            if (_tList.isEmpty) {
              isMoreDataAvailable.value = false;
            }
            _topCashbackList.addAll(_tList);

            update();
            if (_topCashbackList != []) {
              for (var i = 0; i < _topCashbackList.length; i++) {
                if (_topCashbackList[i].ads != []) {
                  for (var j = 0; j < _topCashbackList[i].ads.length; j++) {
                    _topCashbackList[i].commonList.add(
                          CommonModel(
                            name: _topCashbackList[i].ads[j].name,
                            image: '${global.appInfo.baseUrls.offerImageUrl}/${_topCashbackList[i].ads[j].image}',
                            buttonText: _topCashbackList[i].ads[j].buttonText,
                            trackingLink: _topCashbackList[i].ads[j].landingPage,
                            adId: _topCashbackList[i].ads[j].id.toString(),
                          ),
                        );
                  }
                }

                // if (_topCashbackList[i].commonList.length > 0) {
                //   for (var t = 0; t < _topCashbackList[i].commonList.length; t++) {
                //     _topCashbackList[i].commonList.insert((t * 3) + 3, CommonModel(name: 'Ad'));
                //   }
                // }
              }
              for (var n = 0; n < _topCashbackList.length; n++) {
                if (_topCashbackList[n].cuecampaigns != []) {
                  for (var k = 0; k < _topCashbackList[n].cuecampaigns.length; k++) {
                    _topCashbackList[n].commonList.add(
                          CommonModel(
                            name: _topCashbackList[n].cuecampaigns[k].name,
                            image: '${global.appInfo.baseUrls.offerImageUrl}/${_topCashbackList[n].cuecampaigns[k].image}',
                            buttonText: _topCashbackList[n].cuecampaigns[k].buttonText,
                            trackingLink: _topCashbackList[n].cuecampaigns[k].url,
                            campaignId: _topCashbackList[n].cuecampaigns[k].id,
                          ),
                        );
                  }
                }
                // if (_topCashbackList[n].commonList.length > 0) {
                //   for (var t = 0; t < _topCashbackList[n].commonList.length; t++) {
                //     _topCashbackList[n].commonList.insert((t * 3) + 3, CommonModel(name: 'Ad'));
                //   }
                // }
              }
            }
          } else {
            showCustomSnackBar(response.message);
          }
        });
        isTopCashbackLoaded = true;
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      isTopCashbackLoaded = true;
      update();
      print("Exception - HomeController.dart - getTopCashBack():" + e.toString());
    }
  }

  Future getHomeAdv() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getHomeAdv().then((response) {
          if (response.status == "1") {
            _homeAdvList = response.data;

            if (_homeAdvList != []) {
              for (var i = 0; i < _homeAdvList.length; i++) {
                if (_homeAdvList[i].ads != []) {
                  for (var j = 0; j < _homeAdvList[i].ads.length; j++) {
                    _homeAdvList[i].commonList.add(
                          CommonModel(
                            name: _homeAdvList[i].ads[j].name,
                            image: _homeAdvList[i].ads[j].image,
                            buttonText: _homeAdvList[i].ads[j].buttonText,
                            trackingLink: _homeAdvList[i].ads[j].landingPage,
                            adId: _homeAdvList[i].ads[j].id.toString(),
                          ),
                        );
                  }
                  // if (_homeAdvList[i].commonList.length > 0) {
                  //   for (var t = 0; t < _homeAdvList[i].commonList.length; t++) {
                  //     _homeAdvList[i].commonList.insert((t * 3) + 3, CommonModel(name: 'Ad'));
                  //   }
                  // }
                }
              }
              for (var n = 0; n < _homeAdvList.length; n++) {
                if (_homeAdvList[n].cuecampaigns != []) {
                  for (var k = 0; k < _homeAdvList[n].cuecampaigns.length; k++) {
                    _homeAdvList[n].commonList.add(
                          CommonModel(
                            name: _homeAdvList[n].cuecampaigns[k].name,
                            image: _homeAdvList[n].cuecampaigns[k].image,
                            buttonText: _homeAdvList[n].cuecampaigns[k].buttonText,
                            trackingLink: _homeAdvList[n].cuecampaigns[k].url,
                            campaignId: _homeAdvList[n].cuecampaigns[k].id,
                          ),
                        );
                  }
                  // if (_homeAdvList[n].commonList.length > 0) {
                  //   for (var t = 0; t < _homeAdvList[n].commonList.length; t++) {
                  //     _homeAdvList[n].commonList.insert((t * 3) + 3, CommonModel(name: 'Ad'));
                  //   }
                  // }
                }
              }
            }
          } else {
            showCustomSnackBar(response.message);
          }
        });
        isHomeAdvLoaded = true;
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      isHomeAdvLoaded = true;
      update();
      print("Exception - HomeController.dart - getHomeAdv():" + e.toString());
    }
  }

  Future getAllAdv() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        if (_allAdvList.length > 0) {
          page++;
        } else {
          page = 1;
        }
        await apiHelper.getAllAdv(page).then((response) {
          if (response.status == "1") {
            List<CategoryModel> _tList = response.data;
            if (_tList.isEmpty) {
              isMoreDataAvailable.value = false;
            }
            _allAdvList.addAll(_tList);

            update();
            if (_allAdvList != []) {
              for (var i = 0; i < _allAdvList.length; i++) {
                if (_allAdvList[i].ads != []) {
                  for (var j = 0; j < _allAdvList[i].ads.length; j++) {
                    _allAdvList[i].commonList.add(
                          CommonModel(
                            name: _allAdvList[i].ads[j].name,
                            image: '${global.appInfo.baseUrls.offerImageUrl}/${_allAdvList[i].ads[j].image}',
                            buttonText: _allAdvList[i].ads[j].buttonText,
                            trackingLink: _allAdvList[i].ads[j].landingPage,
                            adId: _allAdvList[i].ads[j].id.toString(),
                          ),
                        );
                  }
                }
              }
              for (var n = 0; n < _allAdvList.length; n++) {
                if (_allAdvList[n].cuecampaigns != []) {
                  for (var k = 0; k < _allAdvList[n].cuecampaigns.length; k++) {
                    _allAdvList[n].commonList.add(
                          CommonModel(
                            name: _allAdvList[n].cuecampaigns[k].name,
                            image: '${global.appInfo.baseUrls.offerImageUrl}/${_allAdvList[n].cuecampaigns[k].image}',
                            buttonText: _allAdvList[n].cuecampaigns[k].buttonText,
                            trackingLink: _allAdvList[n].cuecampaigns[k].url,
                            campaignId: _allAdvList[n].cuecampaigns[k].id,
                          ),
                        );
                  }
                }
              }
            }
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - getAllAdv():" + e.toString());
    }
  }

  Future getExclusiveOffers() async {
    try {
      isOfferLoaded = false;
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getExclusiveOffers().then((response) {
          if (response.status == "1") {
            _exclusiveOfferList = response.data;
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
      isOfferLoaded = true;
      update();
    } catch (e) {
      isOfferLoaded = true;
      update();
      print("Exception - HomeController.dart - getExclusiveOffers():" + e.toString());
    }
  }

  Future getNewFlashOffers() async {
    try {
      isFlashOffersLoaded = false;
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getNewFlashOffers().then((response) {
          if (response.status == "1") {
            _newFlashOfferList = response.data;
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
      isFlashOffersLoaded = true;
      update();
    } catch (e) {
      isFlashOffersLoaded = true;
      update();
      print("Exception - HomeController.dart - getNewFlashOffers():" + e.toString());
    }
  }

  Future getTopBanners() async {
    try {
      isBannerLoaded = false;
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getTopBanners().then((response) {
          if (response.status == "1") {
            _topBannerList = response.data;

            if (_topBannerList.length > 0) {
              for (var i = 0; i < _topBannerList.length; i++) {
                //if (i == _topBannerList.length / 3) {
                _topBannerList.insert(
                  (i * 3) + 3,
                  BannerModel(name: 'Ad'),
                );
                //}
              }
            }
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
        isBannerLoaded = true;
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      isBannerLoaded = true;
      update();
      print("Exception - HomeController.dart - getTopBanners():" + e.toString());
    }
  }

  int countTimer(DateTime startTime, DateTime endTime) {
    try {
      int diff;
      if (startTime != null && endTime != null) {
        diff = endTime.difference(startTime).inDays;
        print(diff);
      }
      return diff > 0 ? diff : null;
    } catch (e) {
      print("Exception - HomeController.dart - countTimer():" + e.toString());
      return null;
    }
  }

  Future getOfferDetails(String offerId) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.getOfferDetails(offerId).then((response) {
          Get.back();
          if (response.status == "1") {
            _offer = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
          getMoreOffers(offerId);
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - getOfferDetails():" + e.toString());
    }
  }

  Future getAdDetails(String adId) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.getAdDetails(adId).then((response) {
          Get.back();
          if (response.status == "1") {
            _ads = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
          getMoreAds(adId);
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - getAdDetails():" + e.toString());
    }
  }

  Future getCampignDetails(String campaignId) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.getCampignDetails(campaignId).then((response) {
          Get.back();
          if (response.status == "1") {
            _campaign = response.data;

            update();
          } else {
            showCustomSnackBar(response.message);
          }
          getMoreCampaign(campaignId);
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - getCampignDetails():" + e.toString());
    }
  }

  Future getTrackingLink(String url, String type, {String cId}) async {
    try {
      createdLink = '';
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.getTrackingLink(url, type, cId: cId).then((response) {
          Get.back();
          if (response.status == "1") {
            createdLink = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - getTrackingLink():" + e.toString());
    }
  }

  Future addClick(String name, String image, String trackingLink) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.addClick(name, image, trackingLink).then((response) {
          if (response.status == "1") {
            getClick();
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - addClick():" + e.toString());
    }
  }

  Future getClick() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        isClickDataLoaded.value = false;
        await apiHelper.getClick().then((response) {
          if (response.status == "1") {
            _recentClickList = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
        isClickDataLoaded.value = true;
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - getClick():" + e.toString());
    }
  }

  Future deleteClicks() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.deleteClicks().then((response) {
          Get.back();
          if (response.status == "1") {
            //_recentClickList = response.data;
            showCustomSnackBar(response.message);
            getClick();
          } else {
            showCustomSnackBar(response.message);
          }
        });
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - deleteClicks():" + e.toString());
    }
  }

  String clickDialogText(ClickModel click) {
    try {
      String value = '';
      if (DateTime.now().difference(click.createdAt).inDays == 0) {
        value = 'All is Well\nit will take upto 72 hours to track your rewards till then keep shopping so #yougetmore ';
      } else if (DateTime.now().difference(click.createdAt).inDays == 1) {
        value = 'All is Well\nit will take upto 36 hours to track your rewards till then keep shopping so #yougetmore ';
      } else if (DateTime.now().difference(click.createdAt).inDays == 2) {
        value = 'All is Well\nit will take upto 24 hours to track your rewards till then keep shopping so #yougetmore';
      } else {
        value = "your earnings will show on My Orders Details.\nif you don't see your earnings there , please click below.";
      }
      return value;
    } catch (e) {
      print("Exception - HomeController.dart - clickDialogText():" + e.toString());
      return '';
    }
  }

  String clickTime(ClickModel click) {
    try {
      String value = '';
      if (DateTime.now().difference(click.createdAt).inDays > 0) {
        value = '${DateTime.now().difference(click.createdAt).inDays} day ago';
      } else if (DateTime.now().difference(click.createdAt).inHours > 0) {
        value = '${DateTime.now().difference(click.createdAt).inHours} hour ago';
      } else if (DateTime.now().difference(click.createdAt).inMinutes > 0) {
        value = '${DateTime.now().difference(click.createdAt).inMinutes} min ago';
      } else if (DateTime.now().difference(click.createdAt).inSeconds > 0) {
        value = 'Just Now';
      }

      return value;
    } catch (e) {
      print("Exception - HomeController.dart - clickTime():" + e.toString());
      return '';
    }
  }

  Future getMoreCampaign(String campaignId) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        //Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.getMoreCampaign(campaignId).then((response) {
          //Get.back();
          if (response.status == "1") {
            _seeMoreCampaignList = response.data;
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
      update();
    } catch (e) {
      print("Exception - HomeController.dart - getMoreCampaign():" + e.toString());
    }
  }

  Future getMoreOffers(String offerId) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        // Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.getMoreOffers(offerId).then((response) {
          //Get.back();
          if (response.status == "1") {
            _seeMoreOfferList = response.data;
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
      update();
    } catch (e) {
      print("Exception - HomeController.dart - getMoreOffers():" + e.toString());
    }
  }

  Future getMoreAds(String adId) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        //Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.getMoreAds(adId).then((response) {
          //Get.back();
          if (response.status == "1") {
            _seeMoreAdsList = response.data;
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
      update();
    } catch (e) {
      print("Exception - HomeController.dart - getMoreAds():" + e.toString());
    }
  }
}
