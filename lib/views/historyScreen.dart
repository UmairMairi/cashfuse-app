import 'package:astrotalk/controllers/callController.dart';
import 'package:astrotalk/utils/images.dart';
import 'package:astrotalk/widget/customAppbarWidget.dart';
import 'package:astrotalk/widget/recommendedAstrologerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'History',
        titleStyle: Get.theme.primaryTextTheme.headline6.copyWith(fontWeight: FontWeight.normal),
        bgColor: Get.theme.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset(
              Images.translation,
              height: 25,
              width: 25,
            ),
          ),
        ],
      ),
      body: GetBuilder<CallController>(
        builder: (callController) {
          return Column(
            children: [
              TabBar(
                controller: callController.tabController,
                isScrollable: true,
                indicatorColor: Get.theme.primaryColor,
                labelStyle: Get.theme.primaryTextTheme.subtitle1,
                unselectedLabelStyle: Get.theme.primaryTextTheme.subtitle1.copyWith(fontWeight: FontWeight.w300),
                labelPadding: EdgeInsets.symmetric(horizontal: 15),
                onTap: (index) {
                  callController.setTabIndex(index);
                  if (index == 1) {
                    Get.bottomSheet(
                      RecommendedAstrologerWidget(),
                    );
                  }
                },
                tabs: [
                  Tab(
                    text: 'Wallet',
                  ),
                  Tab(
                    text: 'Call',
                  ),
                  Tab(
                    text: 'Chat',
                  ),
                  Tab(
                    text: 'Astromall',
                  ),
                  Tab(
                    text: 'Report',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: callController.tabController.index == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Available Balance',
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '₹ 0',
                                style: Get.theme.primaryTextTheme.headline5,
                              ),
                              SizedBox(
                                height: 30,
                                child: TextButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                                    fixedSize: MaterialStateProperty.all(Size.fromWidth(90)),
                                    backgroundColor: MaterialStateProperty.all(Get.theme.primaryColor),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {},
                                  child: Text(
                                    'Recharge',
                                    style: Get.theme.primaryTextTheme.subtitle2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Get.theme.primaryColor),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Get.theme.primaryColor,
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  child: Text(
                                    'wallet Transactions',
                                    style: Get.theme.primaryTextTheme.subtitle2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[200],
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  child: Text(
                                    'Payment Logs',
                                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: Get.height - 400,
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                'No Data Available',
                                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            'Uh - oh!',
                          ),
                          Text(
                            '',
                          ),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
