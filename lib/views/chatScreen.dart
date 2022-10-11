import 'package:astrotalk/controllers/chatController.dart';
import 'package:astrotalk/utils/images.dart';
import 'package:astrotalk/widget/customAppbarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Chat with Astrologer',
        titleStyle: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w300),
        bgColor: Get.theme.primaryColor,
        actions: [
          Container(
            width: 40,
            margin: EdgeInsets.symmetric(vertical: 17),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text(
              '₹ 0',
              style: Get.theme.primaryTextTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
              color: Get.theme.iconTheme.color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              FontAwesomeIcons.filter,
              size: 20,
              color: Get.theme.iconTheme.color,
            ),
          )
        ],
      ),
      body: GetBuilder<ChatController>(
        builder: (chatController) {
          return Column(
            children: [
              DefaultTabController(
                length: chatController.tabList.length,
                child: TabBar(
                  padding: EdgeInsets.only(top: 10),
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  tabs: List.generate(chatController.tabList.length, (index) {
                    return SizedBox(
                      height: 30,
                      child: Chip(
                        padding: EdgeInsets.only(bottom: 5),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Get.theme.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.grid_view_rounded,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                chatController.tabList[index],
                                style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(chatController.tabList.length, (index) {
                    return ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: CircleAvatar(
                                        radius: 36,
                                        backgroundColor: Get.theme.primaryColor,
                                        child: CircleAvatar(
                                          radius: 35,
                                          backgroundColor: Colors.white,
                                          child: Image.asset(
                                            Images.user,
                                            fit: BoxFit.fill,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                    RatingBar.builder(
                                      initialRating: 0,
                                      itemCount: 5,
                                      allowHalfRating: false,
                                      itemSize: 15,
                                      ignoreGestures: true,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Get.theme.primaryColor,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    Text(
                                      '1000 orders',
                                      style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 9,
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Raj Patel',
                                        ),
                                        Text(
                                          'Tarot, Vedic',
                                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          'English, Hindi',
                                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          'Exp: 7 Years',
                                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Free',
                                              style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.red,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '10/min',
                                              style: Get.theme.textTheme.subtitle1.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: 0,
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                                        fixedSize: MaterialStateProperty.all(Size.fromWidth(90)),
                                        backgroundColor: MaterialStateProperty.all(Colors.white),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {},
                                      child: Text(
                                        'Chat',
                                        style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.green),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  })),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
