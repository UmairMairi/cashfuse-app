// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:cashfuse/controllers/homeController.dart';
import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/models/countryModel.dart';
import 'package:cashfuse/services/apiHelper.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  NetworkController networkController = Get.put(NetworkController());

  APIHelper apiHelper = new APIHelper();

  @override
  void onInit() {
    super.onInit();
  }

  Future getLocationPermission() async {
    try {
      if (GetPlatform.isAndroid) {
        PermissionStatus permissionStatus;
        permissionStatus = await Permission.location.status;
        if (permissionStatus.isDenied) {
          permissionStatus = await Permission.location.request();
        }
        if (permissionStatus.isGranted) {
          await getCurrentLocation();
        }
      } else if (GetPlatform.isIOS || GetPlatform.isWeb) {
        LocationPermission s = await Geolocator.checkPermission();
        if (s == LocationPermission.denied ||
            s == LocationPermission.deniedForever) {
          s = await Geolocator.requestPermission();
        }
        if (s != LocationPermission.denied &&
            s != LocationPermission.deniedForever) {
          await getCurrentLocation();
        }
      }
    } catch (e) {
      print("Exceptioin - LocationController.dart - _getLocationPermission():" +
          e.toString());
    }
  }

  getCurrentLocation() async {
    try {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best)
          .then((Position position) async {
        String _country = '';
        if (GetPlatform.isWeb) {
          await apiHelper
              .getAddressFromGeocode(position.latitude, position.longitude)
              .then((response) {
            if (response != null) {
              if (response.data['address'] != null &&
                  response.data['address']['country'] != null) {
                _country = response.data['address']['country'];
              } else {
                _country = '';
              }
            }
          });
        } else {
          final placemarks = await placemarkFromCoordinates(
              position.latitude, position.longitude);
          _country = placemarks[0].country!;
        }

        List<CountryModel> _tList = global.appInfo.countries!
            .where((element) => element.countryName == _country)
            .toList();
        if (_tList != null && _tList.length > 0) {
          global.country =
              _tList.firstWhere((element) => element.countryName == _country);
          _tList.map((e) => e.isSelected = true).toList();
          global.countrySlug = _tList
              .firstWhere((element) => element.countryName == _country)
              .slug!;

          await global.sp!
              .setString('country', json.encode(global.country!.toJson()));
          await global.sp!.setString('countrySlug', global.countrySlug);
        } else {
          global.showCountryPopUp = true;
        }

        await Get.find<HomeController>().init();
        update();
      }).catchError((e) {
        print("Exceptioin - LocationController.dart - getCurrentLocation():" +
            e.toString());
      });
    } catch (e) {
      print("Exceptioin - LocationController.dart - getCurrentLocation():" +
          e.toString());
    }
  }
}
