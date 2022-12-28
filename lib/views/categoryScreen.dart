// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/adController.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/models/categoryModel.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/views/adsDetailScreen.dart';
import 'package:cashfuse/views/campaignDetailScreen.dart';
import 'package:cashfuse/widget/adsCampaignWidget.dart';
import 'package:cashfuse/widget/drawerWidget.dart';
import 'package:cashfuse/widget/web/webAdsCampaignWidget.dart';
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
                  global.facebookAdSetting.nativeAdList != null && global.facebookAdSetting.nativeAdList[1].status == 1
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: FacebookNativeAd(
                            placementId: "VID_HD_16_9_46S_APP_INSTALL#536153035214384_536880055141682",
                            adType: NativeAdType.NATIVE_AD,
                            width: double.infinity,
                            height: 300,
                            keepAlive: true,
                            backgroundColor: Colors.blue,
                            titleColor: Colors.white,
                            descriptionColor: Colors.white,
                            buttonColor: Colors.deepPurple,
                            buttonTitleColor: Colors.white,
                            buttonBorderColor: Colors.white,
                            listener: (result, value) {
                              print("Native Ad: $result --> $value");
                            },
                            keepExpandedWhileLoading: false,
                          ),
                        )
                      : SizedBox(),
                  global.admobSetting.nativeAdList != null && global.admobSetting.nativeAdList[1].status == 1 && adController.admobNativeAdLoaded
                      ? Container(
                          height: 100,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: AdWidget(
                            key: Key('nativeAd'),
                            ad: adController.myNative..load(),
                          ))
                      : SizedBox(),
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
                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: global.getPlatFrom() ? 4 : 2,
                              crossAxisSpacing: global.getPlatFrom() ? 25 : 15.0,
                              mainAxisSpacing: global.getPlatFrom() ? 25 : 15.0,
                            ),
                            itemCount: category.commonList.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  if (category.commonList[index].adId != null && category.commonList[index].adId.isNotEmpty) {
                                    await homeController.getAdDetails(category.commonList[index].adId);
                                    Get.to(() => AdsDetailScreen(
                                          ads: homeController.ads,
                                          fromSeeMore: false,
                                        ));
                                  } else {
                                    await homeController.getCampignDetails(category.commonList[index].campaignId.toString());
                                    Get.to(() => CampaignDetailScreen(
                                          campaign: homeController.campaign,
                                          fromSeeMore: false,
                                        ));
                                  }
                                },
                                child: global.getPlatFrom()
                                    ? WebAdsCampaignWidget(
                                        fromWebHome: false,
                                        commonModel: category.commonList[index],
                                      )
                                    : AdsCampaignWidget(
                                        commonModel: category.commonList[index],
                                      ),
                              );
                            },
                          );
                        })
                      // GetBuilder<HomeController>(builder: (controller) {
                      //     return StatefulBuilder(
                      //       builder: (BuildContext context, StateSetter setState) => ListView.separated(
                      //         physics: NeverScrollableScrollPhysics(),
                      //         shrinkWrap: true,
                      //         itemCount: (category.commonList.length / 2).ceil(),
                      //         padding: EdgeInsets.all(10),
                      //         itemBuilder: (context, index) {
                      //           int index1 = (index * 1) + index;
                      //           int index2 = (index * 1) + (index + 1);

                      //           //log("&&&&&&&&&&&&&&&&&&&&&&${category.commonList[(index * 2) + 1].name}");
                      //           //log("####################${!(index2 < category.commonList.length)}");
                      //           return
                      //               // (((category.commonList.length - 1) % 2) == 0)
                      //               //     ?
                      //               //(category.commonList[(index * 2) + 1] == null && category.commonList[(index * 2) + 1].name == 'Ad') || (category.commonList[(index * 2) + 2] == null && category.commonList[(index * 2) + 2].name == 'Ad')
                      //               //((index * 2) + 1) < category.commonList.length &&
                      //               // !(index1 < category.commonList.length) ||
                      //               //         //category.commonList[(index * 2) + 1].name == 'Ad' &&
                      //               //         !(index2 < category.commonList.length)
                      //               //     // && ((index * 2) + 2) < category.commonList.length &&
                      //               //     //category.commonList[(index * 2) + 2].name == 'Ad'
                      //               //     ? SizedBox()
                      //               //     : category.commonList[index1].name == 'Ad' || category.commonList[index2].name == 'Ad'
                      //               //         ? SizedBox()
                      //               //         :

                      //               // ((index1 < category.commonList.length) && category.commonList[index1].name == 'Ad') || ((index2 < category.commonList.length) && category.commonList[index2].name == 'Ad')
                      //               //     ? SizedBox()
                      //               //     :
                      //               // ((index1 < category.commonList.length) && (index2 < category.commonList.length))
                      //               //     ?
                      //               Padding(
                      //             padding: const EdgeInsets.only(bottom: 10),
                      //             child: SizedBox(
                      //               height: 200,
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.start,
                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                 children: [
                      //                   (index1 < category.commonList.length)
                      //                       ?
                      //                       // category.commonList[index1].name == 'Ad'
                      //                       //     ? SizedBox()
                      //                       //     :
                      //                       Expanded(
                      //                           child: InkWell(
                      //                             onTap: () async {
                      //                               if (category.commonList[index1].adId != null && category.commonList[index1].adId.isNotEmpty) {
                      //                                 await homeController.getAdDetails(category.commonList[index1].adId);
                      //                                 Get.to(() => AdsDetailScreen(
                      //                                       ads: homeController.ads,
                      //                                       fromSeeMore: false,
                      //                                     ));
                      //                               } else {
                      //                                 await homeController.getCampignDetails(category.commonList[index1].campaignId.toString());
                      //                                 Get.to(() => CampaignDetailScreen(
                      //                                       campaign: homeController.campaign,
                      //                                       fromSeeMore: false,
                      //                                     ));
                      //                               }
                      //                             },
                      //                             child: SizedBox(
                      //                               //width: (Get.width / 2) - 20,
                      //                               child: AdsCampaignWidget(
                      //                                 commonModel: category.commonList[index1],
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         )
                      //                       : Expanded(child: SizedBox()),
                      //                   SizedBox(
                      //                     width: 10,
                      //                   ),
                      //                   // category.commonList[index2].name == 'Ad'
                      //                   //     ? SizedBox()
                      //                   //     :
                      //                   (index2 < category.commonList.length)
                      //                       ? Expanded(
                      //                           child: InkWell(
                      //                             onTap: () async {
                      //                               if (category.commonList[index2].adId != null && category.commonList[index2].adId.isNotEmpty) {
                      //                                 await homeController.getAdDetails(category.commonList[index2].adId);
                      //                                 Get.to(() => AdsDetailScreen(
                      //                                       ads: homeController.ads,
                      //                                       fromSeeMore: false,
                      //                                     ));
                      //                               } else {
                      //                                 await homeController.getCampignDetails(category.commonList[index2].campaignId.toString());
                      //                                 Get.to(() => CampaignDetailScreen(
                      //                                       campaign: homeController.campaign,
                      //                                       fromSeeMore: false,
                      //                                     ));
                      //                               }
                      //                             },
                      //                             child: SizedBox(
                      //                               //width: (Get.width / 2) - 20,
                      //                               child: AdsCampaignWidget(
                      //                                 commonModel: category.commonList[index2],
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         )
                      //                       : Expanded(child: SizedBox()),
                      //                   // (index2 < category.commonList.length)
                      //                   //     ?
                      //                   // category.commonList[index2].name == 'Ad'
                      //                   //     ? SizedBox()
                      //                   //     :
                      //                   // Expanded(
                      //                   //   child: AdsCampaignWidget(
                      //                   //     commonModel: category.commonList[(index*2) + 2],
                      //                   //   ),
                      //                   // ),
                      //                   // : SizedBox(),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //           // : (index1 < category.commonList.length)
                      //           //     ? AdsCampaignWidget(
                      //           //         commonModel: category.commonList[index1],
                      //           //       )
                      //           //     : (index2 < category.commonList.length)
                      //           //         ? AdsCampaignWidget(
                      //           //             commonModel: category.commonList[index2],
                      //           //           )
                      //           //         : SizedBox();
                      //           // : AdsCampaignWidget(
                      //           //     commonModel: category.commonList[index],
                      //           //   );
                      //         },
                      //         separatorBuilder: (context, index) {
                      //           int index1 = (index * 1) + index;
                      //           int index2 = (index * 1) + (index + 1);
                      //           int _index;
                      //           // Future.delayed(Duration.zero).then((value) {
                      //           //   _index = category.commonList.indexWhere((element) => element.name == 'Ad');
                      //           //   setState(() {});
                      //           // });

                      //           bool yes;

                      //           // Future.delayed(Duration.zero).then((value) {
                      //           //   if (category.commonList[index].name == 'Ad') {
                      //           //     homeController.setValue(true);
                      //           //   } else {
                      //           //     homeController.setValue(false);
                      //           //   }
                      //           // });

                      //           log("+++++++++++${homeController.isExist}");

                      //           // log("@@@@@@@@@@@@@${category.commonList.indexWhere((element) => element.name == 'Ad')}");
                      //           // log("@@@@@@@@${category.commonList.indexWhere((element) => element.name == 'Ad') == index}");
                      //           return ((index + 1) % 4 == 0) //index >= 4 && index % 4 == 0
                      //               ? adController.isFbNativeAdLoaded
                      //                   ? FacebookNativeAd(
                      //                       keepAlive: true,
                      //                       placementId: "VID_HD_16_9_46S_APP_INSTALL#536153035214384_536880055141682",
                      //                       adType: NativeAdType.NATIVE_AD,
                      //                       // width: Get.width,
                      //                       // height: 300,
                      //                       backgroundColor: Colors.blue,
                      //                       titleColor: Colors.white,
                      //                       descriptionColor: Colors.white,
                      //                       buttonColor: Colors.deepPurple,
                      //                       buttonTitleColor: Colors.white,
                      //                       buttonBorderColor: Colors.white,
                      //                       listener: (result, value) {
                      //                         print("Native Ad: $result --> $value");
                      //                       },
                      //                       keepExpandedWhileLoading: true,
                      //                       // expandAnimationDuraion: 1000,
                      //                     )
                      //                   : adController.admobNativeAdLoaded
                      //                       ? Container(
                      //                           height: 100,
                      //                           width: Get.width,
                      //                           key: UniqueKey(),
                      //                           child: AdWidget(
                      //                             key: UniqueKey(),
                      //                             ad: adController.myNative..load(),
                      //                           ),
                      //                         )
                      //                       : SizedBox()
                      //               : SizedBox();
                      //         },
                      //       ),
                      //     );
                      //   })
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
