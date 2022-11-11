import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cashbackapp/models/appInfoModel.dart';
import 'package:cashbackapp/models/userModel.dart';
import 'package:cashbackapp/utils/date_converter.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String appName = "CashBack";

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

Future share(String link, String image) async {
  try {
    //await FlutterShare.shareFile(filePath: filePath, title: '$appName', text: url);
    // var response = await get(Uri.parse(image));
    // final documentDirectory = (await getExternalStorageDirectory()).path;
    // File imgFile = new File('$documentDirectory/flutter.png');
    // imgFile.writeAsBytesSync(response.bodyBytes);
    // Share.shareXFiles(
    //   [
    //     XFile(imgFile.path),
    //   ],
    //   subject: link,
    // );
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
    } else {
      await FlutterShare.share(title: '$appName', text: link).then((value) {}).catchError((e) {
        showCustomSnackBar(e.toString());
      });
    }

    //await Share.shareXFiles([XFile(path)], text: link);

  } catch (e) {
    print("Exception - global.dart - share():" + e.toString());
  }
}
