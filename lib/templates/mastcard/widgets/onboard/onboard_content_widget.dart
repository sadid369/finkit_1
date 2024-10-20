import 'dart:io';

import 'package:flutter/material.dart';

import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/size.dart';

class OnboardContentWidget extends StatelessWidget {
  const OnboardContentWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.backgroundImagePath,
  }) : super(key: key);

  final String image, title, backgroundImagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImagePath),
          fit: BoxFit.fitWidth,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.widthSize * 2),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.80,
        child: Column(
          mainAxisAlignment: mainStart,
          children: [
            addVerticalSpace(Dimensions.heightSize * 13),
            Image.asset(
              image,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPaddingSize),
              margin: EdgeInsets.only(
                  top: Platform.isAndroid ? Dimensions.widthSize * 5 : Dimensions.widthSize * 8,
                  bottom: Dimensions.widthSize * 2),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: CustomStyle.onboardTextTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
