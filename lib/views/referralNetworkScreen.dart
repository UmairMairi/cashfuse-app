// ignore_for_file: must_be_immutable

import 'package:cashfuse/controllers/referEarnController.dart';
import 'package:cashfuse/utils/date_converter.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/views/faqSceen.dart';
import 'package:cashfuse/views/referEarnScreen.dart';
import 'package:cashfuse/widget/customImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class ReferralNetworkScreen extends StatelessWidget {
  ReferEarnController referEarnController = Get.find<ReferEarnController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReferEarnController>(builder: (controller) {
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
            AppLocalizations.of(context).my_referrals,
            style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Get.to(() => FaqScreen());
          },
          child: Image.asset(
            Images.gethelp,
            height: 50,
          ),
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
                    AppLocalizations.of(context).refer_earn_desc,
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
                            '${global.appInfo.currency} ${global.currentUser.earning.referralEarning}',
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
                            global.totalJoinedCount.toString(),
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
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
            Expanded(
              child: referEarnController.isDataLoaded
                  ? referEarnController.referralUserList != null && referEarnController.referralUserList.length > 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: referEarnController.referralUserList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: CustomImage(
                                        image: global.appInfo.baseUrls.userImageUrl + '/' + referEarnController.referralUserList[index].referraluser.userImage,
                                        // height: 30,
                                        // width: 30,
                                        fit: BoxFit.cover,
                                        errorImage: Images.user,
                                      ),
                                    ),
                                  ),
                                  title: Text(referEarnController.referralUserList[index].referraluser.name),
                                  subtitle: Text(
                                    referEarnController.referralUserList[index].referraluser.phone,
                                    style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.grey, letterSpacing: 0.5),
                                  ),
                                  trailing: Text(
                                    DateConverter.dateTimeToDateOnly(
                                      referEarnController.referralUserList[index].createdAt,
                                    ),
                                  ),
                                ),
                                Divider()
                              ],
                            );
                          },
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              Images.refer,
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
                                "You are now entited to 10% Extra Referral Earnings everytime your friend shops via us! You can earn more if you refer us to more people in your network.",
                                textAlign: TextAlign.center,
                                style: Get.theme.primaryTextTheme.caption.copyWith(fontSize: 11, color: Colors.black54),
                              ),
                            ),
                          ],
                        )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Get.back();
            Get.to(() => ReferEarnScreen());
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
    });
  }
}
