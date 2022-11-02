import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:cashbackapp/widget/recentClickDialogWidget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentClickScreen extends StatelessWidget {
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.find<BottomNavigationController>().setBottomIndex(0);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Recent Clicks',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: homeController.recentClickList != null && homeController.recentClickList.length > 0
          ? Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Hey Shopper! This page shows all your clicks and transactions from the last 10 days.',
                    style: Get.theme.primaryTextTheme.subtitle2,
                  ),
                ),
                GetBuilder<HomeController>(builder: (home) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeController.recentClickList.length,
                      padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: Card(
                                  color: Colors.white,
                                  //margin: EdgeInsets.all(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CustomImage(
                                      image: homeController.recentClickList[index].image,
                                      height: 30,
                                      width: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                trailing: Text(
                                  '1 hour ago',
                                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  'Did you shop on ${homeController.recentClickList[index].name}?',
                                  style: Get.theme.primaryTextTheme.bodyText2.copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: DottedLine(
                                  dashColor: Colors.grey[350],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.dialog(
                                    Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      insetPadding: EdgeInsets.symmetric(horizontal: 15),
                                      child: RecentClickDialogWidget(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Yes I Did ',
                                        textAlign: TextAlign.center,
                                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 6,
                                        backgroundColor: Colors.teal,
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 8,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }),
              ],
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.Click_image,
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Don't stop, just shop!",
                      style: Get.theme.primaryTextTheme.subtitle1.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      "When you visit any of the sites on ${global.appName}, it will record your click and display on it.",
                      textAlign: TextAlign.center,
                      //style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Get.find<BottomNavigationController>().setBottomIndex(0);
                    },
                    child: Container(
                      height: 45,
                      width: Get.width / 2.5,
                      //margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                      decoration: BoxDecoration(
                        color: Get.theme.secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'SEE BEST DEALS',
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
