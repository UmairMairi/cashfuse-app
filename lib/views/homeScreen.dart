import 'package:carousel_slider/carousel_slider.dart';
import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/appWiseoffershowListScreen.dart';
import 'package:cashbackapp/views/categoryScreen.dart';
import 'package:cashbackapp/views/couponDetailScreen.dart';
import 'package:cashbackapp/views/dealDetailScreen.dart';
import 'package:cashbackapp/views/faqSceen.dart';
import 'package:cashbackapp/views/myEarningScreen.dart';
import 'package:cashbackapp/views/offerDetailScreen.dart';
import 'package:cashbackapp/widget/appWiseoffershowWidget.dart';
import 'package:cashbackapp/widget/couponWidget.dart';
import 'package:cashbackapp/widget/drawerWidget.dart';
import 'package:cashbackapp/widget/storeOfferWidget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:slide_countdown/slide_countdown.dart';

class HomeScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
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
                CarouselSlider.builder(
                    options: CarouselOptions(
                      clipBehavior: Clip.none,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      height: 180,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      autoPlayCurve: Curves.easeIn,
                      autoPlayInterval: Duration(seconds: 5),
                      //viewportFraction: 0.85,
                      onPageChanged: (index, reason) {},
                      pageSnapping: false,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index, _) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => OfferDetailScreen());
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
                                child: Image.asset(
                                  Images.banner_bg,
                                  width: Get.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
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
                              ),
                              Positioned(
                                top: 10,
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'myntra',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: DotsIndicator(
                      dotsCount: 5,
                      position: 1,
                      decorator: DotsDecorator(
                        activeSize: Size(8, 8),
                        size: Size(8, 8),
                        color: Colors.white, // Inactive color
                        activeColor: Colors.orange,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  child: Text(
                    'TOP CATEGORIES',
                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.catList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => CategoryScreen(
                                category: homeController.catList[index],
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
                                homeController.catList[index].name.toUpperCase(),
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: index == 0 ? Colors.white : Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Image.asset(
                                Images.placeholder,
                                height: 25,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => OfferDetailScreen());
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
                                child: Image.asset(
                                  Images.dummyImage,
                                  height: 165,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: SlideCountdown(
                                  slideDirection: SlideDirection.none,
                                  textStyle: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                                  decoration: BoxDecoration(
                                    color: Colors.red[800],
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  duration: const Duration(days: 2),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
                          Get.to(() => CategoryScreen());
                        },
                        child: Text(
                          'View All >',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 155,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => OfferDetailScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 13),
                          child: SizedBox(
                            width: 155,
                            child: StoreOfferWidget(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          isTimeShow: true,
                        ),
                      );
                    },
                  ),
                ),

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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          isTimeShow: false,
                        ),
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          isTimeShow: false,
                        ),
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          isTimeShow: false,
                        ),
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          isTimeShow: false,
                        ),
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          isTimeShow: false,
                        ),
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          isTimeShow: false,
                        ),
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          isTimeShow: false,
                        ),
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          isTimeShow: true,
                        ),
                      );
                    },
                  ),
                ),
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
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DealDetailScreen());
                        },
                        child: AppWiseOfferShowWidget(
                          isTimeShow: true,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
