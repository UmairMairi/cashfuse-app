import 'package:cashbackapp/models/adsModel.dart';
import 'package:cashbackapp/models/campaignModel.dart';

class CategoryModel {
  int id;
  int cueCatId;
  String advId;
  String name;
  String image;
  int parentId;
  int position;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int priority;
  List<AdsModel> ads;
  List<CampaignModel> cuecampaigns;
  dynamic leftTab;
  dynamic leftTabDesc;
  dynamic rightTab;
  dynamic rightTabDesc;
  String affiliatePartner;
  String regions;
  int topCashback;
  int pId;
  int rank;
  String tagline;

  CategoryModel({
    this.id,
    this.cueCatId,
    this.advId,
    this.name,
    this.image,
    this.parentId,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.priority,
    this.ads,
    this.cuecampaigns,
    this.leftTab,
    this.leftTabDesc,
    this.rightTab,
    this.rightTabDesc,
    this.affiliatePartner,
    this.regions,
    this.topCashback,
    this.pId,
    this.rank,
    this.tagline,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      cueCatId = json["cue_cat_id"];
      advId = json["adv_id"];
      name = json["name"];
      image = json["image"];
      parentId = json["parent_id"];
      position = json["position"];
      status = json["status"];
      createdAt = DateTime.parse(json["created_at"]);
      updatedAt = DateTime.parse(json["updated_at"]);
      priority = json["priority"];

      leftTab = json["left_tab"];
      leftTabDesc = json["left_tab_desc"];
      rightTab = json["right_tab"];
      rightTabDesc = json["right_tab_desc"];
      affiliatePartner = json["affiliate_partner"];
      regions = json["regions"];
      topCashback = json["top_cashback"];

      ads = json["ads"] != null && json["ads"] != [] ? List<AdsModel>.from(json["ads"].map((x) => AdsModel.fromJson(x))) : [];
      cuecampaigns = json["cuecampaigns"] != null && json["cuecampaigns"] != [] ? List<CampaignModel>.from(json["cuecampaigns"].map((x) => CampaignModel.fromJson(x))) : [];
      pId = json["p_id"];
      rank = json["rank"];
      tagline = json["tagline"];
    } catch (e) {
      print("Exception - CategoryModel.dart - CategoryModel.fromJson():" + e.toString());
    }
  }
}
