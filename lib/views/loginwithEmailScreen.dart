import 'package:cashbackapp/views/bottomNavigationBarScreen.dart';
import 'package:cashbackapp/views/forgotPasswordScreen.dart';
import 'package:cashbackapp/views/loginOrSignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWithEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF9F3),
      body: Column(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Enter email id & password',
              style: Get.theme.primaryTextTheme.displaySmall.copyWith(
                height: 1.1,
                letterSpacing: -1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              'For easy access to your account',
              style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                letterSpacing: -0.2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SizedBox(
              height: 50,
              child: TextFormField(
                cursorColor: Get.theme.primaryColor,
                decoration: InputDecoration(
                  labelText: 'Enter email id',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SizedBox(
              height: 50,
              child: TextFormField(
                cursorColor: Get.theme.primaryColor,
                decoration: InputDecoration(
                  labelText: 'Enter password',
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.black,
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
          InkWell(
            onTap: () {
              Get.to(() => ForgotPasswordScreen());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(
                  text: "Don't rememeber your password?",
                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                    letterSpacing: -0.2,
                    fontWeight: FontWeight.w600,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Reset',
                      style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.to(() => LoginOrSignUpScreen());
            },
            child: Center(
              child: Text(
                'Login using mobile',
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue[900],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: InkWell(
        onTap: () {
          Get.to(() => BottomNavigationBarScreen());
        },
        child: Container(
          width: Get.width,
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
