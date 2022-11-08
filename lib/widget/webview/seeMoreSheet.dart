import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;

class SeeMoreSheet extends StatelessWidget {
  final int screenId;
  SeeMoreSheet({this.screenId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Container(
          height: homeController.webBottomIndex == 3 ? 400 : 300,
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
                  ? Column(
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
                                  'CB',
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
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 15,
                                ),
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
                                    ' Myntra pays commison to ${global.appName}',
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
                                    ' ${global.appName} Pays you Rewards',
                                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 48,
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
                      ],
                    )
                  : homeController.webBottomIndex == 1
                      ? Expanded(
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
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                          child: RichText(
                                            text: TextSpan(
                                              text: '6%',
                                              style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                                color: Get.theme.secondaryHeaderColor,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: '      Cashback for New Myntra Users',
                                                  style: Get.theme.primaryTextTheme.bodySmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          thickness: 1,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      : homeController.webBottomIndex == 2
                          ? Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Coupons",
                                          style: Get.theme.primaryTextTheme.subtitle1.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Icon(
                                            Icons.close,
                                            size: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Expanded(
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(10),
                                      shrinkWrap: true,
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                DottedBorder(
                                                  color: Get.theme.secondaryHeaderColor,
                                                  child: Text(
                                                    'MYNTRA200',
                                                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                                      color: Get.theme.secondaryHeaderColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(child: SizedBox()),
                                                Icon(
                                                  Icons.copy,
                                                  color: Get.theme.secondaryHeaderColor,
                                                  size: 18,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Clipboard.setData(
                                                      ClipboardData(
                                                        text: 'MYNTRA200',
                                                      ),
                                                    ).then((value) {
                                                      showCustomSnackBar(
                                                        'Coupon Code Copied',
                                                      );
                                                    });
                                                  },
                                                  child: Text(
                                                    'Copy Code',
                                                    style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                                                      decoration: TextDecoration.underline,
                                                      color: Get.theme.secondaryHeaderColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15),
                                              child: Text('Flat Rs.200 off Code + Free Shipping on your First Order'),
                                            ),
                                            Divider(
                                              height: 1,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  )
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
                                          "Offer Details",
                                          style: Get.theme.primaryTextTheme.subtitle1.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Icon(
                                            Icons.close,
                                            size: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Card(
                                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                    elevation: 0,
                                    color: Colors.lightBlue[50],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            minVerticalPadding: 0,
                                            contentPadding: EdgeInsets.zero,
                                            horizontalTitleGap: 10,
                                            minLeadingWidth: 0,
                                            leading: CircleAvatar(
                                              radius: 4,
                                              backgroundColor: Colors.black,
                                            ),
                                            title: Text(
                                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            horizontalTitleGap: 10,
                                            minLeadingWidth: 0,
                                            leading: CircleAvatar(
                                              radius: 4,
                                              backgroundColor: Colors.black,
                                            ),
                                            title: Text(
                                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            horizontalTitleGap: 10,
                                            minLeadingWidth: 0,
                                            leading: CircleAvatar(
                                              radius: 4,
                                              backgroundColor: Colors.black,
                                            ),
                                            title: Text(
                                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                    elevation: 0,
                                    color: Colors.lightBlue.withOpacity(0.08),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Get.theme.secondaryHeaderColor,
                                                radius: 9,
                                                child: CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                              DottedLine(
                                                lineLength: 100,
                                                dashColor: Colors.grey,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Get.theme.secondaryHeaderColor,
                                                radius: 9,
                                                child: CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                              DottedLine(
                                                lineLength: 100,
                                                dashColor: Colors.grey,
                                              ),
                                              CircleAvatar(
                                                backgroundColor: Get.theme.secondaryHeaderColor,
                                                radius: 9,
                                                child: CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Purchase',
                                                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                                                    ),
                                                    Text(
                                                      'Today',
                                                      style: TextStyle(fontWeight: FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'Cashback tracks in',
                                                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                                                      ),
                                                      Text(
                                                        '1 Hour',
                                                        style: TextStyle(fontWeight: FontWeight.w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Confirms in ',
                                                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                                                    ),
                                                    Text(
                                                      '80 days',
                                                      style: TextStyle(fontWeight: FontWeight.w600),
                                                    ),
                                                  ],
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
                            ),
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
