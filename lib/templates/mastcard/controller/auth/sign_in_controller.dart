import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class SignInController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetPasswordController = TextEditingController();
  final pinCodeController = TextEditingController();
  bool hasError = false;

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  RxString currentText = "".obs;
  changeCurrentText(value) {
    currentText.value = value;
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    forgetPasswordController.dispose();
    pinCodeController.dispose();
    super.dispose();
  }

  goToOTPVerificationScreen() {
    Get.toNamed(Mascardroutes.oTPVerificationScreenMastCard);
  }

  goToResetPasswordScreen() {
    Get.toNamed(Mascardroutes.resetPasswordScreenMastCard);
  }

  goToNavigationScreen() {
    Get.offAllNamed(Mascardroutes.mastcardNavigationScreenMastCard);
  }
}
