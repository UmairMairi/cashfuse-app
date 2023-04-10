import 'package:cashfuse/controllers/authController.dart';
import 'package:cashfuse/utils/global.dart' as global;
import 'package:cashfuse/views/loginOrSignUpScreen.dart';
import 'package:cashfuse/widget/drawerWidget.dart';
import 'package:cashfuse/widget/web/webTopBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../utils/images.dart';

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
        backgroundColor: Colors.white,
        key: scaffoldKey,
        drawer: global.getPlatFrom() ? DrawerWidget() : null,
        appBar: global.getPlatFrom()
            ? WebTopBarWidget(
                scaffoldKey: scaffoldKey,
              )
            : null,
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.logo,
                  fit: BoxFit.contain,
                  scale: 2,
                ),
              ],
            ),
          ),
        ),
        // Stack(
        //   alignment: Alignment.bottomCenter,
        //   children: [
        //     Container(
        //       height: MediaQuery.of(context).size.height,
        //       width: global.getPlatFrom() ? AppConstants.WEB_MAX_WIDTH / 2 : null,
        //       child: VideoPlayer(
        //         splash.videoPlayerController,
        //       ),
        //     ),
        //     !fromSplash
        //         ? InkWell(
        //             onTap: () {
        //               Get.back();
        //             },
        //             child: Align(
        //               alignment: Alignment.topLeft,
        //               child: Padding(
        //                 padding: EdgeInsets.only(left: 10, top: 40),
        //                 child: Icon(
        //                   Icons.arrow_back,
        //                   size: 26,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ),
        //           )
        //         : SizedBox(),
        //     Align(
        //       alignment: Alignment.topCenter,
        //       child: Padding(
        //         padding: const EdgeInsets.only(top: 70),
        //         child: Text(
        //           AppLocalizations.of(context).see_how_to,
        //           style: Get.theme.primaryTextTheme.headlineSmall.copyWith(
        //             letterSpacing: -1.5,
        //             fontWeight: FontWeight.w400,
        //             color: GetPlatform.isWeb ? Colors.black : Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Align(
        //       alignment: Alignment.topCenter,
        //       child: Padding(
        //         padding: const EdgeInsets.only(top: 100),
        //         child: Text(
        //           AppLocalizations.of(context).earn_cashback,
        //           style: Get.theme.primaryTextTheme.displaySmall.copyWith(
        //             letterSpacing: -2,
        //             fontWeight: FontWeight.w500,
        //             color: GetPlatform.isWeb ? Colors.black : Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Align(
        //       alignment: Alignment.center,
        //       child: IconButton(
        //         onPressed: () {
        //           splash.playPauseVideo();
        //         },
        //         icon: Icon(
        //           splash.videoPlayerController.value.isPlaying ? Icons.pause_circle_outline_rounded : Icons.play_circle_outline,
        //           color: Colors.white,
        //           size: 60,
        //         ),
        //       ),
        //     ),

        //   ],
        // );
        // }),
        bottomNavigationBar:
            // fromSplash
            //     ? InkWell(
            //         onTap: () async {
            //           Get.to(
            //             () => LoginOrSignUpScreen(
            //               fromMenu: false,
            //             ),
            //             routeName: 'login',
            //           );
            //         },
            //         child: Container(
            //           height: 50,
            //           margin: EdgeInsets.all(20),
            //           width: MediaQuery.of(context).size.width,
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //             color: Get.theme.primaryColor,
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Text(
            //             AppLocalizations.of(context).login_or_signup,
            //             style: Get.theme.primaryTextTheme.bodyLarge.copyWith(
            //               color: Colors.white,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ),
            //       )
            //     : SizedBox(),
            GetBuilder<AuthController>(builder: (authController) {
          return fromSplash
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () async {
                        await authController.googleSignInFun(fromSplash);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.google,
                              height: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Login with Google',
                              style: Get.theme.primaryTextTheme.titleMedium.copyWith(
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Get.to(
                          () => LoginOrSignUpScreen(
                            fromMenu: false,
                          ),
                          routeName: 'login',
                        );
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 20,
                              color: Colors.blue[800],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Login with Phone',
                              style: Get.theme.primaryTextTheme.titleMedium.copyWith(
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Get.to(
                          () => LoginOrSignUpScreen(
                            fromMenu: false,
                          ),
                          routeName: 'login',
                        );
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.email,
                              size: 20,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Login with Email',
                              style: Get.theme.primaryTextTheme.titleMedium.copyWith(
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox();
        }),
      ),
    );
  }
}
