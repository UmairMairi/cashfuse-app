// ignore_for_file: must_be_immutable

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/models/couponModel.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/views/getStartedScreen.dart';
import 'package:cashfuse/widget/customImage.dart';
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:slide_countdown/slide_countdown.dart';

class WebCouponDetailScreen extends StatelessWidget {
  final Coupon? coupon;
  WebCouponDetailScreen({this.coupon});
  HomeController homeController = Get.find<HomeController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        key: scaffoldKey,
        appBar: global.getPlatFrom()
            ? WebTopBarWidget(
                scaffoldKey: scaffoldKey,
              )
            : AppBar(
                elevation: 0,
                backgroundColor: Get.theme.primaryColor,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                title: Text(
                  coupon!.name!,
                  style: Get.theme.primaryTextTheme.titleSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: global.getPlatFrom() ? Colors.white : Colors.white,
              height: Get.height,
              width: AppConstants.WEB_MAX_WIDTH,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.deal_ends_in,
                    style: Get.theme.primaryTextTheme.titleSmall,
                  ),
                  coupon!.dayDifference != null && coupon!.dayDifference! > 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SlideCountdownSeparated(
                            separatorType: SeparatorType.symbol,
                            durationTitle: DurationTitle(
                              hours: 'hr',
                              minutes: 'min',
                              seconds: 'sec',
                              days: 'day',
                            ),
                            slideDirection: SlideDirection.none,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                              color: Colors.red[800],
                              borderRadius: BorderRadius.circular(3),
                            ),
                            duration: Duration(
                              days: coupon!.dayDifference!,
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    width: Get.width,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CustomImage(
                              image:
                                  '${global.appInfo.baseUrls!.couponBannerImageUrl}/${coupon!.bannerImage}',
                              height: global.getPlatFrom() ? 250 : 200,
                              width: global.getPlatFrom()
                                  ? AppConstants.WEB_MAX_WIDTH / 3
                                  : Get.width,
                              fit: global.getPlatFrom()
                                  ? BoxFit.contain
                                  : BoxFit.fill,
                              coupon: coupon!,
                            ),
                            Card(
                              color: Colors.white,
                              margin: EdgeInsets.all(10),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CustomImage(
                                  image:
                                      '${global.appInfo.baseUrls!.partnerImageUrl}/${coupon!.image}',
                                  height: 30,
                                  width: 60,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        coupon!.code != null && coupon!.code!.isNotEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.use_code,
                                    style: Get.theme.primaryTextTheme.bodyLarge!
                                        .copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: DottedBorder(
                                      padding: EdgeInsets.all(10),
                                      color: Get.theme.secondaryHeaderColor,
                                      child: Text(
                                        coupon!.code!,
                                        style: Get
                                            .theme.primaryTextTheme.titleSmall!
                                            .copyWith(
                                          color: Get.theme.secondaryHeaderColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Clipboard.setData(
                                        ClipboardData(
                                          text: coupon!.code!,
                                        ),
                                      ).then((value) {
                                        showCustomSnackBar(
                                          'Coupon Code Copied',
                                        );
                                      });
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.copy_code,
                                      style: Get
                                          .theme.primaryTextTheme.bodyLarge!
                                          .copyWith(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : Text(
                                '*${AppLocalizations.of(context)!.code_not_required}',
                                style: TextStyle(color: Colors.red),
                              ),
                        InkWell(
                          onTap: () async {
                            if (global.currentUser.id != null) {
                              await homeController.getTrackingLink(
                                  coupon!.url!, coupon!.affiliatePartner!);
                              await homeController.addClick(
                                  coupon!.partnerName!,
                                  '${global.appInfo.baseUrls!.partnerImageUrl}/${coupon!.image}',
                                  coupon!.url!);

                              global.launchInBrowser(
                                homeController.createdLink.isNotEmpty
                                    ? homeController.createdLink
                                    : coupon!.url!,
                              );
                            } else {
                              if (global.getPlatFrom()) {
                                Get.dialog(Dialog(
                                  child: SizedBox(
                                    width: Get.width / 3,
                                    child: GetStartedScreen(
                                      fromMenu: true,
                                    ),
                                  ),
                                ));
                              } else {
                                Get.to(
                                  () => GetStartedScreen(
                                    fromMenu: true,
                                  ),
                                  routeName: 'login',
                                );
                              }
                            }
                          },
                          child: Container(
                            width: global.getPlatFrom()
                                ? Get.width / 4
                                : Get.width,
                            height: 45,
                            margin: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 8),
                            decoration: BoxDecoration(
                              color: Get.theme.secondaryHeaderColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              coupon!.buttonText!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: global.getPlatFrom() ? Get.width / 3 : Get.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.about_this_coupon,
                            style: global.getPlatFrom()
                                ? Get.theme.primaryTextTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w600)
                                : Get.theme.primaryTextTheme.titleSmall,
                          ),
                          Divider(),
                          Text(
                            coupon!.heading!,
                            style: Get.theme.primaryTextTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            coupon!.description!,
                            style: Get.theme.primaryTextTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
