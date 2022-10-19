import 'package:cashbackapp/models/categoryModel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<CategoryModel> catList = [
    CategoryModel(
      name: 'Fashion',
      image: '',
    ),
    CategoryModel(name: 'mobiles', image: ''),
    CategoryModel(name: 'beauty', image: ''),
    CategoryModel(name: 'home', image: ''),
    CategoryModel(name: 'pharmacy', image: ''),
    CategoryModel(name: 'grocery', image: ''),
  ];

  bool isCategoryExpand = false;
  bool isRoted = true;
  bool isOffer = false;
  int webBottomIndex = 0;

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
}
