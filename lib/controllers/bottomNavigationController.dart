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
      'https://media.istockphoto.com/id/1323271459/video/connected-lines-and-particles-on-black-background.mp4?s=mp4-640x640-is&k=20&c=Jzkaf3VHLlSrBvCZDPqQgHzb0Ph5OdPhuDlMBBkDyFM=',
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
