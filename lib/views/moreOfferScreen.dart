import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreOfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'See more offers',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.1,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey[300],
              width: 0.5,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expires in 15 days',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Earn upto 6% Cashback on all Myntra Orders + 24% Bonus Cashback (Once per user)'),
            ),
            Text(
              'See Details',
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
              ),
            ),
            Container(
              width: Get.width / 2,
              height: 45,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Get.theme.secondaryHeaderColor,
                    width: 1,
                  )),
              alignment: Alignment.center,
              child: Text(
                'ACTIVATE CASHBACK',
                style: TextStyle(color: Get.theme.secondaryHeaderColor, fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 10,
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}
