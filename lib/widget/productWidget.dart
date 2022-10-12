import 'package:cashbackapp/utils/images.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 365,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[200]),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Price Compared ',
                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontSize: 9),
                      children: <TextSpan>[
                        TextSpan(
                          text: '( 2 Sellers )',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.teal, fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 160,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            Images.placeholder,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: RichText(
                              text: TextSpan(
                                text: 'Brand: ',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontSize: 11, fontWeight: FontWeight.w300),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'OnePlus',
                                    style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            indent: 5,
                            endIndent: 5,
                            thickness: 1.5,
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: RotatedBox(
                        quarterTurns: -45,
                        child: ClipPath(
                          clipper: MultiplePointsClipper(Sides.bottom, heightOfPoint: 10, numberOfPoints: 1),
                          child: Container(
                            width: 20,
                            height: 135,
                            decoration: BoxDecoration(
                              color: Colors.red[600],
                            ),
                            alignment: Alignment.topCenter,
                            child: RotatedBox(
                              quarterTurns: 45,
                              child: Text(
                                'GIF SALE BESTSELLERS  ',
                                textAlign: TextAlign.center,
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                  color: Colors.white,
                                  fontSize: 11.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  child: Text(
                    'One Plus Nord CE 2 Lite 5G',
                    textAlign: TextAlign.center,
                    style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: RichText(
                    text: TextSpan(
                      text: '₹19999',
                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.lineThrough,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' ₹18999',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: ' (5% off)',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.orange[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: Colors.deepOrange[400],
                      )),
                  child: Text(
                    '+₹95 REWARDS',
                    style: TextStyle(color: Colors.deepOrange[400], fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  'Final Price ₹18904',
                  style: TextStyle(color: Get.theme.primaryColor, fontSize: 13, fontWeight: FontWeight.w600),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
