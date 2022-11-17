import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cashfuse/models/appInfoModel.dart';
import 'package:cashfuse/models/userModel.dart';
import 'package:cashfuse/utils/date_converter.dart';
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String appName = "Cashfuse";

String baseUrl = "https://okaydemo.com/cashback/api";

SharedPreferences sp;
UserModel currentUser = new UserModel();
AppInfo appInfo = new AppInfo();
String timeFormat = '24';
String appDeviceId;
bool isRTL = false;
List<String> clickedList = [];

String isBannerDate = DateConverter.dateTimeToDateOnly(DateTime.now());
bool isBannerShow = false;
String bannerImage = '';
String languageCode = 'en';
String referralUserId = '';
String appShareContent = "I recently tried Cashfuse app & highly recommend it! You get extra Cashback on top of all retailer discounts. Download the app from below link.";
String appShareLink = '';
FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
int totalJoinedCount = 0;

//Api Header
Future<Map<String, String>> getApiHeaders(bool authorizationRequired) async {
  Map<String, String> apiHeader = new Map<String, String>();

  if (authorizationRequired) {
    sp = await SharedPreferences.getInstance();
    if (sp.getString("currentUser") != null) {
      UserModel currentUser = UserModel.fromJson(json.decode(sp.getString("currentUser")));
      log("Token  == Bearer " + currentUser.token + 'id -- ' + currentUser.id.toString());
      apiHeader.addAll({"Authorization": "Bearer " + currentUser.token});
    }
  }

  apiHeader.addAll({"Content-Type": "application/json"});
  apiHeader.addAll({"Accept": "*/*"});
  print(apiHeader);
  return apiHeader;
}

Future share(String link, String image, String title) async {
  try {
    if (image.isNotEmpty) {
      final uri = Uri.parse(image);
      final response = await http.get(uri);
      final bytes = response.bodyBytes;
      final temp = await getExternalStorageDirectory();
      final path = '${temp.path}/image.jpg';
      File(path).writeAsBytesSync(bytes);
      await FlutterShare.shareFile(filePath: path, title: '$appName', text: link).then((value) {}).catchError((e) {
        showCustomSnackBar(e.toString());
      });
    } else if (title.isNotEmpty) {
      final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: 'https://cashfuse.page.link',
        link: Uri.parse('https://cashfuse.page.link/'),
        androidParameters: AndroidParameters(
          packageName: 'com.cashfuse.app',
          minimumVersion: 1,
        ),
      );
      Uri url;
      final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters, shortLinkType: ShortDynamicLinkType.short);
      url = shortLink.shortUrl;
      await FlutterShare.share(title: '$appName', text: title, linkUrl: url.toString()).then((value) {}).catchError((e) {
        showCustomSnackBar(e.toString());
      });
    } else {
      await FlutterShare.share(title: '$appName', linkUrl: link).then((value) {}).catchError((e) {
        showCustomSnackBar(e.toString());
      });
    }
  } catch (e) {
    print("Exception - global.dart - share():" + e.toString());
  }
}

Future referAndEarn() async {
  try {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://cashfuse.page.link',
      link: Uri.parse('https://cashfuse.page.link/referEarn?userId=${currentUser.id}'),
      androidParameters: AndroidParameters(
        packageName: 'com.cashfuse.app',
        minimumVersion: 1,
      ),
    );
    Uri url;
    final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters, shortLinkType: ShortDynamicLinkType.short);
    url = shortLink.shortUrl;
    appShareLink = url.toString();
  } catch (e) {
    print("Exception - global.dart - referAndEarn():" + e.toString());
  }
}
