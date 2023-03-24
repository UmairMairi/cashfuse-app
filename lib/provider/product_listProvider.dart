
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductListProvider with ChangeNotifier
{

Map _productListData={};
Map get productListData=>_productListData;
  Future productListMethod() async {
    try {
      http.Response response;
      var url = Uri.parse(
        // '${global.baseUrl}${AppConstants.ADMITEDOFFERS_DETAIL}?id=4'
        //ApiCollection.workshopDetail+slug,
        //   "https://cash.codefuse.org/newcashfuse/api/admitadoffer_details?id=4"
       "https://cash.codefuse.org/newcashfuse/api/get_products"
      );
      print('hajsbjdh');
      print('${url}');
      response = await http.get(url);

      if (response.statusCode == 200) {
        Map apiResponse = jsonDecode(response.body);
        _productListData=apiResponse;
        notifyListeners();
        print('hajsbjdh');
        print('${_productListData}');
        return apiResponse;
      } else {
      };
      notifyListeners();
    }on Exception catch (e) {

      print(e);
      notifyListeners();
      return {};
    }
  }


}