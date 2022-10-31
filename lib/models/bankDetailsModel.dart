class BankDetailsModel {
  int id;
  int userId;
  String acNo;
  String acHolderName;
  String bankName;
  String ifsc;
  dynamic upi;
  dynamic paytmNo;
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
    this.createdAt,
    this.updatedAt,
  });

  BankDetailsModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      userId = json["user_id"];
      acNo = json["ac_no"];
      acHolderName = json["ac_holder_name"];
      bankName = json["bank_name"];
      ifsc = json["ifsc"];
      upi = json["upi"];
      paytmNo = json["paytm_no"];
      createdAt = DateTime.parse(json["created_at"]);
      updatedAt = DateTime.parse(json["updated_at"]);
    } catch (e) {
      print("Exception - BankDetailsModel.dart - BankDetailsModel.fromJson():" + e.toString());
    }
  }
}
