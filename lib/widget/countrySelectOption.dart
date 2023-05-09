import 'package:cashfuse/controllers/splashController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SplashController splashController = Get.find<SplashController>();

Widget countrySelectWidget() {
  return WillPopScope(
    onWillPop: () async {
      return null;
    },
    child: FutureBuilder(
        builder: (context1, snapshot) {
          return SizedBox();
        },
        future: Future.delayed(Duration.zero).then((value) {
          return Get.dialog(
            Dialog(
              alignment: Alignment.topRight,
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.only(top: 50, right: 20),
              child: SizedBox(
                width: Get.width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // alignment: Alignment.topCenter,
                  // clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () async {
                          Get.back();
                        },
                        child: CircleAvatar(
                          radius: 15,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 20,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) =>
                          Container(
                        margin: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: global.appInfo.countries.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(global.appInfo
                                          .countries[index].countryName),
                                    ),
                                    Radio(
                                      groupValue: global.country,
                                      value: global.appInfo.countries[index],
                                      onChanged: (value) {
                                        if (value != null) {
                                          global.country =
                                              value;
                                          global.appInfo.countries
                                              .map((e) => e.isSelected = false)
                                              .toList();
                                          global.appInfo.countries[index]
                                              .isSelected = true;

                                          setState(() {});
                                        }
                                      },
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 0,
                                  thickness: 0.5,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    // Positioned(
                    //    top: !global.getPlatFrom() ? -50 : 10,
                    //   // right: -7,
                    //   child: InkWell(
                    //     onTap: () async {
                    //       Get.back();
                    //     },
                    //     child: CircleAvatar(
                    //       radius: 15,
                    //       child: Icon(
                    //         Icons.close,
                    //         color: Colors.black,
                    //         size: 20,
                    //       ),
                    //       backgroundColor: Colors.grey[400],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            barrierDismissible: false,
          ).whenComplete(() {
            global.country = global.appInfo.countries.firstWhere((element) => element.isSelected);
          });
        })),
  );
}
