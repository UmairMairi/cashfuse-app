import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonController extends GetxController with GetTickerProviderStateMixin {
  TabController tabController;

  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
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
}
