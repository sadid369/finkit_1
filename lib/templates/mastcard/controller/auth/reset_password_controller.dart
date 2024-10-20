import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void dispose() {
    confirmPassword.dispose();
    passwordController.dispose();
    super.dispose();
  }

  goToCongratulationScreen() {
    Get.toNamed(Mascardroutes.congratulationScreenMastCard, arguments: {
    'message':Strings.congratulationsMessage,
    'route':Mascardroutes.mastcardSignInScreenMastCard,
    });
  }

  goToSignInScreen() {
    Get.toNamed(Mascardroutes.mastcardSignInScreenMastCard);
  }
}
