import 'package:cashfuse/models/baseUrlsModel.dart';

class AppInfo {
  String businessName;
  String logo;
  String currency;
  String minimumRedeemValue;
  BaseUrls baseUrls;

  AppInfo({
    this.businessName,
    this.logo,
    this.currency,
    this.minimumRedeemValue,
    this.baseUrls,
  });

  AppInfo.fromJson(Map<String, dynamic> json) {
    try {
      businessName = json["business_name"] != null ? json["business_name"] : '';
      logo = json["logo"] != null ? json["logo"] : '';
      currency = json["currency"] != null ? json["currency"] : '';
      minimumRedeemValue = json["minimum_redeem_value"] != null ? json["minimum_redeem_value"] : '';
      baseUrls = json["base_urls"] != null ? BaseUrls.fromJson(json["base_urls"]) : BaseUrls();
    } catch (e) {
      print("Exception - AppInfo.dart - AppInfo.fromJson():" + e.toString());
    }
  }
}
