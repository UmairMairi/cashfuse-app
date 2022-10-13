import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final cEmail = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'Forgot Passsword',
          style: Get.theme.primaryTextTheme.subtitle2.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 180,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    Images.keys,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Center(
                      child: Text(
                        'Verify Account',
                        style: Get.theme.primaryTextTheme.headline6.copyWith(
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Enter your registered Email ID / Mobile Number to reset password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey[800]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: TextFormField(
                      focusNode: cEmail,
                      scrollPadding: EdgeInsets.zero,
                      cursorColor: Get.theme.primaryColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        labelText: 'Email ID / Mobile Number',
                        labelStyle: TextStyle(
                          color: cEmail.hasFocus ? Get.theme.primaryColor : Colors.grey,
                        ),
                        focusColor: Get.theme.primaryColor,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: cEmail.hasFocus ? Get.theme.primaryColor : Colors.grey,
                        )),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: cEmail.hasFocus ? Get.theme.primaryColor : Colors.grey,
                        )),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: cEmail.hasFocus ? Get.theme.primaryColor : Colors.grey,
                        )),
                      ),
                      onTap: () {
                        FocusScope.of(context).unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
                      },
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.orange[800],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Get OTP',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
