import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/widgets/deposit_limit_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import '../../controller/fund_controller.dart';
import '../../widgets/custom_appbar_with_bg.dart';
import '../../widgets/inputs/amount_input_widget.dart';
import '../../widgets/toast/toast_message.dart';

class FundScreen extends StatelessWidget {
  FundScreen({Key? key}) : super(key: key);
  final controller = Get.put(FundController());
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: Strings.fund,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: Dimensions.marginSize * 1.5),
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
        vertical: Dimensions.marginSize,
        horizontal: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          AmountInputWidget(
            controller: controller.amountController,
            hintText: '0.00',
            labelText: Strings.enterAmount,
            keyboardType: TextInputType.number,
          ),
          depositLimitWidget(context),
          _continueButtonWidget(context)
        ],
      ),
    );
  }

  _continueButtonWidget(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize * 2),
        child: PrimaryButton(
          title: 'Continue',
          onPressed: () {
            if (controller.amountController.text.isEmpty) {
              ToastMessage.error("Please enter a value for amount");
            } else {
              Get.toNamed(Mascardroutes.customPreviewWidgetMastCard, arguments: {
                'isDeposit': false,
                'appBarTitle': Strings.fundPreview,
                'depositAmount': controller.amountController.text,
                'message':
                    "You've successfully ${controller.amountController.text} Deposit Money",
              });
            }
          },
        ));
  }
}
