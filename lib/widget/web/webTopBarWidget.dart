// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/authController.dart';
import 'package:cashfuse/controllers/couponController.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/controllers/searchController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/views/aboutUsScreen.dart';
import 'package:cashfuse/views/bottomNavigationBarScreen.dart';
import 'package:cashfuse/views/getHelpScreen.dart';
import 'package:cashfuse/views/getStartedScreen.dart';
import 'package:cashfuse/views/homeScreen.dart';
import 'package:cashfuse/views/myEarningScreen.dart';
import 'package:cashfuse/views/paymentHistoryScreen.dart';
import 'package:cashfuse/views/paymentScreen.dart';
import 'package:cashfuse/views/privacyPolicyScreen.dart';
import 'package:cashfuse/views/recentClicksScreen.dart';
import 'package:cashfuse/views/referralNetworkScreen.dart';
import 'package:cashfuse/views/webScreen/webAccountSettingScreen.dart';
import 'package:cashfuse/views/webScreen/webMyEarningScreen.dart';
import 'package:cashfuse/views/webScreen/webSearchScreen.dart';
import 'package:cashfuse/widget/confirmationDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WebTopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  WebTopBarWidget({this.scaffoldKey});

  AuthController authController = Get.find<AuthController>();
  HomeController homeController = Get.find<HomeController>();
  CouponController couponController = Get.find<CouponController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      height: 80,
      child: SizedBox(
        width: AppConstants.WEB_MAX_WIDTH,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                scaffoldKey!.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  MdiIcons.sortVariant,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(
                  () => HomeScreen(),
                  routeName: 'home',
                );
              },
              child: Image.asset(
                Images.text_logo,
                height: 35,
                // width: 100,
              ),
            ),
            Expanded(
              flex: 2,
              child:
                  GetBuilder<SearchGetController>(builder: (searchController) {
                return Container(
                  //height: 45,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Get.theme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: searchController.searchString,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,
                          size: 25, color: Theme.of(context).disabledColor),
                      hintText: 'What do you want to buy today?',
                      border: InputBorder.none,
                    ),
                    onTap: () {
                      Get.dialog(
                          Dialog(
                            child: SizedBox(
                              width: AppConstants.WEB_MAX_WIDTH,
                              child: WebSearchScreen(),
                            ),
                          ),
                          barrierDismissible: false);
                    },
                    onFieldSubmitted: (text) {
                      //   _actionSearch(searchController, true);
                      //   showDialog(
                      //     context: context,
                      //     builder: (con) => Dialog(
                      //       insetPadding: EdgeInsets.only(top: 70, bottom: 50, left: 50),
                      //       child: SizedBox(
                      //         width: 550,
                      //         child: WebSearchResultWidget(
                      //           searchText: _searchController.text.trim(),
                      //         ),
                      //       ),
                      //     ),
                      //   );
                    },
                  ),
                );
              }),
            ),
            Expanded(child: SizedBox()),

            // global.country != null
            //     ? StatefulBuilder(
            //         builder: (BuildContext context, StateSetter setState) =>
            //             InkWell(
            //           focusColor: Colors.transparent,
            //           hoverColor: Colors.transparent,
            //           splashColor: Colors.transparent,
            //           highlightColor: Colors.transparent,
            //           onTap: () {
            //             if (global.appInfo.countryselection == 1) {
            //               global.showCountryPopUp = true;

            //               setState(() {});

            //               // homeController.setCountryPopUp(true);
            //               // homeController.refresh();

            //               Get.to(
            //                 () => BottomNavigationBarScreen(),
            //                 preventDuplicates: false,
            //                 routeName: 'home',
            //               );

            //               // Get.dialog(Dialog(child: CountrySelectWidget()));
            //               // CountrySelectWidget();
            //               // Get.dialog(
            //               //   Dialog(
            //               //     alignment: Alignment.topRight,
            //               //     backgroundColor: Colors.transparent,
            //               //     insetPadding:
            //               //         EdgeInsets.only(top: 50, right: 20),
            //               //     child: SizedBox(
            //               //       width: Get.width / 2,
            //               //       child: Column(
            //               //         crossAxisAlignment:
            //               //             CrossAxisAlignment.end,
            //               //         // mainAxisAlignment: MainAxisAlignment.start,
            //               //         // alignment: Alignment.topCenter,
            //               //         // clipBehavior: Clip.none,
            //               //         children: [
            //               //           Align(
            //               //             alignment: Alignment.topRight,
            //               //             child: InkWell(
            //               //               onTap: () async {
            //               //                 Get.back();
            //               //               },
            //               //               child: CircleAvatar(
            //               //                 radius: 15,
            //               //                 child: Icon(
            //               //                   Icons.close,
            //               //                   color: Colors.black,
            //               //                   size: 20,
            //               //                 ),
            //               //                 backgroundColor: Colors.white,
            //               //               ),
            //               //             ),
            //               //           ),
            //               //           StatefulBuilder(
            //               //             builder: (BuildContext context,
            //               //                     StateSetter setState) =>
            //               //                 Container(
            //               //               margin: EdgeInsets.only(top: 20),
            //               //               color: Colors.white,
            //               //               child: ListView.builder(
            //               //                 padding: EdgeInsets.zero,
            //               //                 shrinkWrap: true,
            //               //                 itemCount: global
            //               //                     .appInfo.countries.length,
            //               //                 itemBuilder: (context, index) {
            //               //                   return Column(
            //               //                     children: [
            //               //                       Row(
            //               //                         mainAxisAlignment:
            //               //                             MainAxisAlignment
            //               //                                 .spaceBetween,
            //               //                         children: [
            //               //                           Padding(
            //               //                             padding:
            //               //                                 const EdgeInsets
            //               //                                     .all(10.0),
            //               //                             child: Text(global
            //               //                                 .appInfo
            //               //                                 .countries[
            //               //                                     index]
            //               //                                 .countryName),
            //               //                           ),
            //               //                           Radio(
            //               //                             groupValue:
            //               //                                 global.country,
            //               //                             value: global
            //               //                                     .appInfo
            //               //                                     .countries[
            //               //                                 index],
            //               //                             onChanged: (value) {
            //               //                               if (value !=
            //               //                                   null) {
            //               //                                 global.country =
            //               //                                     value;
            //               //                                 global.appInfo
            //               //                                     .countries
            //               //                                     .map((e) =>
            //               //                                         e.isSelected =
            //               //                                             false)
            //               //                                     .toList();
            //               //                                 global
            //               //                                     .appInfo
            //               //                                     .countries[
            //               //                                         index]
            //               //                                     .isSelected = true;

            //               //                                 setState(() {});
            //               //                                 Navigator.of(
            //               //                                         context)
            //               //                                     .pop(global
            //               //                                         .country);
            //               //                               }
            //               //                             },
            //               //                           )
            //               //                         ],
            //               //                       ),
            //               //                       Divider(
            //               //                         height: 0,
            //               //                         thickness: 0.5,
            //               //                       ),
            //               //                     ],
            //               //                   );
            //               //                 },
            //               //               ),
            //               //             ),
            //               //           ),
            //               //           // Positioned(
            //               //           //    top: !global.getPlatFrom() ? -50 : 10,
            //               //           //   // right: -7,
            //               //           //   child: InkWell(
            //               //           //     onTap: () async {
            //               //           //       Get.back();
            //               //           //     },
            //               //           //     child: CircleAvatar(
            //               //           //       radius: 15,
            //               //           //       child: Icon(
            //               //           //         Icons.close,
            //               //           //         color: Colors.black,
            //               //           //         size: 20,
            //               //           //       ),
            //               //           //       backgroundColor: Colors.grey[400],
            //               //           //     ),
            //               //           //   ),
            //               //           // ),
            //               //         ],
            //               //       ),
            //               //     ),
            //               //   ),
            //               //   barrierDismissible: false,
            //               // ).then((value) async {
            //               //   if (value != null) {
            //               //     global.country = value;
            //               //     global.countrySlug = global.country.slug;
            //               //     homeController.topBannerList = [];
            //               //     homeController.topCategoryList = [];
            //               //     couponController.couponList = [];
            //               //     homeController.topCashbackList = [];
            //               //     homeController.exclusiveOfferList = [];
            //               //     homeController.productList = [];
            //               //     homeController.trendingProductList = [];
            //               //     homeController.newFlashOfferList = [];
            //               //     homeController.homeAdvList = [];
            //               //     homeController.allAdvList = [];

            //               //     setState(() {});

            //               //     await homeController.init();
            //               //   }
            //               // });
            //             }
            //           },
            //           child: Container(
            //             width: 35,
            //             height: 35,
            //             margin: EdgeInsets.only(right: 10),
            //             alignment: Alignment.center,
            //             decoration: BoxDecoration(
            //               color: Get.theme.primaryColor,
            //               borderRadius: BorderRadius.circular(10),
            //               border:
            //                   Border.all(color: Get.theme.secondaryHeaderColor),
            //             ),
            //             child: Text(
            //               global.country!.countryCode!,
            //               style: TextStyle(color: Colors.white),
            //             ),
            //           ),
            //         ),
            //       )
            //     : SizedBox(),
            global.country != null
                ? GetBuilder<HomeController>(
                    builder: (controller) => PopupMenuButton(
                      onSelected: (value) async {
                        if (global.appInfo.countryselection == 1) {
                          Get.to(() => BottomNavigationBarScreen(),
                              preventDuplicates: false, routeName: 'home');
                          global.country = value;
                          global.appInfo.countries!
                              .map((e) => e.isSelected = false)
                              .toList();
                          // global.appInfo.countries![index].isSelected = true;

                          global.showCountryPopUp = false;

                          homeController.update();

                          global.country = value;
                          global.countrySlug = global.country!.slug!;
                          await global.sp!.setString(
                              'country', json.encode(global.country!.toJson()));
                          await global.sp!
                              .setString('countrySlug', global.countrySlug);

                          homeController.update();

                          homeController.topBannerList = [];
                          homeController.topCategoryList = [];
                          couponController.couponList = [];
                          homeController.topCashbackList = [];
                          homeController.exclusiveOfferList = [];
                          homeController.productList = [];
                          homeController.trendingProductList = [];
                          homeController.newFlashOfferList = [];
                          homeController.homeAdvList = [];
                          homeController.allAdvList = [];
                          await couponController.getCouponList();
                          await homeController.init();

                          homeController.update();
                        }
                      },
                      position: PopupMenuPosition.under,
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Get.theme.secondaryHeaderColor),
                        ),
                        child: Text(
                          global.country!.countryCode!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      itemBuilder: (context) {
                        return List.generate(global.appInfo.countries!.length,
                            (index) {
                          return PopupMenuItem(
                            height: 40,
                            value: global.appInfo.countries![index],
                            padding: EdgeInsets.zero,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(global
                                      .appInfo.countries![index].countryName!),
                                ),
                                Divider(
                                  height: 0,
                                ),
                              ],
                            ),
                          );
                        });
                      },
                    ),
                  )
                : SizedBox(),
            InkWell(
              onTap: () {
                Get.to(
                  () => GetHelpScreen(),
                  routeName: 'faq',
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('How It Works'),
              ),
            ),
            VerticalDivider(
              endIndent: 20,
              indent: 20,
              color: Get.theme.primaryColor,
            ),
            global.currentUser.id != null
                ? InkWell(
                    onTap: () {
                      showAlignedDialog(
                        context: context,
                        builder: _localDialogBuilder,
                        followerAnchor: Alignment.topRight,
                        targetAnchor: Alignment.topRight,
                        barrierColor: Colors.black54,
                        avoidOverflow: true,
                        duration: Duration.zero,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          Text(
                            '  My Account',
                          ),
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Get.dialog(Dialog(
                        child: SizedBox(
                            width: Get.width / 3,
                            child: GetStartedScreen(
                              fromMenu: true,
                            )
                            // LoginOrSignUpScreen(
                            //   fromMenu: true,
                            // ),
                            ),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Login or signup'),
                    ),
                  ),
            global.currentUser.id != null
                ? InkWell(
                    onTap: () {
                      Get.to(
                        () => MyEarningSceen(),
                        routeName: 'earning',
                      );
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          Images.payments,
                          height: 25,
                        )),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  WidgetBuilder get _localDialogBuilder {
    return (BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Card(
          margin: EdgeInsets.only(top: 70, right: 170),
          child: SizedBox(
            width: 150,
            child: DefaultTextStyle(
              style: Get.theme.primaryTextTheme.titleSmall!,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                        authController.name.text = global.currentUser.name!;
                        authController.email.text = global.currentUser.email!;
                        authController.contactNo.text =
                            global.currentUser.phone!;
                        Get.to(
                          () => WebAccountSettingScreen(),
                          routeName: 'account',
                        );
                      },
                      child: Text(
                        'Account Settings',
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.to(
                          () => WebMyEarningSceen(),
                          routeName: 'earning',
                        );
                      },
                      child: Text(
                        'My Earnings',
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.to(
                          () => PaymentScreen(),
                          routeName: 'payment',
                        );
                      },
                      child: Text(
                        'Payments',
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.to(
                          () => PaymentHistoryScreen(),
                          routeName: 'payment-history',
                        );
                      },
                      child: Text(
                        'Payment History',
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.to(
                          () => RecentClickScreen(),
                          routeName: 'recent-clicks',
                        );
                      },
                      child: Text(
                        'Recents Clicks',
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.to(
                          () => ReferralNetworkScreen(),
                          routeName: 'referral-network',
                        );
                      },
                      child: Text(
                        'Referral Network',
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.to(
                          () => GetHelpScreen(),
                          routeName: 'faq',
                        );
                      },
                      child: Text(
                        'Get Help',
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.to(
                          () => AboutUsScreen(),
                          routeName: 'about',
                        );
                      },
                      child: Text(
                        'About Us',
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.to(
                          () => PrivacyPolicyScreen(),
                          routeName: 'privacy',
                        );
                      },
                      child: Text(
                        'Privacy Policy',
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.back();
                        showConfirmationDialog(
                          context,
                          'Logout',
                          'Are you sure you want to logout ?',
                          [
                            CupertinoDialogAction(
                              child: Text(
                                'Yes',
                                style: Get.theme.primaryTextTheme.titleSmall!
                                    .copyWith(color: Colors.red),
                              ),
                              onPressed: () {
                                Get.back();
                                authController.logout();
                                Get.offAll(
                                  () => BottomNavigationBarScreen(),
                                  //preventDuplicates: false,
                                  routeName: 'home',
                                );
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                'No',
                                style: Get.theme.primaryTextTheme.titleSmall!
                                    .copyWith(color: Colors.blue),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        );
                      },
                      child: Text(
                        'Logout',
                        style: Get.theme.primaryTextTheme.bodyMedium!.copyWith(
                          letterSpacing: -0.5,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    };
  }

  @override
  Size get preferredSize => Size(
        AppConstants.WEB_MAX_WIDTH,
        85,
      );
}
