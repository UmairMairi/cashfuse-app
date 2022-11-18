import 'package:cashfuse/models/baseUrlsModel.dart';

class AppInfo {
  String businessName;
  String logo;
  String currency;
  String perOrderReferPercentage;
  String minimumRedeemValue;
  BaseUrls baseUrls;

  AppInfo({
    this.businessName,
    this.logo,
    this.currency,
    this.perOrderReferPercentage,
    this.minimumRedeemValue,
    this.baseUrls,
  });

  AppInfo.fromJson(Map<String, dynamic> json) {
    try {
      businessName = json["business_name"] != null ? json["business_name"] : '';
      logo = json["logo"] != null ? json["logo"] : '';
      currency = json["currency"] != null ? json["currency"] : '';
      perOrderReferPercentage = json["per_order_refer_percentage"] != null ? json["per_order_refer_percentage"] : '';
      minimumRedeemValue = json["minimum_redeem_value"] != null ? json["minimum_redeem_value"] : '';
      baseUrls = json["base_urls"] != null ? BaseUrls.fromJson(json["base_urls"]) : BaseUrls();
    } catch (e) {
      print("Exception - AppInfo.dart - AppInfo.fromJson():" + e.toString());
    }
  }
}
