import 'package:cashbackapp/controllers/ratingController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class AddRatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RatingController>(
      builder: (ratingController) {
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
              'Write a Testimonial',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20).copyWith(bottom: 0),
                child: Text(
                  'How was your experiance with us?',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 0,
                margin: EdgeInsets.all(20).copyWith(top: 0),
                borderOnForeground: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                    color: Colors.grey[400],
                  ),
                ),
                child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Rate your experience ',
                        style: TextStyle(color: Colors.black87, fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: RatingBar.builder(
                          itemCount: 5,
                          glow: false,
                          itemPadding: EdgeInsets.zero,
                          itemSize: 35,
                          initialRating: 1,
                          allowHalfRating: false,
                          minRating: 1,
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow[700],
                            );
                          },
                          onRatingUpdate: (value) {
                            ratingController.setRating(value);
                          },
                        ),
                      ),
                      Text(
                        ratingController.ratingText,
                        style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: Get.width,
              color: Colors.orange[800],
              alignment: Alignment.center,
              child: Text(
                'SUBMIT',
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
