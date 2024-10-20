import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';
import 'package:get/get.dart';


class WelcomeScreenController extends GetxController {
  goToSignInScreen() {
    Get.toNamed(Mascardroutes.mastcardSignInScreenMastCard);
  }

  goToSignUpScreen() {
    Get.toNamed(Mascardroutes.mastcardSignUpScreenMastCard);
  }
}
