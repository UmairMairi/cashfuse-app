class BankDetailsModel {
  int id;
  String userId;
  String acNo;
  String acHolderName;
  String bankName;
  String ifsc;
  String upi;
  String paytmNo;
  String amazonNo;
  DateTime createdAt;
  DateTime updatedAt;

  BankDetailsModel({
    this.id,
    this.userId,
    this.acNo,
    this.acHolderName,
    this.bankName,
    this.ifsc,
    this.upi,
    this.paytmNo,
    this.amazonNo,
    this.createdAt,
    this.updatedAt,
  });

  BankDetailsModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      userId = json["user_id"];
      acNo = json["ac_no"] != null ? json["ac_no"] : '';
      acHolderName = json["ac_holder_name"] != null ? json["ac_holder_name"] : '';
      bankName = json["bank_name"] != null ? json["bank_name"] : '';
      ifsc = json["ifsc"] != null ? json["ifsc"] : '';
      upi = json["upi"] != null ? json["upi"] : '';
      paytmNo = json["paytm_no"] != null ? json["paytm_no"] : '';
      amazonNo = json["amazon_no"] != null ? json["amazon_no"] : '';
      createdAt = DateTime.parse(json["created_at"]);
      updatedAt = DateTime.parse(json["updated_at"]);
    } catch (e) {
      print("Exception - BankDetailsModel.dart - BankDetailsModel.fromJson():" + e.toString());
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "ac_no": acNo,
        "ac_holder_name": acHolderName,
        "bank_name": bankName,
        "ifsc": ifsc,
        "upi": upi,
        "paytm_no": paytmNo,
        "amazon_no": amazonNo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
