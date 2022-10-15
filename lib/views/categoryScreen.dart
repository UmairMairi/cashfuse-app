import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/views/offerDetailScreen.dart';
import 'package:cashbackapp/widget/storeOfferWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel category;
  CategoryScreen({this.category});

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
      body: Column(
        children: [
          Container(
            height: 90,
            alignment: Alignment.center,
            color: Colors.blue[800],
            child: Text(
              category != null ? '${category.name}(5)' : '',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
            ),
          ),
          DefaultTabController(
            length: 4,
            child: TabBar(
              indicatorWeight: 2.5,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  text: 'Popular',
                ),
                Tab(
                  text: 'A-Z',
                ),
                Tab(
                  text: 'Percent',
                ),
                Tab(
                  text: 'Amount',
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.all(10).copyWith(top: 30),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => OfferDetailScreen());
                  },
                  child: StoreOfferWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
