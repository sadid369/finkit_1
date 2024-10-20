import 'package:country_code_picker/country_code_picker.dart';
import 'package:finkit/templates/mastcard/controller/auth/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class SignUpCountryCodePickerWidget extends StatelessWidget {
  const SignUpCountryCodePickerWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final ValueChanged? onChanged;

  // static String? countryName =;

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius),
            border: Border.all(
              color: CustomColor.primaryColor.withOpacity(0.4),
              width: 1.5,
            ),
          ),
          width: double.infinity,
          height: Dimensions.buttonHeight * 0.9,
          child: CountryCodePicker(
            padding: EdgeInsets.zero,
            textStyle: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.smallTextSize,
              fontWeight: FontWeight.w400,
            ),
            onChanged: (value) {
              controller.text = value.name!;
              signUpController.countryCode.value = value.dialCode.toString();
            },
            // onChanged: onChanged,
            showOnlyCountryWhenClosed: true,
            showDropDownButton: true,
            initialSelection: 'US',
            // initialSelection: controller.text,
            backgroundColor: Colors.transparent,
            alignLeft: true,
            // onInit: (code) => {profileController.countryController.text = code?.name},
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        )
      ],
    );
  }
}
