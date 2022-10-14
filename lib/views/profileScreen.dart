import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/views/accountSettingScreen.dart';
import 'package:cashbackapp/views/getHelpScreen.dart';
import 'package:cashbackapp/views/missingCashbackScreen.dart';
import 'package:cashbackapp/views/myEarningScreen.dart';
import 'package:cashbackapp/views/privacyPolicyScreen.dart';
import 'package:cashbackapp/views/rateUsScreen.dart';
import 'package:cashbackapp/views/referralNetworkScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          'Profile',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Get.theme.primaryColor,
              padding: EdgeInsets.only(left: 20, top: 5, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Test User',
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
                      style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w300,
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
                      style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.account_balance_wallet_rounded,
            //         color: Get.theme.iconTheme.color,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Text(
            //         'Payments',
            //         style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
            //           letterSpacing: -0.5,
            //           fontWeight: FontWeight.w300,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.history,
            //         color: Get.theme.iconTheme.color,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Text(
            //         'Payments History',
            //         style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
            //           letterSpacing: -0.5,
            //           fontWeight: FontWeight.w300,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
                      style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w300,
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
                      style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w300,
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
                      style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w300,
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
                      style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w300,
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
                      style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                if (await canLaunchUrlString('tel:${9999999999}')) {
                  await launchUrlString('tel:${9999999999}');
                } else {
                  throw 'Could not launch';
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Get.theme.iconTheme.color,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Call Us',
                      style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w300,
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
                      style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w300,
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
                      style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
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
      ),
    );
  }
}