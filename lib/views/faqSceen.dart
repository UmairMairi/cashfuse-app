import 'package:cashbackapp/views/helpDetailSceen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controllers/commonController.dart';

class FaqScreen extends StatelessWidget {
  CommonController commonController = Get.find<CommonController>();

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
          AppLocalizations.of(context).faqs,
          style: Get.theme.primaryTextTheme.headline6.copyWith(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ),
          ),
        ],
      ),
      body: GetBuilder<CommonController>(builder: (controller) {
        return ListView.builder(
          padding: EdgeInsets.only(top: 5),
          shrinkWrap: true,
          itemCount: commonController.faqList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(
                  () => HelpDetailSceen(
                    faq: commonController.faqList[index],
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      commonController.faqList[index].ques,
                      style: Get.theme.primaryTextTheme.bodyText2.copyWith(color: Colors.grey[600]),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ],
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            width: Get.width,
            decoration: BoxDecoration(
              color: Get.theme.secondaryHeaderColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context).message_us,
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            height: 18,
            width: Get.width,
            color: Colors.black,
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context).powered_by,
              style: Get.theme.primaryTextTheme.caption.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
