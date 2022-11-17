import 'package:cashfuse/controllers/referEarnController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ReferEarnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReferEarnController>(builder: (controller) {
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
            AppLocalizations.of(context).refer_earn,
            style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    Images.refer,
                    height: 120,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context).refer_earn_desc,
                    textAlign: TextAlign.center,
                    style: Get.theme.primaryTextTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context).reffral_link,
              textAlign: TextAlign.center,
              style: Get.theme.primaryTextTheme.subtitle2,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Make your friends join ${global.appName} via your referral link below - No referral code needed',
              textAlign: TextAlign.center,
              style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              height: 50,
              width: Get.width - 50,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                global.appShareLink.isNotEmpty ? global.appShareLink : 'Link Url',
                style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (global.appShareLink.isNotEmpty) {
                  Clipboard.setData(ClipboardData(text: global.appShareLink)).then((value) {
                    Fluttertoast.showToast(
                      msg: 'Link Copied',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  });
                }
              },
              child: Text(
                AppLocalizations.of(context).tap_to_copy,
                textAlign: TextAlign.center,
                style: Get.theme.primaryTextTheme.bodySmall.copyWith(fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                alignment: Alignment.topCenter,
                child: InkWell(
                  onTap: () async {
                    if (global.appShareLink.isNotEmpty) {
                      await FlutterShare.share(
                        title: '${global.appName}',
                        text: 'I recently tried Cashfuse app & highly recommend it! You get extra Cashback on top of all retailer discounts.\n Try it out: ${global.appShareLink}',
                      ).then((value) {
                        if (value) {}
                      }).onError((error, stackTrace) {
                        return error;
                      });
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    //padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                    decoration: BoxDecoration(
                      color: Get.theme.secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context).invite_now,
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
