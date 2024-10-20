import 'dart:io';

import 'package:finkit/utils/custom_color.dart';
import 'package:finkit/utils/dimensions.dart';
import 'package:finkit/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.34,
        shape: Platform.isAndroid
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    Dimensions.radius * 2,
                  ),
                ),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  Dimensions.radius * 2,
                ),
                bottomRight: Radius.circular(
                  Dimensions.radius * 2,
                ),
              )),
        backgroundColor: CustomColor.whiteColor,
        child: ListView(
          children: [
            verticalSpace(50),
            _userImgWidget(context),
            _userTextWidget(context),
          ],
        ),
      ),
    );
  }

  _userImgWidget(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: Dimensions.paddingSize,
          bottom: Dimensions.paddingSize,
        ),
        height: Dimensions.heightSize * 8.3,
        width: Dimensions.widthSize * 11.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
          color: Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor, width: 5),
        ),
        child: Image.asset("assets/logo/app_launcher.png"),
      ),
    );
  }

  _userTextWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          "Finkit",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
            fontSize: Dimensions.headingTextSize2,
          ),
        ),
        FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * 0.5,
            ),
            child: Text(
              "Version : 1.0.0",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
                fontSize: Dimensions.headingTextSize2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
