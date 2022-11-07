import 'package:cashbackapp/controllers/authController.dart';
import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/views/aboutUsScreen.dart';
import 'package:cashbackapp/views/accountSettingScreen.dart';
import 'package:cashbackapp/views/appTabinationScreen.dart';
import 'package:cashbackapp/views/getHelpScreen.dart';
import 'package:cashbackapp/views/loginOrSignUpScreen.dart';
import 'package:cashbackapp/views/missingCashbackScreen.dart';
import 'package:cashbackapp/views/myEarningScreen.dart';
import 'package:cashbackapp/views/privacyPolicyScreen.dart';
import 'package:cashbackapp/views/rateUsScreen.dart';
import 'package:cashbackapp/views/referralNetworkScreen.dart';
import 'package:cashbackapp/widget/confirmationDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Get.find<BottomNavigationController>().setBottomIndex(0);
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            title: Text(
              global.currentUser.id != null ? 'Profile' : '',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
            ),
          ),
          body: global.currentUser.id != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Get.theme.primaryColor,
                        padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello ' + global.currentUser.name,
                              style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.white.withOpacity(0.2),
                              height: 0,
                              thickness: 1.2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Cashback:',
                                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Text(
                                      '₹0.00',
                                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Rewards:',
                                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Text(
                                      '₹0.00',
                                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => AccountSettingScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.settings,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Account Settings',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => MyEarningSceen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'My Earnings',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Get.theme.iconTheme.color,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Payments',
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                letterSpacing: 0,
                                color: Colors.black.withOpacity(0.75),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.history,
                              color: Get.theme.iconTheme.color,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Payments History',
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                letterSpacing: 0,
                                color: Colors.black.withOpacity(0.75),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => MissingCashbackScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Missing Cashback',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => AppTabinationScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.screen_search_desktop_outlined,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'All in One Search',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.find<BottomNavigationController>().setBottomIndex(2);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_add,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Refer and Earn',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => ReferralNetworkScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Referral Network',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.find<BottomNavigationController>().setBottomIndex(3);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.ads_click,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Recent Clicks',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => GetHelpScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.live_help_outlined,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Get Help',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () async {
                      //     if (await canLaunchUrlString('tel:${9999999999}')) {
                      //       await launchUrlString('tel:${9999999999}');
                      //     } else {
                      //       throw 'Could not launch';
                      //     }
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.call,
                      //           color: Get.theme.iconTheme.color,
                      //         ),
                      //         SizedBox(
                      //           width: 20,
                      //         ),
                      //         Text(
                      //           'Call Us',
                      //           style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                      //             letterSpacing: -0.5,
                      //             fontWeight: FontWeight.w300,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => RateUsScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Rate US',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => AboutUsScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'About Us',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => PrivacyPolicyScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.lock_open,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Privacy Policy',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  letterSpacing: 0,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.red),
                                ),
                                onPressed: () {
                                  authController.logout();
                                  Get.back();
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text(
                                  'No',
                                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.blue),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.power_settings_new_rounded,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Logout',
                                style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                                  letterSpacing: -0.5,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login or signup',
                        style: Get.theme.primaryTextTheme.displaySmall.copyWith(
                          letterSpacing: -1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Sign up or login to get exclusive Coupons & extras Cashback on all your online shopping',
                          textAlign: TextAlign.center,
                          style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          Get.to(() => LoginOrSignUpScreen());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                          decoration: BoxDecoration(
                            color: Get.theme.secondaryHeaderColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Continue'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
