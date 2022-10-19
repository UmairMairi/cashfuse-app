import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';

class AppWiseOfferShowWidget extends StatelessWidget {
  final bool isTimeShow;
  AppWiseOfferShowWidget({this.isTimeShow});

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
          Image.asset(
            Images.blog,
            height: 160,
            fit: BoxFit.fill,
          ),
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
                      'GRAB DEAL',
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
