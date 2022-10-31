import 'package:cashbackapp/constants/appConstant.dart';
import 'package:cashbackapp/controllers/networkController.dart';
import 'package:cashbackapp/services/apiHelper.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();

  @override
  void onInit() async {
    await getAccountDetails();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getAccountDetails() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getAccountDetails().then((response) {
          if (response.status == "1") {
            update();
          } else {
            showCustomSnackBar(response.message);
          }
        });
        update();
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
    } catch (e) {
      print("Exception - PaymentController.dart - getAccountDetails():" + e.toString());
    }
  }
}
