import 'package:get/get.dart';
import 'package:cashbackapp/controllers/networkController.dart';

class LocalizationController extends GetxController {
  NetworkController networkController = Get.put(NetworkController());

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
