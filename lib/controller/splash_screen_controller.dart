import 'dart:async';
import 'package:finkit/routes/pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // var languageList = LocalStorage.getLanguage();
    // var locale = Locale(languageList[0], languageList[1]);
    // Get.updateLocale(locale);
    _goToScreen();
  }

  _goToScreen() async {
    Timer(
      const Duration(seconds: 2),
      () => Get.offAllNamed(Mainroutes.homeFinkit),
    );
  }
}
