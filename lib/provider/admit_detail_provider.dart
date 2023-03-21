import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:cashfuse/utils/global.dart' as global;

import '../constants/appConstant.dart';
class AdmitedOffers with ChangeNotifier
{

  Map _admitedData={};
  Map get admitedData=>_admitedData;

  Future admitedOfferDetails(String id) async {
    try {
      http.Response response;
      var url = Uri.parse(
         // '${global.baseUrl}${AppConstants.ADMITEDOFFERS_DETAIL}?id=4'
        //ApiCollection.workshopDetail+slug,
       "https://cash.codefuse.org/newcashfuse/api/admitadoffer_details?id=$id"
      );
      print('ajhbsdh');
      print('${url}');
      response = await http.get(url);

      if (response.statusCode == 200) {
        Map apiResponse = jsonDecode(response.body);
        _admitedData=apiResponse;
        return _admitedData;
        notifyListeners();
      } else {
        return {
          'status':0
        };
        };
        notifyListeners();
      }on Exception catch (e) {
      print(e);
      notifyListeners();
      return {
        'status':0
      };
    }
    }




  Future admitedGetLink(String getlink,String type,String c_id) async {
    int user_id=global.currentUser.id;
    try {
      http.Response response;
      var url = Uri.parse(
        // '${global.baseUrl}${AppConstants.ADMITEDOFFERS_DETAIL}?id=4'
        //ApiCollection.workshopDetail+slug,
        //   "https://cash.codefuse.org/newcashfuse/api/admitadoffer_details?id=4"
        "https://cash.codefuse.org/newcashfuse/api/get_tracking_link?user_id=$user_id&url=$getlink&type=$type&c_id=$c_id"

      );
      print('ajhbsdh');
      print('${url}');
      response = await http.get(url);

      if (response.statusCode == 200) {
        Map apiResponse = jsonDecode(response.body);
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



  Map _seemoreAdmitedOffers={};
  Map get seeMoreAdmitedOffers=>_seemoreAdmitedOffers;

   seeMoreOffers(String id) async {
    try {
      http.Response response;
      var url = Uri.parse(
        // '${global.baseUrl}${AppConstants.ADMITEDOFFERS_DETAIL}?id=4'
        //ApiCollection.workshopDetail+slug,
        //   "https://cash.codefuse.org/newcashfuse/api/admitadoffer_details?id=4"
          "https://cash.codefuse.org/newcashfuse/api/seemoradmitadoffers?id=$id"

      );
      print('ajhbsdh');
      print('${url}');
      response = await http.get(url);

      if (response.statusCode == 200) {
        Map apiResponse = jsonDecode(response.body);
        _seemoreAdmitedOffers=apiResponse;
        print('ajhbsdh');
        print('${_seemoreAdmitedOffers}');
        notifyListeners();
      } else {
      };
      notifyListeners();
    }on Exception catch (e) {

      print(e);
      notifyListeners();
    }
  }


  }
