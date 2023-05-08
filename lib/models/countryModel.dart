class CountryModel {
  int id;
  int phoneCode;
  String countryCode;
  String countryName;
  String currencyCode;
  String currencySymbol;
  String adNetworks;
  String slug;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  CountryModel({
    this.id,
    this.phoneCode,
    this.countryCode,
    this.countryName,
    this.currencyCode,
    this.currencySymbol,
    this.adNetworks,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json["id"];
      phoneCode = json["phone_code"];
      countryCode = json["country_code"] != null ? json["country_code"] : '';
      countryName = json["country_name"] != null ? json["country_name"] : '';
      currencyCode = json["currency_code"] != null ? json["currency_code"] : '';
      currencySymbol =
          json["currency_symbol"] != null ? json["currency_symbol"] : '';
      adNetworks = json["ad_networks"] != null ? json["ad_networks"] : '';
      slug = json["slug"] != null ? json["slug"] : '';
      status = json["status"];
      createdAt = json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : null;
      updatedAt = json["updated_at"] != null
          ? DateTime.parse(json["updated_at"])
          : null;
    } catch (e) {
      print("Exception - CountryModel.dart - CountryModel.fromJson():" +
          e.toString());
    }
  }
}
