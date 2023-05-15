// ignore_for_file: must_be_immutable

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/commonController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/widget/drawerWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';

class AboutUsScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CommonController commonController = Get.find<CommonController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: global.getPlatFrom() ? DrawerWidget() : null,
      appBar: global.getPlatFrom()
          ? WebTopBarWidget(
              scaffoldKey: scaffoldKey,
            )
          : AppBar(
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
                'About Us',
                style: Get.theme.primaryTextTheme.titleSmall
                    .copyWith(color: Colors.white),
              ).translate(),
            ),
      body: GetBuilder<CommonController>(builder: (controller) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(15),
            width: global.getPlatFrom()
                ? AppConstants.WEB_MAX_WIDTH / 2
                : AppConstants.WEB_MAX_WIDTH,
            color: Colors.white,
            height: Get.height,
            margin: global.getPlatFrom()
                ? EdgeInsets.zero
                : EdgeInsets.all(10).copyWith(bottom: 0),
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: global.translatedText(commonController.aboutUs),
                  builder: (context, snapShot) {
                    return HtmlWidget(
                      snapShot.data != null ? snapShot.data : '',
                    );
                  }),
            ),
            // SingleChildScrollView(
            //   child: HtmlWidget(
            //     commonController.aboutUs,
            //   ),
            // ),
          ),
        );
      }),
    );
  }
}
