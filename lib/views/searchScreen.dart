import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/controllers/searchController.dart';
import 'package:cashbackapp/controllers/splashController.dart';
import 'package:cashbackapp/models/commonModel.dart';
import 'package:cashbackapp/views/campaignDetailScreen.dart';
import 'package:cashbackapp/views/categoryScreen.dart';
import 'package:cashbackapp/views/offerDetailScreen.dart';
import 'package:cashbackapp/views/adsDetailScreen.dart';
import 'package:cashbackapp/widget/appWiseoffershowWidget.dart';
import 'package:cashbackapp/widget/storeOfferWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;

class SearchScreen extends StatelessWidget {
  SearchController searchController = Get.find<SearchController>();
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () async {
            await Get.find<SplashController>().bannerShow();
            Get.find<BottomNavigationController>().setBottomIndex(0);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: TextFormField(
          controller: searchController.searchString,
          cursorColor: Colors.orange,
          style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white),
          decoration: InputDecoration(
            suffix: searchController.searchString.text.isNotEmpty
                ? InkWell(
                    onTap: () {
                      searchController.searchString.clear();
                      searchController.searchData = null;
                      searchController.update();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
            border: InputBorder.none,
            hintText: 'What do you want to buy today?',
            hintStyle: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white.withOpacity(0.4)),
          ),
          onEditingComplete: () {
            searchController.getSearchData(searchController.searchString.text.trim());
          },
        ),
      ),
      body: GetBuilder<SearchController>(builder: (controller) {
        return searchController.searchData != null
            ? searchController.searchData.advertiserList.isEmpty && searchController.searchData.commonList.isEmpty && searchController.searchData.offerList.isEmpty
                ? Center(child: Text('No data found.'))
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                        //   child: Text(
                        //     'Trending Searches:',
                        //     style: Get.theme.primaryTextTheme.subtitle2,
                        //   ),
                        // ),
                        // Divider(
                        //   height: 0,
                        //   color: Colors.grey[400],
                        // ),
                        searchController.searchData.advertiserList != null && searchController.searchData.advertiserList.length > 0
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Text(
                                  'in Stores',
                                  style: Get.theme.primaryTextTheme.subtitle2,
                                ),
                              )
                            : SizedBox(),
                        searchController.searchData.advertiserList != null && searchController.searchData.advertiserList.length > 0
                            ? SizedBox(
                                height: 155,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: searchController.searchData.advertiserList.length,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.to(() => CategoryScreen(
                                              category: searchController.searchData.advertiserList[index],
                                            ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 12),
                                        child: SizedBox(
                                          width: 155,
                                          child: StoreOfferWidget(
                                            commonModel: CommonModel(
                                              name: searchController.searchData.advertiserList[index].name,
                                              image: '${global.appInfo.baseUrls.partnerImageUrl}/${searchController.searchData.advertiserList[index].image}',
                                              tagline: searchController.searchData.advertiserList[index].tagline,
                                              adId: searchController.searchData.advertiserList[index].id.toString(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //   width: 150,
                                      //   margin: EdgeInsets.only(right: 15),
                                      //   decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(10),
                                      //     color: Colors.white,
                                      //   ),
                                      //   child: Column(
                                      //     crossAxisAlignment: CrossAxisAlignment.center,
                                      //     mainAxisAlignment: MainAxisAlignment.center,
                                      //     children: [
                                      //       Padding(
                                      //         padding: const EdgeInsets.all(5.0),
                                      //         child: CustomImage(
                                      //           image: '${global.appInfo.baseUrls.partnerImageUrl}/${searchController.searchData.advertiserList[index].image}',
                                      //           height: 25,
                                      //           width: Get.width,
                                      //           fit: BoxFit.contain,
                                      //         ),
                                      //       ),
                                      //       // Image.asset(
                                      //       //   Images.amazon,
                                      //       //   height: 20,
                                      //       // ),
                                      //       Divider(
                                      //         height: 10,
                                      //         color: Colors.grey[400],
                                      //       ),
                                      //       Container(
                                      //         height: 60,
                                      //         alignment: Alignment.center,
                                      //         child: Text(
                                      //           searchController.searchData.advertiserList[index].name,
                                      //           textAlign: TextAlign.center,
                                      //           style: TextStyle(color: Colors.orange[700], fontSize: 12, fontWeight: FontWeight.w400),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    );
                                  },
                                ),
                              )
                            : SizedBox(),
                        searchController.searchData.commonList != null && searchController.searchData.commonList.length > 0
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Text(
                                  'in Offers & Deals',
                                  style: Get.theme.primaryTextTheme.subtitle2,
                                ),
                              )
                            : SizedBox(),
                        searchController.searchData.commonList != null && searchController.searchData.commonList.length > 0
                            ? SizedBox(
                                height: 155,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: searchController.searchData.commonList.length,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () async {
                                        if (searchController.searchData.commonList[index].adId != null && searchController.searchData.commonList[index].adId.isNotEmpty) {
                                          await homeController.getAdDetails(searchController.searchData.commonList[index].adId);
                                          Get.to(() => AdsDetailScreen(
                                                ads: homeController.ads,
                                                fromSeeMore: false,
                                              ));
                                        } else {
                                          await homeController.getCampignDetails(searchController.searchData.commonList[index].campaignId.toString());
                                          Get.to(() => CampaignDetailScreen(
                                                campaign: homeController.campaign,
                                                fromSeeMore: false,
                                              ));
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 15),
                                        child: SizedBox(
                                          width: 155,
                                          child: StoreOfferWidget(
                                            commonModel: searchController.searchData.commonList[index],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : SizedBox(),
                        searchController.searchData.offerList != null && searchController.searchData.offerList.length > 0
                            ? SizedBox(
                                height: 230,
                                child: ListView.builder(
                                  itemCount: searchController.searchData.offerList.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () async {
                                        await homeController.getOfferDetails(searchController.searchData.offerList[index].id.toString());
                                        Get.to(() => OfferDetailScreen(
                                              offer: homeController.offer,
                                              fromSeeMore: false,
                                            ));
                                      },
                                      child: AppWiseOfferShowWidget(
                                        offer: searchController.searchData.offerList[index],
                                        fromList: false,
                                      ),
                                    );
                                  },
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  )
            : SizedBox();
      }),
    );
  }
}
