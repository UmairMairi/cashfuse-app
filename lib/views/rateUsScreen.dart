import 'package:cashbackapp/views/addRatingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class RateUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Testimonials',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            color: Color(0xFF1A8FB9),
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '1000',
                  style: Get.theme.primaryTextTheme.headline6.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'and Counting!',
                  style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'See what our happy uers are saying!',
                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: RatingBar.builder(
                        itemCount: 5,
                        ignoreGestures: true,
                        itemPadding: EdgeInsets.zero,
                        itemSize: 30,
                        initialRating: 3,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star_rate_rounded,
                            color: Colors.yellow[700],
                          );
                        },
                        onRatingUpdate: (value) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Very good app',
                        style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                        'Very good earning app',
                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
                      child: Text(
                        '- Test User, 14 October, 2022',
                        style: Get.theme.primaryTextTheme.caption.copyWith(
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.2,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.6,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Get.to(() => AddRatingScreen());
        },
        child: Container(
          height: 40,
          width: Get.width,
          color: Colors.orange[800],
          alignment: Alignment.center,
          child: Text(
            '+ WRITE A TESTIMONIAL',
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
