class AdsModel {
  int id;
  String adId;
  String cId;
  String advName;
  String advId;
  String trackingLink;
  String name;
  int categoryId;
  String categoryIds;
  String description;
  String image;
  String buttonText;
  int partnerId;
  String affiliatePartner;
  String landingPage;
  String type;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  AdsModel({
    this.id,
    this.adId,
    this.cId,
    this.advName,
    this.advId,
    this.trackingLink,
    this.name,
    this.categoryId,
    this.categoryIds,
    this.description,
    this.image,
    this.buttonText,
    this.partnerId,
    this.affiliatePartner,
    this.landingPage,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  AdsModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      adId = json["ad_id"];
      cId = json["c_id"];
      advId = json["adv_id"];
      advName = json["adv_name"];

      trackingLink = json["tracking_link"];
      name = json["name"];
      categoryId = json["category_id"];
      categoryIds = json["category_ids"] == null ? null : json["category_ids"];
      description = json["description"] == null ? null : json["description"];
      image = json["image"];
      buttonText = json["button_text"];
      partnerId = json["partner_id"];
      affiliatePartner = json["affiliate_partner"];
      landingPage = json["landing_page"];
      type = json["type"];
      status = json["status"];
      createdAt = DateTime.parse(json["created_at"]);
      updatedAt = DateTime.parse(json["updated_at"]);
    } catch (e) {
      print("Exception - AdsModel.dart - AdsModel.fromJson():" + e.toString());
    }
  }
}
