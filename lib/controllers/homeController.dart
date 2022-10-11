import 'package:astrotalk/models/categoryModel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<CategoryModel> catList = [
    CategoryModel(name: 'Fashion', image: ''),
    CategoryModel(name: 'mobiles', image: ''),
    CategoryModel(name: 'beaty', image: ''),
    CategoryModel(name: 'home', image: ''),
    CategoryModel(name: 'pharmacy', image: ''),
    CategoryModel(name: 'grocery', image: ''),
  ];
}
