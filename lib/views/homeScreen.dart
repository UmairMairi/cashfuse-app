import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/appWiseoffershowListScreen.dart';
import 'package:cashbackapp/views/categoryScreen.dart';
import 'package:cashbackapp/widget/appWiseoffershowWidget.dart';
import 'package:cashbackapp/widget/drawerWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
          title: Image.asset(
            Images.cashkaro,
            height: 80,
          ),
          actions: [
            Padding(
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
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Get.theme.primaryColor,
          child: Icon(FontAwesomeIcons.commentDots),
          onPressed: () {},
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6.0).copyWith(right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 165,
                          autoPlay: true,
                          enlargeCenterPage: false,
                          disableCenter: false,
                          autoPlayCurve: Curves.easeIn,
                          aspectRatio: 1,
                          autoPlayInterval: Duration(seconds: 5),
                          onPageChanged: (index, reason) {},
                          viewportFraction: 1,
                          pageSnapping: false,
                        ),
                        itemCount: 5,
                        itemBuilder: (context, index, _) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              width: Get.width,
                              margin: EdgeInsets.only(right: 6),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  Images.cashkaro,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        }),
                    DotsIndicator(
                      dotsCount: 5,
                      position: 1,
                      decorator: DotsDecorator(
                        activeSize: Size(7, 7),
                        size: Size(7, 7),
                        color: Colors.white, // Inactive color
                        activeColor: Colors.orange,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                            color: Colors.white,
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
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
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
                    itemBuilder: (context, index) {
                      return Container(
                        width: Get.width - 120,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            Images.cashkaro,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return Container(
                        width: 155,
                        margin: EdgeInsets.only(right: 13),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: RotatedBox(
                                quarterTurns: -45,
                                child: ClipPath(
                                  clipper: MultiplePointsClipper(Sides.bottom, heightOfPoint: 10, numberOfPoints: 1),
                                  child: Container(
                                    width: 20,
                                    height: 135,
                                    decoration: BoxDecoration(
                                        color: Colors.red[600],
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                        )),
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.only(top: 5),
                                    child: RotatedBox(
                                      quarterTurns: 45,
                                      child: Text(
                                        'GREAT INDIAN FESTIVAL',
                                        textAlign: TextAlign.center,
                                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                Images.amazon,
                                height: 32,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.orange[700],
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Text(
                                'EARN UPTO 8% REWARDS >',
                                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              height: 45,
                              alignment: Alignment.center,
                              child: Text(
                                'Rewards Rates & Terms',
                                textAlign: TextAlign.center,
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  color: Colors.teal,
                                  fontSize: 10,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return AppWiseOfferShowWidget(
                        isTimeShow: true,
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return AppWiseOfferShowWidget(
                        isTimeShow: false,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return AppWiseOfferShowWidget(
                        isTimeShow: false,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return AppWiseOfferShowWidget(
                        isTimeShow: false,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return AppWiseOfferShowWidget(
                        isTimeShow: false,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return AppWiseOfferShowWidget(
                        isTimeShow: false,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return AppWiseOfferShowWidget(
                        isTimeShow: false,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return AppWiseOfferShowWidget(
                        isTimeShow: false,
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
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return AppWiseOfferShowWidget(
                        isTimeShow: true,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 6),
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
                    itemBuilder: (context, index) {
                      return AppWiseOfferShowWidget(
                        isTimeShow: true,
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
