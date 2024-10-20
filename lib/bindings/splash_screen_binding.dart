
import 'package:finkit/controller/splash_screen_controller.dart';
import 'package:get/get.dart';class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
