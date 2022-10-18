import 'dart:convert';
import 'dart:developer';

import 'package:cashbackapp/models/appInfoModel.dart';
import 'package:cashbackapp/models/userModel.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:shared_preferences/shared_preferences.dart';

String appName = "CashBackApp";

String baseUrl = "https://okaydemo.com/cashback/api";
String imageUrl = "";
double lat = 21.1445031;
double lng = 73.0940926;
String currentLocation = '';
SharedPreferences sp;
UserModel currentUser = new UserModel();
AppInfo appInfo;
String timeFormat = '24';
String appDeviceId;
String languageCode = 'en';
bool isRTL = false;
Color defaultColor = Color(0xFF2D3D95);

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

Future share(String url) async {
  try {
    await FlutterShare.share(linkUrl: url, title: ' ', text: ' ');
  } catch (e) {
    print("Exception - global.dart - share():" + e.toString());
  }
}
