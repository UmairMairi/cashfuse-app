import 'package:cashbackapp/controllers/authController.dart';
import 'package:cashbackapp/controllers/commonController.dart';
import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/controllers/networkController.dart';
import 'package:cashbackapp/controllers/ratingController.dart';
import 'package:cashbackapp/controllers/splashController.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/controllers/bottomNavigationController.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController(), fenix: true);
    Get.put(SplashController());
    Get.put(BottomNavigationController());
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<CommonController>(() => CommonController(), fenix: true);
    Get.lazyPut<RatingController>(() => RatingController(), fenix: true);
  }
}
