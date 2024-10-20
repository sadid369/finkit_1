import 'dart:async';

import 'package:get/get.dart';

import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';


class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goToScreen();
  }

  _goToScreen() async {
    Timer(
      const Duration(seconds: 3),
      () => Get.offAllNamed(Mascardroutes.mastcardOnboardScreenMastCard),
    );
  }
}
