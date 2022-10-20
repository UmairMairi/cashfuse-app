import 'package:cashbackapp/constants/appConstant.dart';
import 'package:cashbackapp/controllers/networkController.dart';
import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/services/apiHelper.dart';
import 'package:cashbackapp/widget/customSnackbar.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  APIHelper apiHelper = new APIHelper();
  NetworkController networkController = Get.find<NetworkController>();
  List<CategoryModel> _topCategoryList = [];
  List<CategoryModel> get topCategoryList => _topCategoryList;

  List<CategoryModel> _topCashbackList = [];
  List<CategoryModel> get topCashbackList => _topCashbackList;

  List<CategoryModel> _homeAdvList = [];
  List<CategoryModel> get homeAdvList => _homeAdvList;

  bool isCategoryExpand = false;
  bool isRoted = true;
  bool isOffer = false;
  int webBottomIndex = 0;

  @override
  void onInit() async {
    await getTopCategories();
    await getTopCashBack();
    await getHomeAdv();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCategoryExpand(bool val) {
    isCategoryExpand = val;
    update();
  }

  void setIsOffer(bool val) {
    isOffer = val;
    update();
  }

  void setWebBottomIndex(int val) {
    webBottomIndex = val;
    update();
  }

  void updtaeRotate(bool val) {
    isRoted = val;
    update();
  }

  Future getTopCategories() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getTopCategories().then((response) {
          if (response.status == "1") {
            _topCategoryList = response.data;
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }

      update();
    } catch (e) {
      print("Exception - HomeController.dart - getTopCategories():" + e.toString());
    }
  }

  Future getTopCashBack() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getTopCashBack().then((response) {
          if (response.status == "1") {
            _topCashbackList = response.data;
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }

      update();
    } catch (e) {
      print("Exception - HomeController.dart - getTopCashBack():" + e.toString());
    }
  }

  Future getHomeAdv() async {
    try {
      if (networkController.connectionStatus.value == 1 || networkController.connectionStatus.value == 2) {
        await apiHelper.getHomeAdv().then((response) {
          if (response.status == "1") {
            _homeAdvList = response.data;
          } else {
            showCustomSnackBar(response.message);
          }
        });
      } else {
        showCustomSnackBar(AppConstants.NO_INTERNET);
      }

      update();
    } catch (e) {
      print("Exception - HomeController.dart - getHomeAdv():" + e.toString());
    }
  }
}
