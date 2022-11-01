import 'package:cashbackapp/constants/appConstant.dart';
import 'package:cashbackapp/controllers/networkController.dart';
import 'package:cashbackapp/models/commonModel.dart';
import 'package:cashbackapp/models/searchDataModel.dart';
import 'package:cashbackapp/services/apiHelper.dart';
import 'package:cashbackapp/widget/customLoader.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();

  var searchString = new TextEditingController();

  SearchDataModel searchData;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getSearchData(String keyword) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.search(keyword).then((response) {
          Get.back();
          if (response.status == "1") {
            searchData = response.data;
            if (searchData != null) {
              if (searchData.adsList != []) {
                for (var j = 0; j < searchData.adsList.length; j++) {
                  searchData.commonList.add(
                    CommonModel(
                      name: searchData.adsList[j].name,
                      image: searchData.adsList[j].image,
                      buttonText: searchData.adsList[j].buttonText,
                      trackingLink: searchData.adsList[j].landingPage,
                      adId: searchData.adsList[j].id.toString(),
                    ),
                  );
                }
              }

              if (searchData.campaignList != []) {
                for (var i = 0; i < searchData.campaignList.length; i++) {
                  searchData.commonList.add(
                    CommonModel(
                      name: searchData.campaignList[i].name,
                      image: searchData.campaignList[i].image,
                      buttonText: searchData.campaignList[i].buttonText,
                      trackingLink: searchData.campaignList[i].url,
                      campaignId: searchData.campaignList[i].id,
                    ),
                  );
                }
              }

              // for (var n = 0; n < _topCategoryList.length; n++) {
              //   if (_topCategoryList[n].cuecampaigns != []) {
              //     for (var k = 0; k < _topCategoryList[n].cuecampaigns.length; k++) {
              //       _topCategoryList[n].commonList.add(
              //             CommonModel(
              //               name: _topCategoryList[n].cuecampaigns[k].name,
              //               image: _topCategoryList[n].cuecampaigns[k].image,
              //               buttonText: _topCategoryList[n].cuecampaigns[k].buttonText,
              //               trackingLink: _topCategoryList[n].cuecampaigns[k].url,
              //               campaignId: _topCategoryList[n].cuecampaigns[k].id,
              //             ),
              //           );
              //     }
              //   }
              // }
            }
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
      update();
    } catch (e) {
      print("Exception - SearchController.dart - getSearchData():" + e.toString());
    }
  }
}
