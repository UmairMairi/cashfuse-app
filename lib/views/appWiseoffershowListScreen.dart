import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/views/filterScreen.dart';
import 'package:cashbackapp/views/offerDetailScreen.dart';
import 'package:cashbackapp/widget/appWiseoffershowWidget.dart';
import 'package:cashbackapp/widget/sortDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppWiseOfferShowListScreen extends StatelessWidget {
  AppWiseOfferShowListScreen();

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
            '',
            style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => FilterScreen(),
                        transition: Transition.downToUp,
                        duration: Duration(milliseconds: 600),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.filter,
                          size: 15,
                        ),
                        Text(
                          ' Filters',
                          style: Get.theme.primaryTextTheme.subtitle2.copyWith(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 25,
                    color: Colors.grey[400],
                    margin: EdgeInsets.symmetric(vertical: 10),
                  ),
                  InkWell(
                    onTap: () {
                      Get.dialog(SortDialogWidget());
                    },
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.sort,
                          size: 15,
                        ),
                        Text(
                          ' Sort',
                          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.orange[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: homeController.newFlashOfferList.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(10).copyWith(top: 20),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      await homeController.getOfferDetails(
                        homeController.newFlashOfferList[index].id.toString(),
                      );
                      Get.to(() => OfferDetailScreen(
                            offer: homeController.offer,
                          ));
                    },
                    child: AppWiseOfferShowWidget(
                      isTimeShow: false,
                      offer: homeController.newFlashOfferList[index],
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
