import 'package:cashbackapp/controllers/commonController.dart';
import 'package:cashbackapp/controllers/homeController.dart';
import 'package:cashbackapp/controllers/ratingController.dart';
import 'package:cashbackapp/controllers/splashController.dart';
import 'package:get/get.dart';
import 'package:cashbackapp/controllers/bottomNavigationController.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(BottomNavigationController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<CommonController>(() => CommonController(), fenix: true);
    Get.lazyPut<RatingController>(() => RatingController(), fenix: true);
  }
}
