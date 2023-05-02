// ignore_for_file: invalid_use_of_protected_member

import 'package:cashfuse/controllers/localizationController.dart';
import 'package:cashfuse/l10n/l10n.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () async {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: GetBuilder<LocalizationController>(
          builder: (controller) => Text(
            'Language',
            style: Get.theme.primaryTextTheme.titleSmall
                .copyWith(color: Colors.white),
          ).translate(),
        ),
      ),
      body: GetBuilder<LocalizationController>(
        builder: (localizationController) {
          return ListView.builder(
              itemCount: L10n.languageListName.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Column(
                    children: [
                      RadioListTile(
                        onChanged: (val) {
                          //  global.languageCode = val;
                          //  localizationController.update();
                          // final provider = Provider.of<LocaleProvider>(
                          //     context,
                          //     listen: false);
                          // locale = Locale(L10n.all[index].languageCode);
                          // provider.setLocale(locale);
                          // global.languageCode = locale.languageCode;

                          localizationController.setLanguage(val);
                          localizationController.refresh();
                        },
                        value: L10n.all[index].languageCode,
                        groupValue: localizationController.languageCode,
                        title: Text(L10n.languageListName[index]),
                      ),
                      index != L10n.languageListName.length - 1
                          ? Divider(
                              color: Color(0xFFDFE8EF),
                            )
                          : SizedBox(),
                    ],
                  ));
        },
      ),
    );
  }
}
