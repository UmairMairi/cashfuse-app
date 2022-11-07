import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Get.theme.primaryColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Get.theme.primaryColor,

              ///Get.theme.primaryColor,
              Get.theme.primaryColor.withOpacity(0.2),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Images.logo,
                fit: BoxFit.contain,
                scale: 2,
              ),
              // RichText(
              //   text: TextSpan(
              //     text: "CASH",
              //     style: Get.theme.primaryTextTheme.headline4.copyWith(
              //       letterSpacing: 0.1,
              //       color: Color(0xFFfe3d00),
              //       fontFamily: 'Bebas Neue',
              //     ),
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: 'BACK',
              //         style: Get.theme.primaryTextTheme.headline4.copyWith(
              //           color: Colors.white,
              //           letterSpacing: 0.1,
              //           fontFamily: 'Bebas Neue',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
