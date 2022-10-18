import 'package:cashbackapp/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeMoreSheet extends StatelessWidget {
  final int screenId;
  SeeMoreSheet({this.screenId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Container(
          height: 300,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homeController.webBottomIndex == 0
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Get.theme.primaryColor,
                                  child: Text(
                                    'CK',
                                    style: Get.theme.primaryTextTheme.headline6.copyWith(
                                      color: Get.theme.secondaryHeaderColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  "What's Next",
                                  style: Get.theme.primaryTextTheme.subtitle1.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.close,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Get.theme.secondaryHeaderColor,
                                      radius: 10,
                                    ),
                                    Text(
                                      ' Shop at Myntra',
                                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Get.theme.secondaryHeaderColor,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Get.theme.secondaryHeaderColor,
                                      radius: 10,
                                    ),
                                    Text(
                                      ' Myntra pays commison to CaskKaro',
                                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Get.theme.secondaryHeaderColor,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Get.theme.secondaryHeaderColor,
                                      radius: 10,
                                    ),
                                    Text(
                                      ' CaskKaro Pays you Cashback',
                                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.grey[100],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    ' Real Money',
                                    style: Get.theme.primaryTextTheme.bodySmall,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    ' Above all discounts',
                                    style: Get.theme.primaryTextTheme.bodySmall,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cashback",
                                style: Get.theme.primaryTextTheme.subtitle1.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.close,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    )),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) => Container(
                  color: Get.theme.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.find<HomeController>().setWebBottomIndex(0);
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Get.theme.primaryColor,
                                    Get.theme.primaryColor,
                                    Get.theme.primaryColor,
                                    Get.theme.primaryColor.withOpacity(0.8),
                                  ],
                                )),
                            child: RichText(
                              text: TextSpan(
                                text: "CK",
                                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                  letterSpacing: -0.2,
                                  color: Get.theme.secondaryHeaderColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' See more',
                                    style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                      letterSpacing: -0.2,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          Get.find<HomeController>().setWebBottomIndex(1);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.currency_rupee_sharp,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              ' Cashback',
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                letterSpacing: -0.2,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          Get.find<HomeController>().setWebBottomIndex(2);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_offer,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              ' Coupon',
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                letterSpacing: -0.2,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          Get.find<HomeController>().setWebBottomIndex(3);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              ' Info',
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                letterSpacing: -0.2,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
