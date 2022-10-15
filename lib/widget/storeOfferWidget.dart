import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/ratesAndTermScreen.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreOfferWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      )),
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 5),
                  child: RotatedBox(
                    quarterTurns: 45,
                    child: Text(
                      'GREAT INDIAN FESTIVAL',
                      textAlign: TextAlign.center,
                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Images.amazon,
              height: 32,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.orange[700],
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              'EARN UPTO 8% REWARDS >',
              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(
                () => RatesAndTermScreen(),
                transition: Transition.rightToLeft,
              );
            },
            child: Container(
              height: 45,
              alignment: Alignment.center,
              child: Text(
                'Rewards Rates & Terms',
                textAlign: TextAlign.center,
                style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                  color: Colors.teal,
                  fontSize: 10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
