import 'dart:async';

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
class HomeScreen extends StatefulWidget {
  final bgColor;
  HomeScreen({this.bgColor});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HomeController homeController = Get.find<HomeController>();

  CouponController couponController = Get.find<CouponController>();

  SplashController splashController = Get.find<SplashController>();

  final couponScrollController = new ScrollController();

  final offerScrollController = new ScrollController();

  BannerAd admobBannerAd1;

  BannerAd admobBannerAd2;

  BannerAd admobBannerAd3;

  bool isAdmobBannerAdLoaed1 = false;

  bool isAdmobBannerAdLoaed2 = false;

  bool isAdmobBannerAdLoaed3 = false;

  final Completer<BannerAd> bannerCompleter = Completer<BannerAd>();

  String currentPlatform() {
    if (GetPlatform.isAndroid) {
      return 'android';
    } else if (GetPlatform.isIOS) {
      return 'ios';
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    createAdmobBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    admobBannerAd1.dispose();
    admobBannerAd2.dispose();
    admobBannerAd3.dispose();
  }

  Future createAdmobBannerAd() async {
    try {
      if (global.admobSetting.bannerAdList != null && global.admobSetting.bannerAdList.length > 0) {
        if (global.admobSetting.bannerAdList[0] != null && global.admobSetting.bannerAdList[0].status == 1 && global.admobSetting.bannerAdList[0].platform == currentPlatform()) {
          admobBannerAd1 = new BannerAd(
            adUnitId: "ca-app-pub-3940256099942544/6300978111", // this is testing Id please add your Ad Id
            request: AdRequest(),
            size: AdSize.banner,
            listener: BannerAdListener(
              onAdLoaded: (Ad ad) {
                print('$BannerAd loaded.');
                bannerCompleter.complete(ad as BannerAd);
                setState(() {});
              },
              onAdFailedToLoad: (Ad ad, LoadAdError error) {
                ad.dispose();
                print('$BannerAd failedToLoad: $error');
                bannerCompleter.completeError(error);
                setState(() {});
              },
              onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
              onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
            ),
          );
          await admobBannerAd1.load();
        }

        if (global.admobSetting.bannerAdList[1] != null && global.admobSetting.bannerAdList[1].status == 1 && global.admobSetting.bannerAdList[1].platform == currentPlatform()) {
          admobBannerAd2 = new BannerAd(
            adUnitId: "ca-app-pub-3940256099942544/6300978111", // this is testing Id please add your Ad Id
            request: AdRequest(),
            size: AdSize.banner,
            listener: BannerAdListener(
              onAdLoaded: (Ad ad) {
                print('$BannerAd loaded.');
                bannerCompleter.complete(ad as BannerAd);
                setState(() {});
              },
              onAdFailedToLoad: (Ad ad, LoadAdError error) {
                ad.dispose();
                print('$BannerAd failedToLoad: $error');
                bannerCompleter.completeError(error);
                setState(() {});
              },
              onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
              onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
            ),
          );
          await admobBannerAd2.load();
        }

        if (global.admobSetting.bannerAdList[2] != null && global.admobSetting.bannerAdList[2].status == 1 && global.admobSetting.bannerAdList[2].platform == currentPlatform()) {
          admobBannerAd3 = new BannerAd(
            adUnitId: "ca-app-pub-3940256099942544/6300978111", // this is testing Id please add your Ad Id
            request: AdRequest(),
            size: AdSize.banner,
            listener: BannerAdListener(
              onAdLoaded: (Ad ad) {
                print('$BannerAd loaded.');
                bannerCompleter.complete(ad as BannerAd);
                setState(() {});
              },
              onAdFailedToLoad: (Ad ad, LoadAdError error) {
                ad.dispose();
                print('$BannerAd failedToLoad: $error');
                bannerCompleter.completeError(error);
                setState(() {});
              },
              onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
              onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
            ),
          );
          await admobBannerAd3.load();
        }
      }
    } catch (e) {
      print("Exception - HomeScreen.dart - createAdmobBannerAd():" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      color: widget.bgColor,
                    ),
                  ),
                ),
                title: Image.asset(
                  Images.text_logo,
                  height: 35,
                  // width: 100,
                ),

                actions: [
                  InkWell(
                    onTap: () {
                      if (global.currentUser.id != null) {
                        Get.to(
                          () => MyEarningSceen(),
                          routeName: 'earning',
                        );
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
                          Get.to(
                            () => LoginOrSignUpScreen(
                              fromMenu: true,
                            ),
                            routeName: 'login',
                          );
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
                      Get.to(
                        () => ReferEarnScreen(),
                        routeName: 'referearn',
                      );
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
                        Get.to(
                          () => LoginOrSignUpScreen(
                            fromMenu: true,
                          ),
                          routeName: 'login',
                        );
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
                  Get.to(
                    () => GetHelpScreen(),
                    routeName: 'faq',
                  );
                },
                child: Image.asset(
                  Images.gethelp,
                  height: 50,
                ),
              ),
            ],
          );
        }),
        body: Stack(
          alignment: Alignment.center,
          children: [
            global.getPlatFrom()
                ? WebHomeScreen()
                : GetBuilder<HomeController>(builder: (controller) {
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
                                  ? homeController.topBannerList != null && homeController.topBannerList.length > 0
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
                                                          Get.to(
                                                            () => LoginOrSignUpScreen(
                                                              fromMenu: true,
                                                            ),
                                                            routeName: 'login',
                                                          );
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
                                                          routeName: 'offer',
                                                        );
                                                      }
                                                    },
                                                    child: Container(
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
                                      : SizedBox()
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
                              homeController.topCategoryList != null && homeController.topCategoryList.length > 0
                                  ? Padding(
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
                                              Get.to(
                                                () => AllCategoriesScreen(),
                                                routeName: 'allCategory',
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
                                  : SizedBox(
                                      height: 15,
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
                                              Get.to(
                                                () => CategoryScreen(
                                                  category: homeController.topCategoryList[index],
                                                ),
                                                routeName: 'category',
                                              );
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
                              !GetPlatform.isWeb && admobBannerAd1 != null && bannerCompleter.isCompleted
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 15),
                                        width: admobBannerAd1.size.width.toDouble(),
                                        height: admobBannerAd1.size.height.toDouble(),
                                        child: AdWidget(ad: admobBannerAd1),
                                      ),
                                    )
                                  : SizedBox(),
                              GetBuilder<AdController>(builder: (adCont) {
                                return !GetPlatform.isWeb && adCont.fbBannerAd1 != null && adCont.isfbBannerAdLoaed1
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: adCont.fbBannerAd1,
                                        ),
                                      )
                                    : SizedBox();
                              }),
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
                                                    Get.to(
                                                      () => CouponListScreen(),
                                                      routeName: 'coupons',
                                                    );
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
                                                      routeName: 'offer',
                                                    );
                                                  } else {
                                                    Get.to(
                                                      () => CouponDetailScreen(
                                                        coupon: couponController.couponList[index],
                                                      ),
                                                      routeName: 'detail',
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
                                                  Get.to(
                                                    () => OfferDetailScreen(
                                                      offer: homeController.offer,
                                                      fromSeeMore: false,
                                                    ),
                                                    routeName: 'offer',
                                                  );
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
                                                      homeController.exclusiveOfferList[index].dayDifference != null && homeController.exclusiveOfferList[index].dayDifference > 0
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
                                                                  days: homeController.exclusiveOfferList[index].dayDifference,
                                                                ),
                                                              ),
                                                            )
                                                          : SizedBox()
                                                      // homeController.countTimer(DateTime.now(), homeController.exclusiveOfferList[index].endDate) != null
                                                      //     ? Padding(
                                                      //         padding: const EdgeInsets.all(10),
                                                      //         child: SlideCountdown(
                                                      //           slideDirection: SlideDirection.none,
                                                      //           textStyle: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                                                      //           decoration: BoxDecoration(
                                                      //             color: Colors.red[800],
                                                      //             borderRadius: BorderRadius.circular(3),
                                                      //           ),
                                                      //           duration: Duration(
                                                      //             days: homeController.countTimer(
                                                      //               DateTime.now(),
                                                      //               homeController.exclusiveOfferList[index].endDate,
                                                      //             ),
                                                      //           ),
                                                      //         ),
                                                      //       )
                                                      //     : SizedBox()
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
                                                routeName: 'all',
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
                                                  Get.to(
                                                    () => CategoryScreen(
                                                      category: homeController.topCashbackList[index],
                                                    ),
                                                    routeName: 'category',
                                                  );
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
                                              Get.to(
                                                () => OfferListScreen(),
                                                routeName: 'all',
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
                                                  Get.to(
                                                    () => OfferDetailScreen(
                                                      offer: homeController.offer,
                                                      fromSeeMore: false,
                                                    ),
                                                    routeName: 'offer',
                                                  );
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
                              !GetPlatform.isWeb && admobBannerAd2 != null && bannerCompleter.isCompleted
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 15),
                                        width: admobBannerAd2.size.width.toDouble(),
                                        height: admobBannerAd2.size.height.toDouble(),
                                        child: AdWidget(ad: admobBannerAd2),
                                      ),
                                    )
                                  : SizedBox(),
                              GetBuilder<AdController>(builder: (adCont) {
                                return !GetPlatform.isWeb && adCont.fbBannerAd2 != null && adCont.isfbBannerAdLoaed2
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: adCont.fbBannerAd2,
                                        ),
                                      )
                                    : SizedBox();
                              }),
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
                                                            routeName: 'all',
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
                                                                Get.to(
                                                                  () => AdsDetailScreen(
                                                                    ads: homeController.ads,
                                                                    fromSeeMore: false,
                                                                  ),
                                                                  routeName: 'detail',
                                                                );
                                                              } else {
                                                                await homeController.getCampignDetails(homeController.homeAdvList[index].commonList[i].campaignId.toString());
                                                                Get.to(
                                                                  () => CampaignDetailScreen(
                                                                    campaign: homeController.campaign,
                                                                    fromSeeMore: false,
                                                                  ),
                                                                  routeName: 'detail',
                                                                );
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
                              !GetPlatform.isWeb && admobBannerAd3 != null && bannerCompleter.isCompleted
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 15),
                                        width: admobBannerAd3.size.width.toDouble(),
                                        height: admobBannerAd3.size.height.toDouble(),
                                        child: AdWidget(ad: admobBannerAd3),
                                      ),
                                    )
                                  : SizedBox(),
                              GetBuilder<AdController>(builder: (adCont) {
                                return !GetPlatform.isWeb && adCont.fbBannerAd3 != null && adCont.isfbBannerAdLoaed3
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: adCont.fbBannerAd3,
                                        ),
                                      )
                                    : SizedBox();
                              }),
                            ],
                          ),
                        ),
                      );
                    });
                  }),
            bannerImageWidget(),
          ],
        ));
  }
}
