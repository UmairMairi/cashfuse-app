import 'package:carousel_slider/carousel_slider.dart';
import 'package:cashfuse/controllers/adController.dart';
import 'package:cashfuse/controllers/couponController.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/controllers/splashController.dart';
import 'package:cashfuse/models/commonModel.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/views/adsCampaignWidgetListScreen.dart';
import 'package:cashfuse/views/adsDetailScreen.dart';
import 'package:cashfuse/views/allcategoriesScreen.dart';
import 'package:cashfuse/views/campaignDetailScreen.dart';
import 'package:cashfuse/views/categoryScreen.dart';
import 'package:cashfuse/views/couponDetailScreen.dart';
import 'package:cashfuse/views/couponListScreen.dart';
import 'package:cashfuse/views/getHelpScreen.dart';
import 'package:cashfuse/views/imageRotateWidget.dart';
import 'package:cashfuse/views/loginOrSignUpScreen.dart';
import 'package:cashfuse/views/myEarningScreen.dart';
import 'package:cashfuse/views/offerDetailScreen.dart';
import 'package:cashfuse/views/offerListScreen.dart';
import 'package:cashfuse/views/referEarnScreen.dart';
import 'package:cashfuse/views/webHomeScreen.dart';
import 'package:cashfuse/widget/adsCampaignWidget.dart';
import 'package:cashfuse/widget/bannerImageWidget.dart';
import 'package:cashfuse/widget/couponWidget.dart';
import 'package:cashfuse/widget/customImage.dart';
import 'package:cashfuse/widget/drawerWidget.dart';
import 'package:cashfuse/widget/offerWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:slide_countdown/slide_countdown.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final bgColor;
  HomeScreen({this.bgColor});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HomeController homeController = Get.find<HomeController>();
  CouponController couponController = Get.find<CouponController>();
  SplashController splashController = Get.find<SplashController>();
  //AdController adController = Get.find<AdController>();
  AdController adController = GetPlatform.isWeb ? Get.put(AdController()) : Get.find<AdController>();
  final couponScrollController = new ScrollController();
  final offerScrollController = new ScrollController();

  BannerAd admobBannerAd1;
  BannerAd admobBannerAd2;
  BannerAd admobBannerAd3;

  bool isAdmobBannerAdLoaed1 = false;
  bool isAdmobBannerAdLoaed2 = false;
  bool isAdmobBannerAdLoaed3 = false;

  Future createAdmobBannerAd() async {
    try {
      if (global.admobSetting.bannerAdList != null && global.admobSetting.bannerAdList.length > 0) {
        if (global.admobSetting.bannerAdList[0] != null && global.admobSetting.bannerAdList[0].status == 1) {
          admobBannerAd1 = new BannerAd(
            adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
            size: AdSize.banner,
            request: AdRequest(),
            listener: BannerAdListener(
              onAdLoaded: (_) {
                isAdmobBannerAdLoaed1 = true;
                adController.update();
              },
              onAdFailedToLoad: (ad, error) {
                ad.dispose();
                isAdmobBannerAdLoaed1 = false;
                adController.update();
              },
              onAdImpression: (ad) {
                isAdmobBannerAdLoaed1 = true;
                adController.update();
              },
            ),
          )..load();
        }

        if (global.admobSetting.bannerAdList[1] != null && global.admobSetting.bannerAdList[1].status == 1) {
          admobBannerAd2 = new BannerAd(
            adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
            size: AdSize.banner,
            request: AdRequest(),
            listener: BannerAdListener(
              onAdLoaded: (_) {
                isAdmobBannerAdLoaed2 = true;
                adController.update();
              },
              onAdFailedToLoad: (ad, error) {
                ad.dispose();
                isAdmobBannerAdLoaed2 = false;
                adController.update();
              },
              onAdImpression: (ad) {
                isAdmobBannerAdLoaed2 = true;
                adController.update();
              },
            ),
          )..load();
        }

        if (global.admobSetting.bannerAdList[2] != null && global.admobSetting.bannerAdList[2].status == 1) {
          admobBannerAd3 = new BannerAd(
            adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
            size: AdSize.banner,
            request: AdRequest(),
            listener: BannerAdListener(
              onAdLoaded: (_) {
                isAdmobBannerAdLoaed3 = true;
                adController.update();
              },
              onAdFailedToLoad: (ad, error) {
                ad.dispose();
                isAdmobBannerAdLoaed3 = false;
                adController.update();
              },
              onAdImpression: (ad) {
                isAdmobBannerAdLoaed3 = true;
                adController.update();
              },
            ),
          )..load();
        }
      }
    } catch (e) {
      print("Exception - HomeScreen.dart - createAdmobBannerAd():" + e.toString());
    }
  }

  // bool _isBannerAdLoaded1 = true;
  // bool _isBannerAdLoaded2 = false;
  // bool _isBannerAdLoaded3 = false;

  // Widget _faceNativeBannerAd() {
  //   return FacebookNativeAd(
  //     // placementId: "YOUR_PLACEMENT_ID",
  //     placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
  //     adType: NativeAdType.NATIVE_BANNER_AD,
  //     bannerAdSize: NativeBannerAdSize.HEIGHT_100,
  //     width: double.infinity,
  //     backgroundColor: Colors.blue,
  //     titleColor: Colors.white,
  //     descriptionColor: Colors.white,
  //     buttonColor: Colors.deepPurple,
  //     buttonTitleColor: Colors.white,
  //     buttonBorderColor: Colors.white,
  //     listener: (result, value) {
  //       print("Native Banner Ad: $result --> $value");
  //     },
  //   );
  // }

  // Widget _faceBookBannerAd() {
  //   return FacebookBannerAd(
  //     // placementId: "YOUR_PLACEMENT_ID",
  //     placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047", //testid
  //     bannerSize: BannerSize.STANDARD,
  //     keepAlive: true,
  //     listener: (result, value) {
  //       print("Banner Ad: $result -->  $value");
  //     },
  //   );
  // }

  // Widget _nativeAd() {
  //   return FacebookNativeAd(
  //     placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964952163583650",
  //     adType: NativeAdType.NATIVE_AD_VERTICAL,
  //     width: double.infinity,
  //     height: 300,
  //     backgroundColor: Colors.blue,
  //     titleColor: Colors.white,
  //     descriptionColor: Colors.white,
  //     buttonColor: Colors.deepPurple,
  //     buttonTitleColor: Colors.white,
  //     buttonBorderColor: Colors.white,
  //     listener: (result, value) {
  //       print("Native Ad: $result --> $value");
  //     },
  //     keepExpandedWhileLoading: true,
  //     expandAnimationDuraion: 1000,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    if (!GetPlatform.isWeb) {
      createAdmobBannerAd();
    }

    // FacebookAudienceNetwork.init(
    //   testingId: '468FD9C0CF496815189B2FE63C8EFA31',
    //   iOSAdvertiserTrackingEnabled: false,
    // );
    // try {
    //   FacebookAudienceNetwork.init(iOSAdvertiserTrackingEnabled: false);
    // } catch (e) {
    //   print("Exception - main.dart - main():" + e.toString());
    // }
    return Scaffold(
        key: scaffoldKey,
        drawer: DrawerWidget(),
        appBar: global.getPlatFrom()
            ? WebTopBarWidget(
                scaffoldKey: scaffoldKey,
              )
            : AppBar(
                elevation: 0,
                titleSpacing: 0,
                //leadingWidth: 20,
                backgroundColor: Colors.grey[200],
                leading: InkWell(
                  onTap: () {
                    scaffoldKey.currentState.openDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      MdiIcons.sortVariant,
                      size: 30,
                      color: bgColor,
                    ),
                  ),
                ),
                title: Image.asset(
                  Images.cashfuse,
                  height: 35,
                  // width: 100,
                ),
                // RichText(
                //   text: TextSpan(
                //     text: "CASH",
                //     style: Get.theme.primaryTextTheme.headline4.copyWith(
                //       letterSpacing: 0.1,
                //       color: Get.theme.secondaryHeaderColor,
                //       fontFamily: 'Bebas Neue',
                //     ),
                //     children: <TextSpan>[
                //       TextSpan(
                //         text: 'FUSE',
                //         style: Get.theme.primaryTextTheme.headline4.copyWith(
                //           color: Colors.white,
                //           letterSpacing: 0.1,
                //           fontFamily: 'Bebas Neue',
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                actions: [
                  InkWell(
                    onTap: () {
                      if (global.currentUser.id != null) {
                        Get.to(() => MyEarningSceen());
                      } else {
                        if (global.getPlatFrom()) {
                          Get.dialog(Dialog(
                            child: SizedBox(
                              width: Get.width / 3,
                              child: LoginOrSignUpScreen(
                                fromMenu: true,
                              ),
                            ),
                          ));
                        } else {
                          Get.to(() => LoginOrSignUpScreen(
                                fromMenu: true,
                              ));
                        }
                      }
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          Images.payments,
                          height: 25,
                        )),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     homeController.showRewardedAd();
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8),
                  //     child: Icon(
                  //       Icons.card_giftcard,
                  //       color: bgColor,
                  //       size: 30,
                  //     ),
                  //   ),
                  // )
                ],
              ),
        floatingActionButton: GetBuilder<SplashController>(builder: (splash) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                  onTap: () async {
                    global.showInterstitialAd();

                    if (global.currentUser.id != null) {
                      Get.to(() => ReferEarnScreen());
                    } else {
                      if (global.getPlatFrom()) {
                        Get.dialog(Dialog(
                          child: SizedBox(
                            width: Get.width / 3,
                            child: LoginOrSignUpScreen(
                              fromMenu: true,
                            ),
                          ),
                        ));
                      } else {
                        Get.to(() => LoginOrSignUpScreen(
                              fromMenu: true,
                            ));
                      }
                    }
                  },
                  child: ImageRotate()
                  // Image.asset(
                  //   Images.refer,
                  //   height: 50,
                  // ),
                  ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => GetHelpScreen());
                },
                child: Image.asset(
                  Images.gethelp,
                  height: 50,
                ),
              ),
            ],
          );
        }),
        body: global.getPlatFrom()
            ? WebHomeScreen()
            : Stack(
                alignment: Alignment.center,
                children: [
                  GetBuilder<AdController>(builder: (adsCont) {
                    //controller.loadFacebookInterstitialAd();
                    return GetBuilder<HomeController>(builder: (controller) {
                      //controller.loadFacebookInterstitialAd();
                      return GetBuilder<CouponController>(builder: (cont) {
                        return RefreshIndicator(
                          onRefresh: () async {
                            await homeController.init();
                          },
                          child: SingleChildScrollView(
                            primary: true,
                            padding: EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                homeController.isBannerLoaded
                                    ? Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          CarouselSlider.builder(
                                              options: CarouselOptions(
                                                height: 170,
                                                autoPlay: true,
                                                enlargeCenterPage: false,
                                                disableCenter: true,
                                                pauseAutoPlayOnManualNavigate: true,
                                                aspectRatio: 1,
                                                onScrolled: (value) {},
                                                autoPlayInterval: Duration(seconds: 2),
                                                onPageChanged: (index, reason) {
                                                  homeController.setBannerIndex(index);
                                                },
                                                viewportFraction: 1,
                                                pageSnapping: true,
                                              ),
                                              itemCount: homeController.topBannerList.length,
                                              itemBuilder: (context, index, _) {
                                                return InkWell(
                                                  onTap: () async {
                                                    if (homeController.topBannerList[index].type == 'url') {
                                                      if (global.currentUser.id != null) {
                                                        // Get.to(
                                                        //   () => WebViewScreen(
                                                        //     urlString: homeController.topBannerList[index].url,
                                                        //     brandName: homeController.topBannerList[index].name,
                                                        //   ),
                                                        // );
                                                        global.launchInBrowser(
                                                          homeController.topBannerList[index].url,
                                                        );
                                                      } else {
                                                        Get.to(() => LoginOrSignUpScreen(
                                                              fromMenu: true,
                                                            ));
                                                      }
                                                    } else {
                                                      await homeController.getOfferDetails(
                                                        homeController.topBannerList[index].offerId.toString(),
                                                      );
                                                      Get.to(
                                                        () => OfferDetailScreen(
                                                          offer: homeController.offer,
                                                          fromSeeMore: false,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child:
                                                      // homeController.topBannerList[index].name == 'Ad'
                                                      //     ? FacebookNativeAd(
                                                      //         keepAlive: true,
                                                      //         placementId: "CAROUSEL_IMG_SQUARE_LINK#536153035214384_536880055141682",
                                                      //         adType: NativeAdType.NATIVE_AD_VERTICAL,
                                                      //         width: Get.width,
                                                      //         height: 300,
                                                      //         backgroundColor: Colors.blue,
                                                      //         titleColor: Colors.white,
                                                      //         descriptionColor: Colors.white,
                                                      //         buttonColor: Colors.deepPurple,
                                                      //         buttonTitleColor: Colors.white,
                                                      //         buttonBorderColor: Colors.white,
                                                      //         listener: (result, value) {
                                                      //           print("Native Ad: $result --> $value");
                                                      //         },
                                                      //         keepExpandedWhileLoading: true,
                                                      //         expandAnimationDuraion: 1000,
                                                      //       )
                                                      //     :
                                                      Container(
                                                    width: Get.width,
                                                    margin: EdgeInsets.only(right: 0),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(0),
                                                      child: CustomImage(
                                                        image: '${global.appInfo.baseUrls.bannerImageUrl}/${homeController.topBannerList[index].image}',
                                                        //height: 25,
                                                        width: Get.width,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                          homeController.topBannerList != null && homeController.topBannerList.length > 0
                                              ? Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 6),
                                                    child: DotsIndicator(
                                                      dotsCount: homeController.topBannerList.length,
                                                      position: homeController.bannerIndex.toDouble(),
                                                      decorator: DotsDecorator(
                                                        activeSize: Size(7, 7),
                                                        size: Size(7, 7),
                                                        color: Colors.white, // Inactive color
                                                        activeColor: Colors.orange,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      )
                                    : Shimmer(
                                        duration: Duration(seconds: 2),
                                        child: Container(
                                          width: Get.width,
                                          height: 180,
                                          margin: EdgeInsets.only(right: 15, left: 15),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),

                                // NativeAdWidget(),
                                // global.admobSetting.nativeAdList != null && global.admobSetting.nativeAdList[1].status == 1 && adController.isAdmobBannerAdLoaed
                                //     ? Container(
                                //         height: 100,
                                //         margin: EdgeInsets.symmetric(vertical: 10),
                                //         child: AdWidget(
                                //           key: Key('admob'),
                                //           ad: adController.myNative,
                                //         ))
                                //     : SizedBox(),
                                // Container(
                                //   height: homeController.adheight,
                                //   padding: EdgeInsets.all(10),
                                //   margin: EdgeInsets.only(bottom: 20.0),
                                //   child: NativeAdmob(

                                //     // Your ad unit id
                                //     adUnitID: 'ca-app-pub-3940256099942544/2247696110',
                                //     controller: homeController.nativeAdController,

                                //     // Don't show loading widget when in loading state
                                //     loading: Container(
                                //       height: 100,
                                //       width: 100,
                                //       color: Colors.black,
                                //     ),
                                //   ),
                                // ),
                                // _faceNativeBannerAd(),
                                // FacebookNativeAd(
                                //   // placementId: "YOUR_PLACEMENT_ID",
                                //   placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
                                //   adType: NativeAdType.NATIVE_AD,
                                //   bannerAdSize: NativeBannerAdSize.HEIGHT_100,
                                //   width: double.infinity,
                                //   backgroundColor: Colors.blue,
                                //   titleColor: Colors.white,
                                //   descriptionColor: Colors.white,
                                //   buttonColor: Colors.deepPurple,
                                //   buttonTitleColor: Colors.white,
                                //   buttonBorderColor: Colors.white,

                                //   listener: (result, value) {
                                //     print("Native Banner Ad: $result --> $value");
                                //   },
                                // ),
                                // FacebookNativeAd(
                                //   placementId: "VID_HD_16_9_46S_APP_INSTALL#536153035214384_536880055141682",
                                //   adType: NativeAdType.NATIVE_AD_HORIZONTAL,
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).top_categories,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black.withOpacity(0.79),
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => AllCategoriesScreen());
                                        },
                                        child: Text(
                                          '${AppLocalizations.of(context).view_all} >',
                                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: global.getPlatFrom() ? 16 : null),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                  child: homeController.isCategoryLoaded
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: homeController.topCategoryList.length > 10 ? 10 : homeController.topCategoryList.length,
                                          padding: const EdgeInsets.symmetric(horizontal: 6),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () async {
                                                global.showInterstitialAd();
                                                //await homeController.addAdCategory(index);
                                                Get.to(() => CategoryScreen(
                                                      category: homeController.topCategoryList[index],
                                                    ));
                                              },
                                              child: Container(
                                                width: 95,
                                                margin: EdgeInsets.only(right: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: index == 0 ? Get.theme.primaryColor : Colors.white,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      homeController.topCategoryList[index].name.toUpperCase(),
                                                      textAlign: TextAlign.center,
                                                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w500,
                                                        color: index == 0 ? Colors.white : Colors.black,
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   height: 10,
                                                    // ),
                                                    CustomImage(
                                                      image: '${global.appInfo.baseUrls.categoryImageUrl}/${homeController.topCategoryList[index].image}',
                                                      height: 40,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          padding: const EdgeInsets.symmetric(horizontal: 6),
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              height: 75,
                                              child: Shimmer(
                                                duration: Duration(seconds: 2),
                                                child: Container(
                                                  width: 95,
                                                  margin: EdgeInsets.only(right: 15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                ),
                                !GetPlatform.isWeb && admobBannerAd1 != null && isAdmobBannerAdLoaed1
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: SizedBox(
                                            height: admobBannerAd1.size.height.toDouble(),
                                            width: admobBannerAd1.size.width.toDouble(),
                                            child: AdWidget(
                                              ad: admobBannerAd1,
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                !GetPlatform.isWeb && adController.fbBannerAd1 != null && adController.isfbBannerAdLoaed1
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 15),
                                          child: adController.fbBannerAd1,
                                        ),
                                      )
                                    : SizedBox(),
                                // !GetPlatform.isWeb && global.admobSetting.bannerAdList != null && global.admobSetting.bannerAdList[0].status == 1
                                //     ? StatefulBuilder(
                                //         builder: (BuildContext context, StateSetter setState) => Align(
                                //           alignment: Alignment.center,
                                //           //height: 100,

                                //           child: Padding(
                                //             padding: const EdgeInsets.only(top: 15),
                                //             child: SizedBox(
                                //               height: adController.bannerAdList[0].size.height.toDouble(),
                                //               // //width: 200,
                                //               width: adController.bannerAdList[0].size.width.toDouble(),
                                //               child: AdWidget(
                                //                   key: Key('0'),
                                //                   ad: new BannerAd(
                                //                     adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
                                //                     size: AdSize.banner,

                                //                     request: AdRequest(),
                                //                     listener: BannerAdListener(
                                //                       onAdLoaded: (_) {
                                //                         // _isBannerAdLoaded1 = true;
                                //                         // setState(() {});
                                //                         log("+++++++Ad loaded");
                                //                         // update();
                                //                       },
                                //                       onAdImpression: (ad) {
                                //                         // _isBannerAdLoaded1 = true;
                                //                         // setState(() {});
                                //                         log("+++++++Ad show");
                                //                       },
                                //                       onAdFailedToLoad: (ad, error) {
                                //                         ad.dispose();
                                //                         // _isBannerAdLoaded1 = true;
                                //                         // setState(() {});
                                //                         log("+++++++Ad failed${error.toString()}");
                                //                       },
                                //                       onAdClosed: (ad) {
                                //                         //_isBannerAdLoaded1 = true;
                                //                         setState(() {});
                                //                       },
                                //                     ),
                                //                   )..load()
                                //                   //adController.bannerAdList[0],
                                //                   ),
                                //             ),
                                //           ),
                                //         ),
                                //       )
                                //     : SizedBox(),

                                // FacebookBannerAd(
                                //   // placementId: "YOUR_PLACEMENT_ID",
                                //   placementId: "IMG_16_9_LINK#536153035214384_536898305139857", //testid
                                //   bannerSize: BannerSize.STANDARD,

                                //   keepAlive: true,
                                //   listener: (result, value) {
                                //     print("Banner Ad: $result -->  $value");
                                //   },
                                // ),

                                // Container(
                                //   height: adController.adheight,
                                //   padding: EdgeInsets.all(10),
                                //   margin: EdgeInsets.only(bottom: 20.0),
                                //   child: NativeAdmob(
                                //     type: NativeAdmobType.banner,
                                //     // Your ad unit id
                                //     adUnitID: 'ca-app-pub-3940256099942544/2247696110',
                                //     controller: adController.nativeAdController,

                                //     // Don't show loading widget when in loading state
                                //     loading: Container(
                                //       height: adController.adheight,
                                //       width: adController.adheight,
                                //       color: Colors.red,
                                //     ),
                                //   ),
                                // ),

                                // splashController.isAdLoaed && global.admobSetting.bannerAdList[0].status == 1
                                //     ?
                                // Align(
                                //   alignment: Alignment.center,
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(vertical: 15),
                                //     child: SizedBox(
                                //       // height: homeController.bannerAdList[0].size.height.toDouble(),
                                //       // width: homeController.bannerAdList[0].size.width.toDouble(),
                                //       child: AdWidget(
                                //         key: Key('0'),
                                //         ad: BannerAd(
                                //           adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
                                //           size: AdSize.banner,
                                //           request: AdRequest(),
                                //           listener: BannerAdListener(
                                //             onAdLoaded: (_) {
                                //               // isAdLoaed = true;
                                //               // update();
                                //             },
                                //             onAdFailedToLoad: (ad, error) {
                                //               ad.dispose();
                                //             },
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // : SizedBox(
                                //     height: 25,
                                //   ),
                                // global.facebookAdSetting.bannerAdList != null && global.facebookAdSetting.bannerAdList.length > 0 && global.facebookAdSetting.bannerAdList[0] != null
                                //     ?

                                // _faceBookBannerAd(),
                                // !GetPlatform.isWeb && global.facebookAdSetting.bannerAdList != null && global.facebookAdSetting.bannerAdList[0].status == 1
                                //     ? Padding(
                                //         padding: const EdgeInsets.symmetric(vertical: 10),
                                //         child: FacebookBannerAd(
                                //           placementId: 'IMG_16_9_LINK#536153035214384_536898305139857',
                                //           bannerSize: BannerSize.STANDARD,
                                //           keepAlive: true,
                                //           listener: (result, value) {
                                //             switch (result) {
                                //               case BannerAdResult.ERROR:
                                //                 print("Error: $value");
                                //                 break;
                                //               case BannerAdResult.LOADED:
                                //                 print("Loaded: $value");
                                //                 break;
                                //               case BannerAdResult.CLICKED:
                                //                 print("Clicked: $value");
                                //                 break;
                                //               case BannerAdResult.LOGGING_IMPRESSION:
                                //                 print("Logging Impression: $value");
                                //                 break;
                                //             }
                                //           },
                                //         ),
                                //       )
                                //     : SizedBox(),
                                // FacebookBannerAd(
                                //   placementId: 'IMG_16_9_LINK#536153035214384_536898305139857',
                                //   bannerSize: BannerSize.STANDARD,
                                //   keepAlive: true,
                                //   listener: (result, value) {
                                //     switch (result) {
                                //       case BannerAdResult.ERROR:
                                //         print("Error: $value");
                                //         break;
                                //       case BannerAdResult.LOADED:
                                //         print("Loaded: $value");
                                //         break;
                                //       case BannerAdResult.CLICKED:
                                //         print("Clicked: $value");
                                //         break;
                                //       case BannerAdResult.LOGGING_IMPRESSION:
                                //         print("Logging Impression: $value");
                                //         break;
                                //     }
                                //   },
                                // ),
                                //: SizedBox(),
                                // homeController.isAdLoaed && global.admobSetting.bannerAdList[0].status == 1
                                //     ? SizedBox(
                                //         //height: 100,
                                //         height: homeController.bannerAdList[0].size.height.toDouble(),
                                //         //width: 200,
                                //         width: homeController.bannerAdList[0].size.width.toDouble(),
                                //         child: AdWidget(
                                //           key: Key('0'),
                                //           ad: homeController.bannerAdList[0],
                                //         ),
                                //       )
                                //     : SizedBox(),
                                couponController.couponList != null && couponController.couponList.length > 0
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).coupons_of_the_day.toUpperCase(),
                                              style: TextStyle(
                                                fontSize: global.getPlatFrom() ? 16 : 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black.withOpacity(0.79),
                                                letterSpacing: -0.3,
                                              ),
                                            ),
                                            couponController.couponList.length > 6
                                                ? InkWell(
                                                    onTap: () {
                                                      Get.to(() => CouponListScreen());
                                                    },
                                                    child: Text(
                                                      '${AppLocalizations.of(context).view_all} >',
                                                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: global.getPlatFrom() ? 16 : null),
                                                    ),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                couponController.isDataLoaded
                                    ? couponController.couponList != null && couponController.couponList.length > 0
                                        ? SizedBox(
                                            height: 100,
                                            child: ListView.builder(
                                              controller: couponScrollController,
                                              padding: const EdgeInsets.symmetric(horizontal: 6),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: couponController.couponList.length >= 5 ? 5 : couponController.couponList.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    global.showInterstitialAd();
                                                    if (couponController.couponList[index].offer != null) {
                                                      Get.to(
                                                        () => OfferDetailScreen(
                                                          offer: couponController.couponList[index].offer,
                                                          fromSeeMore: false,
                                                        ),
                                                      );
                                                    } else {
                                                      Get.to(
                                                        () => CouponDetailScreen(
                                                          coupon: couponController.couponList[index],
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: CouponWidget(
                                                      coupon: couponController.couponList[index],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : SizedBox()
                                    : SizedBox(
                                        height: 100,
                                        child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Shimmer(
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(9),
                                                    color: Colors.grey[300],
                                                  ),
                                                  width: Get.width - 60,
                                                  // child:
                                                  // CouponWidget(
                                                  //   coupon: couponC.couponList[index],
                                                  // ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                homeController.exclusiveOfferList != null && homeController.exclusiveOfferList.length > 0
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                                        child: Text(
                                          AppLocalizations.of(context).exclusive_offers,
                                          style: TextStyle(
                                            fontSize: global.getPlatFrom() ? 16 : 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black.withOpacity(0.79),
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                homeController.isOfferLoaded
                                    ? homeController.exclusiveOfferList != null && homeController.exclusiveOfferList.length > 0
                                        ? SizedBox(
                                            height: global.getPlatFrom() ? 170 : 165,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: homeController.exclusiveOfferList.length,
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.symmetric(horizontal: 6),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () async {
                                                    await homeController.getOfferDetails(homeController.exclusiveOfferList[index].id.toString());
                                                    Get.to(() => OfferDetailScreen(
                                                          offer: homeController.offer,
                                                          fromSeeMore: false,
                                                        ));
                                                  },
                                                  child: Container(
                                                    width: global.getPlatFrom() ? 270 : 240, //Get.width - 120,
                                                    margin: EdgeInsets.only(right: 10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Stack(
                                                      alignment: Alignment.bottomLeft,
                                                      children: [
                                                        ClipRRect(
                                                            borderRadius: BorderRadius.circular(10),
                                                            child: CustomImage(
                                                              image: '${global.appInfo.baseUrls.offerImageUrl}/${homeController.exclusiveOfferList[index].bannerImage}',
                                                              height: 170,
                                                              width: Get.width,
                                                              fit: BoxFit.fill,
                                                              errorImage: Images.dummyImage,
                                                            )
                                                            // Image.asset(
                                                            //   Images.dummyImage,
                                                            //   height: 165,
                                                            //   fit: BoxFit.cover,
                                                            // ),
                                                            ),
                                                        Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Card(
                                                            color: Colors.white,
                                                            margin: EdgeInsets.all(10),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(2.0),
                                                              child: CustomImage(
                                                                image: '${global.appInfo.baseUrls.offerImageUrl}/${homeController.exclusiveOfferList[index].image}',
                                                                height: 30,
                                                                width: 60,
                                                                fit: BoxFit.contain,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        homeController.countTimer(DateTime.now(), homeController.exclusiveOfferList[index].endDate) != null
                                                            ? Padding(
                                                                padding: const EdgeInsets.all(10),
                                                                child: SlideCountdown(
                                                                  slideDirection: SlideDirection.none,
                                                                  textStyle: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.red[800],
                                                                    borderRadius: BorderRadius.circular(3),
                                                                  ),
                                                                  duration: Duration(
                                                                    days: homeController.countTimer(
                                                                      DateTime.now(),
                                                                      homeController.exclusiveOfferList[index].endDate,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : SizedBox()
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ))
                                        : SizedBox()
                                    : SizedBox(
                                        height: 165,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                                            itemBuilder: (context, index) {
                                              return Shimmer(
                                                duration: Duration(seconds: 2),
                                                child: Container(
                                                  width: 240,
                                                  height: 165,
                                                  margin: EdgeInsets.only(right: 15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                homeController.topCashbackList != null && homeController.topCashbackList.length > 0
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).top_cashback_stores,
                                              style: TextStyle(
                                                fontSize: global.getPlatFrom() ? 16 : 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black.withOpacity(0.79),
                                                letterSpacing: -0.3,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(
                                                  () => AdsCampaignWidgetListScreen(
                                                    title: AppLocalizations.of(context).top_cashback_stores,
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                '${AppLocalizations.of(context).view_all} >',
                                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: global.getPlatFrom() ? 16 : null),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                homeController.isTopCashbackLoaded
                                    ? homeController.topCashbackList != null && homeController.topCashbackList.length > 0
                                        ? SizedBox(
                                            height: 155,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: homeController.topCashbackList.length > 6 ? 6 : homeController.topCashbackList.length,
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.symmetric(horizontal: 6),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    Get.to(() => CategoryScreen(
                                                          category: homeController.topCashbackList[index],
                                                        ));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 13),
                                                    child: SizedBox(
                                                      width: 155,
                                                      child: AdsCampaignWidget(
                                                        commonModel: CommonModel(
                                                          name: homeController.topCashbackList[index].name,
                                                          image: '${global.appInfo.baseUrls.partnerImageUrl}/${homeController.topCashbackList[index].image}',
                                                          tagline: homeController.topCashbackList[index].tagline,
                                                          adId: homeController.topCashbackList[index].id.toString(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : SizedBox()
                                    : SizedBox(
                                        height: 155,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                                            itemBuilder: (context, index) {
                                              return Shimmer(
                                                duration: Duration(seconds: 2),
                                                child: Container(
                                                  width: 155,
                                                  margin: EdgeInsets.only(right: 15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                homeController.newFlashOfferList != null && homeController.newFlashOfferList.length > 0
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6).copyWith(top: 25, bottom: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'NEW FLASH DEALS - LIVE NOW',
                                              style: TextStyle(
                                                fontSize: global.getPlatFrom() ? 16 : 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black.withOpacity(0.79),
                                                letterSpacing: -0.3,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.to(() => OfferListScreen());
                                              },
                                              child: Text(
                                                '${AppLocalizations.of(context).view_all} >',
                                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: global.getPlatFrom() ? 16 : null),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                homeController.isFlashOffersLoaded
                                    ? homeController.newFlashOfferList != null && homeController.newFlashOfferList.length > 0
                                        ? SizedBox(
                                            height: global.getPlatFrom() ? 230 : 200,
                                            child: ListView.builder(
                                              itemCount: homeController.newFlashOfferList.length,
                                              shrinkWrap: true,
                                              controller: offerScrollController,
                                              scrollDirection: Axis.horizontal,
                                              physics: AlwaysScrollableScrollPhysics(),
                                              padding: const EdgeInsets.symmetric(horizontal: 6),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () async {
                                                    await homeController.getOfferDetails(homeController.newFlashOfferList[index].id.toString());
                                                    Get.to(() => OfferDetailScreen(
                                                          offer: homeController.offer,
                                                          fromSeeMore: false,
                                                        ));
                                                  },
                                                  child: OfferWidget(
                                                    offer: homeController.newFlashOfferList[index],
                                                    fromList: false,
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : SizedBox()
                                    : SizedBox(
                                        height: 200,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.symmetric(horizontal: 6),
                                            itemBuilder: (context, index) {
                                              return Shimmer(
                                                duration: Duration(seconds: 2),
                                                child: Container(
                                                  width: 330,
                                                  margin: EdgeInsets.only(right: 15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: 300,
                                                        height: 145,
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey[300],
                                                          borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(11),
                                                            topRight: Radius.circular(11),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment.centerRight,
                                                        child: Container(
                                                          height: 35,
                                                          width: 80,
                                                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey[300],
                                                            borderRadius: BorderRadius.circular(2),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                !GetPlatform.isWeb && admobBannerAd2 != null && isAdmobBannerAdLoaed2
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 15),
                                          child: SizedBox(
                                            height: admobBannerAd2.size.height.toDouble(),
                                            width: admobBannerAd2.size.width.toDouble(),
                                            child: AdWidget(
                                              ad: admobBannerAd2,
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                !GetPlatform.isWeb && adController.fbBannerAd2 != null && adController.isfbBannerAdLoaed2
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: adController.fbBannerAd2,
                                        ),
                                      )
                                    : SizedBox(),
                                // !GetPlatform.isWeb && global.admobSetting.bannerAdList != null && global.admobSetting.bannerAdList[1].status == 1
                                //     ? Align(
                                //         alignment: Alignment.center,
                                //         //height: 100,

                                //         child: Padding(
                                //           padding: const EdgeInsets.only(top: 15),
                                //           child: SizedBox(
                                //             height: adController.bannerAdList[1].size.height.toDouble(),
                                //             // //width: 200,
                                //             width: adController.bannerAdList[1].size.width.toDouble(),
                                //             child: AdWidget(
                                //                 key: Key('1'),
                                //                 ad: new BannerAd(
                                //                   adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
                                //                   size: AdSize.banner,
                                //                   request: AdRequest(),
                                //                   listener: BannerAdListener(
                                //                     onAdLoaded: (_) {
                                //                       // isAdmobBannerAdLoaed = true;
                                //                       // update();
                                //                     },
                                //                     onAdFailedToLoad: (ad, error) {
                                //                       ad.dispose();
                                //                     },
                                //                   ),
                                //                 )..load()
                                //                 //adController.bannerAdList[0],
                                //                 ),
                                //             //adController.bannerAdList[1],
                                //           ),
                                //         ),
                                //       )
                                //     : SizedBox(),
                                // homeController.isAdLoaed && global.admobSetting.bannerAdList[1].status == 1
                                //     ? Align(
                                //         alignment: Alignment.center,
                                //         child: Padding(
                                //           padding: const EdgeInsets.symmetric(vertical: 15),
                                //           child: SizedBox(
                                //             height: homeController.bannerAdList[1].size.height.toDouble(),
                                //             width: homeController.bannerAdList[1].size.width.toDouble(),
                                //             child: AdWidget(
                                //               key: Key('1'),
                                //               ad: homeController.bannerAdList[1],
                                //             ),
                                //           ),
                                //         ),
                                //       )
                                //     : SizedBox(
                                //         height: 25,
                                //       ),

                                // !GetPlatform.isWeb && global.facebookAdSetting.bannerAdList != null && global.facebookAdSetting.bannerAdList[1].status == 1
                                //     ? Padding(
                                //         padding: const EdgeInsets.symmetric(vertical: 10),
                                //         child: FacebookBannerAd(
                                //           placementId: 'IMG_16_9_LINK#536153035214384_536898305139857',
                                //           bannerSize: BannerSize.STANDARD,
                                //           keepAlive: true,
                                //           listener: (result, value) {
                                //             switch (result) {
                                //               case BannerAdResult.ERROR:
                                //                 print("Error: $value");
                                //                 break;
                                //               case BannerAdResult.LOADED:
                                //                 print("Loaded: $value");
                                //                 break;
                                //               case BannerAdResult.CLICKED:
                                //                 print("Clicked: $value");
                                //                 break;
                                //               case BannerAdResult.LOGGING_IMPRESSION:
                                //                 print("Logging Impression: $value");
                                //                 break;
                                //             }
                                //           },
                                //         ),
                                //       )
                                //     : SizedBox(),
                                //homeController.facebookBannerAdList[1],
                                ListView.builder(
                                  itemCount: homeController.homeAdvList.length,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return homeController.isHomeAdvLoaded
                                        ? homeController.homeAdvList[index].commonList != null && homeController.homeAdvList[index].commonList.length > 0
                                            ? Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 6).copyWith(bottom: 10, top: 15),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          homeController.homeAdvList[index].name.toUpperCase(),
                                                          style: TextStyle(
                                                            fontSize: global.getPlatFrom() ? 16 : 13,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.black.withOpacity(0.79),
                                                            letterSpacing: -0.3,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.to(
                                                              () => OfferListScreen(
                                                                categoryModel: homeController.homeAdvList[index],
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            '${AppLocalizations.of(context).view_all} >',
                                                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: global.getPlatFrom() ? 16 : null),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(bottom: (global.getPlatFrom() && (homeController.homeAdvList[index].commonList.length - 1) != null) ? 20 : 0),
                                                    child: SizedBox(
                                                      height: global.getPlatFrom() ? 230 : 200,
                                                      child: ListView.builder(
                                                          itemCount: homeController.homeAdvList[index].commonList.length,
                                                          shrinkWrap: true,
                                                          padding: const EdgeInsets.symmetric(horizontal: 6),
                                                          scrollDirection: Axis.horizontal,
                                                          itemBuilder: (context, i) {
                                                            return InkWell(
                                                              onTap: () async {
                                                                if (homeController.homeAdvList[index].commonList[i].adId != null && homeController.homeAdvList[index].commonList[i].adId.isNotEmpty) {
                                                                  await homeController.getAdDetails(homeController.homeAdvList[index].commonList[i].adId);
                                                                  Get.to(() => AdsDetailScreen(
                                                                        ads: homeController.ads,
                                                                        fromSeeMore: false,
                                                                      ));
                                                                } else {
                                                                  await homeController.getCampignDetails(homeController.homeAdvList[index].commonList[i].campaignId.toString());
                                                                  Get.to(() => CampaignDetailScreen(
                                                                        campaign: homeController.campaign,
                                                                        fromSeeMore: false,
                                                                      ));
                                                                }
                                                              },
                                                              child: OfferWidget(
                                                                commonModel: homeController.homeAdvList[index].commonList[i],
                                                                domainImage: homeController.homeAdvList[index].image,
                                                                fromList: false,
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : SizedBox()
                                        : SizedBox(
                                            height: 230,
                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: 5,
                                                shrinkWrap: true,
                                                padding: const EdgeInsets.only(top: 20, bottom: 10),
                                                itemBuilder: (context, index) {
                                                  return Shimmer(
                                                    duration: Duration(seconds: 2),
                                                    child: Container(
                                                      width: Get.width - 60,
                                                      margin: EdgeInsets.only(right: 15),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: Get.width - 60,
                                                            height: 145,
                                                            decoration: BoxDecoration(
                                                              color: Colors.grey[300],
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(11),
                                                                topRight: Radius.circular(11),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment.centerRight,
                                                            child: Container(
                                                              height: 35,
                                                              width: 80,
                                                              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                                              decoration: BoxDecoration(
                                                                color: Colors.grey[300],
                                                                borderRadius: BorderRadius.circular(2),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          );
                                  },
                                ),
                                !GetPlatform.isWeb && admobBannerAd3 != null && isAdmobBannerAdLoaed3
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 15),
                                          child: SizedBox(
                                            height: admobBannerAd3.size.height.toDouble(),
                                            width: admobBannerAd3.size.width.toDouble(),
                                            child: AdWidget(
                                              ad: admobBannerAd3,
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                !GetPlatform.isWeb && adController.fbBannerAd3 != null && adController.isfbBannerAdLoaed3
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: adController.fbBannerAd3,
                                        ),
                                      )
                                    : SizedBox(),
                                // !GetPlatform.isWeb && global.admobSetting.bannerAdList != null && global.admobSetting.bannerAdList[2].status == 1
                                //     ? Align(
                                //         alignment: Alignment.center,
                                //         child: Padding(
                                //           padding: const EdgeInsets.symmetric(vertical: 15),
                                //           child: SizedBox(
                                //             height: adController.bannerAdList[2].size.height.toDouble(),
                                //             width: adController.bannerAdList[2].size.width.toDouble(),
                                //             child: AdWidget(
                                //                 key: Key('2'),
                                //                 ad: new BannerAd(
                                //                   adUnitId: "ca-app-pub-3940256099942544/6300978111", //"ca-app-pub-3940256099942544/6300978111",
                                //                   size: AdSize.banner,
                                //                   request: AdRequest(),
                                //                   listener: BannerAdListener(
                                //                     onAdLoaded: (_) {
                                //                       // isAdmobBannerAdLoaed = true;
                                //                       // update();
                                //                     },
                                //                     onAdFailedToLoad: (ad, error) {
                                //                       ad.dispose();
                                //                     },
                                //                   ),
                                //                 )..load()
                                //                 //adController.bannerAdList[2],
                                //                 ),
                                //           ),
                                //         ),
                                //       )
                                //     : SizedBox(
                                //         height: 25,
                                //       ),
                                // !GetPlatform.isWeb && global.facebookAdSetting.bannerAdList != null && global.facebookAdSetting.bannerAdList[2].status == 1
                                //     ? Padding(
                                //         padding: const EdgeInsets.symmetric(vertical: 10),
                                //         child: FacebookBannerAd(
                                //           placementId: 'IMG_16_9_LINK#536153035214384_536898305139857',
                                //           bannerSize: BannerSize.STANDARD,
                                //           listener: (result, value) {
                                //             switch (result) {
                                //               case BannerAdResult.ERROR:
                                //                 print("Error: $value");
                                //                 break;
                                //               case BannerAdResult.LOADED:
                                //                 print("Loaded: $value");
                                //                 break;
                                //               case BannerAdResult.CLICKED:
                                //                 print("Clicked: $value");
                                //                 break;
                                //               case BannerAdResult.LOGGING_IMPRESSION:
                                //                 print("Logging Impression: $value");
                                //                 break;
                                //             }
                                //           },
                                //         ),
                                //       )
                                //     : SizedBox(),
                                // StatefulBuilder(
                                //   builder: (BuildContext context, StateSetter setState) => FutureBuilder(
                                //     future: Future.delayed(Duration(minutes: 1)).then((value) {
                                //       return Timer.periodic(
                                //         Duration(minutes: 1),
                                //         (timer) {
                                //           // log(timer.toString());
                                //           // homeController.setAdShow(!homeController.isFaceBookAdShow);
                                //           homeController.isFaceBookAdShow = !homeController.isFaceBookAdShow;
                                //           setState(() {});
                                //           log(homeController.isFaceBookAdShow.toString());
                                //         },
                                //       );
                                //     }),
                                //     builder: (context, snapshot) {
                                //       return homeController.isFaceBookAdShow
                                //           ? Container(
                                //               color: Colors.black,
                                //               height: 200,
                                //               width: 200,
                                //             )
                                //           //homeController.facebookBannerAdList[2]
                                //           : Container(
                                //               color: Colors.red,
                                //               height: 200,
                                //               width: 200,
                                //             );

                                //     },
                                //   ),
                                // ),
                                // homeController.isAdLoaed && global.admobSetting.bannerAdList[2].status == 1
                                //     ? Align(
                                //         alignment: Alignment.center,
                                //         child: Padding(
                                //           padding: const EdgeInsets.symmetric(vertical: 15),
                                //           child: SizedBox(
                                //             height: homeController.bannerAdList[2].size.height.toDouble(),
                                //             width: homeController.bannerAdList[2].size.width.toDouble(),
                                //             child: AdWidget(
                                //               key: Key('2'),
                                //               ad: homeController.bannerAdList[2],
                                //             ),
                                //           ),
                                //         ),
                                //       )
                                //     : SizedBox(
                                //         height: 25,
                                //       ),
                                // homeController.facebookBannerAdList[2],
                                // homeController.isAdLoaed && global.admobSetting.bannerAdList[2].status == 1
                                //     ? SizedBox(
                                //         //height: 100,
                                //         height: homeController.bannerAdList[2].size.height.toDouble(),
                                //         //width: 200,
                                //         width: homeController.bannerAdList[2].size.width.toDouble(),
                                //         child: AdWidget(
                                //           key: Key('2'),
                                //           ad: homeController.bannerAdList[2],
                                //         ),
                                //       )
                                //     : SizedBox(),
                              ],
                            ),
                          ),
                        );
                      });
                    });
                  }),
                  bannerImageWidget(),
                ],
              ));
  }
}
