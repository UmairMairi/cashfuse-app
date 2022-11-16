// ignore_for_file: must_be_immutable

import 'package:cashfuse/views/helpDetailSceen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controllers/commonController.dart';

class FaqScreen extends StatelessWidget {
  CommonController commonController = Get.find<CommonController>();
  final fSeachNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommonController>(builder: (controller) {
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
          title: commonController.isSearch
              ? TextFormField(
                  controller: commonController.searchString,
                  focusNode: fSeachNode,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What are you looking for?',
                    hintStyle: Get.theme.primaryTextTheme.caption.copyWith(color: Colors.grey, fontSize: 11),
                  ),
                  onFieldSubmitted: (value) {
                    commonController.faqLocalSearch();
                  },
                )
              : Text(
                  AppLocalizations.of(context).faqs,
                  style: Get.theme.primaryTextTheme.headline6.copyWith(color: Colors.white),
                ),
          actions: [
            InkWell(
              onTap: () {
                if (commonController.isSearch) {
                  commonController.searchShow(false);
                } else {
                  commonController.searchShow(true);
                  FocusScope.of(context).requestFocus(fSeachNode);
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        body: commonController.isfaqLoaded
            ? commonController.faqList != null && commonController.faqList.length > 0
                ? ListView.builder(
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
                  )
                : Center(
                    child: Text(AppLocalizations.of(context).no_data_found),
                  )
            : Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}
