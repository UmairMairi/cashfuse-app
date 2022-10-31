import 'package:cashbackapp/constants/appConstant.dart';
import 'package:cashbackapp/controllers/networkController.dart';
import 'package:cashbackapp/models/faqModel.dart';
import 'package:cashbackapp/services/apiHelper.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController with GetTickerProviderStateMixin {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();
  List<FaqModel> _faqList = [];
  List<FaqModel> get faqList => _faqList;
  String aboutUs = '';
  String privacyPolicy = '';

  TabController tabController;

  bool isfaqLoaded = false;

  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
    await getFaqs();
    await getAboutUs();
    await getPrivacyPolicy();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setTabIndex(int index) {
    tabController.index = index;
    update();
  }

  Future getFaqs() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getFaqs().then((response) {
          if (response.status == "1") {
            _faqList = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
      isfaqLoaded = true;
      update();
    } catch (e) {
      print("Exception - CommonController.dart - getFaqs():" + e.toString());
    }
  }

  Future getAboutUs() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getAboutUs().then((response) {
          if (response.status == "1") {
            aboutUs = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - CommonController.dart - getAboutUs():" + e.toString());
    }
  }

  Future getPrivacyPolicy() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getPrivacyPolicy().then((response) {
          if (response.status == "1") {
            privacyPolicy = response.data;
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - CommonController.dart - getPrivacyPolicy():" + e.toString());
    }
  }
}
