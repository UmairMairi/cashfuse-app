import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/models/couponModel.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/widget/webview/seeMoreSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class WebViewScreen extends StatelessWidget {
  final String urlString;
  final bool isCliked;
  final List<Coupon> couponList;
  final CategoryModel partner;
  final String brandName;
  WebViewScreen({this.urlString, this.isCliked, this.couponList, this.partner, this.brandName});

  @override
  Widget build(BuildContext context) {
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return GetBuilder<HomeController>(builder: (homeController) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: Alignment.center,
            children: [
              // WebView(
              //   initialUrl: url != null && url.isNotEmpty ? url : 'https://flutter.dev',
              //   javascriptMode: JavascriptMode.unrestricted,
              //   debuggingEnabled: true,
              //   onWebResourceError: (error) {
              //     homeController.updtaeRotate(false);
              //     log(error.description);
              //   },
              //   onProgress: (val) {
              //     homeController.updtaeRotate(true);
              //   },
              //   onPageStarted: (url) {
              //     homeController.updtaeRotate(true);
              //   },
              //   onPageFinished: (controller) {
              //     homeController.updtaeRotate(false);
              //   },
              // ),
              InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(urlString)),
                onLoadStart: (controller, url) {
                  homeController.updtaeRotate(true);
                },
                onLoadStop: (controller, url) {
                  homeController.updtaeRotate(false);
                },
                initialOptions: InAppWebViewGroupOptions(
                  android: AndroidInAppWebViewOptions(
                    mixedContentMode: AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
                    cacheMode: AndroidCacheMode.LOAD_NO_CACHE,
                  ),
                ),
              ),
              homeController.isRoted && isCliked == false
                  ? Image.asset(Images.webview_gif)
                  // AnimatedContainer(
                  //     width: 200,
                  //     height: 50,
                  //     color: Get.theme.primaryColor,
                  //     duration: Duration(seconds: 3),
                  //     child: AnimatedAlign(
                  //       alignment: homeController.isRoted ? Alignment.centerLeft : Alignment.centerRight,
                  //       duration: Duration(seconds: 1),
                  //       child: CircleAvatar(
                  //         radius: 20,
                  //         backgroundColor: Colors.yellow,
                  //       ),
                  //     ),
                  //   )
                  : SizedBox(),
            ],
          ),
          bottomNavigationBar: Container(
            color: Get.theme.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    homeController.setWebBottomIndex(0);
                    Get.bottomSheet(
                      SeeMoreSheet(
                        brandName: brandName,
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
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    homeController.setWebBottomIndex(1);
                    Get.bottomSheet(
                      SeeMoreSheet(
                        partner: partner,
                      ),
                    );
                  },
                  child: Text(
                    partner.leftTab,
                    style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                      letterSpacing: -0.2,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.currency_rupee_sharp,
                  //       color: Colors.white,
                  //       size: 15,
                  //     ),
                  //     Text(
                  //       ' ${global.appName}',
                  //       style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                  //         letterSpacing: -0.2,
                  //         fontWeight: FontWeight.w300,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    homeController.setWebBottomIndex(2);
                    Get.bottomSheet(
                      SeeMoreSheet(
                        couponList: couponList,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_offer,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(
                        ' Coupon',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: -0.2,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    homeController.setWebBottomIndex(3);
                    Get.bottomSheet(
                      SeeMoreSheet(
                        partner: partner,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(
                        ' Info',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          letterSpacing: -0.2,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      )
                    ],
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