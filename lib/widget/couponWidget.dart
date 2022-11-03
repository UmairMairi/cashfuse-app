import 'package:cashbackapp/models/couponModel.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/widget/customImage.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponWidget extends StatelessWidget {
  final Coupon coupon;
  CouponWidget({this.coupon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Card(
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: Container(
            width: Get.width - 40,
            //width: 310,
            height: 100,
            decoration: DottedDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.grey[400],
              strokeWidth: 1.5,
              shape: Shape.box,
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImage(
                      image: '${global.appInfo.baseUrls.partnerImageUrl}/${coupon.image}',
                      //width: 70,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    // Image.asset(
                    //   Images.amazon,
                    //   width: 70,
                    // ),
                    Text(
                      coupon.name,
                      style: Get.theme.primaryTextTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Get.theme.primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Text(
                        coupon.heading,
                        style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                          color: Colors.grey[500],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 40,
                      width: 90,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Get.theme.secondaryHeaderColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'See code',
                          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 120,
          child: DottedLine(
            dashColor: Colors.grey[400],
            direction: Axis.vertical,
            dashGapLength: 6,
            lineThickness: 1.2,
            lineLength: 100,
          ),
        ),
        Positioned(
          bottom: -20,
          right: 100,
          child: Card(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              height: 30,
              width: 30,
              decoration: DottedDecoration(
                strokeWidth: 1,
                color: Colors.grey[400],
                shape: Shape.circle,
              ),
            ),
          ),
        ),
        Positioned(
          top: -20,
          right: 100,
          child: Card(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              height: 30,
              width: 30,
              decoration: DottedDecoration(
                strokeWidth: 1,
                color: Colors.grey[400],
                shape: Shape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
