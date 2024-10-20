import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/reset_password_controller.dart';
import '../../widgets/inputs/custom_password_input_widget.dart';
import '../../widgets/primary_appbar_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
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
                Strings.resetPassword,
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
        body: _bodyWidget(context, controller),
      ),
    );
  }

  // body widget containing all widget elements
  _bodyWidget(BuildContext context, ResetPasswordController controller) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _resetPasswordWidget(context, controller),
          ],
        ),
      ),
    );
  }

  _resetPasswordInputWidget(
      BuildContext context, ResetPasswordController controller) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomPasswordInputWidget(
            labelText: Strings.newPassword,
            hintText: 'Enter ${Strings.newPassword}',
            controller: controller.passwordController,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
          CustomPasswordInputWidget(
            labelText: Strings.confirmPassword,
            hintText: 'Enter ${Strings.confirmPassword}',
            controller: controller.confirmPassword,
            borderColor: CustomColor.primaryColor,
            color: CustomColor.secondaryColor,
          ),
        ],
      ),
    );
  }

  _resetPasswordWidget(
      BuildContext context, ResetPasswordController controller) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
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
          _resetPasswordInputWidget(context, controller),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          _buttonWidget(context, controller),
        ],
      ),
    );
  }

  // Sign In Button
  _buttonWidget(BuildContext context, ResetPasswordController controller) {
    return Column(
      children: [
        PrimaryButton(
          title: Strings.resetPassword,
          onPressed: () {
            controller.goToCongratulationScreen();
          },
        ),
      ],
    );
  }
}
