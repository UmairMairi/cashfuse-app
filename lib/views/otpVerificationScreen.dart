import 'package:cashbackapp/views/bottomNavigationBarScreen.dart';
import 'package:cashbackapp/views/loginwithEmailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEF9F3),
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
              'Enter 6 digit code we have sent you',
              textAlign: TextAlign.left,
              style: Get.theme.primaryTextTheme.displaySmall.copyWith(
                height: 1.2,
                letterSpacing: -1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Code sent to 99*****999',
                  style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                    letterSpacing: -0.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Edit number',
                    style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                      letterSpacing: -0.2,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 20),
            child: SizedBox(
              child: PinCodeTextField(
                enablePinAutofill: true,
                controller: null,
                appContext: context,
                length: 6,
                onChanged: (code) async {
                  if (code.length == 6) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
                scrollPadding: EdgeInsets.zero,
                keyboardType: TextInputType.number,
                cursorColor: Colors.transparent,
                pinTheme: PinTheme(
                  fieldHeight: 50,
                  fieldWidth: 50,
                  fieldOuterPadding: EdgeInsets.zero,
                  disabledColor: Colors.white,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderWidth: 1.5,
                  shape: PinCodeFieldShape.box,
                  inactiveColor: Colors.grey[350],
                  activeColor: Colors.black,
                  selectedColor: Colors.grey[350],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              text: TextSpan(
                text: "Haven't receive the OTP?",
                style: Get.theme.primaryTextTheme.subtitle2.copyWith(
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w600,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Resend',
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
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.to(() => LoginWithEmailScreen());
            },
            child: Center(
              child: Text(
                'Login using email',
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
            color: Colors.orange[800],
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