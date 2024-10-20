
import 'package:finkit/templates/mastcard/controller/welcome_controller.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeScreenController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Strings.welcomeScreenBgImagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _bodyWidget(context, controller),
        ),
      ),
    );
  }

  // body widget contain all the widgets
  _bodyWidget(BuildContext context, WelcomeScreenController controller) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.defaultPaddingSize,
        right: Dimensions.defaultPaddingSize,
        top: Dimensions.defaultPaddingSize * 4,
      ),
      child: _welcomeMessageAndInputWidget(context, controller),
    );
  }

  // welcome message and sign in and sign out input
  _welcomeMessageAndInputWidget(
      BuildContext context, WelcomeScreenController controller) {
    return Column(
      children: [
        Image.asset(Strings.splashScreenLogoImagePath),
        addVerticalSpace(Dimensions.widthSize),
        Text(
          Strings.splashScreenMessage,
          style: CustomStyle.splashScreenSubTextTitle,
        ),
        addVerticalSpace(Dimensions.widthSize * 4),
        Text(
          Strings.welcomeToMastCard,
          style: TextStyle(
            color: CustomColor.primaryColor.withOpacity(0.8),
            fontSize: Dimensions.largeTextSize * 1.4,
            fontWeight: FontWeight.w700,
          ),
        ),
        _loginButtonsWidget(context, controller),
      ],
    );
  }

  // sign in and sign up button
  _loginButtonsWidget(
      BuildContext context, WelcomeScreenController controller) {
    return Column(children: [
      addVerticalSpace(Dimensions.widthSize * 4),
      PrimaryButton(
        title: Strings.signIn,
        onPressed: () {
          controller.goToSignInScreen();
        },
      ),
      addVerticalSpace(Dimensions.widthSize),
      SecondaryButton(
        title: Strings.signUp,
        onPressed: () {
          controller.goToSignUpScreen();
        },
        borderColorName: CustomColor.primaryColor,
        fillColor: const Color(0xFFFFD48D),
        borderWidth: 2,
      ),
    ]);
  }
}
