import 'package:cashbackapp/models/adsModel.dart';
import 'package:cashbackapp/models/campaignModel.dart';
import 'package:cashbackapp/utils/global.dart' as global;
import 'package:cashbackapp/views/ratesAndTermScreen.dart';
import 'package:cashbackapp/widget/customImage.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreOfferWidget extends StatelessWidget {
  final AdsModel ads;
  final CampaignModel campaign;
  StoreOfferWidget({this.ads, this.campaign});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ads != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: RotatedBox(
                          quarterTurns: -45,
                          child: ClipPath(
                            clipper: MultiplePointsClipper(Sides.bottom, heightOfPoint: 10, numberOfPoints: 1),
                            child: Container(
                              width: 20,
                              height: 135,
                              decoration: BoxDecoration(
                                  color: Colors.red[600],
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                  )),
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(top: 5),
                              child: RotatedBox(
                                quarterTurns: 45,
                                child: Text(
                                  'GREAT INDIAN FESTIVAL',
                                  textAlign: TextAlign.center,
                                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomImage(
                          image: '${global.appInfo.baseUrls.categoryImageUrl}/${ads.image}',
                          height: 32,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.orange[700],
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          ads.buttonText,
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => RatesAndTermScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Container(
                          height: 45,
                          alignment: Alignment.center,
                          child: Text(
                            'Rewards Rates & Terms',
                            textAlign: TextAlign.center,
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                              color: Colors.teal,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : SizedBox(),
            campaign != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: RotatedBox(
                          quarterTurns: -45,
                          child: ClipPath(
                            clipper: MultiplePointsClipper(Sides.bottom, heightOfPoint: 10, numberOfPoints: 1),
                            child: Container(
                              width: 20,
                              height: 135,
                              decoration: BoxDecoration(
                                  color: Colors.red[600],
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                  )),
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.only(top: 5),
                              child: RotatedBox(
                                quarterTurns: 45,
                                child: Text(
                                  'GREAT INDIAN FESTIVAL',
                                  textAlign: TextAlign.center,
                                  style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomImage(
                          image: '${global.appInfo.baseUrls.offerImageUrl}/${campaign.image}',
                          height: 32,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.orange[700],
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          campaign.buttonText,
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => RatesAndTermScreen(),
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: Container(
                          height: 45,
                          alignment: Alignment.center,
                          child: Text(
                            'Rewards Rates & Terms',
                            textAlign: TextAlign.center,
                            style: Get.theme.primaryTextTheme.bodySmall.copyWith(
                              color: Colors.teal,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : SizedBox(),
            // Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Align(
            //         alignment: Alignment.topLeft,
            //         child: RotatedBox(
            //           quarterTurns: -45,
            //           child: ClipPath(
            //             clipper: MultiplePointsClipper(Sides.bottom, heightOfPoint: 10, numberOfPoints: 1),
            //             child: Container(
            //               width: 20,
            //               height: 135,
            //               decoration: BoxDecoration(
            //                   color: Colors.red[600],
            //                   borderRadius: BorderRadius.only(
            //                     topRight: Radius.circular(10),
            //                   )),
            //               alignment: Alignment.topCenter,
            //               padding: EdgeInsets.only(top: 5),
            //               child: RotatedBox(
            //                 quarterTurns: 45,
            //                 child: Text(
            //                   'GREAT INDIAN FESTIVAL',
            //                   textAlign: TextAlign.center,
            //                   style: Get.theme.primaryTextTheme.bodySmall.copyWith(
            //                     color: Colors.white,
            //                     fontSize: 10,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Image.asset(
            //           Images.amazon,
            //           height: 32,
            //         ),
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(top: 10),
            //         padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            //         decoration: BoxDecoration(
            //           color: Colors.orange[700],
            //           borderRadius: BorderRadius.circular(2),
            //         ),
            //         child: Text(
            //           "Grab Deal",
            //           style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //       InkWell(
            //         onTap: () {
            //           Get.to(
            //             () => RatesAndTermScreen(),
            //             transition: Transition.rightToLeft,
            //           );
            //         },
            //         child: Container(
            //           height: 45,
            //           alignment: Alignment.center,
            //           child: Text(
            //             'Rewards Rates & Terms',
            //             textAlign: TextAlign.center,
            //             style: Get.theme.primaryTextTheme.bodySmall.copyWith(
            //               color: Colors.teal,
            //               fontSize: 10,
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
          ],
        ));
  }
}
