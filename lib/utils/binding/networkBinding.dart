import 'package:cashbackapp/controllers/authController.dart';
import 'package:cashbackapp/controllers/commonController.dart';
import 'package:cashbackapp/controllers/couponController.dart';
import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/controllers/imageController.dart';
import 'package:cashbackapp/controllers/networkController.dart';
import 'package:cashbackapp/controllers/orderController.dart';
import 'package:cashbackapp/controllers/paymentController.dart';
import 'package:cashbackapp/controllers/ratingController.dart';
import 'package:cashbackapp/controllers/searchController.dart';
import 'package:cashbackapp/controllers/splashController.dart';
import 'package:cashbackapp/controllers/themeController.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/controllers/bottomNavigationController.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.lazyPut<NetworkController>(() => NetworkController(), fenix: true);
    Get.put(SplashController());
    Get.put(BottomNavigationController());
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<CommonController>(() => CommonController(), fenix: true);
    Get.lazyPut<RatingController>(() => RatingController(), fenix: true);
    Get.lazyPut<CouponController>(() => CouponController(), fenix: true);
    Get.lazyPut<PaymentController>(() => PaymentController(), fenix: true);
    Get.lazyPut<SearchController>(() => SearchController(), fenix: true);
    Get.lazyPut<ImageControlller>(() => ImageControlller(), fenix: true);
    Get.lazyPut<OrderController>(() => OrderController(), fenix: true);
  }
}
