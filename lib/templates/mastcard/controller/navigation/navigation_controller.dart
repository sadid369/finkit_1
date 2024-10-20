import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  List pages = [];
  void onTapChangeIndex(int index) {
    currentIndex.value = index;
    update();
  }

  void onTapDoNotChangeIndex(int index) {
    update();
  }
}
