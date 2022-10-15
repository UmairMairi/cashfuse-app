import 'package:cashbackapp/views/addTicketSceen.dart';
import 'package:cashbackapp/views/faqSceen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MissingCashbackScreen extends StatelessWidget {
  bool isSHow = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Get.theme.primaryColor,
          child: Icon(FontAwesomeIcons.commentDots),
          onPressed: () {
            Get.to(() => FaqScreen());
          },
        ),
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            ListTile(
              tileColor: Get.theme.primaryColor,
              contentPadding: EdgeInsets.only(top: 0),
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Missing Cashback',
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Get.theme.secondaryHeaderColor,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "You don't have any Missing Tickets",
                    style: Get.theme.primaryTextTheme.bodyText1.copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Missing Cashback or Rewards?",
                    style: Get.theme.primaryTextTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => AddTicketSceen());
                    },
                    child: Container(
                      height: 40,
                      width: Get.width / 2,
                      color: Get.theme.secondaryHeaderColor,
                      alignment: Alignment.center,
                      child: Text(
                        'ADD A TICKET',
                        style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) => (FutureBuilder(builder: (context, snapshot) {
                      Future.delayed(Duration(seconds: 2)).then(
                        (value) {
                          setState(() {
                            isSHow = true;
                          });
                        },
                      );
                      return isSHow
                          ? Container(
                              color: Colors.white,
                              width: Get.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 15),
                                    child: Text(
                                      'For Quick Resolution:',
                                      style: Get.theme.primaryTextTheme.bodyText1.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, top: 5),
                                    child: Text(
                                      'When adding Missing, mention\ncorrect product details in \n"Item(s) Purchased"',
                                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300, fontSize: 13),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isSHow = false;
                                      });
                                    },
                                    child: Container(
                                      color: Get.theme.primaryColor,
                                      width: Get.width,
                                      height: 50,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'OKAY',
                                        style: Get.theme.primaryTextTheme.bodyText1.copyWith(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : SizedBox();
                    })))
          ],
        ),
      ),
    );
  }
}
