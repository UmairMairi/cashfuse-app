import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/models/offerModel.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/moreOfferScreen.dart';
import 'package:cashbackapp/views/webViewScreen.dart';
import 'package:cashbackapp/widget/ratesAndOfferTermsSheetWidget.dart';
import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferDetailScreen extends StatelessWidget {
  final OfferModel offer;
  OfferDetailScreen({this.offer});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 170,
              collapsedHeight: 50.0,
              toolbarHeight: 50,
              floating: true,
              pinned: true,
              elevation: 0,
              backgroundColor: Get.theme.primaryColor,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Text(
                'Health and Glow',
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
              ),
              flexibleSpace: CustomizableSpaceBar(builder: (context, scrollingRate) {
                return (scrollingRate != 1.0)
                    ? Stack(
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Image.asset(
                              Images.dummyImage,
                              width: Get.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: -30,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 15),
                                child: Text(
                                  'health & glow',
                                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.orange[500]),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : SizedBox();
              }),
              actions: [
                InkWell(
                  onTap: () {
                    global.share('');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.only(left: 10, right: 3),
                    decoration: BoxDecoration(
                      color: Colors.green[500],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text('Share  '),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.green[700],
                          child: Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SliverFillRemaining(
              fillOverscroll: true,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Free at home Skin Assessment in 5 min Personalized Regime',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontStyle: FontStyle.italic, color: Get.theme.primaryColor),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Free at home Skin Assessment in 5 min Personalized Regime',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Free at home Skin Assessment in 5 min Personalized Regime',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Free at home Skin Assessment in 5 min Personalized Regime',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => WebViewScreen());
                          },
                          child: Container(
                            width: Get.width,
                            height: 45,
                            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                            decoration: BoxDecoration(
                              color: Get.theme.secondaryHeaderColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'EARN 10% CASHBACK NOW >',
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Get.theme.secondaryHeaderColor,
                                radius: 10,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  DottedLine(
                                    lineLength: 130,
                                    dashColor: Colors.grey,
                                  ),
                                  Card(
                                    margin: EdgeInsets.zero,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                    child: Text(
                                      '>>',
                                      style: TextStyle(color: Colors.grey, fontSize: 20, letterSpacing: -5),
                                    ),
                                  )
                                ],
                              ),
                              CircleAvatar(
                                backgroundColor: Get.theme.secondaryHeaderColor,
                                radius: 10,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Purchase',
                                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                                    ),
                                    Text(
                                      'Today',
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Cashback tracks in',
                                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                                    ),
                                    Text(
                                      '8 hours',
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: MoreOfferScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: Get.width,
                              height: 45,
                              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.teal[200],
                                    width: 1.5,
                                  )),
                              alignment: Alignment.center,
                              child: Text(
                                'See More Offers  >',
                                style: TextStyle(color: Colors.teal[200], fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            color: Get.theme.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.find<HomeController>().setIsOffer(false);
                    Get.bottomSheet(
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: RatesAndOfferTermsSheetWidget(),
                      ),
                    );
                  },
                  child: Text(
                    'Cashback Rates',
                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  size: 22,
                  color: Colors.white.withOpacity(0.3),
                ),
                InkWell(
                  onTap: () {
                    Get.find<HomeController>().setIsOffer(true);
                    Get.bottomSheet(
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: RatesAndOfferTermsSheetWidget(),
                      ),
                    );
                  },
                  child: Text(
                    'Offer Terms',
                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w400, color: Colors.white),
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
