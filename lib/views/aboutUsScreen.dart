// ignore_for_file: must_be_immutable

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/commonController.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutUsScreen extends StatelessWidget {
  CommonController commonController = Get.find<CommonController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetPlatform.isWeb
          ? WebTopBarWidget()
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
                AppLocalizations.of(context).about_us,
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
              ),
            ),
      body: GetBuilder<CommonController>(builder: (controller) {
        return Center(
          child: Container(
            padding: GetPlatform.isWeb ? EdgeInsets.all(15) : EdgeInsets.zero,
            width: GetPlatform.isWeb ? AppConstants.WEB_MAX_WIDTH / 2 : AppConstants.WEB_MAX_WIDTH,
            color: Colors.white,
            height: Get.height,
            margin: GetPlatform.isWeb ? EdgeInsets.zero : EdgeInsets.all(10).copyWith(bottom: 0),
            child: SingleChildScrollView(
              child: HtmlWidget(
                commonController.aboutUs,
              ),
            ),
          ),
        );
      }),
    );
  }
}
