import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'About ${global.appName}',
          style: Get.theme.primaryTextTheme.headline6.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 20),
            child: Text(
              'How to use CashKaro?',
              style: Get.theme.primaryTextTheme.subtitle1.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 30),
            child: Text(
              'Follow this simple steps to earn Cashback:',
              style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 10, right: 10),
            horizontalTitleGap: 10,
            minLeadingWidth: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1.',
                  style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: Get.theme.primaryTextTheme.bodyText2.copyWith(fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Was this answer useful?',
                    style: Get.theme.primaryTextTheme.subtitle1.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'NO',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'YES',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 18,
            width: Get.width,
            color: Colors.black,
            alignment: Alignment.center,
            child: Text(
              'Powered by Freshdesk',
              style: Get.theme.primaryTextTheme.caption.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
