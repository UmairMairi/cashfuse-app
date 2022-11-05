class AllInOneSearchDataModel {
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
  dynamic description;
  int campaigns;
  DateTime createdAt;
  DateTime updatedAt;
  String trackingUrl;

  AllInOneSearchDataModel({
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
    this.description,
    this.campaigns,
    this.createdAt,
    this.updatedAt,
    this.trackingUrl,
  });

  AllInOneSearchDataModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      campaignId = json["campaign_id"];
      name = json["name"] != null ? json["name"] : '';
      url = json["url"] != null ? json["url"] : '';
      domain = json["domain"] != null ? json["domain"] : '';
      payoutType = json["payout_type"];
      payout = json["payout"] != null ? json["payout"].toDouble() : 0.0;
      image = json["image"] != null ? json["image"] : '';
      category = json["category"];
      categoryId = json["category_id"];
      status = json["status"];
      buttonText = json["button_text"] != null ? json["button_text"] : '';
      affiliatePartner = json["affiliate_partner"];
      description = json["description"] != null ? json["description"] : '';
      campaigns = json["campaigns"];
      createdAt = DateTime.parse(json["created_at"]);
      updatedAt = DateTime.parse(json["updated_at"]);
      trackingUrl = json["tracking_url"] != null ? json["tracking_url"] : '';
    } catch (e) {
      print("Exception - AllInOneSearchDataModel.dart - AllInOneSearchDataModel.fromJson():" + e.toString());
    }
  }
}
