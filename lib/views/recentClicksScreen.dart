import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentClickScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.find<BottomNavigationController>().setBottomIndex(0);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Recent Clicks',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Text(
              'Hey Shopper! This page shows all your clicks and transactions from the last 10 days.',
              style: Get.theme.primaryTextTheme.subtitle2,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              Images.amazon,
                              height: 15,
                            ),
                          ),
                        ),
                        trailing: Text(
                          '1 hour ago',
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'Did you shop on Croma?',
                          style: Get.theme.primaryTextTheme.bodyText2.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: DottedLine(
                          dashColor: Colors.grey[350],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Yes I Did ',
                              textAlign: TextAlign.center,
                              style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                color: Colors.teal,
                              ),
                            ),
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.teal,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 8,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
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
