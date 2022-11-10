import 'package:cashbackapp/models/bankDetailsModel.dart';
import 'package:cashbackapp/models/earningModel.dart';
import 'package:cashbackapp/models/paymentHistoryModel.dart';

class UserModel {
  int id;
  String name;
  String image;
  String email;
  String phone;
  String cmFirebaseToken;
  DateTime emailVerifiedAt;
  int isPhoneVerified;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String token;

  EarningModel earning;
  List<PaymentHistoryModel> withdrawalRequest;
  BankDetailsModel bankDetail;

  UserModel({
    this.id,
    this.name,
    this.image,
    this.email,
    this.phone,
    this.cmFirebaseToken,
    this.emailVerifiedAt,
    this.isPhoneVerified,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      name = json["name"] != null ? json["name"] : '';
      image = json["image"] != null ? json["image"] : '';
      email = json["email"] != null ? json["email"] : '';
      phone = json["phone"] != null ? json["phone"] : '';
      cmFirebaseToken = json["cm_firebase_token"] != null ? json["cm_firebase_token"] : '';
      emailVerifiedAt = json["email_verified_at"];
      isPhoneVerified = json["is_phone_verified"];
      status = json["status"];
      createdAt = DateTime.parse(json["created_at"]);
      updatedAt = DateTime.parse(json["updated_at"]);
      token = json['token'] != null ? json['token'] : null;
      earning = json['earning'] != null ? EarningModel.fromJson(json['earning']) : null;
      bankDetail = json['bank_detail'] != null ? BankDetailsModel.fromJson(json['bank_detail']) : null;
      withdrawalRequest = json["withdrawal_request"] != null && json["withdrawal_request"] != [] ? List<PaymentHistoryModel>.from(json["withdrawal_request"].map((x) => PaymentHistoryModel.fromJson(x))) : [];
    } catch (e) {
      print("Exception - UserModel.dart - UserModel.fromJson():" + e.toString());
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "email": email,
        "phone": phone,
        "cm_firebase_token": cmFirebaseToken,
        "email_verified_at": emailVerifiedAt,
        "is_phone_verified": isPhoneVerified,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "token": token,
        "earning": earning != null ? earning.toJson() : null,
        "bank_detail": bankDetail != null ? bankDetail.toJson() : null,
        "withdrawal_request": withdrawalRequest != null && withdrawalRequest.length > 0 ? withdrawalRequest : null,
      };
}