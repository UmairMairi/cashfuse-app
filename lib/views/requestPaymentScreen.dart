import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/authController.dart';
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/views/addBankDetailScreen.dart';
import 'package:cashfuse/views/amazonPayRedeemScreen.dart';
import 'package:cashfuse/views/payPalRedeemScreen.dart';
import 'package:cashfuse/views/paytmRedeemScreen.dart';
import 'package:cashfuse/views/upiRedeemScreen.dart';
import 'package:cashfuse/widget/drawerWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:google_translator/google_translator.dart';

class RequestPaymentScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: global.getPlatFrom() ? DrawerWidget() : null,
      appBar: global.getPlatFrom()
          ? WebTopBarWidget(
              scaffoldKey: scaffoldKey,
            )
          : AppBar(
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
                'Request Payments',
                style: Get.theme.primaryTextTheme.titleSmall!
                    .copyWith(color: Colors.white),
              ).translate(),
            ),
      body: Center(
        child: SizedBox(
          width: AppConstants.WEB_MAX_WIDTH / 2,
          child: GetBuilder<AuthController>(builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: global.getPlatFrom()
                        ? AppConstants.WEB_MAX_WIDTH / 3
                        : Get.width,
                    height: global.getPlatFrom() ? Get.height / 3 : null,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(15),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                              'Request Payments',
                              style: Get.theme.primaryTextTheme.titleLarge!
                                  .copyWith(fontSize: 18),
                            ).translate(),
                            SizedBox(
                              height: global.getPlatFrom() ? 30 : 0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: global.getPlatFrom() ? 15 : 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Remaining Earning',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ).translate(),
                                  Text(
                                    global.currentUser.earning != null
                                        ? '${global.appInfo.currency}${global.currentUser.earning!.remEarning}'
                                        : '${global.appInfo.currency}0.00',
                                    style:
                                        Get.theme.primaryTextTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Send Withdrawal Request',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ).translate(),
                                Text(
                                  global.currentUser.earning != null
                                      ? '${global.appInfo.currency}${global.currentUser.earning!.sentForWithdrawal}'
                                      : '${global.appInfo.currency}0.00',
                                  style: Get.theme.primaryTextTheme.titleSmall,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: global.getPlatFrom() ? 15 : 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Successful Withdrawal',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ).translate(),
                                  Text(
                                    global.currentUser.earning != null
                                        ? '${global.appInfo.currency}${global.currentUser.earning!.withdrawal}'
                                        : '${global.appInfo.currency}0.00',
                                    style:
                                        Get.theme.primaryTextTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Earnings',
                                  style: Get.theme.primaryTextTheme.titleSmall,
                                ).translate(),
                                Text(
                                  global.currentUser.earning != null
                                      ? '${global.appInfo.currency}${global.currentUser.earning!.totalEarnings}'
                                      : '${global.appInfo.currency}0.00',
                                  style: Get.theme.primaryTextTheme.titleSmall,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            'Redeem',
                            style: Get.theme.primaryTextTheme.titleLarge!
                                .copyWith(fontSize: 18),
                          ).translate(),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (global.getPlatFrom()) {
                                Get.dialog(Dialog(
                                  child: SizedBox(
                                    width: 400,
                                    height: 400,
                                    child: AmazonPayRedeemScreen(),
                                  ),
                                ));
                              } else {
                                Get.to(
                                  () => AmazonPayRedeemScreen(),
                                  routeName: 'amazon',
                                );
                              }
                            },
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  height: 65,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.green[800]!,
                                        Colors.green[800]!,
                                        Colors.green.withOpacity(0.85),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Amazon Pay',
                                        style: Get
                                            .theme.primaryTextTheme.titleLarge!
                                            .copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ).translate(),
                                      Card(
                                        margin: EdgeInsets.zero,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            Images.Amazon_pay,
                                            height: 20,
                                            width: 50,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: -38,
                                  child: FloatingActionButton(
                                    heroTag: "1",
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    shape: _DiamondBorder(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (global.getPlatFrom()) {
                                Get.dialog(Dialog(
                                  child: SizedBox(
                                    width: 400,
                                    height: 400,
                                    child: PaytmRedeemScreen(),
                                  ),
                                ));
                              } else {
                                Get.to(
                                  () => PaytmRedeemScreen(),
                                  routeName: 'paytm',
                                );
                              }
                            },
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  height: 65,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.blue[800]!,
                                        Colors.blue[800]!,
                                        Colors.blue.withOpacity(0.85),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'PayTM',
                                        style: Get
                                            .theme.primaryTextTheme.titleLarge!
                                            .copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ).translate(),
                                      Card(
                                        margin: EdgeInsets.zero,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            Images.paytm,
                                            width: 50,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: -38,
                                  child: FloatingActionButton(
                                    heroTag: "2",
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    shape: _DiamondBorder(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (global.getPlatFrom()) {
                                Get.dialog(Dialog(
                                  child: SizedBox(
                                    width: 400,
                                    height: 400,
                                    child: UpiRedeemScreen(),
                                  ),
                                ));
                              } else {
                                Get.to(
                                  () => UpiRedeemScreen(),
                                  routeName: 'upi',
                                );
                              }
                            },
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  height: 65,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.orange[800]!,
                                        Colors.orange[800]!,
                                        Colors.orange.withOpacity(0.85),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' UPI',
                                        style: Get
                                            .theme.primaryTextTheme.titleLarge!
                                            .copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ).translate(),
                                      Card(
                                        margin: EdgeInsets.zero,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            Images.upi,
                                            width: 50,
                                            height: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: -38,
                                  child: FloatingActionButton(
                                    heroTag: "3",
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    shape: _DiamondBorder(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (global.getPlatFrom()) {
                                Get.dialog(Dialog(
                                  child: SizedBox(
                                    width: 400,
                                    height: 500,
                                    child: AddPaymentDetailScreen(),
                                  ),
                                ));
                              } else {
                                Get.to(
                                  () => AddPaymentDetailScreen(),
                                  routeName: 'add-payment',
                                );
                              }
                            },
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  height: 65,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.purple[800]!,
                                        Colors.purple[800]!,
                                        Colors.purple.withOpacity(0.85),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' Bank Transfer',
                                        style: Get
                                            .theme.primaryTextTheme.titleLarge!
                                            .copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ).translate(),
                                      Card(
                                        margin: EdgeInsets.zero,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            Images.bank,
                                            height: 20,
                                            width: 50,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: -38,
                                  child: FloatingActionButton(
                                    heroTag: "4",
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    shape: _DiamondBorder(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (global.getPlatFrom()) {
                                Get.dialog(Dialog(
                                  child: SizedBox(
                                    width: 400,
                                    height: 400,
                                    child: PayPalRedeemScreen(),
                                  ),
                                ));
                              } else {
                                Get.to(
                                  () => PayPalRedeemScreen(),
                                  routeName: 'paypal',
                                );
                              }
                            },
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  height: 65,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.blue[900]!,
                                        Colors.blue[800]!,
                                        Colors.blue.withOpacity(0.85),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' PayPal',
                                        style: Get
                                            .theme.primaryTextTheme.titleLarge!
                                            .copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ).translate(),
                                      Card(
                                        margin: EdgeInsets.zero,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            Images.paypal,
                                            width: 50,
                                            height: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: -38,
                                  child: FloatingActionButton(
                                    heroTag: "5",
                                    elevation: 0,
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    shape: _DiamondBorder(),
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
          }),
        ),
      ),
    );
  }
}

class _DiamondBorder extends ShapeBorder {
  const _DiamondBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection!);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return Border();
  }
}
