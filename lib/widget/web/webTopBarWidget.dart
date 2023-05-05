// ignore_for_file: must_be_immutable

import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/authController.dart';
import 'package:cashfuse/controllers/searchController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/views/aboutUsScreen.dart';
import 'package:cashfuse/views/accountSettingScreen.dart';
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
import 'package:cashfuse/views/searchScreen.dart';
import 'package:cashfuse/widget/confirmationDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WebTopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  WebTopBarWidget({this.scaffoldKey});

  AuthController authController = Get.find<AuthController>();

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
                scaffoldKey.currentState.openDrawer();
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
              child: GetBuilder<SearchController>(builder: (searchController) {
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
                              child: SearchScreen(),
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
              style: Get.theme.primaryTextTheme.titleSmall,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        authController.name.text = global.currentUser.name;
                        authController.email.text = global.currentUser.email;
                        authController.contactNo.text =
                            global.currentUser.phone;
                        Get.to(
                          () => AccountSettingScreen(),
                          routeName: 'account',
                        );
                      },
                      child: Text(
                        'Account Settings',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => MyEarningSceen(),
                          routeName: 'earning',
                        );
                      },
                      child: Text(
                        'My Earnings',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => PaymentScreen(),
                          routeName: 'payment',
                        );
                      },
                      child: Text(
                        'Payments',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => PaymentHistoryScreen(),
                          routeName: 'payment-history',
                        );
                      },
                      child: Text(
                        'Payment History',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => RecentClickScreen(),
                          routeName: 'recent-clicks',
                        );
                      },
                      child: Text(
                        'Recents Clicks',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => ReferralNetworkScreen(),
                          routeName: 'referral-network',
                        );
                      },
                      child: Text(
                        'Referral Network',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => GetHelpScreen(),
                          routeName: 'faq',
                        );
                      },
                      child: Text(
                        'Get Help',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => AboutUsScreen(),
                          routeName: 'about',
                        );
                      },
                      child: Text(
                        'About Us',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => PrivacyPolicyScreen(),
                          routeName: 'privacy',
                        );
                      },
                      child: Text(
                        'Privacy Policy',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: 0,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        showConfirmationDialog(
                          context,
                          'Logout',
                          'Are you sure you want to logout ?',
                          [
                            CupertinoDialogAction(
                              child: Text(
                                'Yes',
                                style: Get.theme.primaryTextTheme.titleSmall
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
                                style: Get.theme.primaryTextTheme.titleSmall
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
                        style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
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
