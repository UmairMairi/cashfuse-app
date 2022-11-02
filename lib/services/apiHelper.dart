import 'dart:developer';

import 'package:cashbackapp/constants/appConstant.dart';
import 'package:cashbackapp/models/adsModel.dart';
import 'package:cashbackapp/models/appInfoModel.dart';
import 'package:cashbackapp/models/bankDetailsModel.dart';
import 'package:cashbackapp/models/bannerModel.dart';
import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/models/clickModel.dart';
import 'package:cashbackapp/models/couponModel.dart';
import 'package:cashbackapp/models/faqModel.dart';
import 'package:cashbackapp/models/offerModel.dart';
import 'package:cashbackapp/models/searchDataModel.dart';
import 'package:cashbackapp/models/userModel.dart';
import 'package:cashbackapp/services/dioResult.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:dio/dio.dart';

class APIHelper {
  //bind you api result using it
  dynamic getDioResult<T>(final response, T recordList) {
    try {
      dynamic result;
      result = DioResult.fromJson(response, recordList);
      return result;
    } catch (e) {
      print("Exception - getDioResult():" + e.toString());
    }
  }

  Future<dynamic> getAppInfo() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.APP_INFO_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = AppInfo.fromJson(response.data);
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.APP_INFO_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getAppInfo():" + e.toString());
    }
  }

  Future<dynamic> loginOrRegister(String phone) async {
    try {
      Response response;
      var dio = Dio();
      var formData = FormData.fromMap({'phone': phone, 'device_id': global.appDeviceId});
      response = await dio.post('${global.baseUrl}${AppConstants.LOGIN_RESGISTER}',
          data: formData,
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.LOGIN_RESGISTER}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - loginOrRegister():" + e.toString());
    }
  }

  Future<dynamic> verifyOtp(String phone, String status) async {
    try {
      Response response;
      var dio = Dio();
      var formData = FormData.fromMap({'phone': phone, 'otp': status});
      response = await dio.post('${global.baseUrl}${AppConstants.VERIFY_OTP}',
          data: formData,
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = UserModel.fromJson(response.data['user']);
        recordList.token = response.data["token"];
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.VERIFY_OTP}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - verifyOtp():" + e.toString());
    }
  }

  Future<dynamic> getTopCategories() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.CAEGORY_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = List<CategoryModel>.from(response.data['data'].map((x) => CategoryModel.fromJson(x)));
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.CAEGORY_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getTopCategories():" + e.toString());
    }
  }

  Future<dynamic> getTopCashBack() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.CASHBACK_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = List<CategoryModel>.from(response.data['data'].map((x) => CategoryModel.fromJson(x)));
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.CASHBACK_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getTopCashBack():" + e.toString());
    }
  }

  Future<dynamic> getHomeAdv() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.HOME_ADV_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = List<CategoryModel>.from(response.data['data'].map((x) => CategoryModel.fromJson(x)));
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.HOME_ADV_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getHomeAdv():" + e.toString());
    }
  }

  Future<dynamic> getAllAdv() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.ALL_ADV}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = List<CategoryModel>.from(response.data['data'].map((x) => CategoryModel.fromJson(x)));
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.ALL_ADV}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getAllAdv():" + e.toString());
    }
  }

  Future<dynamic> getExclusiveOffers() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.EXCLUSIVE_OFFER_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = List<OfferModel>.from(response.data['data'].map((x) => OfferModel.fromJson(x)));
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.EXCLUSIVE_OFFER_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getExclusiveOffers():" + e.toString());
    }
  }

  Future<dynamic> getNewFlashOffers() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.NEW_FLASH_OFFER_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = List<OfferModel>.from(response.data['data'].map((x) => OfferModel.fromJson(x)));
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.NEW_FLASH_OFFER_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getNewFlashOffers():" + e.toString());
    }
  }

  Future<dynamic> getTopBanners() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.BANNER_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = List<BannerModel>.from(response.data['data'].map((x) => BannerModel.fromJson(x)));
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.BANNER_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getTopBanners():" + e.toString());
    }
  }

  Future<dynamic> getAdDetails(String adId) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.AD_DETAIL_URI}?ad_id=$adId',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = AdsModel.fromJson(response.data);
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.AD_DETAIL_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getAdDetails():" + e.toString());
    }
  }

  Future<dynamic> getOfferDetails(String offerId) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.OFEFER_DETAIL_URI}?offer_id=$offerId',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = OfferModel.fromJson(response.data);
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.OFEFER_DETAIL_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getOfferDetails():" + e.toString());
    }
  }

  Future<dynamic> getCampignDetails(String campaignId) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.CAMPAIGN_DETAIL_URI}?campaign_id=$campaignId',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = OfferModel.fromJson(response.data);
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.CAMPAIGN_DETAIL_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getCampignDetails():" + e.toString());
    }
  }

  Future<dynamic> getCoupons() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.COUPON_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = List<Coupon>.from(response.data['data'].map((x) => Coupon.fromJson(x)));
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.COUPON_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getCoupons():" + e.toString());
    }
  }

  Future<dynamic> getFaqs() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.FAQ_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = List<FaqModel>.from(response.data['data'].map((x) => FaqModel.fromJson(x)));
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.FAQ_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getFaqs():" + e.toString());
    }
  }

  Future<dynamic> getAboutUs() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.ABOUT_US_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = response.data['data'];
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.ABOUT_US_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getAboutUs():" + e.toString());
    }
  }

  Future<dynamic> getPrivacyPolicy() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.PRIVACY_POLICY_URI}',
          options: Options(
            headers: await global.getApiHeaders(false),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = response.data['data'];
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.PRIVACY_POLICY_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getPrivacyPolicy():" + e.toString());
    }
  }

  Future<dynamic> getAccountDetails() async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get('${global.baseUrl}${AppConstants.ACCOUNT_DETAILS_URI}?user_id=${global.currentUser.id}',
          options: Options(
            headers: await global.getApiHeaders(true),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = BankDetailsModel.fromJson(response.data['data']);
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.ACCOUNT_DETAILS_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getAccountDetails():" + e.toString());
    }
  }

  Future<dynamic> addBankDetails(String acHolderName, String accountNo, String bankName, String ifscCode) async {
    try {
      Response response;
      var dio = Dio();
      var data = FormData.fromMap({
        'user_id': global.currentUser.id,
        'holder_name': acHolderName,
        'ac_no': accountNo,
        'bank_name': bankName,
        'ifsc': ifscCode,
      });
      response = await dio.post('${global.baseUrl}${AppConstants.ADD_BANK_DETAILS_URI}',
          data: data,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = BankDetailsModel.fromJson(response.data['data']);
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.ADD_BANK_DETAILS_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - addBankDetails():" + e.toString());
    }
  }

  Future<dynamic> addAmazonPayDetails(String amazonNo) async {
    try {
      Response response;
      var dio = Dio();
      var data = FormData.fromMap({
        'user_id': global.currentUser.id,
        'amazon_no': amazonNo,
      });
      response = await dio.post('${global.baseUrl}${AppConstants.ADD_AMAZON_DETAILS_URI}',
          data: data,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = BankDetailsModel.fromJson(response.data['data']);
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.ADD_AMAZON_DETAILS_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - addAmazonPayDetails():" + e.toString());
    }
  }

  Future<dynamic> addPayTMDetails(String paytmNo) async {
    try {
      Response response;
      var dio = Dio();
      var data = FormData.fromMap({
        'user_id': global.currentUser.id,
        'paytm_no': paytmNo,
      });
      response = await dio.post('${global.baseUrl}${AppConstants.ADD_PAYTM_DETAILS_URI}',
          data: data,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = BankDetailsModel.fromJson(response.data['data']);
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.ADD_PAYTM_DETAILS_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - addPayTMDetails():" + e.toString());
    }
  }

  Future<dynamic> addUpiDetails(String upi) async {
    try {
      Response response;
      var dio = Dio();
      var data = FormData.fromMap({
        'user_id': global.currentUser.id,
        'upi': upi,
      });
      response = await dio.post('${global.baseUrl}${AppConstants.ADD_UPI_DETAILS_URI}',
          data: data,
          options: Options(
            headers: await global.getApiHeaders(true),
          ));

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = BankDetailsModel.fromJson(response.data['data']);
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.ADD_UPI_DETAILS_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - addUpiDetails():" + e.toString());
    }
  }

  Future<dynamic> getTrackingLink(String url, String type, {String cId}) async {
    try {
      Response response;
      var dio = Dio();

      response = await dio.get(
        cId != null ? '${global.baseUrl}${AppConstants.TRACKING_LINK_URI}?user_id=${global.currentUser.id}&url=$url&type=$type&c_id=$cId' : '${global.baseUrl}${AppConstants.TRACKING_LINK_URI}?user_id=${global.currentUser.id}&url=$url&type=$type',
        options: Options(
          headers: await global.getApiHeaders(true),
        ),
      );

      log('${global.baseUrl}${AppConstants.TRACKING_LINK_URI}?user_id=${global.currentUser.id}&url=$url&type=$type&c_id=$cId +++++' '${global.baseUrl}${AppConstants.TRACKING_LINK_URI}?user_id=${global.currentUser.id}&url=$url&type=$type');

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = response.data['tracking_link'];
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.TRACKING_LINK_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getTrackingLink():" + e.toString());
    }
  }

  Future<dynamic> search(String keyword) async {
    try {
      Response response;
      var dio = Dio();
      var formData = FormData.fromMap({'keyword': keyword});
      response = await dio.post(
        '${global.baseUrl}${AppConstants.SEARCH_URI}',
        data: formData,
        options: Options(headers: await global.getApiHeaders(false)),
      );

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = SearchDataModel.fromJson(response.data);
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.SEARCH_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - search():" + e.toString());
    }
  }

  Future<dynamic> addClick(String name, String image) async {
    try {
      Response response;
      var dio = Dio();
      var formData = FormData.fromMap({
        'user_id': global.currentUser.id,
        'name': name,
        'image': image,
      });
      response = await dio.post(
        '${global.baseUrl}${AppConstants.ADD_CLICK_URI}',
        data: formData,
        options: Options(headers: await global.getApiHeaders(true)),
      );

      dynamic recordList;
      if (response.statusCode == 200) {
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.ADD_CLICK_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - search():" + e.toString());
    }
  }

  Future<dynamic> getClick() async {
    try {
      Response response;
      var dio = Dio();

      response = await dio.get(
        '${global.baseUrl}${AppConstants.GET_CLICK_URI}?user_id=${global.currentUser.id}',
        options: Options(headers: await global.getApiHeaders(true)),
      );

      dynamic recordList;
      if (response.statusCode == 200) {
        recordList = List<ClickModel>.from(response.data['data'].map((x) => ClickModel.fromJson(x)));
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.GET_CLICK_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - getClick():" + e.toString());
    }
  }

  Future<dynamic> updateProfile(String name, String phone, String email) async {
    try {
      Response response;
      var dio = Dio();
      var formData = FormData.fromMap({
        'user_id': global.currentUser.id,
        'name': name,
        'phone': phone,
        'email': email,
      });
      response = await dio.post(
        '${global.baseUrl}${AppConstants.UPDATE_PROFILE_URI}',
        data: formData,
        options: Options(headers: await global.getApiHeaders(false)),
      );

      dynamic recordList;
      if (response.statusCode == 200) {
      } else {
        recordList = null;
      }
      print('====> API Response: [${response.statusCode}] ${global.baseUrl}${AppConstants.UPDATE_PROFILE_URI}\n${response.data}');
      return getDioResult(response, recordList);
    } catch (e) {
      print("Exception -  apiHelper.dart - updateProfile():" + e.toString());
    }
  }
}
