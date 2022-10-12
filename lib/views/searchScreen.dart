import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.find<BottomNavigationController>().setBottomIndex(0);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: TextFormField(
          cursorColor: Colors.orange,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'What do you want to buy today?',
            hintStyle: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white.withOpacity(0.4)),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            child: Text(
              'Trending Searches:',
              style: Get.theme.primaryTextTheme.subtitle2,
            ),
          ),
          Divider(
            height: 0,
            color: Colors.grey[400],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'in Stores',
              style: Get.theme.primaryTextTheme.subtitle2,
            ),
          ),
          SizedBox(
            height: 110,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.amazon,
                        height: 20,
                      ),
                      Divider(
                        height: 10,
                        color: Colors.grey[400],
                      ),
                      Container(
                        height: 60,
                        alignment: Alignment.center,
                        child: Text(
                          'EARN 30% CASHBACK NOW >',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.orange[700], fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //   child: Text(
          //     'in Products',
          //     style: Get.theme.primaryTextTheme.subtitle2,
          //   ),
          // ),
        ],
      ),
    );
  }
}
