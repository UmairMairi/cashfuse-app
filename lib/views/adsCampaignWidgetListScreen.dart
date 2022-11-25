// ignore_for_file: must_be_immutable

import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/models/commonModel.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/views/categoryScreen.dart';
import 'package:cashfuse/widget/adsCampaignWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsCampaignWidgetListScreen extends StatelessWidget {
  final String title;
  AdsCampaignWidgetListScreen({this.title});

  HomeController homeController = Get.find<HomeController>();

  void paginateTask() {
    homeController.scrollController.addListener(() async {
      if (homeController.scrollController.position.pixels == homeController.scrollController.position.maxScrollExtent) {
        homeController.isMoreDataAvailable.value = true;
        print('Reached end');
        await homeController.getAllAdv();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    paginateTask();
    return GetBuilder<HomeController>(builder: (homeController1) {
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text(
            title,
            style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
          ),
        ),
        body: GridView.builder(
          controller: homeController.scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
          ),
          itemCount: homeController.allAdvList.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(10).copyWith(top: 20),
          itemBuilder: (context, index) {
            return homeController.isMoreDataAvailable.value == true && homeController.allAdvList.length - 1 == index
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : InkWell(
                    onTap: () {
                      Get.to(() => CategoryScreen(
                            category: homeController.allAdvList[index],
                          ));
                    },
                    child: AdsCampaignWidget(
                      commonModel: CommonModel(
                        name: homeController.allAdvList[index].name,
                        image: '${global.appInfo.baseUrls.partnerImageUrl}/${homeController.allAdvList[index].image}',
                        tagline: homeController.allAdvList[index].tagline,
                        adId: homeController.allAdvList[index].id.toString(),
                      ),
                    ),
                  );
          },
        ),
      );
    });
  }
}