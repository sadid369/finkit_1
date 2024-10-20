import 'package:finkit/templates/mastcard/widgets/inputs/custom_password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import '../../controller/profle/profile_controller.dart';
import '../../widgets/custom_appbar_with_bg.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: Strings.changePassword,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: Dimensions.marginSize * 2),
      padding: EdgeInsets.only(top: Dimensions.marginSize * 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 3.5),
          topRight: Radius.circular(Dimensions.radius * 3.5),
        ),
        color: Colors.white,
      ),
      child: _mainBodyWidget(context),
    );
  }

  _mainBodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSize, vertical: Dimensions.marginSize),
      child: ListView(
        children: [
          _inputFieldWidget(context),
          _changePasswordButtonWidget(context)
        ],
      ),
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomPasswordInputWidget(
            controller: controller.oldPasswordController,
            hintText: Strings.enterOldPassword,
            labelText: Strings.oldPassword,
          ),
          CustomPasswordInputWidget(
            controller: controller.newPasswordController,
            hintText: Strings.enterNewPassword,
            labelText: Strings.newPassword,
          ),
          CustomPasswordInputWidget(
            controller: controller.confirmPasswordController,
            hintText: Strings.enterConfirmPassword,
            labelText: Strings.confirmPassword,
          ),
        ],
      ),
    );
  }

  _changePasswordButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize*1.5),
      child: PrimaryButton(
        title: Strings.changePassword,
        onPressed: () {Get.back();},
      ),
    );
  }
}
