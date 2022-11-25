import 'package:carousel_slider/carousel_slider.dart';
import 'package:cashfuse/constants/appConstant.dart';
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
import 'package:cashfuse/widget/adsCampaignWidget.dart';
import 'package:cashfuse/widget/bannerImageWidget.dart';
import 'package:cashfuse/widget/couponWidget.dart';
import 'package:cashfuse/widget/customImage.dart';
import 'package:cashfuse/widget/drawerWidget.dart';
import 'package:cashfuse/widget/offerWidget.dart';
import 'package:cashfuse/widget/web/homeWebCategoryView.dart';
import 'package:cashfuse/widget/web/homeWebTopCashbackView.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:cashfuse/widget/web/web_banner_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:slide_countdown/slide_countdown.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final bgColor;
  HomeScreen({this.bgColor});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HomeController homeController2 = Get.find<HomeController>();
  CouponController couponC = Get.find<CouponController>();
  SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(),
      appBar: GetPlatform.isWeb
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
                      Get.to(() => LoginOrSignUpScreen(
                            fromMenu: true,
                          ));
                    }
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        Images.payments,
                        height: 25,
                      )),
                )
              ],
            ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
              onTap: () async {
                if (global.currentUser.id != null) {
                  Get.to(() => ReferEarnScreen());
                } else {
                  Get.to(() => LoginOrSignUpScreen(
                        fromMenu: true,
                      ));
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
      ),
      body: Center(
        child: SizedBox(
          width: AppConstants.WEB_MAX_WIDTH,
          child: Stack(
            alignment: Alignment.center,
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  await homeController2.init();
                },
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<HomeController>(builder: (controller) {
                        return GetPlatform.isWeb
                            ? WebBannerView(homeController: homeController2)
                            : homeController2.isBannerLoaded
                                ? Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      CarouselSlider.builder(
                                          options: CarouselOptions(
                                            height: GetPlatform.isWeb ? 250 : 170,
                                            autoPlay: true,
                                            enlargeCenterPage: false,
                                            disableCenter: false,
                                            autoPlayCurve: Curves.easeIn,
                                            aspectRatio: 1,
                                            autoPlayInterval: Duration(seconds: 2),
                                            onPageChanged: (index, reason) {
                                              homeController2.setBannerIndex(index);
                                            },
                                            viewportFraction: GetPlatform.isWeb ? 0.5 : 1,
                                            pageSnapping: false,
                                          ),
                                          itemCount: homeController2.topBannerList.length,
                                          itemBuilder: (context, index, _) {
                                            return InkWell(
                                              onTap: () async {
                                                if (homeController2.topBannerList[index].type == 'url') {
                                                  if (global.currentUser.id != null) {
                                                    // Get.to(
                                                    //   () => WebViewScreen(
                                                    //     urlString: homeController2.topBannerList[index].url,
                                                    //     brandName: homeController2.topBannerList[index].name,
                                                    //   ),
                                                    // );
                                                    global.launchInBrowser(
                                                      homeController2.topBannerList[index].url,
                                                    );
                                                  } else {
                                                    Get.to(() => LoginOrSignUpScreen(
                                                          fromMenu: true,
                                                        ));
                                                  }
                                                } else {
                                                  await homeController2.getOfferDetails(
                                                    homeController2.topBannerList[index].offerId.toString(),
                                                  );
                                                  Get.to(
                                                    () => OfferDetailScreen(
                                                      offer: homeController2.offer,
                                                      fromSeeMore: false,
                                                    ),
                                                  );
                                                }
                                              },
                                              child: Container(
                                                width: GetPlatform.isWeb ? Get.width / 2 : Get.width,
                                                margin: EdgeInsets.only(right: 0),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(0),
                                                  child: CustomImage(
                                                    image: '${global.appInfo.baseUrls.bannerImageUrl}/${homeController2.topBannerList[index].image}',
                                                    //height: 25,
                                                    width: Get.width,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                      GetBuilder<HomeController>(builder: (controller1) {
                                        return homeController2.topBannerList != null && homeController2.topBannerList.length > 0
                                            ? Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 6),
                                                  child: DotsIndicator(
                                                    dotsCount: homeController2.topBannerList.length,
                                                    position: homeController2.bannerIndex.toDouble(),
                                                    decorator: DotsDecorator(
                                                      activeSize: Size(7, 7),
                                                      size: Size(7, 7),
                                                      color: Colors.white, // Inactive color
                                                      activeColor: Colors.orange,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox();
                                      }),
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
                                  );
                      }),
                      GetBuilder<HomeController>(builder: (hm) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).top_categories,
                                style: TextStyle(
                                  fontSize: GetPlatform.isWeb ? 16 : 13,
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
                                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: GetPlatform.isWeb ? 16 : null),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                      GetPlatform.isWeb
                          ? HomeWebCategoryView()
                          : GetBuilder<HomeController>(builder: (hm) {
                              return SizedBox(
                                height: 80,
                                child: hm.isCategoryLoaded
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: hm.topCategoryList.length > 10 ? 10 : hm.topCategoryList.length,
                                        padding: const EdgeInsets.symmetric(horizontal: 6),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Get.to(() => CategoryScreen(
                                                    category: hm.topCategoryList[index],
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
                                                    hm.topCategoryList[index].name.toUpperCase(),
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
                                                    image: '${global.appInfo.baseUrls.categoryImageUrl}/${hm.topCategoryList[index].image}',
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
                              );
                            }),
                      GetBuilder<CouponController>(builder: (couponController) {
                        return couponController.couponList != null && couponController.couponList.length > 0
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).coupons_of_the_day.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: GetPlatform.isWeb ? 16 : 13,
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
                                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: GetPlatform.isWeb ? 16 : null),
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              )
                            : SizedBox();
                      }),
                      GetBuilder<CouponController>(builder: (couponController) {
                        return couponController.isDataLoaded
                            ? couponController.couponList != null && couponController.couponList.length > 0
                                ? SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: couponC.couponList.length >= 5 ? 5 : couponC.couponList.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            if (couponC.couponList[index].offer != null) {
                                              Get.to(
                                                () => OfferDetailScreen(
                                                  offer: couponC.couponList[index].offer,
                                                  fromSeeMore: false,
                                                ),
                                              );
                                            } else {
                                              Get.to(
                                                () => CouponDetailScreen(
                                                  coupon: couponC.couponList[index],
                                                ),
                                              );
                                            }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: CouponWidget(
                                              coupon: couponC.couponList[index],
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
                              );
                      }),
                      GetBuilder<HomeController>(builder: (hmCon) {
                        return hmCon.exclusiveOfferList != null && hmCon.exclusiveOfferList.length > 0
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                                child: Text(
                                  AppLocalizations.of(context).exclusive_offers,
                                  style: TextStyle(
                                    fontSize: GetPlatform.isWeb ? 16 : 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.79),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              )
                            : SizedBox();
                      }),
                      GetBuilder<HomeController>(builder: (hmCon) {
                        return hmCon.isOfferLoaded
                            ? hmCon.exclusiveOfferList != null && hmCon.exclusiveOfferList.length > 0
                                ? SizedBox(
                                    height: GetPlatform.isWeb ? 170 : 165,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: hmCon.exclusiveOfferList.length,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () async {
                                            await hmCon.getOfferDetails(hmCon.exclusiveOfferList[index].id.toString());
                                            Get.to(() => OfferDetailScreen(
                                                  offer: hmCon.offer,
                                                  fromSeeMore: false,
                                                ));
                                          },
                                          child: Container(
                                            width: GetPlatform.isWeb ? 270 : 240, //Get.width - 120,
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
                                                      image: '${global.appInfo.baseUrls.offerImageUrl}/${hmCon.exclusiveOfferList[index].bannerImage}',
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
                                                        image: '${global.appInfo.baseUrls.offerImageUrl}/${hmCon.exclusiveOfferList[index].image}',
                                                        height: 30,
                                                        width: 60,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                hmCon.countTimer(DateTime.now(), hmCon.exclusiveOfferList[index].endDate) != null
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
                                                            days: hmCon.countTimer(
                                                              DateTime.now(),
                                                              hmCon.exclusiveOfferList[index].endDate,
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
                              );
                      }),
                      GetBuilder<HomeController>(builder: (hmController) {
                        return hmController.topCashbackList != null && hmController.topCashbackList.length > 0
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).top_cashback_stores,
                                      style: TextStyle(
                                        fontSize: GetPlatform.isWeb ? 16 : 13,
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
                                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: GetPlatform.isWeb ? 16 : null),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox();
                      }),
                      GetPlatform.isWeb
                          ? HomeWebTopCashbackView()
                          : GetBuilder<HomeController>(builder: (hmController) {
                              return hmController.isTopCashbackLoaded
                                  ? hmController.topCashbackList != null && hmController.topCashbackList.length > 0
                                      ? SizedBox(
                                          height: 155,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: hmController.topCashbackList.length > 6 ? 6 : hmController.topCashbackList.length,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.symmetric(horizontal: 6),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  Get.to(() => CategoryScreen(
                                                        category: hmController.topCashbackList[index],
                                                      ));
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 13),
                                                  child: SizedBox(
                                                    width: 155,
                                                    child: AdsCampaignWidget(
                                                      commonModel: CommonModel(
                                                        name: hmController.topCashbackList[index].name,
                                                        image: '${global.appInfo.baseUrls.partnerImageUrl}/${hmController.topCashbackList[index].image}',
                                                        tagline: hmController.topCashbackList[index].tagline,
                                                        adId: hmController.topCashbackList[index].id.toString(),
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
                                    );
                            }),
                      GetBuilder<HomeController>(builder: (home) {
                        return home.newFlashOfferList != null && home.newFlashOfferList.length > 0
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6).copyWith(top: 25, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'NEW FLASH DEALS - LIVE NOW',
                                      style: TextStyle(
                                        fontSize: GetPlatform.isWeb ? 16 : 13,
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
                                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: GetPlatform.isWeb ? 16 : null),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox();
                      }),
                      GetBuilder<HomeController>(builder: (home) {
                        return home.isFlashOffersLoaded
                            ? home.newFlashOfferList != null && home.newFlashOfferList.length > 0
                                ? SizedBox(
                                    height: GetPlatform.isWeb ? 230 : 200,
                                    child: ListView.builder(
                                      itemCount: home.newFlashOfferList.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () async {
                                            await home.getOfferDetails(home.newFlashOfferList[index].id.toString());
                                            Get.to(() => OfferDetailScreen(
                                                  offer: home.offer,
                                                  fromSeeMore: false,
                                                ));
                                          },
                                          child: OfferWidget(
                                            offer: home.newFlashOfferList[index],
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
                              );
                      }),
                      GetBuilder<HomeController>(builder: (home1) {
                        return ListView.builder(
                          itemCount: home1.homeAdvList.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return home1.isHomeAdvLoaded
                                ? home1.homeAdvList[index].commonList != null && home1.homeAdvList[index].commonList.length > 0
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 6).copyWith(top: 25, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  home1.homeAdvList[index].name.toUpperCase(),
                                                  style: TextStyle(
                                                    fontSize: GetPlatform.isWeb ? 16 : 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black.withOpacity(0.79),
                                                    letterSpacing: -0.3,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                      () => OfferListScreen(
                                                        categoryModel: home1.homeAdvList[index],
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    '${AppLocalizations.of(context).view_all} >',
                                                    style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: GetPlatform.isWeb ? 16 : null),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: GetPlatform.isWeb ? 230 : 200,
                                            child: ListView.builder(
                                                itemCount: home1.homeAdvList[index].commonList.length,
                                                shrinkWrap: true,
                                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context, i) {
                                                  return InkWell(
                                                    onTap: () async {
                                                      if (home1.homeAdvList[index].commonList[i].adId != null && home1.homeAdvList[index].commonList[i].adId.isNotEmpty) {
                                                        await home1.getAdDetails(home1.homeAdvList[index].commonList[i].adId);
                                                        Get.to(() => AdsDetailScreen(
                                                              ads: home1.ads,
                                                              fromSeeMore: false,
                                                            ));
                                                      } else {
                                                        await home1.getCampignDetails(home1.homeAdvList[index].commonList[i].campaignId.toString());
                                                        Get.to(() => CampaignDetailScreen(
                                                              campaign: home1.campaign,
                                                              fromSeeMore: false,
                                                            ));
                                                      }
                                                    },
                                                    child: OfferWidget(
                                                      commonModel: home1.homeAdvList[index].commonList[i],
                                                      domainImage: home1.homeAdvList[index].image,
                                                      fromList: false,
                                                    ),
                                                  );
                                                }),
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
                        );
                      }),
                    ],
                  ),
                ),
              ),
              bannerImageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
