import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:cashfuse/utils/global.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';

import '../views/bottomNavigationBarScreen.dart';

class LoginAndSignInProvider with ChangeNotifier
{


  String deviceName = "";
  String deviceVersion = "";
  String identifier = "";

  Future getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceName = build.model;
        deviceVersion = build.version.toString();
        identifier = build.androidId; //UUID for Android
        notifyListeners();
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceName = data.name;
        deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
        notifyListeners();
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
    print(deviceName.toString());
    print(deviceVersion.toString());
    print("identifier ${identifier.toString()}");
  }

  Map _registerResponse={};
  Map get  registerResponse=>_registerResponse;
  bool _loader=false;
  bool get loader=>_loader;
  Future register(String name,String mobile,String password,String email) async
  {
    getDeviceDetails();
    _loader=true;
    notifyListeners();
    SharedPreferences _sharedPreference=await SharedPreferences.getInstance();
    print('ajksndkjs');
    print('${identifier}');
    try {
        http.Response response;
        var url = Uri.parse(
          // '${global.baseUrl}${AppConstants.ADMITEDOFFERS_DETAIL}?id=4'
          //ApiCollection.workshopDetail+slug,
          "https://cash.codefuse.org/newcashfuse/api/auth/register"
        );
        var apiBody={
        "name":"$name",
        "phone":"$mobile",
        "email":"$email",
    "device_id":"$identifier",
  "pasword":"$password"
        };
        print('ajhbsdh');
        print('${url}');
        response = await http.post(url,
          body: apiBody
        );
        print('${response.statusCode}');
        print('${response.body}');
      if (response.statusCode == 200) {
          Map apiResponse = jsonDecode(response.body);
          _registerResponse=apiResponse;
          if(_registerResponse['status'].toString()=="1")
            {
              _sharedPreference.setString("user_id", _registerResponse['id']['id'].toString());
              _sharedPreference.setString("user_name", _registerResponse['id']['name'].toString());
              _sharedPreference.setString("user_email", _registerResponse['id']['email'].toString());
              _sharedPreference.setString("user_phone", _registerResponse['id']['phone'].toString());
              _sharedPreference.setString("user_token", _registerResponse['data']['token'].toString());
              Fluttertoast.showToast(msg: "${_registerResponse['message']}");
              _loader=false;
              notifyListeners();
              Get.to(() => BottomNavigationBarScreen(), routeName: 'home');
              notifyListeners();


            }
          return _registerResponse;
          notifyListeners();
        } else {
        Map apiResponse = jsonDecode(response.body);
        Fluttertoast.showToast(msg: "${apiResponse['errors'][0]['message']}");
        _loader=false;
        notifyListeners();
        return {
            'status':0
          };
        }
      }on Exception catch (e) {
        print(e);
        _loader=false;
        notifyListeners();
        return {
          'status':0
        };
      }

  }

  Map _loginResponse={};
  Map  get loginResponse=> _loginResponse;

  Future loginMethod(String email,String password) async
  {
    _loader=true;
    notifyListeners();
    SharedPreferences _sharedPreference=await SharedPreferences.getInstance();

    try {
      http.Response response;
      var url = Uri.parse(
        // '${global.baseUrl}${AppConstants.ADMITEDOFFERS_DETAIL}?id=4'
        //ApiCollection.workshopDetail+slug,
        "https://cash.codefuse.org/newcashfuse/api/auth/login"
      );
      var apiBody={
        "email":"$email",
        "password":"$password"
      };
      print('ajhbsdh');
      print('${url}');
      response = await http.post(url,
          body: apiBody
      );
      print('${response.statusCode}');
      print('${response.body}');
      if (response.statusCode == 200) {
        Map apiResponse = jsonDecode(response.body);
        _loginResponse=apiResponse;
        if(_loginResponse['status'].toString()=="1")
        {

          // global.currentUser = _loginResponse;
          //
          // global.sp.setString('currentUser', json.encode(global.currentUser.toJson()));

          _sharedPreference.setString("user_id", _loginResponse['user_data']['id'].toString());
          _sharedPreference.setString("user_name", _loginResponse['user_data']['name'].toString());
          _sharedPreference.setString("user_email", _loginResponse['user_data']['email'].toString());
          _sharedPreference.setString("user_phone", _loginResponse['user_data']['phone'].toString());
          _sharedPreference.setString("user_token", _loginResponse['token'].toString());

          print('ajsbhj');
          print('${_sharedPreference.getString("user_token")}');
          print('${_sharedPreference.getString("user_phone")}');
          print('${_sharedPreference.getString("user_name")}');
          print('${_sharedPreference.getString("user_id")}');

          Fluttertoast.showToast(msg: "${_loginResponse['message']}");
          _loader=false;
          notifyListeners();
          Get.to(() => BottomNavigationBarScreen(), routeName: 'home');
          notifyListeners();
          return _loginResponse;
        }
        else
          {
            Fluttertoast.showToast(msg: "${_loginResponse['message']}");
            _loader=false;
            notifyListeners();

          }
        notifyListeners();
      } else {
        _loader=false;
        notifyListeners();
        return {
          'status':0
        };
      }
    }on Exception catch (e) {
      print(e);
      _loader=false;
      notifyListeners();
      return {
        'status':0
      };
    }

  }

}