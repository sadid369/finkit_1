import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/widgets/inputs/text_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import '../../widgets/custom_appbar_with_bg.dart';

class TwoFactorScreen extends StatelessWidget {
  const TwoFactorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: Strings.twoFactor,
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
      child: Column(
        children: [
          const CustomLabelWidget(text: Strings.twoFactor),
          _keyWidget(context),
          _qrCodeWidget(),
          _enableButtonWidget(context)
        ],
      ),
    );
  }

  _keyWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          height: Dimensions.inputBoxHeight * 0.82,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: CustomColor.primaryColor.withOpacity(0.7), width: 1.5),
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Text(
            '5689SVGHKR75D458R',
            style: CustomStyle.hintTextStyle,
          ),
        ),
        Container(
          height: Dimensions.inputBoxHeight * 0.82,
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(
            color: CustomColor.screenBGColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius),
              bottomRight: Radius.circular(Dimensions.radius),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.file_copy_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _qrCodeWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize * 2.5),
      child: Column(
        children: [
          Image.asset(Strings.qrCode),
          addVerticalSpace(Dimensions.heightSize * 0.5),
          Text(
            'Scan QR',
            style: CustomStyle.commonSubTextTitle,
          )
        ],
      ),
    );
  }

  _enableButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.enable,
      onPressed: () {
        Get.back();
      },
    );
  }
}
