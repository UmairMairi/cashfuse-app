import 'package:get/get.dart';

class RatingController extends GetxController {
  double ratingVal = 1;
  String ratingText = 'Terrible';

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setRating(double value) {
    ratingVal = value;
    update();
    if (ratingVal == 1) {
      ratingText = 'Terrible';
      update();
    } else if (ratingVal == 2) {
      ratingText = "Not Great";
      update();
    } else if (ratingVal == 3) {
      ratingText = 'Average';
      update();
    } else if (ratingVal == 4) {
      ratingText = 'Good Experience';
      update();
    } else if (ratingVal == 5) {
      ratingText = 'Awesome Experience';
      update();
    }
  }
}
