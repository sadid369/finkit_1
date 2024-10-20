import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';


class SignUpController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxString countryCode = '+1'.obs;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    countryController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  goToOTPVerificationScreen() {
    Get.toNamed(Mascardroutes.oTPVerificationScreenMastCard);
  }

  goToResetPasswordScreen() {
    Get.toNamed(Mascardroutes.resetPasswordScreenMastCard);
  }

  goToOTPEmailVerificationScreen() {
    Get.toNamed(Mascardroutes.oTPEmailVerificationScreenMastCard);
  }
}
