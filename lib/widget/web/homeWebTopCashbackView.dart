import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/models/commonModel.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/views/categoryScreen.dart';
import 'package:cashfuse/widget/web/webAdsCampaignWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeWebTopCashbackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (hmController) {
      return hmController.isTopCashbackLoaded
          ? hmController.topCashbackList != null && hmController.topCashbackList.length > 0
              ? SizedBox(
                  height: 195,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hmController.topCashbackList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => CategoryScreen(
                                category: hmController.topCashbackList[index],
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 13),
                          child: SizedBox(
                            width: 195,
                            child: WebAdsCampaignWidget(
                              fromWebHome: true,
                              commonModel: CommonModel(
                                name: hmController.topCashbackList[index].name,
                                image: '${global.appInfo.baseUrls.partnerImageUrl}/${hmController.topCashbackList[index].image}',
                                tagline: hmController.topCashbackList[index].tagline,
                                adId: hmController.topCashbackList[index].id.toString(),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : SizedBox()
          : SizedBox(
              height: 155,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                  itemBuilder: (context, index) {
                    return Shimmer(
                      duration: Duration(seconds: 2),
                      child: Container(
                        width: 155,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }),
            );
    });
  }
}
