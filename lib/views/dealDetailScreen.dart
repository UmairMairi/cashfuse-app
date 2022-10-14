import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: kToolbarHeight,
          collapsedHeight: kToolbarHeight,
          toolbarHeight: kToolbarHeight,
          floating: true,
          pinned: true,
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
            'New Flash Deals - Live Now',
            style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
          ),
          actions: [
            Container(
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
            )
          ],
        ),
        SliverFillRemaining(
          fillOverscroll: true,
          hasScrollBody: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                            Images.cashkaro,
                            height: 200,
                            width: Get.width,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      Container(
                        width: Get.width,
                        height: 45,
                        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.orange[800],
                          borderRadius: BorderRadius.circular(2),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'GRAB DEAL',
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
        ),
      ]),
    );
  }
}