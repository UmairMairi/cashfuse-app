import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/views/dealDetailScreen.dart';
import 'package:cashbackapp/widget/storeOfferWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  final CategoryModel category;
  CategoryScreen({this.category, this.title});

  @override
  Widget build(BuildContext context) {
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
          category != null ? category.name : '',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
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

            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: category.commonList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => DealDetailScreen());
                  },
                  child: StoreOfferWidget(
                    commonModel: category.commonList[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
