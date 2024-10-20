
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:flutter/material.dart';
Widget   depositLimitWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        RichText(
          text: TextSpan(
            text: Strings.depositLimit,
            style: TextStyle(
              color: CustomColor.primaryTextColor.withOpacity(0.7),
              fontSize: Dimensions.smallestTextSize,
              fontWeight: FontWeight.w400,
            ),
            children: const [
              TextSpan(
                text: ' 0.10 - 500,000.00 USD',
              ),
            ],
          ),
        ),
        addVerticalSpace(Dimensions.heightSize * 0.4),
        RichText(
          text: TextSpan(
            text: "${Strings.charge}:",
            style: TextStyle(
              color: CustomColor.primaryTextColor.withOpacity(0.7),
              fontSize: Dimensions.smallestTextSize,
              fontWeight: FontWeight.w400,
            ),
            children: const [
              TextSpan(
                text: ' 0.00 USD',
              ),
            ],
          ),
        ),
      ],
    );
  }