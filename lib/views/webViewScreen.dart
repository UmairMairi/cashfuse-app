// ignore_for_file: must_be_immutable

import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/models/couponModel.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/widget/webview/seeMoreSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WebViewScreen extends StatelessWidget {
  final String urlString;
  final bool isCliked;
  final List<Coupon> couponList;
  final CategoryModel partner;
  final String brandName;
  WebViewScreen({this.urlString, this.isCliked, this.couponList, this.partner, this.brandName});

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return GetBuilder<HomeController>(builder: (controller1) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: Alignment.center,
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(urlString)),
                onLoadStart: (controller, url) {
                  homeController.updtaeRotate(false);
                },
                onWebViewCreated: (controller) {
                  homeController.updtaeRotate(true);
                },
                initialOptions: InAppWebViewGroupOptions(
                  android: AndroidInAppWebViewOptions(
                    mixedContentMode: AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
                    cacheMode: AndroidCacheMode.LOAD_NO_CACHE,
                    clearSessionCache: true,
                    networkAvailable: true,
                  ),
                ),
              ),
              homeController.isRoted && isCliked == false ? Image.asset(Images.webview_gif) : SizedBox(),
            ],
          ),
          bottomNavigationBar: Container(
            color: Get.theme.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    homeController.setWebBottomIndex(0);
                    Get.bottomSheet(
                      SeeMoreSheet(
                        partner: partner,
                        brandName: brandName,
                        couponList: couponList,
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Get.theme.primaryColor,
                              Get.theme.primaryColor,
                              Get.theme.primaryColor,
                              Get.theme.primaryColor.withOpacity(0.8),
                            ],
                          )),
                      child: RichText(
                        text: TextSpan(
                          text: "CB",
                          style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                            letterSpacing: -0.2,
                            color: Get.theme.secondaryHeaderColor,
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' See more',
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                letterSpacing: -0.2,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //Expanded(child: SizedBox()),
                partner != null && partner.leftTab.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          homeController.setWebBottomIndex(1);
                          Get.bottomSheet(
                            SeeMoreSheet(
                              partner: partner,
                              brandName: brandName,
                              couponList: couponList,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            partner.leftTab,
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                              letterSpacing: -0.2,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                //Expanded(child: SizedBox()),
                couponList != null && couponList.length > 0
                    ? InkWell(
                        onTap: () {
                          homeController.setWebBottomIndex(2);
                          Get.bottomSheet(
                            SeeMoreSheet(
                              partner: partner,
                              brandName: brandName,
                              couponList: couponList,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(left: 5),
                          child: Text(
                            ' ${AppLocalizations.of(context).coupon}',
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                              letterSpacing: -0.2,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                //Expanded(child: SizedBox()),
                partner != null && partner.rightTab.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          homeController.setWebBottomIndex(3);
                          Get.bottomSheet(
                            SeeMoreSheet(
                              partner: partner,
                              brandName: brandName,
                              couponList: couponList,
                            ),
                          );
                        },
                        child: Text(
                          partner.rightTab,
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
