import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HelpDetailSceen extends StatelessWidget {
  final fSeachNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'How CashKaro Works?',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: GetBuilder<BottomNavigationController>(
        builder: (navController) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFBC53E1),
                            Color(0xFF6285E3),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[300],
                        ),
                      ),
                      child: TextFormField(
                        focusNode: fSeachNode,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Get.theme.primaryColor,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 10),
                          border: InputBorder.none,
                          hintText: 'What are you looking for?',
                          hintStyle: Get.theme.primaryTextTheme.caption.copyWith(color: Colors.black54, fontSize: 11),
                          prefixIcon: Icon(
                            Icons.search,
                            color: fSeachNode.hasFocus ? Get.theme.primaryColor : Colors.grey,
                          ),
                          prefixIconColor: fSeachNode.hasFocus ? Get.theme.primaryColor : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Card(
                            elevation: 5,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'How to Shop via CashKaro',
                                    style: Get.theme.primaryTextTheme.subtitle2,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: DottedLine(
                                      dashLength: 1,
                                      lineThickness: 1.5,
                                      dashGapLength: 1.5,
                                      dashColor: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.teal[200],
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          FontAwesomeIcons.arrowRightLong,
                                          color: Colors.teal[200],
                                          size: 12,
                                        ),
                                      ),
                                      Text(
                                        '  Read Answer',
                                        style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                                          color: Colors.teal[200],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 15, 5, 10),
                            height: 200,
                            child: VideoPlayer(
                              navController.videoPlayerController,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
