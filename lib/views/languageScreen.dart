// ignore_for_file: invalid_use_of_protected_member

import 'package:cashfuse/controllers/localizationController.dart';
import 'package:cashfuse/views/bottomNavigationBarScreen.dart';

import 'package:flutter/material.dart';
import 'package:cashfuse/utils/global.dart' as global;

import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Get.to(
          () => BottomNavigationBarScreen(pageIndex: 4),
          routeName: 'home',
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () async {
              Get.to(
                () => BottomNavigationBarScreen(pageIndex: 4),
                routeName: 'home',
              );
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: GetBuilder<LocalizationController>(
            builder: (controller) => Text(
              'Language',
              style: Get.theme.primaryTextTheme.titleSmall!
                  .copyWith(color: Colors.white),
            ).translate(),
          ),
        ),
        body: GetBuilder<LocalizationController>(
          builder: (localizationController) {
            return ListView.builder(
                itemCount: global.appInfo.languages!.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                      children: [
                        RadioListTile(
                          onChanged: (val) {
                            localizationController.setLanguage(val!);
                            localizationController.refresh();
                          },
                          value: global.appInfo.languages![index].languageCode,
                          groupValue: localizationController.languageCode,
                          title: Text(
                              global.appInfo.languages![index].languageName!),
                        ),
                        index != global.appInfo.languages!.length - 1
                            ? Divider(
                                color: Color(0xFFDFE8EF),
                              )
                            : SizedBox(),
                      ],
                    ));
          },
        ),
      ),
    );
  }
}
