import 'package:cashbackapp/constants/appConstant.dart';
import 'package:cashbackapp/controllers/networkController.dart';
import 'package:cashbackapp/models/adsModel.dart';
import 'package:cashbackapp/models/bannerModel.dart';
import 'package:cashbackapp/models/campaignModel.dart';
import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/models/commonModel.dart';
import 'package:cashbackapp/models/offerModel.dart';
import 'package:cashbackapp/services/apiHelper.dart';
import 'package:cashbackapp/widget/customLoader.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:get/get.dart';

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

  OfferModel _offer = new OfferModel();
  OfferModel get offer => _offer;

  AdsModel _ads = new AdsModel();
  AdsModel get ads => _ads;

  CampaignModel _campaign = new CampaignModel();
  CampaignModel get campaign => _campaign;

  bool isCategoryLoaded = false;
  bool isBannerLoaded = false;
  bool isOfferLoaded = false;

  bool isCategoryExpand = false;
  bool isRoted = true;
  bool isOffer = false;
  int webBottomIndex = 0;
  int bannerIndex = 0;

  @override
  void onInit() async {
    await getTopBanners();
    await getTopCategories();
    await getExclusiveOffers();
    await getTopCashBack();
    await getNewFlashOffers();
    await getHomeAdv();
    await getAllAdv();

    super.onInit();
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

  void updtaeRotate(bool val) {
    isRoted = val;
    update();
  }

  void setBannerIndex(int val) {
    bannerIndex = val;
    update();
  }

  Future getTopCategories() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getTopCategories().then((response) {
          if (response.status == "1") {
            _topCategoryList = response.data;

            if (_topCategoryList != []) {
              for (var i = 0; i < _topCategoryList.length; i++) {
                if (_topCategoryList[i].ads != []) {
                  for (var j = 0; j < _topCategoryList[i].ads.length; j++) {
                    _topCategoryList[i].commonList.add(
                          CommonModel(
                            name: _topCategoryList[i].ads[j].name,
                            image: _topCategoryList[i].ads[j].image,
                            buttonText: _topCategoryList[i].ads[j].buttonText,
                            trackingLink: _topCategoryList[i].ads[j].trackingLink,
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
                            image: _topCategoryList[n].cuecampaigns[k].image,
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
      print("Exception - HomeController.dart - getTopCategories():" + e.toString());
    }
  }

  Future getTopCashBack() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getTopCashBack().then((response) {
          if (response.status == "1") {
            _topCashbackList = response.data;
            update();
            if (_topCashbackList != []) {
              for (var i = 0; i < _topCashbackList.length; i++) {
                if (_topCashbackList[i].ads != []) {
                  for (var j = 0; j < _topCashbackList[i].ads.length; j++) {
                    _topCashbackList[i].commonList.add(
                          CommonModel(
                            name: _topCashbackList[i].ads[j].name,
                            image: _topCashbackList[i].ads[j].image,
                            buttonText: _topCashbackList[i].ads[j].buttonText,
                            trackingLink: _topCashbackList[i].ads[j].trackingLink,
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
                            image: _topCashbackList[n].cuecampaigns[k].image,
                            buttonText: _topCashbackList[n].cuecampaigns[k].buttonText,
                            trackingLink: _topCashbackList[n].cuecampaigns[k].url,
                            campaignId: _topCashbackList[n].cuecampaigns[k].id,
                          ),
                        );
                  }
                }
              }
              update();
            }
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - getTopCashBack():" + e.toString());
    }
  }

  Future getHomeAdv() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getHomeAdv().then((response) {
          if (response.status == "1") {
            _homeAdvList = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - getHomeAdv():" + e.toString());
    }
  }

  Future getAllAdv() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getAllAdv().then((response) {
          if (response.status == "1") {
            _allAdvList = response.data;
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
      print("Exception - HomeController.dart - getExclusiveOffers():" + e.toString());
    }
  }

  Future getNewFlashOffers() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getNewFlashOffers().then((response) {
          if (response.status == "1") {
            _newFlashOfferList = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - getNewFlashOffers():" + e.toString());
    }
  }

  Future getTopBanners() async {
    try {
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
        });
        isBannerLoaded = true;
        update();
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
        });
        isBannerLoaded = true;
        update();
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
        });
        isBannerLoaded = true;
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - HomeController.dart - getCampignDetails():" + e.toString());
    }
  }
}
