import 'package:cashfuse/models/adModel.dart';

class AdmobSettingModel {
  List<AdModel> banner;
  List<AdModel> native;
  List<AdModel> interstitial;
  List<AdModel> rewards;

  AdmobSettingModel({
    this.banner,
    this.native,
    this.interstitial,
    this.rewards,
  });

  AdmobSettingModel.fromJson(Map<String, dynamic> json) {
    try {
      banner = json["banner"] != null && json["banner"] != [] ? List<AdModel>.from(json["banner"].map((x) => AdModel.fromJson(x))) : [];
      native = json["native"] != null && json["native"] != [] ? List<AdModel>.from(json["native"].map((x) => AdModel.fromJson(x))) : [];
      interstitial = json["interstitial"] != null && json["interstitial"] != [] ? List<AdModel>.from(json["interstitial"].map((x) => AdModel.fromJson(x))) : [];
      rewards = json["rewards"] != null && json["rewards"] != [] ? List<AdModel>.from(json["rewards"].map((x) => AdModel.fromJson(x))) : [];
    } catch (e) {
      print("Exception - AdmobSettingModel.dart - AdmobSettingModel.fromJson():" + e.toString());
    }
  }
}
