// ignore_for_file: must_be_immutable

import 'package:cashfuse/controllers/couponController.dart';
import 'package:cashfuse/views/couponDetailScreen.dart';
import 'package:cashfuse/views/offerDetailScreen.dart';
import 'package:cashfuse/widget/couponWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CouponListScreen extends StatelessWidget {
  CouponController couponController = Get.find<CouponController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          AppLocalizations.of(context).coupons_of_the_day.toUpperCase(),
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          // crossAxisSpacing: 15.0,
          // mainAxisSpacing: 15.0,
          childAspectRatio: 3.5,
        ),
        itemCount: couponController.couponList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (couponController.couponList[index].offer != null) {
                Get.to(
                  () => OfferDetailScreen(
                    offer: couponController.couponList[index].offer,
                    fromSeeMore: false,
                  ),
                  routeName: 'offer',
                );
              } else {
                Get.to(
                  () => CouponDetailScreen(
                    coupon: couponController.couponList[index],
                  ),
                  routeName: 'coupon',
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: CouponWidget(
                coupon: couponController.couponList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
