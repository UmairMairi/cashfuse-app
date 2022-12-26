// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/adController.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/models/categoryModel.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/widget/adsCampaignWidget.dart';
import 'package:cashfuse/widget/drawerWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  final CategoryModel category;
  CategoryScreen({this.category, this.title});

  HomeController homeController = Get.find<HomeController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    log("@@@@@@@@@@@@@@@@@@@@@@@@@@@${homeController.catPageListIndex.toString()}");
    return Scaffold(
      key: scaffoldKey,
      drawer: global.getPlatFrom() ? DrawerWidget() : null,
      appBar: global.getPlatFrom()
          ? WebTopBarWidget(
              scaffoldKey: scaffoldKey,
            )
          : AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
              title: Text(
                category != null ? category.name : '',
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
              ),
            ),
      body: GetBuilder<AdController>(builder: (adController) {
        return SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: AppConstants.WEB_MAX_WIDTH,
              child: Column(
                children: [
                  // FacebookNativeAd(
                  //   placementId: "VID_HD_16_9_46S_APP_INSTALL#536153035214384_536880055141682",
                  //   adType: NativeAdType.NATIVE_AD,
                  //   width: double.infinity,
                  //   height: 300,
                  //   keepAlive: true,
                  //   backgroundColor: Colors.blue,
                  //   titleColor: Colors.white,
                  //   descriptionColor: Colors.white,
                  //   buttonColor: Colors.deepPurple,
                  //   buttonTitleColor: Colors.white,
                  //   buttonBorderColor: Colors.white,
                  //   listener: (result, value) {
                  //     print("Native Ad: $result --> $value");
                  //   },
                  //   keepExpandedWhileLoading: true,
                  //   expandAnimationDuraion: 1000,
                  // ),
                  // Get.find<AdController>().isAdmobBannerAdLoaed
                  //     ? Container(
                  //         height: 100,
                  //         child: AdWidget(
                  //           key: Key('0'),
                  //           ad: Get.find<AdController>().myNative,
                  //         ))
                  //     : SizedBox(),
                  // category.ads != []
                  //     ? Container(
                  //         height: 50,
                  //         alignment: Alignment.center,
                  //         color: Colors.blue[800],
                  //         child: Text(
                  //           'Ads(${category.ads.length})',
                  //           style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                  //         ),
                  //       )
                  //     : SizedBox(),
                  // DefaultTabController(
                  //   length: 4,
                  //   child: TabBar(
                  //     indicatorWeight: 2.5,
                  //     indicatorSize: TabBarIndicatorSize.label,
                  //     tabs: [
                  //       Tab(
                  //         text: 'Popular',
                  //       ),
                  //       Tab(
                  //         text: 'A-Z',
                  //       ),
                  //       Tab(
                  //         text: 'Percent',
                  //       ),
                  //       Tab(
                  //         text: 'Amount',
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  category.commonList != null && category.commonList.length > 0
                      ? GetBuilder<HomeController>(builder: (controller) {
                          return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              log("&&&&&&&&&&&&&&&&&&&&&&${category.commonList.length % 2}");
                              return
                                  // (((category.commonList.length - 1) % 2) == 0)
                                  //     ?
                                  SizedBox(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: AdsCampaignWidget(
                                          commonModel: category.commonList[index],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: AdsCampaignWidget(
                                          commonModel: category.commonList[index],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              // : AdsCampaignWidget(
                              //     commonModel: category.commonList[index],
                              //   );
                            },
                            separatorBuilder: (context, index) {
                              return category.commonList[index].name == 'Ad' && adController.fbBannerAdLoaded
                                  ? FacebookNativeAd(
                                      keepAlive: true,
                                      placementId: "VID_HD_16_9_46S_APP_INSTALL#536153035214384_536880055141682",
                                      adType: NativeAdType.NATIVE_AD,
                                      // width: Get.width,
                                      // height: 300,
                                      backgroundColor: Colors.blue,
                                      titleColor: Colors.white,
                                      descriptionColor: Colors.white,
                                      buttonColor: Colors.deepPurple,
                                      buttonTitleColor: Colors.white,
                                      buttonBorderColor: Colors.white,
                                      listener: (result, value) {
                                        print("Native Ad: $result --> $value");
                                      },
                                      keepExpandedWhileLoading: true,
                                      // expandAnimationDuraion: 1000,
                                    )
                                  : category.commonList[index].name == 'Ad' && adController.admobNativeAdLoaded
                                      ? Container(
                                          height: 100,
                                          child: AdWidget(
                                            key: Key('$index'),
                                            ad: adController.myNative,
                                          ),
                                        )
                                      : SizedBox();
                            },
                            itemCount: category.commonList.length,
                          );
                        })
                      //   GridView.count(
                      //     childAspectRatio: 1,
                      //     crossAxisCount: category.commonList.where((element) => element.name == 'Ad').toList().length > 0 ? 1 : 2,
                      //     // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     //   crossAxisCount: global.getPlatFrom() ? 4 : 2,
                      //     //   crossAxisSpacing: global.getPlatFrom() ? 25 : 15.0,
                      //     //   mainAxisSpacing: global.getPlatFrom() ? 25 : 15.0,
                      //     // ),
                      //     //itemCount: category.commonList.length,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      //     children: [
                      //       category.commonList[homeController.catPageListIndex].name == 'Ad'
                      //           ? Container(
                      //               color: Colors.red,
                      //               height: 100,
                      //               width: Get.width,
                      //             )
                      //           : GridView.builder(
                      //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //                 crossAxisCount: global.getPlatFrom() ? 4 : 2,
                      //                 crossAxisSpacing: global.getPlatFrom() ? 25 : 15.0,
                      //                 mainAxisSpacing: global.getPlatFrom() ? 25 : 15.0,
                      //               ),
                      //               itemCount: category.commonList.length,
                      //               itemBuilder: (context, index) {
                      //                 Future.delayed(Duration.zero).then(
                      //                   (value) {
                      //                     homeController.setcatListIndex(index);
                      //                   },
                      //                 );
                      //                 return InkWell(
                      //                   onTap: () async {
                      //                     if (category.commonList[index].adId != null && category.commonList[index].adId.isNotEmpty) {
                      //                       await homeController.getAdDetails(category.commonList[index].adId);
                      //                       Get.to(() => AdsDetailScreen(
                      //                             ads: homeController.ads,
                      //                             fromSeeMore: false,
                      //                           ));
                      //                     } else {
                      //                       await homeController.getCampignDetails(category.commonList[index].campaignId.toString());
                      //                       Get.to(() => CampaignDetailScreen(
                      //                             campaign: homeController.campaign,
                      //                             fromSeeMore: false,
                      //                           ));
                      //                     }
                      //                   },
                      //                   child: global.getPlatFrom()
                      //                       ? WebAdsCampaignWidget(
                      //                           fromWebHome: false,
                      //                           commonModel: category.commonList[index],
                      //                         )
                      //                       : AdsCampaignWidget(
                      //                           commonModel: category.commonList[index],
                      //                         ),
                      //                 );
                      //               },
                      //             )
                      //     ],
                      //     // itemBuilder: (context, index) {
                      //     //   Future.delayed(Duration.zero).then(
                      //     //     (value) {
                      //     //       homeController.setcatListIndex(index);
                      //     //     },
                      //     //   );
                      //     //   return InkWell(
                      //     //     onTap: () async {
                      //     //       if (category.commonList[index].adId != null && category.commonList[index].adId.isNotEmpty) {
                      //     //         await homeController.getAdDetails(category.commonList[index].adId);
                      //     //         Get.to(() => AdsDetailScreen(
                      //     //               ads: homeController.ads,
                      //     //               fromSeeMore: false,
                      //     //             ));
                      //     //       } else {
                      //     //         await homeController.getCampignDetails(category.commonList[index].campaignId.toString());
                      //     //         Get.to(() => CampaignDetailScreen(
                      //     //               campaign: homeController.campaign,
                      //     //               fromSeeMore: false,
                      //     //             ));
                      //     //       }
                      //     //     },
                      //     //     child: global.getPlatFrom()
                      //     //         ? WebAdsCampaignWidget(
                      //     //             fromWebHome: false,
                      //     //             commonModel: category.commonList[index],
                      //     //           )
                      //     //         : AdsCampaignWidget(
                      //     //             commonModel: category.commonList[index],
                      //     //           ),
                      //     //   );
                      //     // },
                      //   );
                      // })
                      : SizedBox(
                          height: Get.height,
                          child: Center(
                            child: Text(
                              'No data found.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
