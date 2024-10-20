import 'package:finkit/bindings/splash_screen_binding.dart';
import 'package:finkit/routes/routes.dart';
import 'package:finkit/templates/mastcard/views/splash_screen/splash_screen.dart';
// import 'package:finkit/views/splash/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../views/main_screen/main_screen.dart';
import '../views/main_screen/settings_screen.dart';

class Mainroutes {
  static const String splashScreenFinkit = '/splashScreenFinkit';
  static const String homeFinkit = '/homeFinkit';
  static const String settingScreenFinkit = '/settingScreenFinkit';
  static void initialize() {
    Baseroutes.list.addAll([
      GetPage(
          name: splashScreenFinkit,
          page: () => const SplashScreen(),
          binding: SplashBinding()),
      GetPage(
        name: homeFinkit,
        page: () => Home(),
      ),
      GetPage(
        name: settingScreenFinkit,
        page: () => const SettingScreen(),
      )
    ]);
  }
}
