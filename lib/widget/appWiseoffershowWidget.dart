import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/models/offerModel.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/widget/customImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';

class AppWiseOfferShowWidget extends StatelessWidget {
  final bool isTimeShow;
  final OfferModel offer;
  AppWiseOfferShowWidget({this.isTimeShow, this.offer});

  HomeController homeController = Get.find<HomeController>();

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
          Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: CustomImage(
                  image: '${global.appInfo.baseUrls.offerImageUrl}/${offer.bannerImage}',
                  height: 145,
                  width: Get.width,
                  fit: BoxFit.fill,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CustomImage(
                    image: '${global.appInfo.baseUrls.offerImageUrl}/${offer.image}',
                    height: 30,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  homeController.countTimer(DateTime.now(), offer.endDate) != null
                      ? SlideCountdown(
                          slideDirection: SlideDirection.none,
                          textStyle: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.circular(3),
                          ),
                          duration: Duration(days: homeController.countTimer(DateTime.now(), offer.endDate)),
                        )
                      : SizedBox(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Get.theme.secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      offer.buttonText,
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
