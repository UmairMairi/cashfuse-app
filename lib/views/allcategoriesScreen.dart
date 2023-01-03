// ignore_for_file: must_be_immutable

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/adController.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/views/categoryScreen.dart';
import 'package:cashfuse/widget/customImage.dart';
import 'package:cashfuse/widget/drawerWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AllCategoriesScreen extends StatelessWidget {
  HomeController homeController = Get.find<HomeController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  NativeAd _myNativeAd;

  void paginateTask() {
    homeController.catScrollController.addListener(() async {
      if (homeController.catScrollController.position.pixels == homeController.catScrollController.position.maxScrollExtent) {
        homeController.isMoreDataAvailable.value = true;
        print('Reached end');
        await homeController.getTopCategories();
      }
    });
  }

  Future loadNativeAd() async {
    try {
      if (global.admobSetting.nativeAdList != null && global.admobSetting.nativeAdList.length > 0 && global.admobSetting.nativeAdList[0] != null && global.admobSetting.nativeAdList[0].status == 1) {
        final NativeAdListener listener = NativeAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (Ad ad) => print('+++++++++++++++++++Ad loaded.'),
          // Called when an ad request failed.
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // Dispose the ad here to free resources.
            ad.dispose();
            print('Ad failed to load:++++++++ $error');
          },

          onAdImpression: (Ad ad) {
            // //setNativeAdLoaded(true);
            // admobNativeAdLoaded = true;
            //  update();
          },
        );

        _myNativeAd = new NativeAd(
            adUnitId: 'ca-app-pub-3940256099942544/2247696110',
            factoryId: 'adFactoryExample',
            request: AdRequest(),
            listener: listener,
            nativeAdOptions: NativeAdOptions(
              shouldRequestMultipleImages: true,
            ))
          ..load();
      }
    } catch (e) {
      print("Exception - AllCategoriesScreen.dart - loadNativeAd():" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    paginateTask();
    loadNativeAd();
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
                AppLocalizations.of(context).all_categories,
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
              ),
            ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return GetBuilder<AdController>(builder: (adController) {
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: AppConstants.WEB_MAX_WIDTH,
              child: SingleChildScrollView(
                controller: controller.catScrollController,
                child: Column(
                  children: [
                    GridView.builder(
                      //controller: controller.scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: global.getPlatFrom() ? 6 : 3,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                      ),
                      itemCount: controller.topCategoryList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      itemBuilder: (context, index) {
                        return controller.isMoreDataAvailable.value == true && controller.isAllDataLoaded.value && controller.topCategoryList.length - 1 == index
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : InkWell(
                                onTap: () async {
                                  Get.to(() => CategoryScreen(
                                        category: controller.topCategoryList[index],
                                      ));
                                },
                                child: Container(
                                  //width: 95,
                                  //margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: index == 0 ? Get.theme.primaryColor : Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.topCategoryList[index].name.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                          fontSize: global.getPlatFrom() ? 16 : 10,
                                          fontWeight: FontWeight.w500,
                                          color: index == 0 ? Colors.white : Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: global.getPlatFrom() ? 15 : 5,
                                      ),
                                      CustomImage(
                                        image: '${global.appInfo.baseUrls.categoryImageUrl}/${controller.topCategoryList[index].image}',
                                        height: global.getPlatFrom() ? 80 : 40,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
                    !GetPlatform.isWeb && global.facebookAdSetting.nativeAdList != null && global.facebookAdSetting.nativeAdList[0].status == 1
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
                    // global.admobSetting.nativeAdList != null && global.admobSetting.nativeAdList[0].status == 1 && adController.isAdmobBannerAdLoaed
                    //     ?
                    !GetPlatform.isWeb && _myNativeAd != null
                        ? Container(
                            height: 100,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: AdWidget(
                              key: Key('admob'),
                              ad: _myNativeAd,
                            ))
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}
