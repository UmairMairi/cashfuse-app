// ignore_for_file: cancel_subscriptions, unused_field

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connectionStatus = GetPlatform.isWeb ? 1.obs : 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void onInit() async {
    await initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((event) => updateConnectivity,);
    super.onInit();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = (await _connectivity.checkConnectivity()).first;
      return updateConnectivity(result);
    } catch (e) {
      print("Exception - NetworkController.dart - initConnectivity():" +
          e.toString());
    }
  }

  updateConnectivity(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;

      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.ethernet:
        connectionStatus.value = 3;
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        Get.snackbar('Netowrk Error', 'No internet connectio over there',
            snackPosition: SnackPosition.BOTTOM);
        break;

      default:
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
