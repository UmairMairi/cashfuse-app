import 'package:cashbackapp/controllers/authController.dart';
import 'package:cashbackapp/widget/codePickerWidget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginOrSignUpScreen extends StatelessWidget {
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
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context).login,
                  style: Get.theme.primaryTextTheme.displaySmall.copyWith(
                    letterSpacing: -1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  AppLocalizations.of(context).login_subtitle,
                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                    letterSpacing: -0.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: authController.contactNo,
                    cursorColor: Get.theme.primaryColor,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      labelText: 'Enter phone',
                      labelStyle: TextStyle(color: Colors.black),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      contentPadding: EdgeInsets.only(bottom: 5),
                      prefixIcon: CodePickerWidget(
                        textOverflow: TextOverflow.visible,
                        onChanged: (CountryCode countryCode) {
                          authController.coutryCode = countryCode.dialCode;
                        },
                        initialSelection: authController.coutryCode,
                        favorite: [authController.coutryCode],
                        showDropDownButton: false,
                        showFlagMain: false,
                        dialogBackgroundColor: Theme.of(context).cardColor,
                        boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        closeIcon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        searchDecoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Get.theme.primaryColor),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
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
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Center(
              //   child: Text(
              //     'Or continue with social account',
              //     style: Get.theme.primaryTextTheme.subtitle2.copyWith(
              //       letterSpacing: -0.2,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         padding: EdgeInsets.all(15),
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(
              //             color: Colors.grey[200],
              //           ),
              //         ),
              //         child: Image.asset(
              //           Images.google,
              //           height: 20,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Container(
              //         padding: EdgeInsets.all(15),
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(
              //             color: Colors.grey[200],
              //           ),
              //         ),
              //         child: Icon(
              //           FontAwesomeIcons.facebook,
              //           color: Colors.blue[600],
              //           size: 22,
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () async {
            await authController.loginOrRegister();
            //Get.to(() => OtpVerificationScreen());
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            decoration: BoxDecoration(
              color: Get.theme.secondaryHeaderColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context).conti,
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    });
  }
}
