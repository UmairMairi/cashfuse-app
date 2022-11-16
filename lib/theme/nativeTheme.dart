import 'package:cashfuse/controllers/themeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

ThemeController themeController = Get.find<ThemeController>();

ThemeData nativeTheme({bool darkModeEnabled}) {
  if (darkModeEnabled == null) {
    darkModeEnabled = false;
  }
  if (darkModeEnabled) {
    return ThemeData(
      appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
      fontFamily: 'Roboto',
      primaryColor: Colors.black, //Color(0xFFF8CB46), //Color(0xFFEF7822),
      primaryColorLight: Colors.black,

      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.white),
        caption: TextStyle(color: Colors.white),
        subtitle1: TextStyle(color: Colors.white),
        subtitle2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.white),
        caption: TextStyle(color: Colors.white),
        subtitle1: TextStyle(color: Colors.white),
        subtitle2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
    );
  } else {
    return ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(
          backgroundColor: themeController.pickColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: themeController.pickColor,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        fontFamily: 'Poppins',
        primaryColor: themeController.pickColor, //Color(0xFFF8CB46), //Color(0xFFEF7822),
        primaryColorLight: themeController.pickColor,
        iconTheme: IconThemeData(color: Colors.black),
        primaryIconTheme: IconThemeData(color: Colors.black),
        secondaryHeaderColor: themeController.pickSecondaryColor,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.black),
          headline4: TextStyle(color: Colors.black),
          headline5: TextStyle(color: Colors.black),
          headline6: TextStyle(color: Colors.black),
          caption: TextStyle(color: Colors.black),
          subtitle1: TextStyle(color: Colors.black),
          subtitle2: TextStyle(color: Colors.black),
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
        ),
        primaryTextTheme: TextTheme(
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.black),
          headline3: TextStyle(color: Colors.black),
          headline4: TextStyle(color: Colors.black),
          headline5: TextStyle(color: Colors.black),
          headline6: TextStyle(color: Colors.black),
          subtitle1: TextStyle(color: Colors.black),
          subtitle2: TextStyle(color: Colors.black),
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          caption: TextStyle(color: Colors.black),
        ));
  }
}
