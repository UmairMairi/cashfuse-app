import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:cashbackapp/utils/global.dart' as global;

class AppWiseOfferShowWidget extends StatelessWidget {
  final bool isTimeShow;
  final CategoryModel category;
  AppWiseOfferShowWidget({this.isTimeShow, this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 60,
      height: 200,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: CustomImage(
              image: '${global.appInfo.baseUrls.categoryImageUrl}/${category.image}',
              height: 145,
              width: Get.width,
              fit: BoxFit.fill,
            ),
          ),
          // Image.asset(
          //   Images.blog,
          //   height: 160,
          //   fit: BoxFit.fill,
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isTimeShow
                      ? SlideCountdown(
                          slideDirection: SlideDirection.none,
                          textStyle: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.circular(3),
                          ),
                          duration: const Duration(hours: 2),
                        )
                      : SizedBox(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Get.theme.secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      'GRAB NOW',
                      style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
