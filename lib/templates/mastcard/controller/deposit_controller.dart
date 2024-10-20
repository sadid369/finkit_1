import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/strings.dart';

class DepositController extends GetxController {
  
  RxString selectDepositMethod = Strings.selectDepositMethod.obs;
  final amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  List<String> depositMethod = [
    'Payeer',
    'Tether',
  ];
}
