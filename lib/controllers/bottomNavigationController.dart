//flutter

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
//views

class BottomNavigationController extends GetxController {
  var bottomNavIndex = 0.obs;
  VideoPlayerController videoPlayerController;

  @override
  void onInit() async {
    _init();
    videoPlayerController = VideoPlayerController.network(
      'https://dm0qx8t0i9gc9.cloudfront.net/watermarks/video/yRF5c-O/videoblocks-zodiac-horoscope-astrological-sun-signs-on-a-spinning-wheel-or-chakra-seamless-looping-animated-motion-background-gold-golden-brown-yellow-orange_rdngum3mm__1d234f9703b80881130961848a843dbe__P360.mp4',
    )..initialize().then((_) {
        videoPlayerController.pause();
        videoPlayerController.setLooping(true);

        update();
      });

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void playPauseVideo() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      update();
    } else {
      videoPlayerController.play();
      update();
    }
  }

  _init() async {
    await setBottomIndex(bottomNavIndex.value);
  }

  Future setBottomIndex(int index) async {
    try {
      bottomNavIndex.value = index;
      update();
    } catch (e) {
      print("Exception - BottomNavigationController.dart - setBottomIndex():" + e.toString());
    }
  }
}
