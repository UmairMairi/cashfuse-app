// ignore_for_file: must_be_immutable

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

  NativeAd _myNativeAd;

  String currentPlatform() {
    if (GetPlatform.isAndroid) {
      return 'android';
    } else if (GetPlatform.isIOS) {
      return 'ios';
    }
    return '';
  }

  Future loadNativeAd() async {
    try {
      if (global.admobSetting.nativeAdList != null && global.admobSetting.nativeAdList.length > 0 && global.admobSetting.nativeAdList[1] != null && global.admobSetting.nativeAdList[1].status == 1 && global.admobSetting.bannerAdList[1].platform == currentPlatform()) {
        final NativeAdListener listener = NativeAdListener(
          onAdLoaded: (Ad ad) => print('Ad loaded.'),
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            print('Ad failed to load $error');
          },
          onAdImpression: (Ad ad) {},
        );

        _myNativeAd = new NativeAd(
            adUnitId: global.admobSetting.nativeAdList[1].adId, //'ca-app-pub-3940256099942544/2247696110',
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
                  !GetPlatform.isWeb && global.facebookAdSetting.nativeAdList != null && global.facebookAdSetting.nativeAdList[1].status == 1 && global.admobSetting.nativeAdList[1].platform == currentPlatform()
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: FacebookNativeAd(
                            placementId: global.facebookAdSetting.nativeAdList[1].placementId, //"VID_HD_16_9_46S_APP_INSTALL#536153035214384_536880055141682",
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
                  !GetPlatform.isWeb && _myNativeAd != null
                      ? Container(
                          height: 100,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: AdWidget(
                            key: Key('nativeAd'),
                            ad: _myNativeAd,
                          ))
                      : SizedBox(),
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
                                    Get.to(
                                      () => AdsDetailScreen(
                                        ads: homeController.ads,
                                        fromSeeMore: false,
                                      ),
                                      routeName: 'detail',
                                    );
                                  } else {
                                    await homeController.getCampignDetails(category.commonList[index].campaignId.toString());
                                    Get.to(
                                        () => CampaignDetailScreen(
                                              campaign: homeController.campaign,
                                              fromSeeMore: false,
                                            ),
                                        routeName: 'detail');
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
