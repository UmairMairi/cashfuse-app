class PaymentHistoryModel {
  int id;
  int userId;
  int amount;
  int approved;
  DateTime createdAt;
  DateTime updatedAt;
  String medium;
  String mediumDetails;

  PaymentHistoryModel({
    this.id,
    this.userId,
    this.amount,
    this.approved,
    this.createdAt,
    this.updatedAt,
    this.medium,
    this.mediumDetails,
  });

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      userId = json["user_id"];
      amount = json["amount"];
      approved = json["approved"];
      createdAt = DateTime.parse(json["created_at"]);
      updatedAt = DateTime.parse(json["updated_at"]);
      medium = json["medium"];
      mediumDetails = json["medium_details"];
    } catch (e) {
      print("Exception - PaymentHistoryModel.dart - PaymentHistoryModel.fromJson():" + e.toString());
    }
  }
}
