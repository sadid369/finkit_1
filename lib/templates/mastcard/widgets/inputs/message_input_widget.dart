import 'package:flutter/material.dart';
import 'package:finkit/templates/mastcard/widgets/inputs/text_label_widget.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/size.dart';
import '../../utils/strings.dart';

class MessageInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Color? color;
  final double focusedBorderWidth;
  final double enabledBorderWidth;
  final Color borderColor;
  final VoidCallback? onTap;
  final String labelText;

  const MessageInputWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.readOnly = false,
    this.focusedBorderWidth = 1.6,
    this.enabledBorderWidth = 1.5,
    this.color = Colors.white,
    this.borderColor = CustomColor.primaryColor,
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
        Container(
          height: Dimensions.inputBoxHeight * 3,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              border: Border.all(
                color: borderColor.withOpacity(0.4),
                width: enabledBorderWidth,
              )),
          child: TextFormField(
            maxLines: 100,
            style: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.smallTextSize,
              fontWeight: FontWeight.w400,
            ),
            readOnly: readOnly!,
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
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              filled: false,
              fillColor: color,
              contentPadding: const EdgeInsets.only(
                left: 10,
                right: 0,
                top: 14,
                bottom: 10,
              ),
              hintText: hintText,
              hintStyle: CustomStyle.hintTextStyle,
            ),
          ),
        ),
        addVerticalSpace(Dimensions.heightSize),
      ],
    );
  }
}
