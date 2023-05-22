import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/controllers/authController.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';

// import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginOrSignUpScreen extends StatelessWidget {
  final bool fromMenu;
  LoginOrSignUpScreen({required this.fromMenu});

  // final countryPicker = FlCountryCodePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        backgroundColor: Color(0xFFFEF9F3),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FutureBuilder(
                  future: global.translatedText('Login or signup'),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data != null
                          ? snapshot.data!
                          : 'Login or signup',
                      style: Get.theme.primaryTextTheme.displaySmall!.copyWith(
                        letterSpacing: -1,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: FutureBuilder(
                  future: global.translatedText('We will send a SMS to verify'),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data != null
                          ? snapshot.data!
                          : 'We will send a SMS to verify',
                      style: Get.theme.primaryTextTheme.titleSmall!.copyWith(
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                child: SizedBox(
                  height: 100,
                  child: IntlPhoneField(
                    pickerDialogStyle: PickerDialogStyle(width: AppConstants.WEB_MAX_WIDTH / 2),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    focusNode: authController.phoneFocus,
                    showCountryFlag: false,
                    controller: authController.contactNo,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // initialCountryCode: authController.country!.code,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    disableLengthCheck: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      // fillColor: AppColor.WHITE_COLOR,
                      label: Text('Enter phone'),
                      labelStyle: TextStyle(color: Colors.black),
                      // hintText: MessageConstants.HNT_PHONE_NUMBER,
                      filled: false,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Get.theme.primaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Get.theme.primaryColor,
                        ),
                      ),
                      counterText: "",
                    ),
                    onChanged: (phone) {
                      //           authController.update();
                      // print(phone.completeNumber);
                      // contactNo = phone.completeNumber;
                      // phonenumber = phone;

                      // phone.countryCode;
                    },
                    // flagsButtonPadding: EdgeInsets.only(left: 15),
                    dropdownTextStyle: TextStyle(color: Colors.black),
                    showDropdownIcon: false,
                    cursorColor: Theme.of(context).primaryColor,
                    onCountryChanged: (country) {
                      FocusScope.of(context).unfocus();
                      authController.country = country;
                      authController.coutryCode = '+' + country.dialCode;
                      authController.update();
                      print('Country changed to: ' + country.name);
                    },
                  ),
                  // TextFormField(
                  //   controller: authController.contactNo,
                  //   cursorColor: Get.theme.primaryColor,
                  //   textInputAction: TextInputAction.done,
                  //   keyboardType: TextInputType.numberWithOptions(
                  //       signed: true, decimal: true),
                  //   inputFormatters: [
                  //     FilteringTextInputFormatter.digitsOnly,
                  //   ],
                  //   decoration: InputDecoration(
                  //     labelText: 'Enter phone',
                  //     labelStyle: TextStyle(color: Colors.black),
                  //     floatingLabelBehavior: FloatingLabelBehavior.always,
                  //     floatingLabelAlignment: FloatingLabelAlignment.start,
                  //     contentPadding: EdgeInsets.only(bottom: 5),
                  //     prefixIcon: InkWell(
                  //       onTap: () async {
                  //         final code = await countryPicker.showPicker(
                  //           context: context,
                  //         );
                  //         if (code != null) {
                  //           authController.coutryCode = code.dialCode;
                  //           authController.update();
                  //         }
                  //       },
                  //       child: Container(
                  //         width: 20,
                  //         alignment: Alignment.center,
                  //         child: Text(
                  //           authController.coutryCode!,
                  //         ).translate(),
                  //       ),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(
                  //         color: Get.theme.primaryColor,
                  //       ),
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(
                  //         color: Get.theme.primaryColor,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () async {
                await authController.loginOrRegister(fromMenu);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                margin:
                    EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 15),
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                decoration: BoxDecoration(
                  color: Get.theme.secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: FutureBuilder(
                  future: global.translatedText('Continue'),
                  builder: (context, snapshot) {
                    return Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
