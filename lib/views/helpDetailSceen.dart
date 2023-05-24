import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/commonController.dart';
import 'package:cashfuse/models/faqModel.dart';
import 'package:cashfuse/widget/translationTextWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:google_translator/google_translator.dart';

class HelpDetailSceen extends StatelessWidget {
  final FaqModel faq;
  HelpDetailSceen({required this.faq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: global.getPlatFrom()
          ? WebTopBarWidget()
          : AppBar(
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
              title: GetPlatform.isWeb
                  ? TranslationTextWidget(
                      text: faq.ques!,
                      style: Get.theme.primaryTextTheme.titleSmall!
                          .copyWith(color: Colors.white),
                    )
                  : Text(
                      faq.ques!,
                      style: Get.theme.primaryTextTheme.titleSmall!
                          .copyWith(color: Colors.white),
                    ).translate(),
            ),
      body: GetBuilder<CommonController>(builder: (controller) {
        return Center(
          child: Container(
            width: global.getPlatFrom()
                ? AppConstants.WEB_MAX_WIDTH / 3
                : AppConstants.WEB_MAX_WIDTH,
            color: Colors.white,
            height: Get.height,
            margin: global.getPlatFrom()
                ? EdgeInsets.zero
                : EdgeInsets.all(10).copyWith(bottom: 0),
                padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: FutureBuilder(
                initialData: '',
                future: global.translatedText(faq.ans!),
                builder: (context, snapshot) {
                  return HtmlWidget(
                    snapshot.data!,
                    textStyle: global.getPlatFrom()
                        ? Get.theme.primaryTextTheme.titleSmall
                        : null,
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
