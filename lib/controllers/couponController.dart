import 'package:cashbackapp/constants/appConstant.dart';
import 'package:cashbackapp/controllers/networkController.dart';
import 'package:cashbackapp/models/couponModel.dart';
import 'package:cashbackapp/services/apiHelper.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();
  List<Coupon> _couponList = [];
  List<Coupon> get couponList => _couponList;

  bool isDataLoaded = false;

  @override
  void onInit() async {
    await getCouponList();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getCouponList() async {
    try {
      isDataLoaded = false;
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getCoupons().then((response) {
          if (response.status == "1") {
            _couponList = response.data;
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }
      isDataLoaded = true;
      update();
    } catch (e) {
      print("Exception - CouponController.dart - getCouponList():" + e.toString());
    }
  }
}
