import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/models/commonModel.dart';
import 'package:cashbackapp/views/categoryScreen.dart';
import 'package:cashbackapp/widget/storeOfferWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreOfferListScreen extends StatelessWidget {
  final List<CategoryModel> list;
  final String title;
  StoreOfferListScreen({this.title, this.list});

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
            title,
            style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
          ),
          itemCount: list.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(10).copyWith(top: 20),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => CategoryScreen(
                      category: list[index],
                    ));
              },
              child: StoreOfferWidget(
                commonModel: CommonModel(
                  name: list[index].name,
                  image: list[index].image,
                  tagline: list[index].tagline,
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
