import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Images.splash_bg,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
          ),
          Image.asset(
            Images.splash_image,
          ),
        ],
      ),
    );
  }
}
