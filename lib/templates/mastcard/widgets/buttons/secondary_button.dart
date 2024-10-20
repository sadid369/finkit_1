import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.borderColorName,
    this.borderWidth = 1,
    required this.fillColor,
    this.height,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final Color borderColorName;
  final Color fillColor;
  final double borderWidth;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Dimensions.buttonHeight * 0.8,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          backgroundColor: fillColor,
          side: BorderSide(
            width: borderWidth,
            color: borderColorName,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: Dimensions.mediumTextSize,
            color: borderColorName,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
