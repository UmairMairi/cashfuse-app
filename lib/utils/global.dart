import 'package:flutter/animation.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:shared_preferences/shared_preferences.dart';

String appName = "CashBackApp";

double lat = 21.1445031;
double lng = 73.0940926;
String currentLocation = '';
SharedPreferences sp;

String timeFormat = '24';
String appDeviceId;
String languageCode = 'en';
bool isRTL = false;
Color defaultColor = Color(0xFF2D3D95);

Future share(String url) async {
  try {
    await FlutterShare.share(linkUrl: url, title: ' ', text: ' ');
  } catch (e) {
    print("Exception - global.dart - share():" + e.toString());
  }
}
