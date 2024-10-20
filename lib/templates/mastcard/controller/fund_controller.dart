import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundController extends GetxController {
  final amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();

    super.dispose();
  }
}
