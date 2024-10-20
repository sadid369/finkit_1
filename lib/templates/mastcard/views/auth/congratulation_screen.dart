import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/size.dart';
import '../../controller/auth/reset_password_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/buttons/primary_button.dart';
class CongratulationScreen extends StatelessWidget {
  CongratulationScreen({Key? key}) : super(key: key);
  
  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();
 final congratulationsMessage= Get.arguments;
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
        backgroundColor: Colors.transparent,
        body: _bodyWidget(context, controller),
      ),
    );
  }

  // body widget containing all widget elements
  _bodyWidget(BuildContext context, ResetPasswordController controller) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _congratulationImageWidget(context, controller),
          addVerticalSpace(Dimensions.heightSize * 2),
          _congratulationInfoWidget(context, controller),
          addVerticalSpace(Dimensions.heightSize * 5),
          _buttonWidget(context, controller),
        ],
      ),
    );
  }

  // Sign In Button
  _buttonWidget(BuildContext context, ResetPasswordController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
      child: PrimaryButton(
        title: Strings.okay,
        onPressed: () {
         Get.toNamed(congratulationsMessage['route']);
        },
      ),
    );
  }

  _congratulationImageWidget(
      BuildContext context, ResetPasswordController controller) {
    return Image.asset(
      Strings.congratulationImagePath,
      scale: 1.2,
    );
  }

  _congratulationInfoWidget(
      BuildContext context, ResetPasswordController controller) {
    return Column(
      children: [
        Text(
          Strings.congratulations,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColor.primaryColor,
            fontSize: Dimensions.largeTextSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        addVerticalSpace(Dimensions.heightSize),
        Text(
          congratulationsMessage['message'],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColor.primaryTextColor,
            fontSize: Dimensions.mediumTextSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
