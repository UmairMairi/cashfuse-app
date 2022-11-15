import 'package:cashbackapp/controllers/commonController.dart';
import 'package:cashbackapp/models/faqModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

class HelpDetailSceen extends StatelessWidget {
  final FaqModel faq;
  HelpDetailSceen({this.faq});

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
          faq.ques,
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: GetBuilder<CommonController>(builder: (controller) {
        return Container(
          color: Colors.white,
          height: Get.height,
          margin: EdgeInsets.all(10).copyWith(bottom: 0),
          child: SingleChildScrollView(
            child: HtmlWidget(
              faq.ans,
            ),
          ),
        );
      }),
    );
  }
}
