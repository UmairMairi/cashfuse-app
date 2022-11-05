import 'package:cashbackapp/models/commonModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatesAndTermScreen extends StatelessWidget {
  final CommonModel commonModel;
  RatesAndTermScreen({this.commonModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        titleSpacing: 10,
        backgroundColor: Colors.white,
        title: Text(
          'CASHBACK RATES',
          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
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
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 0,
            thickness: 1,
            color: Colors.grey,
          ),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                ],
              );
            },
          ),
          Container(
            height: 5,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OFFER TERMS',
                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Key Points',
                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.1,
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
                    style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
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
                    style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
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
        ],
      ),
    );
  }
}
