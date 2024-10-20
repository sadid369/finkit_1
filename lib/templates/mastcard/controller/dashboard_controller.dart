import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../widgets/dashboard/buy_card_item_widget.dart';
import '../widgets/dashboard/card_item_widget.dart';

class DashboardController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetPasswordController = TextEditingController();
  final pinCodeController = TextEditingController();
  bool hasError = false;
  RxBool isTransaction = false.obs;

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  RxString currentText = "".obs;
  changeCurrentText(value) {
    currentText.value = value;
  }

  RxInt activeIndex = 0.obs;
  changeIndicator(int value) {
    activeIndex.value = value;
  }

  final List<Map<String, dynamic>> cardList = [
    {'name': 'Lifeline Card', 'balance': '500'},
    {'name': 'Lifeline Coin', 'balance': '900'},
    {'name': 'Cash Back Coin', 'balance': '1200'},
  ];

  // RxString cardName = ''.obs;
  // changeCardName({required String card}) {
  //   cardName.value = card;

  // }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    forgetPasswordController.dispose();
    pinCodeController.dispose();
    super.dispose();
  }

  final List<MyCardItemWidget> sliderList = [
    const MyCardItemWidget(
      cardHolderName: 'test user',
      cardExpDate: '11/2024',
      cardNumber: '5366131828291260',
    ),
    const MyCardItemWidget(
      cardHolderName: 'test user',
      cardExpDate: '11/2024',
      cardNumber: '5366131828291260',
    ),
    const MyCardItemWidget(
      cardHolderName: 'test user',
      cardExpDate: '11/2024',
      cardNumber: '5366131828291260',
    ),
    // const MyCardItemWidget(
    //   cardHolderName: 'test user',
    //   cardExpDate: '11/2024',
    //   cardNumber: '5366131828291260',
    // ),
    // const MyCardItemWidget(
    //   cardHolderName: 'test user',
    //   cardExpDate: '11/2024',
    //   cardNumber: '5366131828291260',
    // ),
  ];

  final List<BuyCardItemWidget> buyCardSliderList = [
    const BuyCardItemWidget(
      cardHolderName: 'test user',
      cardExpDate: '11/2024',
      cardNumber: '5366131828291260',
    ),
    const BuyCardItemWidget(
      cardHolderName: 'test user',
      cardExpDate: '11/2024',
      cardNumber: '5366131828291260',
    ),
    const BuyCardItemWidget(
      cardHolderName: 'test user',
      cardExpDate: '11/2024',
      cardNumber: '5366131828291260',
    ),
  ];
}
