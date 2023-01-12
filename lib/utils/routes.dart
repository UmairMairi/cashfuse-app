import 'package:cashfuse/views/categoryScreen.dart';
import 'package:cashfuse/views/homeScreen.dart';
import 'package:get/get.dart';

class Routes {
  static String homeRoute = '/home';
  static String categoryRoute = '/category';
  // static String screen3 = '/screen3;
  // static String screen4 = '/screen4;
  // static String screen5 = '/screen5;
  // static String screen6 = '/screen6;
}

final getPages = [
  GetPage(
    name: Routes.homeRoute,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: Routes.categoryRoute,
    page: () => CategoryScreen(),
  ),
];
