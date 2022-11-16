import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/models/userModel.dart';
import 'package:cashfuse/services/apiHelper.dart';
import 'package:cashfuse/views/bottomNavigationBarScreen.dart';
import 'package:cashfuse/views/otpVerificationScreen.dart';
import 'package:cashfuse/widget/customLoader.dart';
import 'package:cashfuse/widget/customSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashfuse/utils/global.dart' as global;

class AuthController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();
  String coutryCode;
  var otp = TextEditingController();
  final FocusNode phoneFocus = FocusNode();
  var contactNo = TextEditingController();
  var name = TextEditingController();
  var email = TextEditingController();
  int seconds = 60;
  Timer timer;
  String status;

  @override
  void onInit() async {
    coutryCode = '+91';
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future logout() async {
    try {
      global.sp.remove('currentUser');
      global.currentUser = new UserModel();
      contactNo.clear();

      update();
    } catch (e) {
      print("Exception - authController.dart - logout():" + e.toString());
    }
  }

  Future loginOrRegister() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        if (contactNo.text.isNotEmpty) {
          if (contactNo.text.length >= 7) {
            Get.dialog(CustomLoader(), barrierDismissible: false);
            await apiHelper.loginOrRegister(coutryCode + contactNo.text).then((response) async {
              if (response.statusCode == 200) {
                await sendOTP();
              } else {
                Get.back();
                showCustomSnackBar(response.message);
              }
            });
          } else {
            showCustomSnackBar('Please enter valid number.');
          }
        } else {
          showCustomSnackBar('Please enter number.');
        }
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }

      update();
    } catch (e) {
      Get.back();
      print("Exception - authController.dart - loginOrRegister():" + e.toString());
    }
  }

  Future sendOTP() async {
    try {
      otp.clear();
      if (GetPlatform.isWeb) {
        FirebaseAuth auth = FirebaseAuth.instance;
        Get.back();
        ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(coutryCode + contactNo.text);
        if (confirmationResult.verificationId != null) {
          Get.to(() => OtpVerificationScreen(
                verificationCode: confirmationResult.verificationId,
              ));
        }
      } else {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: coutryCode + contactNo.text,
          verificationCompleted: (PhoneAuthCredential credential) {
            otp.text = credential.smsCode;
            update();
          },
          verificationFailed: (FirebaseAuthException e) {
            Get.back();
            showCustomSnackBar(e.message.toString());
            log(e.message.toString());
          },
          codeSent: (String verificationId, int resendToken) async {
            Get.back();
            startTimer();
            Get.to(() => OtpVerificationScreen(
                  verificationCode: verificationId,
                ));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }
    } catch (e) {
      Get.back();
      print("Exception - authController.dart - sendOTP():" + e.toString());
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (timerVal) {
        if (seconds == 0) {
          timer.cancel();
          timerVal.cancel();
          update();
        } else {
          seconds--;
          update();
        }
      },
    );
    update();
  }

  void stopTimer() {
    seconds = 60;
    timer?.cancel();
    update();
  }

  Future checkOTP(String verificationCode) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        FirebaseAuth auth = FirebaseAuth.instance;
        var _credential = PhoneAuthProvider.credential(verificationId: verificationCode, smsCode: otp.text.trim());
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await auth.signInWithCredential(_credential).then((result) {
          Get.back();
          status = 'success';
          verifyOtp(status);
        }).catchError((e) {
          status = 'failed';
          Get.back();
          verifyOtp(status);
        }).onError((error, stackTrace) {
          showCustomSnackBar(error.toString());
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - authController.dart - checkOTP():" + e.toString());
    }
  }

  Future verifyOtp(String status) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        Get.dialog(CustomLoader(), barrierDismissible: false);
        await apiHelper.verifyOtp(coutryCode + contactNo.text, status).then((response) async {
          Get.back();
          if (response.statusCode == 200) {
            global.currentUser = response.data;

            global.sp.setString('currentUser', json.encode(global.currentUser.toJson()));
            Get.to(() => BottomNavigationBarScreen());
            await getProfile();
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }

      update();
    } catch (e) {
      print("Exception - authController.dart - verifyOtp():" + e.toString());
    }
  }

  Future resendOtp() async {
    try {
      stopTimer();
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth
          .verifyPhoneNumber(
        phoneNumber: coutryCode + contactNo.text,
        verificationCompleted: (AuthCredential authCredential) async {},
        verificationFailed: (e) {
          showCustomSnackBar(e.message.toString());
          log(e.message.toString());
        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          startTimer();
          Get.to(() => OtpVerificationScreen(
                verificationCode: verificationId,
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
        },
      )
          .onError((error, stackTrace) {
        showCustomSnackBar(error.message.toString());
        log(error.message.toString());
      });
    } catch (e) {
      print("Exception - authController.dart - resendOtp():" + e.toString());
    }
  }

  Future updateProfile(File userImage) async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        if (email.text.trim().isNotEmpty) {
          Get.dialog(CustomLoader(), barrierDismissible: false);
          await apiHelper.updateProfile(name.text.trim(), global.currentUser.phone, email.text.trim(), userImage).then((response) async {
            Get.back();
            if (response != null) {
              if (response.statusCode == 200) {
                showCustomSnackBar(response.message, isError: false);
                await getProfile();
              } else {
                showCustomSnackBar(response.message);
              }
            } else {
              showCustomSnackBar('Email has been already taken');
            }
          });
        } else {
          showCustomSnackBar('Please enter Email.');
        }
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }

      update();
    } catch (e) {
      print("Exception - authController.dart - updateProfile():" + e.toString());
    }
  }

  Future getProfile() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.myProfile().then((response) {
          if (response.statusCode == 200) {
            String _token = global.currentUser.token;
            global.currentUser = response.data;
            global.currentUser.token = _token;
            global.sp.setString('currentUser', json.encode(global.currentUser.toJson()));
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }

      update();
    } catch (e) {
      print("Exception - authController.dart - getProfile():" + e.toString());
    }
  }
}
