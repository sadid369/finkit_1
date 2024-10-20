import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/controller/auth/sign_up_controller.dart';


import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class PhoneNumberWithCountryCodeInput extends StatelessWidget {
  const PhoneNumberWithCountryCodeInput({
    Key? key,
    required this.controller,
    required this.hintText,
    this.focusedBorderWidth = 1.6,
    this.enabledBorderWidth = 1.5,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final double focusedBorderWidth;
  final double enabledBorderWidth;

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.left,
          controller: controller,
          style: TextStyle(
            fontSize: Dimensions.smallTextSize,
            color: CustomColor.primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              borderSide: BorderSide(
                  color: CustomColor.primaryColor.withOpacity(0.4),
                  width: enabledBorderWidth),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              borderSide: BorderSide(
                  color: CustomColor.primaryColor.withOpacity(0.7),
                  width: focusedBorderWidth),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            hintText: hintText,
            hintStyle: CustomStyle.hintTextStyle,
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.only(left: 0, top: 15),
            prefixIcon: Obx(() {
              return SizedBox(
                width: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addHorizontalSpace(Dimensions.widthSize*0.5),
                    Text(
                      signUpController.countryCode.value,
                      style: TextStyle(
                        fontSize: Dimensions.smallTextSize,
                        color: CustomColor.primaryTextColor.withOpacity(0.5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),addHorizontalSpace(Dimensions.widthSize*0.4),
                    const Text('|'),
                  ],
                ),
              );
            }),
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        )
      ],
    );
  }
}
