import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel category;
  CategoryScreen({this.category});

  @override
  Widget build(BuildContext context) {
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
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: RotatedBox(
                          quarterTurns: -45,
                          child: ClipPath(
                            clipper: MultiplePointsClipper(Sides.bottom, heightOfPoint: 10, numberOfPoints: 1),
                            child: Container(
                              width: 20,
                              height: 135,
                              decoration: BoxDecoration(
                                  color: Colors.red[600],
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                  )),
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(top: 5),
                              child: RotatedBox(
                                quarterTurns: 45,
                                child: Text(
                                  'GREAT INDIAN FESTIVAL',
                                  textAlign: TextAlign.center,
                                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Images.amazon,
                          height: 32,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.orange[700],
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          'EARN UPTO 8% REWARDS >',
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        height: 45,
                        alignment: Alignment.center,
                        child: Text(
                          'Rewards Rates & Terms',
                          textAlign: TextAlign.center,
                          style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                            color: Colors.teal,
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
