import 'package:cashbackapp/models/baseUrlsModel.dart';

class AppInfo {
  String businessName;
  String logo;
  BaseUrls baseUrls;

  AppInfo({
    this.businessName,
    this.logo,
    this.baseUrls,
  });

  AppInfo.fromJson(Map<String, dynamic> json) {
    try {
      businessName = json["business_name"] != null ? json["business_name"] : '';
      logo = json["logo"] != null ? json["logo"] : '';
      baseUrls = json["base_urls"] != null ? BaseUrls.fromJson(json["base_urls"]) : BaseUrls();
    } catch (e) {
      print("Exception - AppInfo.dart - AppInfo.fromJson():" + e.toString());
    }
  }
}
