import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ReferEarnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.find<BottomNavigationController>().setBottomIndex(0);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Refer & Earn',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
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
                  Images.referearn,
                  height: 120,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Invite friends & earn flat 10% of their Cashback amount, EVERYTIME they shop!',
                  textAlign: TextAlign.center,
                  style: Get.theme.primaryTextTheme.subtitle2,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Your Referal Link',
            textAlign: TextAlign.center,
            style: Get.theme.primaryTextTheme.subtitle2,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Make your friends join CashKaro via your referral link below - No referral code needed',
            textAlign: TextAlign.center,
            style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
          ),
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
              'Url link',
              style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Tap to Copy',
            textAlign: TextAlign.center,
            style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Invite by social media',
                    textAlign: TextAlign.center,
                    style: Get.theme.primaryTextTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.facebook,
                            color: Get.theme.primaryColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Facebook',
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.telegram,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Telegram',
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Whatsapp',
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
