import 'package:flutter/animation.dart';
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
