import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/views/categoryScreen.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllCategoriesScreen extends StatelessWidget {
  HomeController homeController = Get.find<HomeController>();

  void paginateTask() {
    homeController.scrollController.addListener(() async {
      if (homeController.scrollController.position.pixels == homeController.scrollController.position.maxScrollExtent) {
        homeController.isMoreDataAvailable.value = true;
        print('Reached end');
        await homeController.getTopCategories();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    paginateTask();
    return Scaffold(
      appBar: AppBar(
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
          AppLocalizations.of(context).all_categories,
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return GridView.builder(
          controller: controller.scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
          ),
          itemCount: controller.topCategoryList.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemBuilder: (context, index) {
            return controller.isMoreDataAvailable.value == true && controller.isAllDataLoaded.value && controller.topCategoryList.length - 1 == index
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : InkWell(
                    onTap: () async {
                      Get.to(() => CategoryScreen(
                            category: controller.topCategoryList[index],
                          ));
                    },
                    child: Container(
                      //width: 95,
                      //margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index == 0 ? Colors.blue[700] : Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.topCategoryList[index].name.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: index == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomImage(
                            image: '${global.appInfo.baseUrls.categoryImageUrl}/${controller.topCategoryList[index].image}',
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  );
          },
        );
      }),
    );
  }
}
