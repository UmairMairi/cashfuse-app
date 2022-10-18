import 'dart:io';

import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/widget/webview/seeMoreSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://flutter.dev',
          javascriptMode: JavascriptMode.unrestricted,
        ),
        bottomNavigationBar: Container(
          color: Get.theme.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.find<HomeController>().setWebBottomIndex(0);
                  Get.bottomSheet(
                    SeeMoreSheet(),
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
                        text: "CK",
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
                  Get.find<HomeController>().setWebBottomIndex(1);
                  Get.bottomSheet(
                    SeeMoreSheet(),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.currency_rupee_sharp,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      ' Cashback',
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
                  Get.find<HomeController>().setWebBottomIndex(2);
                  Get.bottomSheet(
                    SeeMoreSheet(),
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
                  Get.find<HomeController>().setWebBottomIndex(3);
                  Get.bottomSheet(
                    SeeMoreSheet(),
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
  }
}
