import 'package:finkit/templates/mastcard/widgets/inputs/text_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';


class AmountInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Color? color;
  final double focusedBorderWidth;
  final double enabledBorderWidth;
  final Color borderColor;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final String labelText;

  const AmountInputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.readOnly = false,
    this.focusedBorderWidth = 1.6,
    this.enabledBorderWidth = 1.5,
    this.color = Colors.white,
    this.borderColor = CustomColor.primaryColor,
    this.suffixIcon,
    this.onTap,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLabelWidget(
          text: labelText,
        ),
        Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              height: Dimensions.inputBoxHeight,
              width: double.infinity,
              child: TextFormField(
                style: TextStyle(
                  color: CustomColor.primaryTextColor,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.w400,
                ),
                readOnly: readOnly!,
                // style: CustomStyle.textStyle,
                controller: controller,
                keyboardType: keyboardType,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return null;
                  } else {
                    return Strings.pleaseFillOutTheField;
                  }
                },
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
                  filled: true,
                  fillColor: color,
                  contentPadding: const EdgeInsets.only(
                      left: 15, right: 0, top: 14, bottom: 10),
                  hintText: hintText,
                  hintStyle: CustomStyle.hintTextStyle,
                ),
              ),
            ),
            Container(
              height: Dimensions.inputBoxHeight * 0.83,
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                color: CustomColor.screenBGColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius),
                  bottomRight: Radius.circular(Dimensions.radius),
                ),
              ),
              child: Center(
                  child: Text(
                'USD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.mediumTextSize,
                  fontWeight: FontWeight.w600,
                ),
              )),
            ),
          ],
        ),
        addVerticalSpace(Dimensions.heightSize),
      ],
    );
  }
}
