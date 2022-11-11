import 'package:cashbackapp/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderModel {
  int id;
  String cId;
  String logo;
  String advertisers;
  String partnerOrderId;
  String affiliatePartner;
  String orderAmount;
  String earningAmount;
  String orderStatus;
  int userId;
  String url;
  DateTime referDate;
  DateTime eventDate;
  DateTime lockingDate;
  DateTime createdAt;
  DateTime updatedAt;
  UserModel user;

  OrderModel({
    this.id,
    this.cId,
    this.logo,
    this.advertisers,
    this.partnerOrderId,
    this.affiliatePartner,
    this.orderAmount,
    this.earningAmount,
    this.orderStatus,
    this.userId,
    this.url,
    this.referDate,
    this.eventDate,
    this.lockingDate,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      cId = json["c_id"];
      logo = json["logo"] != null ? json["logo"] : '';
      advertisers = json["advertisers"];
      partnerOrderId = json["partner_order_id"];
      affiliatePartner = json["affiliate_partner"];
      orderAmount = json["order_amount"];
      earningAmount = json["earning_amount"];
      orderStatus = json["order_status"];
      userId = json["user_id"];
      url = json["url"];
      referDate = DateTime.parse(json["refer_date"]);
      eventDate = DateTime.parse(json["event_date"]);
      lockingDate = DateTime.parse(json["locking_date"]);
      createdAt = DateTime.parse(json["created_at"]);
      updatedAt = DateTime.parse(json["updated_at"]);
      user = json["user"] != null ? UserModel.fromJson(json["user"]) : null;
    } catch (e) {
      print("Exception - OrderModel.dart - OrderModel.fromJson():" + e.toString());
    }
  }
}
