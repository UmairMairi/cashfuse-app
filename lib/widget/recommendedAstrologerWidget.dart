import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedAstrologerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        border: Border.all(color: Get.theme.primaryColor),
      ),
      padding: EdgeInsets.all(10).copyWith(bottom: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Free Call with recommended astrologers',
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.grey[350],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 1),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.only(right: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CircleAvatar(
                            radius: 36,
                            backgroundColor: Get.theme.primaryColor,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                Images.user,
                                fit: BoxFit.fill,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Raj',
                          textAlign: TextAlign.center,
                          style: Get.theme.textTheme.subtitle1.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0,
                          ),
                        ),
                        Text(
                          '₹ 40/min',
                          textAlign: TextAlign.center,
                          style: Get.theme.textTheme.subtitle1.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6).copyWith(top: 5),
                          child: SizedBox(
                            height: 30,
                            child: TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                                fixedSize: MaterialStateProperty.all(Size.fromWidth(90)),
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () async {},
                              child: Text(
                                'Call',
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
