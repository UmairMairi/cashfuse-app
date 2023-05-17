import 'dart:convert';

import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/models/countryModel.dart';
import 'package:cashfuse/services/apiHelper.dart';
import 'package:cashfuse/widget/countrySelectOption.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cashfuse/utils/global.dart' as global;

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
      } else if (GetPlatform.isIOS) {
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
        final placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        String _country = placemarks[0].country!;

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
        homeController.init();
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

  // Future<dynamic> getAddressFromGeocode() async {
  //   try {
  //     if (networkController.connectionStatus.value == 1 ||
  //         networkController.connectionStatus.value == 2) {
  //       await apiHelper.getAddressFromGeocode().then((response) {
  //         if (response.status == "OK") {
  //           global.currentLocation = response.recordList['results'][0]
  //                   ['formatted_address']
  //               .toString();
  //           update();
  //           global.sp!.setString('currentLocation', global.currentLocation);
  //         } else {
  //           showCustomSnackBar(response.message);
  //         }
  //       });
  //     } else {
  //       showCustomSnackBar(AppConstant.NO_INTERNET);
  //     }
  //   } catch (e) {
  //     print(
  //         "Exception -  base.dart - getLocationFromAddress():" + e.toString());
  //     return null;
  //   }
  // }

  Future getAddressFromGeocode() async {
    // addressResult = [];
    // final coordinates = new Coordinates(latitude, longitude);
    // final placemarks = await placemarkFromCoordinates(global.lat!, global.lng!);
    // global.currentLocation = placemarks[0].street == "" ||
    //         placemarks[0].name == ""
    //     ? "${placemarks[0].locality},${placemarks[0].administrativeArea},${placemarks[0].country}"
    //     : "${placemarks[0].street},${placemarks[0].name},${placemarks[0].locality},${placemarks[0].administrativeArea},${placemarks[0].country}";
    // // await getAreaFromPincode(placemarks[0].postalCode!);
    // finalAddress = placemarks[0].country == "India"
    //     ? address
    //     : "No restaurants available at this location at the moment. please select a different location";
    // // await getAdderessDataFromPostalCode2(placemarks[0].postalCode!);

    // lat2 = latitude;
    // lng2 = longitude;
    // setState(() {});

    // global.pincode = placemarks[0].postalCode!;
    update();
    // await getRegionId();
  }

  // Future getRegionId() async {
  //   try {
  //     if (networkController.connectionStatus.value == 1 ||
  //         networkController.connectionStatus.value == 2) {
  //       await apiHelper.getRegionId().then((response) {
  //         if (response.statusCode == "200") {
  //           global.regionId = response.recordList['data'];
  //           update();
  //           global.sp!.setString('regionId', global.regionId.toString());
  //         } else {
  //           showCustomSnackBar(response.message);
  //         }
  //       });
  //     } else {
  //       showCustomSnackBar(AppConstant.NO_INTERNET);
  //     }
  //   } catch (e) {
  //     print("Exception - LocationController.dart - getRegionId():" +
  //         e.toString());
  //   }
  // }
}
