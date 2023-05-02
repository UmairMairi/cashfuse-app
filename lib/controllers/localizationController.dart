import 'package:get/get.dart';
import 'package:cashfuse/controllers/networkController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationController extends GetxController {
  LocalizationController() {
    _loadCurrentTheme();
  }
  NetworkController networkController = Get.put(NetworkController());

  String languageCode = 'en';

  void _loadCurrentTheme() async {
    global.sp = await SharedPreferences.getInstance();
    if (global.sp.getString('languageCode') != null) {
      languageCode = global.sp.getString('languageCode');
    } else {
      languageCode = 'en';
    }

    update();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future setLanguage(String code) async {
    try {
      languageCode = code;
      update();
      if (languageCode == 'ar') {
        global.isRTL = false;
      } else {
        global.isRTL = true;
      }
      global.sp.setString('languageCode', languageCode);
      update();
    } catch (e) {
      print("Exception - LocalizationController.dart - setLanguage():" +
          e.toString());
    }
  }
}
