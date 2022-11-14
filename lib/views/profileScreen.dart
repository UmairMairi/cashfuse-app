import 'package:cashbackapp/controllers/authController.dart';
import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/controllers/splashController.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/aboutUsScreen.dart';
import 'package:cashbackapp/views/accountSettingScreen.dart';
import 'package:cashbackapp/views/colorPicker.dart';
import 'package:cashbackapp/views/getHelpScreen.dart';
import 'package:cashbackapp/views/languageScreen.dart';
import 'package:cashbackapp/views/loginOrSignUpScreen.dart';
import 'package:cashbackapp/views/myEarningScreen.dart';
import 'package:cashbackapp/views/paymentHistoryScreen.dart';
import 'package:cashbackapp/views/paymentScreen.dart';
import 'package:cashbackapp/views/privacyPolicyScreen.dart';
import 'package:cashbackapp/widget/confirmationDialog.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              onTap: () async {
                await Get.find<SplashController>().bannerShow();
                Get.find<BottomNavigationController>().setBottomIndex(0);
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            title: Text(
              global.currentUser.id != null ? AppLocalizations.of(context).profile : '',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
            ),
          ),
          body: global.currentUser.id != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          color: Get.theme.primaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: global.currentUser.userImage.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: CustomImage(
                                            image: global.appInfo.baseUrls.userImageUrl + '/' + global.currentUser.userImage,
                                            // height: 30,
                                            // width: 30,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: Image.asset(
                                            Images.user,
                                            //height: 30,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                                title: Text(
                                  global.currentUser.name,
                                  style: Get.theme.primaryTextTheme.subtitle1.copyWith(color: Colors.white),
                                ),
                                subtitle: Text(
                                  global.currentUser.email.isNotEmpty ? global.currentUser.email : global.currentUser.phone,
                                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).pending,
                                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                          color: Colors.white,
                                          fontSize: 11,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      Text(
                                        global.currentUser.earning != null ? '₹${global.currentUser.earning.remEarning}' : '₹0.00',
                                        textAlign: TextAlign.center,
                                        style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      // width: 2,
                                      // thickness: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).approved,
                                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                          color: Colors.white,
                                          letterSpacing: 0,
                                          fontSize: 11,
                                        ),
                                      ),
                                      Text(
                                        global.currentUser.earning != null ? '₹${global.currentUser.earning.totalEarnings}' : '₹0.00',
                                        textAlign: TextAlign.center,
                                        style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      // width: 2,
                                      // thickness: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).redeemed,
                                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                          color: Colors.white,
                                          letterSpacing: 0,
                                          fontSize: 11,
                                        ),
                                      ),
                                      Text(
                                        global.currentUser.earning != null ? '₹${global.currentUser.earning.sentForWithdrawal}' : '₹0.00',
                                        textAlign: TextAlign.center,
                                        style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                          //: Text('Welcome!'),
                          ),
                      // Container(
                      //   color: Get.theme.primaryColor,
                      //   padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Hello ' + global.currentUser.name,
                      //         style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                      //       ),
                      //       SizedBox(
                      //         height: 10,
                      //       ),
                      //       Divider(
                      //         color: Colors.white.withOpacity(0.2),
                      //         height: 0,
                      //         thickness: 1.2,
                      //       ),
                      //       SizedBox(
                      //         height: 10,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 'Total Cashback:',
                      //                 style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                      //                   color: Colors.white,
                      //                   fontSize: 11,
                      //                 ),
                      //               ),
                      //               Text(
                      //                 global.currentUser.earning != null ? '₹${global.currentUser.earning.totalEarnings}' : '₹0.00',
                      //                 style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                      //               ),
                      //             ],
                      //           ),
                      //           // Column(
                      //           //   crossAxisAlignment: CrossAxisAlignment.start,
                      //           //   children: [
                      //           //     Text(
                      //           //       'Total Rewards:',
                      //           //       style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                      //           //         color: Colors.white,
                      //           //         fontSize: 11,
                      //           //       ),
                      //           //     ),
                      //           //     Text(
                      //           //       '₹0.00',
                      //           //       style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                      //           //     ),
                      //           //   ],
                      //           // )
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: 10,
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
                                AppLocalizations.of(context).account_settings,
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
                                AppLocalizations.of(context).my_earnings,
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
                          Get.to(() => PaymentScreen());
                        },
                        child: Padding(
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
                                AppLocalizations.of(context).payments,
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
                          Get.to(() => PaymentHistoryScreen());
                        },
                        child: Padding(
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
                                AppLocalizations.of(context).payment_history,
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
                      //   onTap: () {
                      //     Get.to(() => MissingCashbackScreen());
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.search,
                      //           color: Get.theme.iconTheme.color,
                      //         ),
                      //         SizedBox(
                      //           width: 20,
                      //         ),
                      //         Text(
                      //           'Missing Cashback',
                      //           style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                      //             letterSpacing: 0,
                      //             color: Colors.black.withOpacity(0.75),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Get.to(() => AppTabinationScreen());
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.screen_search_desktop_outlined,
                      //           color: Get.theme.iconTheme.color,
                      //         ),
                      //         SizedBox(
                      //           width: 20,
                      //         ),
                      //         Text(
                      //           'All in One Search',
                      //           style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                      //             letterSpacing: 0,
                      //             color: Colors.black.withOpacity(0.75),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Get.find<BottomNavigationController>().setBottomIndex(2);
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.person_add,
                      //           color: Get.theme.iconTheme.color,
                      //         ),
                      //         SizedBox(
                      //           width: 20,
                      //         ),
                      //         Text(
                      //           'Refer and Earn',
                      //           style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                      //             letterSpacing: 0,
                      //             color: Colors.black.withOpacity(0.75),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Get.to(() => ReferralNetworkScreen());
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.person,
                      //           color: Get.theme.iconTheme.color,
                      //         ),
                      //         SizedBox(
                      //           width: 20,
                      //         ),
                      //         Text(
                      //           'Referral Network',
                      //           style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                      //             letterSpacing: 0,
                      //             color: Colors.black.withOpacity(0.75),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
                                AppLocalizations.of(context).recents_clicks,
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
                                AppLocalizations.of(context).get_help,
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
                          Get.to(() => ColorPickerPage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.color_lens,
                                color: Get.theme.iconTheme.color,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                AppLocalizations.of(context).theme,
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
                          Get.to(() => LanguageScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              // Icon(
                              //   Icons.,
                              //   color: Get.theme.iconTheme.color,
                              // ),
                              Image.asset(
                                Images.translation,
                                height: 20,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                AppLocalizations.of(context).language,
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
                          //Get.to(() => RateUsScreen());
                          StoreRedirect.redirect(
                            androidAppId: 'com.cashback.app',
                          );
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
                                AppLocalizations.of(context).rate_us,
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
                                AppLocalizations.of(context).about_us,
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
                                AppLocalizations.of(context).privacy_policy,
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
                            AppLocalizations.of(context).logout,
                            AppLocalizations.of(context).logout_desc,
                            [
                              CupertinoDialogAction(
                                child: Text(
                                  AppLocalizations.of(context).yes,
                                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.red),
                                ),
                                onPressed: () {
                                  authController.logout();
                                  Get.back();
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text(
                                  AppLocalizations.of(context).no,
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
                                AppLocalizations.of(context).logout,
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
                        AppLocalizations.of(context).login,
                        style: Get.theme.primaryTextTheme.displaySmall.copyWith(
                          letterSpacing: -1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          AppLocalizations.of(context).profile_desc,
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
                            AppLocalizations.of(context).conti.toUpperCase(),
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
