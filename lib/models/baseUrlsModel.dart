class BaseUrls {
  String offerImageUrl;
  String partnerImageUrl;
  String userImageUrl;
  String categoryImageUrl;
  String businessLogoUrl;
  String bannerImageUrl;
  String faqImageUrl;
  String couponBannerImageUrl;

  BaseUrls({
    this.offerImageUrl,
    this.partnerImageUrl,
    this.userImageUrl,
    this.categoryImageUrl,
    this.businessLogoUrl,
    this.bannerImageUrl,
    this.faqImageUrl,
    this.couponBannerImageUrl,
  });

  BaseUrls.fromJson(Map<String, dynamic> json) {
    try {
      offerImageUrl = json["offer_image_url"] != null ? json["offer_image_url"] : '';
      partnerImageUrl = json["partner_image_url"] != null ? json["partner_image_url"] : '';
      userImageUrl = json["user_image_url"] != null ? json["user_image_url"] : '';
      categoryImageUrl = json["category_image_url"] != null ? json["category_image_url"] : '';
      businessLogoUrl = json["business_logo_url"] != null ? json["business_logo_url"] : '';
      bannerImageUrl = json["banner_image_url"] != null ? json["banner_image_url"] : '';
      faqImageUrl = json["faq_image_url"] != null ? json["faq_image_url"] : '';
      couponBannerImageUrl = json["coupon_banner_url"] != null ? json["coupon_banner_url"] : '';
    } catch (e) {
      print("Exception - BaseUrls.dart - BaseUrls.fromJson():" + e.toString());
    }
  }
}
