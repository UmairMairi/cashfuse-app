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
import 'package:cashfuse/widget/customLoader.dart';
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashfuse/utils/global.dart' as global;

class HomeController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();
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

  String createdLink = '';
  ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    init();
    super.onInit();
  }

  init() async {
    try {
      await getTopCategories();
      await getTopCashBack(page);
      await getTopBanners();

      await getExclusiveOffers();

      await getNewFlashOffers();
      await getHomeAdv();
      getAllAdv();
      if (global.currentUser.id != null) {
        getClick();
        Get.find<AuthController>().getProfile();
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
              }
            }
          } else {
            showCustomSnackBar(response.message);
          }
        });
        isCategoryLoaded = true;
        update();
      } else {
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
        await apiHelper.getClick().then((response) {
          if (response.status == "1") {
            _recentClickList = response.data;
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
