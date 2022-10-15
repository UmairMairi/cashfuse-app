import 'package:cashbackapp/utils/images.dart';
import 'package:cashbackapp/views/otpVerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginOrSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'Login or signup',
                style: Get.theme.primaryTextTheme.displaySmall.copyWith(
                  letterSpacing: -1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'We will send a SMS to verify',
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
                  cursorColor: Get.theme.primaryColor,
                  decoration: InputDecoration(
                    labelText: 'Enter phone or email',
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
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
            Center(
              child: Text(
                'Or continue with social account',
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey[200],
                      ),
                    ),
                    child: Image.asset(
                      Images.google,
                      height: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey[200],
                      ),
                    ),
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue[600],
                      size: 22,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Get.to(() => OtpVerificationScreen());
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
            'Continue',
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
