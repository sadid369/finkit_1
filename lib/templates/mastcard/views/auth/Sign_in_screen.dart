// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import '../../controller/auth/sign_in_controller.dart';
import '../../utils/size.dart';
import '../../widgets/inputs/custom_password_input_widget.dart';
import '../../widgets/inputs/text_field_input_widget.dart';
import '../../widgets/primary_appbar_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.commonBgImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: PrimaryAppBar(
          appbarSize: Dimensions.defaultAppBarHeight,
          toolbarHeight: Dimensions.defaultAppBarHeight,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.only(left: Dimensions.marginSize * 0.5),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: Dimensions.iconSizeDefault * 1.2,
                  ),
                ),
              ),
              SizedBox(
                width: Dimensions.widthSize,
              ),
              Text(
                Strings.signIn,
                style: CustomStyle.appBarTextStyle,
              )
            ],
          ),
          appBar: AppBar(),
          backgroundColor: Colors.transparent,
          autoLeading: false,
          elevation: 0,
          appbarColor: CustomColor.secondaryColor,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: _bodyWidget(context, controller),
        ),
      ),
    );
  }

  // body widget containing all widget elements
  _bodyWidget(BuildContext context, SignInController controller) {
    return Column(
      children: [
        _loginInfoWidget(context),
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
        _loginWidget(context, controller),
      ],
    );
  }

  // login info
  _loginInfoWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Strings.loginLogoImagePath,
          scale: 2,
        ),
        addVerticalSpace(Dimensions.widthSize),
        Text(
          Strings.signInMessage,
          style: TextStyle(
            color: CustomColor.primaryTextColor.withOpacity(0.8),
            fontSize: Dimensions.mediumTextSize * 1.2,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

// Login input and info
  _inputWidget(BuildContext context, SignInController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: Dimensions.heightSize,
        ),
        _loginInputWidget(context, controller),
      ],
    );
  }

  // login inputs
  _loginInputWidget(BuildContext context, SignInController controller) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomInputWidget(
            labelText: Strings.emailAndUserName,
            hintText: Strings.emailAndUserName,
            controller: controller.usernameController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          CustomPasswordInputWidget(
            labelText: Strings.password,
            hintText: 'Enter ${Strings.password}',
            controller: controller.passwordController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
        ],
      ),
    );
  }

  _loginWidget(BuildContext context, SignInController controller) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.64,
      padding: EdgeInsets.only(
        left: Dimensions.defaultPaddingSize,
        right: Dimensions.defaultPaddingSize,
        top: Dimensions.defaultPaddingSize,
      ),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 4),
          topRight: Radius.circular(Dimensions.radius * 4),
        ),
      ),
      child: Column(
        children: [
          _inputWidget(context, controller),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          _buttonWidget(context, controller),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          GestureDetector(
            onTap: () {
              _openDialogue(context, controller);
            },
            child: Text(
              '${Strings.forgetPassword}?',
              style: TextStyle(
                color: CustomColor.primaryTextColor,
                fontSize: Dimensions.smallestTextSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }

  _openDialogue(BuildContext context, SignInController controller) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
            backgroundColor: CustomColor.secondaryColor,
            alignment: Alignment.center,
            insetPadding: EdgeInsets.all(Dimensions.defaultPaddingSize * 0.5),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Builder(
              builder: (context) {
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;
                return Container(
                  width: width * 0.85,
                  height: height * 0.6,
                  padding: EdgeInsets.all(Dimensions.defaultPaddingSize * 0.5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              size: Dimensions.iconSizeDefault * 1.5,
                              color: CustomColor.primaryColor.withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                      Image.asset(Strings.forgetPasswordImagePath),
                      addVerticalSpace(Dimensions.heightSize * 1.7),
                      Text(
                        Strings.forgetPassword,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColor.primaryTextColor,
                          fontSize: Dimensions.smallestTextSize * 1.4,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      addVerticalSpace(Dimensions.heightSize * 0.5),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.defaultPaddingSize * 1.4),
                        child: Text(
                          Strings.forgetPasswordMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:
                                CustomColor.primaryTextColor.withOpacity(0.5),
                            fontSize: Dimensions.smallestTextSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      addVerticalSpace(Dimensions.heightSize),
                      Form(
                        key: forgotPasswordFormKey,
                        child: CustomInputWidget(
                          labelText: Strings.phoneNumber,
                          hintText: 'Enter ${Strings.phoneNumber}',
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.forgetPasswordController,
                        ),
                      ),
                      PrimaryButton(
                        title: Strings.continueLabel,
                        onPressed: () {
                          controller.goToOTPVerificationScreen();
                        },
                      ),
                    ],
                  ),
                );
              },
            )));
  }

  // Sign In Button
  _buttonWidget(BuildContext context, SignInController controller) {
    return Column(
      children: [
        PrimaryButton(
          title: Strings.signIn,
          onPressed: () {
            controller.goToNavigationScreen();
          },
        ),
      ],
    );
  }
}
