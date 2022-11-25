// ignore_for_file: must_be_immutable

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/models/categoryModel.dart';
import 'package:cashfuse/views/adsDetailScreen.dart';
import 'package:cashfuse/views/campaignDetailScreen.dart';
import 'package:cashfuse/widget/adsCampaignWidget.dart';
import 'package:cashfuse/widget/web/webAdsCampaignWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  final CategoryModel category;
  CategoryScreen({this.category, this.title});

  HomeController homeController = Get.find<HomeController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: GetPlatform.isWeb
          ? WebTopBarWidget(
              scaffoldKey: scaffoldKey,
            )
          : AppBar(
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
                category != null ? category.name : '',
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
              ),
            ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: AppConstants.WEB_MAX_WIDTH,
            child: Column(
              children: [
                // category.ads != []
                //     ? Container(
                //         height: 50,
                //         alignment: Alignment.center,
                //         color: Colors.blue[800],
                //         child: Text(
                //           'Ads(${category.ads.length})',
                //           style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
                //         ),
                //       )
                //     : SizedBox(),
                // DefaultTabController(
                //   length: 4,
                //   child: TabBar(
                //     indicatorWeight: 2.5,
                //     indicatorSize: TabBarIndicatorSize.label,
                //     tabs: [
                //       Tab(
                //         text: 'Popular',
                //       ),
                //       Tab(
                //         text: 'A-Z',
                //       ),
                //       Tab(
                //         text: 'Percent',
                //       ),
                //       Tab(
                //         text: 'Amount',
                //       ),
                //     ],
                //   ),
                // ),
                category.commonList != null && category.commonList.length > 0
                    ? GetBuilder<HomeController>(builder: (controller) {
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: GetPlatform.isWeb ? 4 : 2,
                            crossAxisSpacing: GetPlatform.isWeb ? 25 : 15.0,
                            mainAxisSpacing: GetPlatform.isWeb ? 25 : 15.0,
                          ),
                          itemCount: category.commonList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                if (category.commonList[index].adId != null && category.commonList[index].adId.isNotEmpty) {
                                  await homeController.getAdDetails(category.commonList[index].adId);
                                  Get.to(() => AdsDetailScreen(
                                        ads: homeController.ads,
                                        fromSeeMore: false,
                                      ));
                                } else {
                                  await homeController.getCampignDetails(category.commonList[index].campaignId.toString());
                                  Get.to(() => CampaignDetailScreen(
                                        campaign: homeController.campaign,
                                        fromSeeMore: false,
                                      ));
                                }
                              },
                              child: GetPlatform.isWeb
                                  ? WebAdsCampaignWidget(
                                      fromWebHome: false,
                                      commonModel: category.commonList[index],
                                    )
                                  : AdsCampaignWidget(
                                      commonModel: category.commonList[index],
                                    ),
                            );
                          },
                        );
                      })
                    : SizedBox(
                        height: Get.height,
                        child: Center(
                          child: Text(
                            'No data found.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
