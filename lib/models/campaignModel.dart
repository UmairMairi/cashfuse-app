import 'package:cashbackapp/models/categoryModel.dart';
import 'package:cashbackapp/models/couponModel.dart';

class CampaignModel {
  int id;
  int campaignId;
  String name;
  String url;
  String domain;
  String payoutType;
  double payout;
  String image;
  String category;
  int categoryId;
  int status;
  String buttonText;
  String affiliatePartner;
  DateTime createdAt;
  DateTime updatedAt;
  int campaigns;
  String description;
  CategoryModel partner;
  List<Coupon> couponList;
  bool isImageError = false; //for check image error

  CampaignModel({
    this.id,
    this.campaignId,
    this.name,
    this.url,
    this.domain,
    this.payoutType,
    this.payout,
    this.image,
    this.category,
    this.categoryId,
    this.status,
    this.buttonText,
    this.affiliatePartner,
    this.createdAt,
    this.updatedAt,
    this.campaigns,
    this.description,
    this.partner,
    this.couponList,
    this.isImageError,
  });

  CampaignModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      campaignId = json["campaign_id"];
      name = json["name"];
      url = json["url"];
      domain = json["domain"];
      payoutType = json["payout_type"];
      payout = json["payout"].toDouble();
      image = json["image"] != null ? json["image"] : '';
      category = json["category"];
      categoryId = json["category_id"];
      status = json["status"];
      buttonText = json["button_text"];
      affiliatePartner = json["affiliate_partner"];
      createdAt = DateTime.parse(json["created_at"]);
      updatedAt = DateTime.parse(json["updated_at"]);
      campaigns = json["campaigns"];
      description = json["description"] != null ? json["description"] : '';
      partner = json["partner"] != null ? CategoryModel.fromJson(json["partner"]) : null;
      couponList = json["coupon"] != null && json["coupon"] != [] ? List<Coupon>.from(json["coupon"].map((x) => Coupon.fromJson(x))) : [];
    } catch (e) {
      print("Exception - CampaignModel.dart - CampaignModel.fromJson():" + e.toString());
    }
  }
}
