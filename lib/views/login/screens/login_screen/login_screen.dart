import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/center_widget/center_widget.dart';
import 'components/login_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget topWidget(double screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient:  LinearGradient(
            begin: Alignment(-0.2, -0.8),
            end: Alignment.bottomCenter,
            colors: [
               Color(0x007CBFCF),
               Color(0xB316BFC4),
              // Mycolors.colorPurple,
              // Mycolors.lightBlue,
              // Mycolors.blueColor

            ],
          ),
        ),
      ),
    );
  }

  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment(0.6, -1.1),
          end: Alignment(0.7, 0.8),
          colors: [
            Color(0xDB4BE8CC),
            Color(0x005CDBCF),

            // Mycolors.colorPurple,
            // Mycolors.lightBlue,
            // Mycolors.blueColor
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return  Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: -160,
                left: -30,
                child: topWidget(screenSize.width),
              ),
              Positioned(
                bottom: -180,
                left: -40,
                child: bottomWidget(screenSize.width),
              ),
              CenterWidget(size: screenSize),
              const LoginContent(),
            ],
          ),
        );

  }
}
