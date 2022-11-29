import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/views/aboutUsScreen.dart';
import 'package:cashfuse/views/getHelpScreen.dart';
import 'package:cashfuse/views/privacyPolicyScreen.dart';
import 'package:cashfuse/widget/customImage.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebFooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: Color(0xFF333333),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${global.appName}',
                              style: TextStyle(fontSize: 28, color: Colors.white),
                            ),
                            Text(
                              '',
                              style: TextStyle(fontSize: 11, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Quick Links',
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => AboutUsScreen());
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Text(
                            'About Us',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => GetHelpScreen());
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Text(
                            'Contact Us',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PrivacyPolicyScreen());
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Download our app',
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // if (Get.find<SplashController>().configModel.appUrlAndroid != null) {
                                  //   _launchURL('${Get.find<SplashController>().configModel.appUrlAndroid}');
                                  // }
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Container(
                                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  child: Row(
                                    children: [
                                      CustomImage(
                                        height: 30,
                                        width: 30,
                                        fit: BoxFit.cover,
                                        image: 'assets/image/play-store.png',
                                        errorImage: Images.logo,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Get it on',
                                            style: TextStyle(fontSize: 14, color: Colors.white),
                                          ),
                                          Text(
                                            'Play Store',
                                            style: TextStyle(fontSize: 18, color: Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // if (Get.find<SplashController>().configModel.appUrlIos != null) {
                                  //   _launchURL('${Get.find<SplashController>().configModel.appUrlIos}');
                                  // }
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Container(
                                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  child: Row(
                                    children: [
                                      CustomImage(
                                        height: 30,
                                        width: 30,
                                        fit: BoxFit.cover,
                                        image: 'assets/image/apple_logo.png',
                                        errorImage: Images.logo,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Get it on',
                                            style: TextStyle(fontSize: 14, color: Colors.white),
                                          ),
                                          Text(
                                            'App Store',
                                            style: TextStyle(fontSize: 18, color: Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Us',
                              style: TextStyle(fontSize: 28, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'New Delhi Railway Station,New Delhi',
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.email,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    'appking@gmail.com',
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    '0xxxxxxxxxxx',
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //_launchURL('https://www.facebook.com/');
                              },
                              behavior: HitTestBehavior.opaque,
                              child: ClipOval(
                                  child: CustomImage(
                                height: 45,
                                width: 45,
                                fit: BoxFit.cover,
                                image: 'assets/image/facebook.jpg',
                                errorImage: Images.logo,
                              )),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        )
                      ],
                    ),
                    Text('OkayStartUp @ Copyright 2021', style: TextStyle(fontSize: 16, color: Colors.white))
                  ],
                )
              ],
            )),
        Container(
          width: AppConstants.WEB_MAX_WIDTH,
          color: Color(0xFF292929),
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Text(
            '(©) Copyright 2022 ${global.appName}. All Rights Reserved.',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
