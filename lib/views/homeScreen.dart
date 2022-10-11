import 'package:astrotalk/controllers/homeController.dart';
import 'package:astrotalk/utils/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.theme.primaryColor,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          title: Image.asset(Images.cashkaro),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Earnings',
                    style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Text('₹0.00'),
                ],
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0).copyWith(right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 165,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    disableCenter: false,
                    autoPlayCurve: Curves.easeIn,
                    aspectRatio: 1,
                    autoPlayInterval: Duration(seconds: 5),
                    onPageChanged: (index, reason) {},
                    viewportFraction: 1,
                    pageSnapping: false,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index, _) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: Get.width,
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(Images.placeholder),
                        ),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'TOP CATEGRIES',
                  style: Get.theme.primaryTextTheme.subtitle2,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
