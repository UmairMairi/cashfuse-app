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
      image = json["image"];
      category = json["category"];
      categoryId = json["category_id"];
      status = json["status"];
      buttonText = json["button_text"];
      affiliatePartner = json["affiliate_partner"];
      createdAt = DateTime.parse(json["created_at"]);
      updatedAt = DateTime.parse(json["updated_at"]);
    } catch (e) {
      print("Exception - CampaignModel.dart - CampaignModel.fromJson():" + e.toString());
    }
  }
}
