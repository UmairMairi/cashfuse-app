import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
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
          'Request Payment',
          style: Get.theme.primaryTextTheme.headline6.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
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
                    'Cashback Status',
                    style: Get.theme.primaryTextTheme.headline6.copyWith(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Approved Cashback',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          '₹0.00',
                          style: Get.theme.primaryTextTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Approved Rewards',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        '₹0.00',
                        style: Get.theme.primaryTextTheme.subtitle2,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Approved Referral Bonus',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          '₹0.00',
                          style: Get.theme.primaryTextTheme.subtitle2,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: Get.theme.primaryTextTheme.subtitle2,
                      ),
                      Text(
                        '₹0.00',
                        style: Get.theme.primaryTextTheme.subtitle2,
                      ),
                    ],
                  )
                ],
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
                    style: Get.theme.primaryTextTheme.headline6.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
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
                              Colors.green[800],
                              Colors.green[800],
                              Colors.green.withOpacity(0.85),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' Amazon Pay',
                              style: Get.theme.primaryTextTheme.headline6.copyWith(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
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
                              Colors.blue[800],
                              Colors.blue[800],
                              Colors.blue.withOpacity(0.85),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' PayTM',
                              style: Get.theme.primaryTextTheme.headline6.copyWith(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
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
                              Colors.orange[800],
                              Colors.orange[800],
                              Colors.orange.withOpacity(0.85),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' UPI',
                              style: Get.theme.primaryTextTheme.headline6.copyWith(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
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
                              Colors.purple[800],
                              Colors.purple[800],
                              Colors.purple.withOpacity(0.85),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' Bank Transfer',
                              style: Get.theme.primaryTextTheme.headline6.copyWith(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
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
                ],
              ),
            ),
          ),
        ],
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
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
