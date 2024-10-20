import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../controller/auth/email_verification_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/size.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/primary_appbar_widget.dart';

class OTPEmailVerificationScreen extends StatelessWidget {
  OTPEmailVerificationScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerificationController());
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.emailVerificationBgImagePath),
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
                Strings.otpEmailVerification,
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
  _bodyWidget(BuildContext context, EmailVerificationController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _otpInfoWidget(context),
        SizedBox(
          height: Dimensions.heightSize * 2,
        ),
        _otpWidget(context, controller),
      ],
    );
  }

  // otp info
  _otpInfoWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        addVerticalSpace(Dimensions.heightSize * 3),
        Image.asset(
          Strings.otpEmailImagePath,
          // scale: 1.2,
        ),
      ],
    );
  }

  _otpInputWidget(
      BuildContext context, EmailVerificationController controller) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Form(
        key: formKey,
        child: PinCodeTextField(
          appContext: context,
          backgroundColor: Colors.transparent,
          textStyle: const TextStyle(
            color: CustomColor.primaryColor,
          ),
          pastedTextStyle: TextStyle(
            color: Colors.orange.shade600,
            fontWeight: FontWeight.bold,
          ),
          length: 6,
          obscureText: false,
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 3) {
              return Strings.pleaseFillOutTheField;
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              fieldHeight: 48,
              fieldWidth: 50,
              inactiveColor: CustomColor.primaryColor.withOpacity(0.5),
              activeColor: CustomColor.primaryColor,
              selectedColor: CustomColor.primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5)),
          cursorColor: CustomColor.secondaryColor,
          animationDuration: const Duration(milliseconds: 300),
          errorAnimationController: controller.errorController,
          controller: controller.pinCodeController,
          keyboardType: TextInputType.number,
          onCompleted: (v) {},
          onChanged: (value) {
            controller.changeCurrentText(value);
          },
          beforeTextPaste: (text) {
            return true;
          },
        ),
      ),
    );
  }

  _otpWidget(BuildContext context, EmailVerificationController controller) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      width: MediaQuery.of(context).size.width,
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
          Text(
            Strings.otpEmailMessage,
            style: TextStyle(
                fontSize: Dimensions.smallTextSize * 0.9,
                fontWeight: FontWeight.w400,
                color: CustomColor.primaryTextColor.withOpacity(0.5)),
          ),
          _otpInputWidget(context, controller),
          _timeWidget(context),
          _resendButton(context),
          _buttonWidget(context, controller),
        ],
      ),
    );
  }

  // Sign In Button
  _buttonWidget(BuildContext context, EmailVerificationController controller) {
    return Column(
      children: [
        PrimaryButton(
          title: Strings.submit,
          onPressed: () {
            controller.goToEmailCongratulationScreen();
          },
        ),
      ],
    );
  }

  _timeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Strings.timerImagePath),
          addHorizontalSpace(Dimensions.widthSize * 0.5),
          Text(
            '1:59',
            style: TextStyle(
                fontSize: Dimensions.mediumTextSize,
                fontWeight: FontWeight.bold,
                color: CustomColor.primaryTextColor),
          ),
        ],
      ),
    );
  }

  _resendButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.defaultPaddingSize),
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: TextSpan(
            text: Strings.didNotGetAnyCode,
            style: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.smallestTextSize,
              fontWeight: FontWeight.w600,
            ),
            children: <TextSpan>[
              TextSpan(
                text: Strings.resend,
                style: TextStyle(
                  color: CustomColor.secondaryTextColor,
                  fontSize: Dimensions.smallestTextSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
