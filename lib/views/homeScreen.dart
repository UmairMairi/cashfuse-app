import 'package:carousel_slider/carousel_slider.dart';
import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/models/commonModel.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/views/appWiseoffershowListScreen.dart';
import 'package:cashbackapp/views/categoryScreen.dart';
import 'package:cashbackapp/views/couponDetailScreen.dart';
import 'package:cashbackapp/views/dealDetailScreen.dart';
import 'package:cashbackapp/views/faqSceen.dart';
import 'package:cashbackapp/views/myEarningScreen.dart';
import 'package:cashbackapp/views/offerDetailScreen.dart';
import 'package:cashbackapp/views/storeOfferListSceen.dart';
import 'package:cashbackapp/views/webViewScreen.dart';
import 'package:cashbackapp/widget/appWiseoffershowWidget.dart';
import 'package:cashbackapp/widget/couponWidget.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:cashbackapp/widget/drawerWidget.dart';
import 'package:cashbackapp/widget/storeOfferWidget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:slide_countdown/slide_countdown.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HomeController homeController2 = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
          child: Icon(
            MdiIcons.sortVariant,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: "CASH",
            style: Get.theme.primaryTextTheme.headline4.copyWith(
              letterSpacing: 0.1,
              color: Color(0xFFfe3d00),
              fontFamily: 'Bebas Neue',
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'BACK',
                style: Get.theme.primaryTextTheme.headline4.copyWith(
                  color: Colors.white,
                  letterSpacing: 0.1,
                  fontFamily: 'Bebas Neue',
                ),
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => MyEarningSceen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Earnings',
                    style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Text('₹0.00'),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Get.theme.primaryColor,
        child: Icon(FontAwesomeIcons.commentDots),
        onPressed: () {
          Get.to(() => FaqScreen());
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<HomeController>(builder: (controller) {
                return controller.isBannerLoaded
                    ? CarouselSlider.builder(
                        options: CarouselOptions(
                          clipBehavior: Clip.none,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          height: 180,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          disableCenter: true,
                          autoPlayCurve: Curves.easeIn,
                          autoPlayInterval: Duration(seconds: 5),
                          enableInfiniteScroll: false,
                          //viewportFraction: 0.85,
                          onPageChanged: (index, reason) {
                            controller.setBannerIndex(index);
                          },
                          pageSnapping: false,
                        ),
                        itemCount: controller.topBannerList.length,
                        itemBuilder: (context, index, _) {
                          return InkWell(
                            onTap: () {
                              if (controller.topBannerList[index].type == 'url') {
                                Get.to(
                                  () => WebViewScreen(
                                    url: controller.topBannerList[index].url,
                                  ),
                                );
                              } else {
                                Get.to(() => OfferDetailScreen());
                              }
                            },
                            child: Container(
                              //width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CustomImage(
                                      image: '${global.appInfo.baseUrls.bannerImageUrl}/${controller.topBannerList[index].image}',
                                      //height: 25,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    ),
                                    // Image.asset(
                                    //   Images.banner_bg,
                                    //   width: Get.width,
                                    //   fit: BoxFit.fill,
                                    // ),
                                  ),
                                  controller.topBannerList[index].type == 'offer'
                                      ? Container(
                                          width: Get.width,
                                          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.8),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '40% OFF EVERYTHING',
                                                style: Get.theme.primaryTextTheme.headline6.copyWith(color: Colors.white),
                                              ),
                                              Text(
                                                'extra 10% with code:MYNTRA',
                                                style: Get.theme.primaryTextTheme.subtitle1.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                'Every 10th Wins',
                                                style: Get.theme.primaryTextTheme.headline6.copyWith(color: Colors.teal),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(),
                                  controller.topBannerList[index].type == 'offer'
                                      ? Positioned(
                                          top: 10,
                                          child: Card(
                                            margin: EdgeInsets.zero,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                controller.topBannerList[index].cuelinkoffer.campaignName,
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              ),
                            ),
                          );
                        })
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
              GetBuilder<HomeController>(builder: (controller1) {
                return controller1.topBannerList != null && controller1.topBannerList.length > 0
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: DotsIndicator(
                            dotsCount: controller1.topBannerList.length,
                            position: controller1.bannerIndex.toDouble(),
                            decorator: DotsDecorator(
                              activeSize: Size(8, 8),
                              size: Size(8, 8),
                              color: Colors.white, // Inactive color
                              activeColor: Colors.orange,
                            ),
                          ),
                        ),
                      )
                    : SizedBox();
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Text(
                  'TOP CATEGORIES',
                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              GetBuilder<HomeController>(builder: (hm) {
                return SizedBox(
                  height: 80,
                  child: hm.isCategoryLoaded
                      ? ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: hm.topCategoryList.length,
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
                                  color: index == 0 ? Colors.blue[700] : Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      hm.topCategoryList[index].name.toUpperCase(),
                                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: index == 0 ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomImage(
                                      image: '${global.appInfo.baseUrls.categoryImageUrl}/${hm.topCategoryList[index].image}',
                                      height: 25,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coupons of the day'.toUpperCase(),
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => CouponDetailScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CouponWidget(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Text(
                  'EXCLUSIVE OFFERS FOR YOU',
                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              GetBuilder<HomeController>(builder: (hmCon) {
                return SizedBox(
                  height: 165,
                  child: hmCon.isOfferLoaded
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hmCon.exclusiveOfferList.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => OfferDetailScreen(
                                      offer: hmCon.exclusiveOfferList[index],
                                    ));
                              },
                              child: Container(
                                width: Get.width - 120,
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
                                          height: 165,
                                          width: Get.width,
                                          fit: BoxFit.cover,
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
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          itemBuilder: (context, index) {
                            return Shimmer(
                              duration: Duration(seconds: 2),
                              child: Container(
                                width: Get.width - 120,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TOP CASHBACK STORES',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => StoreOfferListScreen(
                            title: 'TOP CASHBACK STORES',
                            list: homeController2.topCashbackList,
                          ),
                        );
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              GetBuilder<HomeController>(builder: (hmController) {
                return SizedBox(
                  height: 155,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hmController.topCashbackList.length,
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
                            child: StoreOfferWidget(
                              commonModel: CommonModel(
                                name: hmController.topCashbackList[index].name,
                                image: hmController.topCashbackList[index].image,
                                tagline: hmController.topCashbackList[index].tagline,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NEW FLASH DEALS - LIVE NOW',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AppWiseOfferShowListScreen());
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              GetBuilder<HomeController>(builder: (home) {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: home.newFlashOfferList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          offer: home.newFlashOfferList[index],
                          isTimeShow: true,
                        ),
                      );
                    },
                  ),
                );
              }),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CROMA - FESTIVAL OF DREAMS',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AppWiseOfferShowListScreen());
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: homeController2.homeAdvList.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     padding: const EdgeInsets.symmetric(horizontal: 6),
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           Get.to(() => DealDetailScreen());
              //         },
              //         child: AppWiseOfferShowWidget(
              //           category: homeController2.homeAdvList[index],
              //           isTimeShow: true,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AMAZON - GREAT INDIAN FESTIVAL',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AppWiseOfferShowListScreen());
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: homeController2.homeAdvList.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     padding: const EdgeInsets.symmetric(horizontal: 6),
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           Get.to(() => DealDetailScreen());
              //         },
              //         child: AppWiseOfferShowWidget(
              //           category: homeController2.homeAdvList[index],
              //           isTimeShow: true,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FLIPKART - BIG DIWALI SALE',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AppWiseOfferShowListScreen());
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: homeController2.homeAdvList.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     padding: const EdgeInsets.symmetric(horizontal: 6),
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           Get.to(() => DealDetailScreen());
              //         },
              //         child: AppWiseOfferShowWidget(
              //           category: homeController2.homeAdvList[index],
              //           isTimeShow: true,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MYNTRA DIWALI SALE',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AppWiseOfferShowListScreen());
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: homeController2.homeAdvList.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     padding: const EdgeInsets.symmetric(horizontal: 6),
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           Get.to(() => DealDetailScreen());
              //         },
              //         child: AppWiseOfferShowWidget(
              //           category: homeController2.homeAdvList[index],
              //           isTimeShow: true,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AMAZON - GIF TOP SELLING MOBILES',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AppWiseOfferShowListScreen());
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: homeController2.homeAdvList.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     padding: const EdgeInsets.symmetric(horizontal: 6),
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           Get.to(() => DealDetailScreen());
              //         },
              //         child: AppWiseOfferShowWidget(
              //           category: homeController2.homeAdvList[index],
              //           isTimeShow: true,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AJIO - ALL STARTS SALE',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AppWiseOfferShowListScreen());
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: homeController2.homeAdvList.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     padding: const EdgeInsets.symmetric(horizontal: 6),
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           Get.to(() => DealDetailScreen());
              //         },
              //         child: AppWiseOfferShowWidget(
              //           category: homeController2.homeAdvList[index],
              //           isTimeShow: true,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'THE MAN COMPANY - EXCLUSIVE OFFERS',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AppWiseOfferShowListScreen());
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: homeController2.homeAdvList.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     padding: const EdgeInsets.symmetric(horizontal: 6),
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           Get.to(() => DealDetailScreen());
              //         },
              //         child: AppWiseOfferShowWidget(
              //           category: homeController2.homeAdvList[index],
              //           isTimeShow: true,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'AMAZON - GIF HOT SELLING PRODUCTS',
              //         style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
              //       ),
              //       Text(
              //         'View All >',
              //         style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
              //       )
              //     ],
              //   ),
              // ),
              // ProductWidget(),
              // Padding(
              //   padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'TOP SELLING MOBILE PHONES',
              //         style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
              //       ),
              //       Text(
              //         'View All >',
              //         style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
              //       )
              //     ],
              //   ),
              // ),
              // ProductWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ALL BEAUTY DEALS',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AppWiseOfferShowListScreen());
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: homeController2.homeAdvList.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     padding: const EdgeInsets.symmetric(horizontal: 6),
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           Get.to(() => DealDetailScreen());
              //         },
              //         child: AppWiseOfferShowWidget(
              //           category: homeController2.homeAdvList[index],
              //           isTimeShow: true,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NEW ON CASHKARO',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AppWiseOfferShowListScreen());
                      },
                      child: Text(
                        'View All >',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: homeController2.homeAdvList.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     padding: const EdgeInsets.symmetric(horizontal: 6),
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           Get.to(() => DealDetailScreen());
              //         },
              //         child: AppWiseOfferShowWidget(
              //           category: homeController2.homeAdvList[index],
              //           isTimeShow: true,
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
