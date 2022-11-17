class EarningModel {
  int id;
  int userId;
  int totalEarnings;
  int withdrawal;
  int remEarning;
  int sentForWithdrawal;
  int referralEarning;
  DateTime createdAt;
  DateTime updatedAt;

  EarningModel({
    this.id,
    this.userId,
    this.totalEarnings,
    this.withdrawal,
    this.remEarning,
    this.sentForWithdrawal,
    this.referralEarning,
    this.createdAt,
    this.updatedAt,
  });

  EarningModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      userId = json["user_id"];
      totalEarnings = json["total_earnings"] != null ? json["total_earnings"] : 0;
      withdrawal = json["withdrawal"] != null ? json["withdrawal"] : 0;
      remEarning = json["rem_earning"] != null ? json["rem_earning"] : 0;
      sentForWithdrawal = json["sent_for_withdrawal"] != null ? json["sent_for_withdrawal"] : 0;
      referralEarning = json["referral_earning"] != null ? json["referral_earning"] : 0;
      createdAt = json["created_at"] != null ? DateTime.parse(json["created_at"]) : null;
      updatedAt = json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null;
    } catch (e) {
      print("Exception - EarningModel.dart - EarningModel.fromJson():" + e.toString());
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "total_earnings": totalEarnings,
        "withdrawal": withdrawal,
        "rem_earning": remEarning,
        "sent_for_withdrawal": sentForWithdrawal,
        "referral_earning": referralEarning,
        "created_at": createdAt != null ? createdAt.toIso8601String() : null,
        "updated_at": updatedAt != null ? updatedAt.toIso8601String() : null,
      };
}
