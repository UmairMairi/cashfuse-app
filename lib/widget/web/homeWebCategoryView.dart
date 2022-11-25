import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/views/categoryScreen.dart';
import 'package:cashfuse/widget/customImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:cashfuse/utils/global.dart' as global;

class HomeWebCategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (hm) {
      return SizedBox(
        height: 140,
        child: hm.isCategoryLoaded
            ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: hm.topCategoryList.length > 10 ? 10 : hm.topCategoryList.length,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => CategoryScreen(
                            category: hm.topCategoryList[index],
                          ));
                    },
                    child: Container(
                      width: 200,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            hm.topCategoryList[index].name.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomImage(
                            image: '${global.appInfo.baseUrls.categoryImageUrl}/${hm.topCategoryList[index].image}',
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 75,
                    child: Shimmer(
                      duration: Duration(seconds: 2),
                      child: Container(
                        width: 95,
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
