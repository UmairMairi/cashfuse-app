import 'package:cashfuse/constants/appConstant.dart';
import 'package:cashfuse/views/loginOrSignUpScreen.dart';
import 'package:cashfuse/widget/bannerImageWidget.dart';
import 'package:cashfuse/widget/drawerWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cashfuse/utils/global.dart' as global;

class GetStartedScreen extends StatelessWidget {
  final bool fromSplash;
  GetStartedScreen({this.fromSplash});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        fromSplash ? SystemNavigator.pop() : Get.back();
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: global.getPlatFrom() ? DrawerWidget() : null,
        appBar: global.getPlatFrom()
            ? WebTopBarWidget(
                scaffoldKey: scaffoldKey,
              )
            : null,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: global.getPlatFrom() ? AppConstants.WEB_MAX_WIDTH / 2 : null,
              child: VideoPlayer(
                splashController.videoPlayerController,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                  AppLocalizations.of(context).see_how_to,
                  style: Get.theme.primaryTextTheme.headline5.copyWith(
                    letterSpacing: -1.5,
                    fontWeight: FontWeight.w400,
                    color: global.getPlatFrom() ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  AppLocalizations.of(context).earn_cashback,
                  style: Get.theme.primaryTextTheme.displaySmall.copyWith(
                    letterSpacing: -2,
                    fontWeight: FontWeight.w500,
                    color: global.getPlatFrom() ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {
                  splashController.playPauseVideo();
                },
                icon: Icon(
                  splashController.videoPlayerController.value.isPlaying ? Icons.pause_circle_outline_rounded : Icons.play_circle_outline,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            fromSplash
                ? InkWell(
                    onTap: () {
                      Get.to(() => LoginOrSignUpScreen(
                            fromMenu: false,
                          ));
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        AppLocalizations.of(context).login_or_signup,
                        style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
