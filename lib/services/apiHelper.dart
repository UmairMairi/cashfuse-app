import 'package:cashbackapp/constants/appConstant.dart';
import 'package:cashbackapp/models/appInfoModel.dart';
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
}
