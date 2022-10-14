import 'package:cashbackapp/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RetailerCategoryScreen extends StatelessWidget {
  @override
  Widget build(Object context) {
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
          'Retailer Category',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (homeController) {
          return ExpansionTile(
            backgroundColor: Colors.transparent,
            initiallyExpanded: false,
            onExpansionChanged: (value) {
              homeController.setCategoryExpand(value);
            },
            trailing: Icon(
              homeController.isCategoryExpand ? Icons.minimize : Icons.add,
              color: Colors.black54,
              size: 20,
            ),
            title: Text(
              'data',
              style: Get.theme.primaryTextTheme.bodyText1.copyWith(fontWeight: FontWeight.w300),
            ),
            childrenPadding: EdgeInsets.only(left: 30),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(3, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'data $index',
                    style: Get.theme.primaryTextTheme.bodyText1.copyWith(fontWeight: FontWeight.w300),
                  ),
                  index == 2
                      ? SizedBox(
                          height: 10,
                        )
                      : Divider(),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
