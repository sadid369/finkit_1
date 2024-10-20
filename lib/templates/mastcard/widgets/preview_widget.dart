import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import 'package:finkit/templates/mastcard/widgets/custom_appbar_with_bg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/deposit_controller.dart';
import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';
import '../utils/custom_color.dart';
import '../utils/custom_style.dart';
import '../utils/size.dart';

final data = Get.arguments;

class CustomPreviewWidget extends StatelessWidget {
  CustomPreviewWidget({Key? key}) : super(key: key);
 final controller = Get.put(DepositController());
  final appBarTitle = data['appBarTitle'];
  final depositAmount = data['depositAmount'];
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: appBarTitle,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: Dimensions.marginSize * 1.5),
      padding: EdgeInsets.only(top: Dimensions.marginSize * 2),
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
    var charge = 6.00;
    var amount = double.parse('$depositAmount');
    final total = amount + charge;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [

        _depositMethod(context),
        _spaceBetWidget(context, Strings.depositAmount, '${amount.toString()} USD'),
        _spaceBetWidget(context, Strings.charge, '${charge.toString()} USD'),
        _spaceBetWidget(context, Strings.payable, '${total.toString()} USD'),
        _spaceBetWidget(context, Strings.conversionRate, '1 USD = 1.00 USD'),
        _confirmButtonWidget(context),

      ],
    );
  }

  _spaceBetWidget(BuildContext context, String text, String text2,
      {Color? textColor = CustomColor.primaryTextColor}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            crossAxisAlignment: crossStart,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: CustomColor.primaryTextColor.withOpacity(0.7),
                    fontSize: Dimensions.smallestTextSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  text2,
                  style: TextStyle(
                    color: textColor,
                    fontSize: Dimensions.extraSmallTextSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize * 0.5),
            height: 1,
            color: Theme.of(context).dividerColor,
          )
        ],
      ),
    );
  }

  _depositMethod(BuildContext context) {
    return data['isDeposit'] == true
        ? Column(
            crossAxisAlignment: crossStart,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
                child: Text(
                  Strings.cardDetails,
                  style: CustomStyle.commonTextTitle,
                ),
              ),
              const Divider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(Strings.payeerLogo),
                    ),
                    addVerticalSpace(Dimensions.heightSize * 3)
                  ],
                ),
              )
            ],
          )
        : Container();
  }

  _confirmButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSize * 1.5,
        horizontal: Dimensions.marginSize,
      ),
      child: PrimaryButton(
        title: 'Confirm',
        onPressed: () {
          Get.toNamed(Mascardroutes.congratulationScreenMastCard, arguments: {
            'message': data['message'],
             'route': Mascardroutes.mastcardNavigationScreenMastCard,
          });
        },
      ),
    );
  }



}
