import 'dart:convert';

import 'package:cashbackapp/constants/appConstant.dart';
import 'package:cashbackapp/controllers/networkController.dart';
import 'package:cashbackapp/models/bankDetailsModel.dart';
import 'package:cashbackapp/services/apiHelper.dart';
import 'package:cashbackapp/widget/customLoader.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/utils/global.dart' as global;

class PaymentController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();

  BankDetailsModel bankDetails;
  BankDetailsModel amazonDetails;
  BankDetailsModel payTMDetails;
  BankDetailsModel upiDetails;

  @override
  void onInit() async {
    await init();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future init() async {
    try {
      if (global.sp.getString('amazon_pay') != null) {
        amazonDetails = BankDetailsModel.fromJson(json.decode(global.sp.getString("amazon_pay")));
      }
      if (global.sp.getString('payTM') != null) {
        payTMDetails = BankDetailsModel.fromJson(json.decode(global.sp.getString("payTM")));
      }
      if (global.sp.getString('upi') != null) {
        upiDetails = BankDetailsModel.fromJson(json.decode(global.sp.getString("upi")));
      }
      if (global.sp.getString('bank') != null) {
        bankDetails = BankDetailsModel.fromJson(json.decode(global.sp.getString("bank")));
      }
    } catch (e) {
      print("Exception - PaymentController.dart - init():" + e.toString());
    }
  }

  Future getAccountDetails() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getAccountDetails().then((response) {
          if (response.status == "1") {
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - PaymentController.dart - getAccountDetails():" + e.toString());
    }
  }

  Future addAmazonPayDetails(String amazonNo) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.addAmazonPayDetails(amazonNo).then((response) {
          Get.back();
          if (response.status == "1") {
            amazonDetails = response.data;
            global.sp.setString('amazon_pay', json.encode(amazonDetails.toJson()));
          } else {
            showCustomSnackBar(response.message);
          }
        });
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - PaymentController.dart - addAmazonPayDetails():" + e.toString());
    }
  }

  Future addPayTMDetails(String paytmNo) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.addPayTMDetails(paytmNo).then((response) {
          Get.back();
          if (response.status == "1") {
            payTMDetails = response.data;
            global.sp.setString('payTM', json.encode(payTMDetails.toJson()));
          } else {
            showCustomSnackBar(response.message);
          }
        });
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - PaymentController.dart - addPayTMDetails():" + e.toString());
    }
  }

  Future addUpiDetails(String upi) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.addUpiDetails(upi).then((response) {
          Get.back();
          if (response.status == "1") {
            upiDetails = response.data;
            global.sp.setString('upi', json.encode(upiDetails.toJson()));
          } else {
            showCustomSnackBar(response.message);
          }
        });
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - PaymentController.dart - addUpiDetails():" + e.toString());
    }
  }

  Future addBankDetails(String acHolderName, String accountNo, String bankName, String ifscCode) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.addBankDetails(acHolderName, accountNo, bankName, ifscCode).then((response) {
          Get.back();
          if (response.status == "1") {
            bankDetails = response.data;
            global.sp.setString('bank', json.encode(bankDetails.toJson()));
          } else {
            showCustomSnackBar(response.message);
          }
        });
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - PaymentController.dart - addBankDetails():" + e.toString());
    }
  }
}
