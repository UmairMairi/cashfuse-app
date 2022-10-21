class BaseUrls {
  String offerImageUrl;
  String partnerImageUrl;
  String userImageUrl;
  String categoryImageUrl;
  String businessLogoUrl;
  String bannerImageUrl;

  BaseUrls({
    this.offerImageUrl,
    this.partnerImageUrl,
    this.userImageUrl,
    this.categoryImageUrl,
    this.businessLogoUrl,
    this.bannerImageUrl,
  });

  BaseUrls.fromJson(Map<String, dynamic> json) {
    try {
      offerImageUrl = json["offer_image_url"] != null ? json["offer_image_url"] : '';
      partnerImageUrl = json["partner_image_url"] != null ? json["partner_image_url"] : '';
      userImageUrl = json["user_image_url"] != null ? json["user_image_url"] : '';
      categoryImageUrl = json["category_image_url"] != null ? json["category_image_url"] : '';
      businessLogoUrl = json["business_logo_url"] != null ? json["business_logo_url"] : '';
      bannerImageUrl = json["banner_image_url"] != null ? json["banner_image_url"] : '';
    } catch (e) {
      print("Exception - BaseUrls.dart - BaseUrls.fromJson():" + e.toString());
    }
  }
}
