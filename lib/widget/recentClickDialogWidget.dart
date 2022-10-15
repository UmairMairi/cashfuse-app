import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentClickDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ),
          ),
          Image.asset(
            Images.imoji,
            fit: BoxFit.contain,
            height: 100,
          ),
          Text(
            'All is well!',
            style: Get.theme.primaryTextTheme.headline6,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: Get.width / 2,
            height: 45,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            decoration: BoxDecoration(
              color: Get.theme.secondaryHeaderColor,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text(
              'SEE BEAT DEALS',
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: SizedBox()),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Image.asset(
              Images.curve,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
