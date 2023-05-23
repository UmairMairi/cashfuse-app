import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/referEarnController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/widget/translationTextWidget.dart';
import 'package:cashfuse/widget/web/webDrawerWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferEarnScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReferEarnController>(builder: (controller) {
      return Scaffold(
        key: scaffoldKey,
        drawer: global.getPlatFrom() ? WebDrawerWidget() : null,
        appBar: global.getPlatFrom()
            ? WebTopBarWidget(
                scaffoldKey: scaffoldKey,
              )
            : AppBar(
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                title: GetPlatform.isWeb
                    ? TranslationTextWidget(
                        text: 'Refer & Earn',
                        style: Get.theme.primaryTextTheme.titleSmall!
                            .copyWith(color: Colors.white),
                      )
                    : Text(
                        'Refer & Earn',
                        style: Get.theme.primaryTextTheme.titleSmall!
                            .copyWith(color: Colors.white),
                      ).translate(),
              ),
        body: global.getPlatFrom()
            ? Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: Get.height / 3,
                        color: Get.theme.secondaryHeaderColor,
                        width: Get.width,
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: AppConstants.WEB_MAX_WIDTH / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TranslationTextWidget(
                                text:
                                    "Invite friends & earn flat ${global.appInfo.perOrderReferPercentage}% of their Cashback amount, EVERYTIME they shop!",
                                textAlign: TextAlign.center,
                                style: Get
                                    .theme.primaryTextTheme.headlineMedium!
                                    .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TranslationTextWidget(
                                text:
                                    'Make your friends join ${global.appName} via your referral link below - No referral code needed',
                                textAlign: TextAlign.center,
                                style: Get.theme.primaryTextTheme.titleLarge!
                                    .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -Get.height * 0.23,
                        child: SizedBox(
                          width: AppConstants.WEB_MAX_WIDTH / 2,
                          child: Card(
                            color: Colors.white,
                            //margin: EdgeInsets.only(top: Get.height * 0.2),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 40),
                              child: Column(
                                children: [
                                  Card(
                                    margin: EdgeInsets.zero,
                                    elevation: 0,
                                    color: Colors.grey[300],
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        children: [
                                          TranslationTextWidget(
                                            text: 'Your Referral Link : ',
                                          ),
                                          Expanded(
                                            child: Container(
                                              color: Colors.white,
                                              height: 50,
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    global.appShareLink
                                                            .isNotEmpty
                                                        ? global.appShareLink
                                                        : 'Link Url',
                                                    style: Get
                                                        .theme
                                                        .primaryTextTheme
                                                        .titleSmall,
                                                  ),
                                                  TranslationTextWidget(
                                                    text: 'Copy Link'
                                                        .toUpperCase(),
                                                    style: Get
                                                        .theme
                                                        .primaryTextTheme
                                                        .titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    alignment: Alignment.topCenter,
                                    child: InkWell(
                                      onTap: () async {
                                        if (global.appShareLink.isNotEmpty) {
                                          await FlutterShare.share(
                                            title: '${global.appName}',
                                            text:
                                                'I recently tried ${global.appName} app & highly recommend it! You get extra Cashback on top of all retailer discounts.\n Try it out: ${global.appShareLink}',
                                          ).then((value) {
                                            if (value!) {}
                                          }).onError((error, stackTrace) {});
                                        }
                                      },
                                      child: Container(
                                          width: AppConstants.WEB_MAX_WIDTH / 3,
                                          height: 45,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 20),
                                          //padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                                          decoration: BoxDecoration(
                                            color:
                                                Get.theme.secondaryHeaderColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          alignment: Alignment.center,
                                          child: TranslationTextWidget(
                                            text: 'Invite Now',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  FutureBuilder(
                      builder: (context1, snapshot) {
                        return SizedBox();
                      },
                      future: Future.delayed(Duration.zero).then((value) {
                        return Get.dialog(
                          Dialog(
                            backgroundColor: Colors.white,
                            insetPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: SizedBox(
                              width: AppConstants.WEB_MAX_WIDTH / 3,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Image.asset(Images.access),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: TranslationTextWidget(
                                      text:
                                          'To access this feature, download the app',
                                      style: Get
                                          .theme.primaryTextTheme.titleLarge!
                                          .copyWith(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchUrl(
                                        Uri.parse(
                                            "https://play.google.com/store/apps/details?id=${global.appPackageName}"),
                                        webOnlyWindowName: 'blank',
                                      );
                                    },
                                    child: Container(
                                      height: 40,
                                      margin: EdgeInsets.all(15),
                                      width: AppConstants.WEB_MAX_WIDTH / 4,
                                      color: Get.theme.secondaryHeaderColor,
                                      alignment: Alignment.center,
                                      child: TranslationTextWidget(
                                        text: 'Download The App',
                                        style: Get
                                            .theme.primaryTextTheme.titleSmall!
                                            .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          useSafeArea: true,
                          barrierDismissible: false,
                        );
                      }))
                ],
              )
            : Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Image.asset(
                              Images.refer,
                              height: 120,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GetPlatform.isWeb
                                ? TranslationTextWidget(
                                    text:
                                        "Invite friends & earn flat ${global.appInfo.perOrderReferPercentage}% of their Cashback amount, EVERYTIME they shop!",
                                    textAlign: TextAlign.center,
                                    style:
                                        Get.theme.primaryTextTheme.titleSmall,
                                  )
                                : Text(
                                    "Invite friends & earn flat ${global.appInfo.perOrderReferPercentage}% of their Cashback amount, EVERYTIME they shop!",
                                    textAlign: TextAlign.center,
                                    style:
                                        Get.theme.primaryTextTheme.titleSmall,
                                  ).translate(),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GetPlatform.isWeb
                          ? TranslationTextWidget(
                              text: 'Your Referal Link',
                              textAlign: TextAlign.center,
                              style: Get.theme.primaryTextTheme.titleSmall,
                            )
                          : Text(
                              'Your Referal Link',
                              textAlign: TextAlign.center,
                              style: Get.theme.primaryTextTheme.titleSmall,
                            ).translate(),
                      SizedBox(
                        height: 20,
                      ),
                      GetPlatform.isWeb
                          ? TranslationTextWidget(
                              text:
                                  'Make your friends join ${global.appName} via your referral link below - No referral code needed',
                              textAlign: TextAlign.center,
                              style: Get.theme.primaryTextTheme.bodySmall!
                                  .copyWith(fontWeight: FontWeight.w300),
                            )
                          : Text(
                              'Make your friends join ${global.appName} via your referral link below - No referral code needed',
                              textAlign: TextAlign.center,
                              style: Get.theme.primaryTextTheme.bodySmall!
                                  .copyWith(fontWeight: FontWeight.w300),
                            ).translate(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,
                        height: 50,
                        width: Get.width - 50,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          global.appShareLink.isNotEmpty
                              ? global.appShareLink
                              : 'Link Url',
                          style: Get.theme.primaryTextTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (global.appShareLink.isNotEmpty) {
                            Clipboard.setData(
                                    ClipboardData(text: global.appShareLink))
                                .then((value) {
                              Fluttertoast.showToast(
                                msg: 'Link Copied',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            });
                          }
                        },
                        child: GetPlatform.isWeb
                            ? TranslationTextWidget(
                                text: 'Tap to Copy',
                                textAlign: TextAlign.center,
                                style: Get.theme.primaryTextTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.w300),
                              )
                            : Text(
                                'Tap to Copy',
                                textAlign: TextAlign.center,
                                style: Get.theme.primaryTextTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.w300),
                              ).translate(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap: () async {
                              if (global.appShareLink.isNotEmpty) {
                                await FlutterShare.share(
                                  title: '${global.appName}',
                                  text:
                                      'I recently tried ${global.appName} app & highly recommend it! You get extra Cashback on top of all retailer discounts.\n Try it out: ${global.appShareLink}',
                                ).then((value) {
                                  if (value!) {}
                                }).onError((error, stackTrace) {});
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              //padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                              decoration: BoxDecoration(
                                color: Get.theme.secondaryHeaderColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: GetPlatform.isWeb
                                  ? TranslationTextWidget(
                                      text: 'Invite Now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : Text(
                                      'Invite Now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ).translate(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  GetPlatform.isWeb
                      ? FutureBuilder(
                          builder: (context1, snapshot) {
                            return SizedBox();
                          },
                          future: Future.delayed(Duration.zero).then((value) {
                            return Get.dialog(
                              Dialog(
                                backgroundColor: Colors.white,
                                insetPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: SizedBox(
                                  width: AppConstants.WEB_MAX_WIDTH / 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Image.asset(Images.access),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 15),
                                        child: GetPlatform.isWeb
                                            ? TranslationTextWidget(
                                                text:
                                                    'To access this feature, download the app',
                                                textAlign: TextAlign.center,
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              )
                                            : Text(
                                                'To access this feature, download the app',
                                                textAlign: TextAlign.center,
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ).translate(),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          launchUrl(
                                            Uri.parse(
                                                "https://play.google.com/store/apps/details?id=${global.appPackageName}"),
                                            webOnlyWindowName: 'blank',
                                          );
                                        },
                                        child: Container(
                                          height: 40,
                                          margin: EdgeInsets.all(15),
                                          width: AppConstants.WEB_MAX_WIDTH / 4,
                                          color: Get.theme.secondaryHeaderColor,
                                          alignment: Alignment.center,
                                          child: GetPlatform.isWeb
                                              ? TranslationTextWidget(
                                                  text: 'Download The App',
                                                  style: Get
                                                      .theme
                                                      .primaryTextTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              : Text(
                                                  'Download The App',
                                                  style: Get
                                                      .theme
                                                      .primaryTextTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ).translate(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              useSafeArea: true,
                              barrierDismissible: false,
                            );
                          }))
                      : SizedBox()
                ],
              ),
      );
    });
  }
}
