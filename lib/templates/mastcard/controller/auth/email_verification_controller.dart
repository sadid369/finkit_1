import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';

import '../../utils/strings.dart';

class EmailVerificationController extends GetxController {
  final pinCodeController = TextEditingController();
  bool hasError = false;
  RxString currentText = "".obs;

  changeCurrentText(value) {
    currentText.value = value;
  }

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  @override
  void dispose() {
    pinCodeController.dispose();
    super.dispose();
  }

  goToEmailCongratulationScreen() {
    Get.toNamed(Mascardroutes.emailCongratulationScreenMastCard, arguments: {
      'message': Strings.congratulationsEmailMessage,
      'route': Mascardroutes.mastcardSignInScreenMastCard,
    });
  }

  goToSignInScreen() {
    Get.toNamed(Mascardroutes.mastcardSignInScreenMastCard);
  }
}
