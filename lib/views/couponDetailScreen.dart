import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:slide_countdown/slide_countdown.dart';

class CouponDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.theme.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Coupon',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {
              global.share('');
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12).copyWith(right: 10),
              padding: EdgeInsets.only(left: 10, right: 3),
              decoration: BoxDecoration(
                color: Colors.green[500],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Text('Share  '),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.green[700],
                    child: Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Deal ends in:',
              style: Get.theme.primaryTextTheme.subtitle2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SlideCountdownSeparated(
                separatorType: SeparatorType.symbol,
                durationTitle: DurationTitle(
                  hours: 'hr',
                  minutes: 'min',
                  seconds: 'sec',
                  days: 'day',
                ),
                slideDirection: SlideDirection.none,
                textStyle: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.circular(3),
                ),
                duration: const Duration(hours: 2),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              width: Get.width,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        Images.dummyImage,
                        height: 200,
                        width: Get.width,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: RotatedBox(
                          quarterTurns: 45,
                          child: ClipPath(
                            clipper: MultiplePointsClipper(Sides.bottom, heightOfPoint: 10, numberOfPoints: 1),
                            child: Container(
                              width: 20,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.red[600],
                              ),
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(bottom: 5, top: 5),
                              child: RotatedBox(
                                quarterTurns: -45,
                                child: Text(
                                  'LOWEST PRICE GURRENTY',
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Use Code',
                        style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: DottedBorder(
                          padding: EdgeInsets.all(10),
                          color: Get.theme.secondaryHeaderColor,
                          child: Text(
                            'CB50',
                            style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                              color: Get.theme.secondaryHeaderColor,
                            ),
                          ),
                        ),
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
                            color: Colors.teal,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: Get.width,
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                    decoration: BoxDecoration(
                      color: Get.theme.secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'GO NUTS',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About this offer',
                      style: Get.theme.primaryTextTheme.subtitle2,
                    ),
                    Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Important Information',
                      style: Get.theme.primaryTextTheme.subtitle2,
                    ),
                    Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cashkaro Rewards Details',
                      style: Get.theme.primaryTextTheme.subtitle2,
                    ),
                    Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How to get this offer',
                      style: Get.theme.primaryTextTheme.subtitle2,
                    ),
                    Divider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.black54,
                      ),
                      title: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
