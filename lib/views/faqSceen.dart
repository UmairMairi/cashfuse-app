import 'package:cashbackapp/views/aboutScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FaqScreen extends StatelessWidget {
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
          'FAQs',
          style: Get.theme.primaryTextTheme.headline6.copyWith(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 5),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(() => AboutScreen());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'How to use CashKaro?',
                    style: Get.theme.primaryTextTheme.bodyText2.copyWith(color: Colors.grey[600]),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            width: Get.width,
            decoration: BoxDecoration(
              color: Get.theme.secondaryHeaderColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              'Message Us',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
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
