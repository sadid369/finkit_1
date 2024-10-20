// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();


   
  }

  createTicket() {
   // Get.toNamed(Mascardroutes.);
  }


}
