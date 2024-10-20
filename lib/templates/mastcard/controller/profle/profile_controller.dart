import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class ProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();
  final newPasswordController = TextEditingController();
  final oldPasswordController = TextEditingController();
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
    newPasswordController.dispose();
    oldPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
    goToEditProfileScreen() {
      Get.toNamed(Mascardroutes.editProfileScreenMastCard);
    }

    goToTwoFactorScreen() {
      Get.toNamed(Mascardroutes.twoFactorScreenMastCard);
    }
    goToChangePasswordScreen() {
        Get.toNamed(Mascardroutes.changePasswordScreenMastCard);
    }


     File? image;

  final picker = ImagePicker();

  Future chooseFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {}
    update();
  }

  Future chooseFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {}
    update();
  }
  }

