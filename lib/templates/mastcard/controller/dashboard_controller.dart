import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/custom_color.dart';
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

  RxBool isOrder = true.obs;
  changeIsOrder(value) {
    isOrder.value = value;
  }

  RxInt activeIndex = 0.obs;
  changeIndicator(int value) {
    activeIndex.value = value;
  }

  List<Map<String, dynamic>> tData = [
    {
      'title': 'Send To Shivraj Patil',
      'txnDescription': 'Debited from Lifeline Card Wallet',
      'subTitle': 'Cashback Coin Earned',
      'date': '23rd Feb, 2024 . 11.35PM',
      'txnId': 'T67642578547',
      'amount': -999,
      'coinAmount': 00.00,
      'txnType': 'Send',
    },
    {
      'title': 'Received From Shivraj Patil',
      'txnDescription': 'Credited To Lifeline Card Wallet',
      'subTitle': 'Cashback Coin Earned',
      'date': '23rd Feb, 2024 . 11.35PM',
      'txnId': 'T67642578547',
      'amount': 999,
      'coinAmount': 00.00,
      'txnType': 'Received',
    },
    {
      'title': 'Send To Bnak',
      'txnDescription': 'Debited from Lifeline Card Wallet',
      'subTitle': 'Cashback Coin Earned',
      'date': '23rd Feb, 2024 . 11.35PM',
      'txnId': 'T67642578547',
      'amount': -999,
      'coinAmount': 00.00,
      'txnType': 'Send',
    },
    {
      'title': 'Rewarded From Refferal',
      'txnDescription': 'Credited To Lifeline Card Wallet',
      'subTitle': 'Cashback Coin Earned',
      'date': '23rd Feb, 2024 . 11.35PM',
      'txnId': 'T67642578547',
      'amount': 1000,
      'coinAmount': 00.00,
      'txnType': 'Rewarded',
    },
    {
      'title': 'Debited To Udhar',
      'txnDescription': 'Debited from Lifeline Card Wallet',
      'subTitle': 'Cashback Coin Earned',
      'date': '23rd Feb, 2024 . 11.35PM',
      'txnId': 'T67642578547',
      'amount': -999,
      'coinAmount': 00.00,
      'txnType': 'Debited',
    },
  ];
  List<Map<String, dynamic>> tCoinData = [
    {
      'title': 'Received From CashBack Coin Wallet',
      'txnDescription': 'Lifeline Coin Was Created',
      'subTitle': 'Cashback Coin Earned',
      'date': '23rd Feb, 2024 . 11.35PM',
      'txnId': 'T67642578547',
      'amount': 3000,
      'coinAmount': 3,
      'txnType': 'Received',
    },
    {
      'title': 'Received From CashBack Coin Wallet',
      'txnDescription': 'Lifeline Coin Was Created',
      'subTitle': 'Cashback Coin Earned',
      'date': '23rd Feb, 2024 . 11.35PM',
      'txnId': 'T67642578547',
      'amount': 3000,
      'coinAmount': 3,
      'txnType': 'Received',
    },
    {
      'title': 'Received From CashBack Coin Wallet',
      'txnDescription': 'Lifeline Coin Was Created',
      'subTitle': 'Cashback Coin Earned',
      'date': '23rd Feb, 2024 . 11.35PM',
      'txnId': 'T67642578547',
      'amount': 3000,
      'coinAmount': 3,
      'txnType': 'Received',
    },
    {
      'title': 'Received From CashBack Coin Wallet',
      'txnDescription': 'Lifeline Coin Was Created',
      'subTitle': 'Cashback Coin Earned',
      'date': '23rd Feb, 2024 . 11.35PM',
      'txnId': 'T67642578547',
      'amount': 3000,
      'coinAmount': 3,
      'txnType': 'Received',
    },
  ];
  final List<Map<String, dynamic>> cardList = [
    {
      'name': 'Lifeline Card',
      'balance': '500',
      "color": CustomColor.primaryColor,
      'validity': '10/26'
    },
    {
      'name': 'Lifeline Coin',
      'balance': '900',
      "color": CustomColor.secondaryColor,
      'validity': '16/28'
    },
    {
      'name': 'CashBack Coin',
      'balance': '1200',
      "color": CustomColor.screenBGColor,
      'validity': '19/32'
    },
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
