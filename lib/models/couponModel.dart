class Coupon {
  int id;
  String name;
  String code;
  String image;
  int advId;
  String heading;
  String description;
  DateTime startDate;
  DateTime endDate;
  String affiliatePartner;
  DateTime createdAt;
  DateTime updatedAt;

  Coupon({
    this.id,
    this.name,
    this.code,
    this.image,
    this.advId,
    this.heading,
    this.description,
    this.startDate,
    this.endDate,
    this.affiliatePartner,
    this.createdAt,
    this.updatedAt,
  });

  Coupon.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      advId = json["adv_id"];
      name = json["name"] != null ? json["name"] : '';
      code = json["code"] != null ? json["code"] : '';
      image = json["image"] != null ? json["image"] : '';
      heading = json["heading"] != null ? json["heading"] : '';
      description = json["description"] != null ? json["description"] : '';
      startDate = json["start_date"] != null ? DateTime.parse(json["start_date"]) : null;
      endDate = json["end_date"] != null ? DateTime.parse(json["end_date"]) : null;
      affiliatePartner = json["affiliate_partner"];
      createdAt = json["created_at"] != null ? DateTime.parse(json["created_at"]) : '';
      updatedAt = json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : '';
    } catch (e) {
      print("Exception - CouponModel.dart - Coupon.fromJson():" + e.toString());
    }
  }
}
