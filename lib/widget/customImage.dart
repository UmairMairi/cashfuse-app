// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cashbackapp/models/adsModel.dart';
import 'package:cashbackapp/models/campaignModel.dart';
import 'package:cashbackapp/models/couponModel.dart';
import 'package:cashbackapp/models/offerModel.dart';
import 'package:cashbackapp/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double height;
  double width;
  final BoxFit fit;
  final String placeholder;
  final OfferModel offer;
  final CampaignModel campaign;
  final AdsModel ads;
  final Coupon coupon;
  CustomImage({
    @required this.image,
    this.height,
    this.width,
    this.fit,
    this.placeholder = Images.placeholder,
    this.offer,
    this.campaign,
    this.ads,
    this.coupon,
  }) {
    width != null ? width = width : width = height;
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(image: imageProvider, fit: fit),
              ),
            ),
        placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
              color: Get.theme.primaryColor,
            )),
        errorWidget: (context, url, error) {
          if (offer != null) {
            offer.isImageError = true;
          } else if (campaign != null) {
            campaign.isImageError = true;
          } else if (ads != null) {
            ads.isImageError = true;
          } else if (coupon != null) {
            coupon.isImageError = true;
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              image: DecorationImage(image: AssetImage('${Images.dummyImage}'), fit: fit),
            ),
          );
        });
  }
}
