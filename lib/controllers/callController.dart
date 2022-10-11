import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallController extends GetxController with GetSingleTickerProviderStateMixin {
  List<String> tabList = ['All', 'Love', 'Career', 'Marriage', 'Health', 'Wealth', 'Finanace'];

  TabController tabController;

  @override
  void onInit() async {
    tabController = TabController(length: 5, vsync: this);
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
