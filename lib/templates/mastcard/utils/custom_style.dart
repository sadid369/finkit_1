import 'package:flutter/material.dart';

import 'custom_color.dart';
import 'dimensions.dart';

class CustomStyle {
  // Common
  static var commonTextTitle = TextStyle(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w600,
  );

  static var commonLargeTextTitle = TextStyle(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.largeTextSize,
    fontWeight: FontWeight.w600,
  );

  static var commonSubTextTitle = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.7),
    fontSize: Dimensions.smallestTextSize,
    fontWeight: FontWeight.w600,
  );

  static var commonMediumSubTextTitle = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.7),
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w600,
  );

  // splash screen
  static var splashScreenSubTextTitle = TextStyle(
    color: Colors.black,
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w900,
  );

  // onboard styles
  static var onboardTextTitle = TextStyle(
    color: Colors.white,
    fontSize: Dimensions.mediumTextSize * 1.2,
    fontWeight: FontWeight.w900,
  );
  static var hintTextStyle = TextStyle(
    color: CustomColor.primaryTextColor.withOpacity(0.5),
    fontSize: Dimensions.smallestTextSize,
    fontWeight: FontWeight.w400,
  );

  static var appBarTextStyle = TextStyle(
    color: CustomColor.primaryColor,
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w600,
  );
  static var authTitleStyle = TextStyle(
    color: CustomColor.appBarTextColor,
    fontSize: Dimensions.smallestTextSize * 1.2,
    fontWeight: FontWeight.w600,
  );

// Button

  static var secondaryButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
  );

  //Drawer

  static var drawerTileTextStyle = TextStyle(
    color: CustomColor.primaryTextColor,
    fontSize: Dimensions.largeTextSize,
    fontWeight: FontWeight.w500,
  );
}
