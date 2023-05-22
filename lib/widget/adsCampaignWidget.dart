import 'package:cashfuse/models/commonModel.dart';
import 'package:cashfuse/utils/images.dart';
import 'package:cashfuse/widget/customImage.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';

class AdsCampaignWidget extends StatelessWidget {
  final CommonModel commonModel;
  AdsCampaignWidget({required this.commonModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child:
          // commonModel.name == 'Ad'
          //     ? FacebookNativeAd(
          //         keepAlive: true,
          //         placementId: "VID_HD_16_9_46S_APP_INSTALL#536153035214384_536880055141682",
          //         adType: NativeAdType.NATIVE_AD_VERTICAL,
          //         // width: Get.width,
          //         // height: 300,
          //         backgroundColor: Colors.blue,
          //         titleColor: Colors.white,
          //         descriptionColor: Colors.white,
          //         buttonColor: Colors.deepPurple,
          //         buttonTitleColor: Colors.white,
          //         buttonBorderColor: Colors.white,
          //         listener: (result, value) {
          //           print("Native Ad: $result --> $value");
          //         },
          //         keepExpandedWhileLoading: true,
          //         expandAnimationDuraion: 1000,
          //       )
          //:
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: commonModel.tagline != null
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          commonModel.tagline != null && commonModel.tagline!.isNotEmpty
              ? Align(
                  alignment: Alignment.topLeft,
                  child: RotatedBox(
                    quarterTurns: -45,
                    child: ClipPath(
                      clipper: MultiplePointsClipper(Sides.bottom,
                          heightOfPoint: 10, numberOfPoints: 1),
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
                          child: GetPlatform.isWeb
                              ? Text(
                                  commonModel.tagline!,
                                  textAlign: TextAlign.center,
                                  style: Get.theme.primaryTextTheme.bodySmall!
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                )
                              : Text(
                                  commonModel.tagline!,
                                  textAlign: TextAlign.center,
                                  style: Get.theme.primaryTextTheme.bodySmall!
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ).translate(),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: CustomImage(
              image: commonModel.image!,
              //height: 32,
              height: 70,

              //width: 100,
              fit: BoxFit.contain,
              errorImage: Images.dummyImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GetPlatform.isWeb
                ? Text(
                    commonModel.name!,
                    style: Get.theme.primaryTextTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )
                : Text(
                    commonModel.name!,
                    style: Get.theme.primaryTextTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ).translate(),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            decoration: BoxDecoration(
              color: Get.theme.secondaryHeaderColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: GetPlatform.isWeb
                ? Text(
                    commonModel.buttonText != null
                        ? commonModel.buttonText!
                        : 'Grab deal',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  )
                : Text(
                    commonModel.buttonText != null
                        ? commonModel.buttonText!
                        : 'Grab deal',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ).translate(),
          ),
          // InkWell(
          //   onTap: () {
          //     Get.to(
          //       () => RatesAndTermScreen(
          //         commonModel: commonModel,
          //       ),
          //       transition: Transition.rightToLeft,
          //     );
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 10),
          //     //height: 20,
          //     //alignment: Alignment.center,
          //     child: Text(
          //       'Rewards Rates & Terms',
          //       textAlign: TextAlign.center,
          //       style: Get.theme.primaryTextTheme.bodySmall.copyWith(
          //         color: Colors.teal,
          //         fontSize: 10,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
