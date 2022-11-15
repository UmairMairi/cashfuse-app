import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/views/adsDetailScreen.dart';
import 'package:cashbackapp/views/campaignDetailScreen.dart';
import 'package:cashbackapp/views/offerDetailScreen.dart';
import 'package:cashbackapp/widget/offerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferListScreen extends StatelessWidget {
  final CategoryModel categoryModel;
  OfferListScreen({this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
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
            categoryModel != null ? categoryModel.name : 'NEW FLASH DEALS - LIVE NOW',
            style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: categoryModel != null
                  ? ListView.builder(
                      itemCount: categoryModel.commonList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            if (categoryModel.commonList[index].adId != null && categoryModel.commonList[index].adId.isNotEmpty) {
                              await homeController.getAdDetails(categoryModel.commonList[index].adId);
                              Get.to(() => AdsDetailScreen(
                                    ads: homeController.ads,
                                    fromSeeMore: false,
                                  ));
                            } else {
                              await homeController.getCampignDetails(categoryModel.commonList[index].campaignId.toString());
                              Get.to(() => CampaignDetailScreen(
                                    campaign: homeController.campaign,
                                    fromSeeMore: false,
                                  ));
                            }
                          },
                          child: OfferWidget(
                            commonModel: categoryModel.commonList[index],
                            fromList: true,
                            domainImage: categoryModel.image,
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: homeController.newFlashOfferList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            await homeController.getOfferDetails(
                              homeController.newFlashOfferList[index].id.toString(),
                            );
                            Get.to(() => OfferDetailScreen(
                                  offer: homeController.offer,
                                  fromSeeMore: false,
                                ));
                          },
                          child: OfferWidget(
                            offer: homeController.newFlashOfferList[index],
                            fromList: true,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      );
    });
  }
}
