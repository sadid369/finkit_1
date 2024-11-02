import 'package:finkit/templates/mastcard/controller/dashboard_controller.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:get/get.dart';
import '../../widgets/custom_appbar_with_bg.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: Strings.cardDetails,
      body: _bodyWidget(context, Get.find<DashboardController>()),
    );
  }

  _bodyWidget(BuildContext context, DashboardController controller) {
    return ListView(
      children: [
        _cardWidget(context,
            balance: controller.cardList[controller.activeIndex.value]
                ['balance'],
            color: CustomColor.primaryColor,
            validity: controller.cardList[controller.activeIndex.value]
                ['validity']),
        SizedBox(
          height: Get.height * 0.05,
        ),
        Container(
          height: Get.height / 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Get.height * 0.045),
              topRight: Radius.circular(Get.height * 0.045),
            ),
            color: Colors.white,
          ),
          child: _mainBodyWidget(context),
        ),
      ],
    );
  }

  _mainBodyWidget(BuildContext context) {
    return Container(
      height: Get.height / 5,
      margin: EdgeInsets.symmetric(
        vertical: Get.width * 0.06,
      ),
      child: Column(
        children: [
          _headerTitleWidget(context),
          _cardDetails(context),
        ],
      ),
    );
  }

  _cardWidget(BuildContext context,
      {required String balance, required Color color, required validity}) {
    return Container(
      height: Get.width / 2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.cardFrontImagePathNew2),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: Get.width * 0.19,
            left: Get.width * 0.3,
            child: Text(
              'Balance \₹ $balance.00',
              style: TextStyle(
                fontSize: Get.width * 0.055,
                fontWeight: FontWeight.w900,
                color: CustomColor.secondaryColor,
              ),
            ),
          ),
          Positioned(
            bottom: Get.width * 0.05,
            right: Get.width * 0.2,
            child: Text(
              validity,
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.width * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _headerTitleWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05,
          ),
          child: Text(
            Strings.cardDetails,
            style: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Get.width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Divider()
      ],
    );
  }

  _cardDetails(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Get.width * 0.06,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          _spaceBetWidget(Strings.cardType, 'Value'),
          _spaceBetWidget(Strings.issuanceFee, '\₹5.00'),
          _spaceBetWidget(Strings.cardLoadType, 'Reloadable'),
          _spaceBetWidget(Strings.loadFee, '\₹2.00 + 2%'),
          _spaceBetWidget(Strings.minLoad, '\₹5.00'),
          _spaceBetWidget(Strings.maxLoad, '\₹1500.00'),
          _spaceBetWidget(Strings.validity, '4 Years'),
          _spaceBetWidget(Strings.monthlyFees, 'N/O'),
          _spaceBetWidget(Strings.status, 'Active',
              textColor: CustomColor.primaryColor),
        ],
      ),
    );
  }

  _spaceBetWidget(String text, String text2,
      {Color? textColor = CustomColor.primaryTextColor}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Get.height * 0.015,
      ),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        crossAxisAlignment: crossStart,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: CustomColor.primaryTextColor.withOpacity(0.7),
                fontSize: Get.width * 0.04,
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
                fontSize: Get.width * 0.04,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
