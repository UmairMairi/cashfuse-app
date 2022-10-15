import 'package:cashbackapp/controllers/bottomNavigationController.dart';
import 'package:cashbackapp/views/loginOrSignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(builder: (navController) {
      return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: VideoPlayer(
                  navController.videoPlayerController,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    'See How To',
                    style: Get.theme.primaryTextTheme.headline5.copyWith(
                      letterSpacing: -1.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    'Earn Cashback',
                    style: Get.theme.primaryTextTheme.displaySmall.copyWith(
                      letterSpacing: -2,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    navController.playPauseVideo();
                  },
                  icon: Icon(
                    navController.videoPlayerController.value.isPlaying ? Icons.pause_circle_outline_rounded : Icons.play_circle_outline,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => LoginOrSignUpScreen());
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Get.theme.secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'LOG IN OR SIGN UP',
                    style: Get.theme.primaryTextTheme.bodyText1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
