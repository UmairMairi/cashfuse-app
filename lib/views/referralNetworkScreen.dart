import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/faqSceen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ReferralNetworkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'My Referrals',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Get.theme.primaryColor,
        child: Icon(FontAwesomeIcons.commentDots),
        onPressed: () {
          Get.to(() => FaqScreen());
        },
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            color: Color(0xFF1A8FB9),
            height: 140,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Refer friends & earn 10% of their Cashback amount, EVERYTIME they shop!',
                  textAlign: TextAlign.center,
                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₹0.00',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Total Referral',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          'Cashback Earned',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 0.1,
                      color: Colors.white,
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -0.2,
                          ),
                        ),
                        Text(
                          'Friends Joined',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Image.asset(
            Images.referearn,
            height: 120,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'There is no Refferal Earnings',
            textAlign: TextAlign.center,
            style: Get.theme.primaryTextTheme.bodyText2,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              textAlign: TextAlign.center,
              style: Get.theme.primaryTextTheme.caption.copyWith(fontSize: 11, color: Colors.black54),
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Get.back();
          Get.find<BottomNavigationController>().setBottomIndex(2);
        },
        child: Container(
          height: 40,
          width: Get.width,
          color: Get.theme.secondaryHeaderColor,
          alignment: Alignment.center,
          child: Text(
            'REFER & EARN NOW',
            style: Get.theme.primaryTextTheme.subtitle2.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
