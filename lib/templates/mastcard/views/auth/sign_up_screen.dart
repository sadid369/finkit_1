import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import '../../controller/auth/sign_up_controller.dart';
import '../../utils/size.dart';
import '../../widgets/inputs/custom_password_input_widget.dart';
import '../../widgets/inputs/sign_up_country_picker_input_widget.dart';
import '../../widgets/inputs/sign_up_phone_with_code_input_widget.dart';
import '../../widgets/inputs/text_field_input_widget.dart';
import '../../widgets/inputs/text_label_widget.dart';
import '../../widgets/primary_appbar_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
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
                Strings.signUp,
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
  _bodyWidget(BuildContext context, SignUpController controller) {
    return Column(
      children: [
        _signUpInfoWidget(context),
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
        _signUpWidget(context, controller),
      ],
    );
  }

  // signUp info
  _signUpInfoWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Strings.loginLogoImagePath,
          scale: 2,
        ),
        addVerticalSpace(Dimensions.widthSize),
        Text(
          Strings.signUpMessage,
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

  // signUp inputs
  _signUpInputWidget(BuildContext context, SignUpController controller) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomInputWidget(
            labelText: Strings.firstName,
            hintText: 'Enter ${Strings.firstName}',
            controller: controller.firstNameController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          CustomInputWidget(
            labelText: Strings.lastName,
            hintText: 'Enter ${Strings.lastName}',
            controller: controller.lastNameController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          CustomInputWidget(
            labelText: Strings.userName,
            hintText: Strings.userName,
            controller: controller.usernameController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          CustomInputWidget(
            labelText: Strings.email,
            hintText: 'Enter ${Strings.email}',
            controller: controller.emailController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          const CustomLabelWidget(text: Strings.country),
          SignUpCountryCodePickerWidget(
            hintText: 'Select Country',
            controller: controller.countryController,
          ),
          const CustomLabelWidget(text: Strings.phoneNumber),
          PhoneNumberWithCountryCodeInput(
            hintText: 'XXX XXX XXXX',
            controller: controller.phoneController,
          ),
          CustomPasswordInputWidget(
            labelText: Strings.password,
            hintText: 'Enter ${Strings.password}',
            controller: controller.passwordController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          CustomPasswordInputWidget(
            labelText: Strings.confirmPassword,
            hintText: 'Enter ${Strings.confirmPassword}',
            controller: controller.confirmPasswordController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
        ],
      ),
    );
  }

  _signUpWidget(BuildContext context, SignUpController controller) {
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
      child: ListView(
        children: [
          _signUpInputWidget(context, controller),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          _buttonWidget(context, controller),
          _privacyWidget(context, controller),
          SizedBox(
            height: Dimensions.heightSize * 2,
          )
        ],
      ),
    );
  }

  // Sign In Button
  _buttonWidget(BuildContext context, SignUpController controller) {
    return Column(
      children: [
        PrimaryButton(
          title: Strings.signUp,
          onPressed: () {
            controller.goToOTPEmailVerificationScreen();
          },
        ),
      ],
    );
  }

  _privacyWidget(BuildContext context, SignUpController controller) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.heightSize * 1.5,
        ),
        Text(
          Strings.signUpPrivacy1,
          style: TextStyle(
              fontSize: Dimensions.smallestTextSize,
              fontWeight: FontWeight.w200,
              color: CustomColor.primaryTextColor.withOpacity(0.5)),
        ),
        SizedBox(
          height: Dimensions.heightSize * 0.5,
        ),
        Text(
          Strings.signUpPrivacy2,
          style: TextStyle(
              fontSize: Dimensions.smallestTextSize,
              fontWeight: FontWeight.w200,
              color: CustomColor.primaryTextColor),
        ),
      ],
    );
  }
}
