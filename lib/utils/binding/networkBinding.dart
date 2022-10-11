import 'package:astrotalk/controllers/callController.dart';
import 'package:astrotalk/controllers/chatController.dart';
import 'package:astrotalk/controllers/homeController.dart';
import 'package:get/get.dart';
import 'package:astrotalk/controllers/bottomNavigationController.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ChatController>(() => ChatController(), fenix: true);
    Get.lazyPut<CallController>(() => CallController(), fenix: true);
  }
}
