class LanguageModel {
  String key;
  String imageUrl;
  String languageName;
  String languageCode;
  String countryCode;
  bool isLangShown;

  LanguageModel({this.key, this.imageUrl, this.languageName, this.countryCode, this.languageCode, this.isLangShown});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    try {
      key = json["key"] != null ? json["key"] : '';
      languageName = json["value"] != null ? json["value"] : '';
    } catch (e) {
      print("Exception - LanguageModel.dart - LanguageModel.fromJson():" + e.toString());
    }
  }
}
