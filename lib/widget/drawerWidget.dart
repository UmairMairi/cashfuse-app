import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Get.width - 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            color: Get.theme.primaryColor,
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: Get.theme.primaryTextTheme.bodySmall.copyWith(color: Colors.white),
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              Icons.store_outlined,
              color: Get.theme.iconTheme.color,
            ),
            title: Text(
              'Higest Cashback Stores',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(letterSpacing: -0.2),
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              Icons.edit_calendar_sharp,
              color: Get.theme.iconTheme.color,
            ),
            title: Text(
              'Retailers By Category',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(letterSpacing: -0.2),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              Icons.volume_down_outlined,
              color: Get.theme.iconTheme.color,
            ),
            title: Text(
              'Top Product Deals',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(letterSpacing: -0.2),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(
                  Icons.man,
                  color: Colors.black.withOpacity(0.7),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Men Fashion',
                  style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(
                  Icons.woman_outlined,
                  color: Colors.black.withOpacity(0.7),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Women Fashion',
                  style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(
                  Icons.man,
                  color: Colors.black.withOpacity(0.7),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Men Shoes',
                  style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(
                  Icons.woman_outlined,
                  color: Colors.black.withOpacity(0.7),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Women Shoes',
                  style: Get.theme.primaryTextTheme.bodyMedium.copyWith(
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
