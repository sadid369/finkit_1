import 'package:finkit/templates/mastcard/controller/dashboard_controller.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
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
          height: Dimensions.heightSize * 2,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 0.8,
          padding: EdgeInsets.only(top: Dimensions.marginSize * 0.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 3.5),
              topRight: Radius.circular(Dimensions.radius * 3.5),
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
      height: MediaQuery.of(context).size.height / 5,
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize),
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
      height: MediaQuery.of(context).size.width / 2,
      margin: EdgeInsets.symmetric(
          // vertical: Dimensions.marginSize * 1.5,
          ),
      decoration: const BoxDecoration(
        // border: Border.all(color: Colors.black),
        image: DecorationImage(
          image: AssetImage(Strings.cardFrontImagePathNew2),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.19,
            left: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              'Balance \₹ $balance.00',
              style: TextStyle(
                  fontSize: Dimensions.largeTextSize * 0.9,
                  fontWeight: FontWeight.w900,
                  color: CustomColor.secondaryColor),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.025,
            right: MediaQuery.of(context).size.width * 0.2,
            child: Text(
              validity,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.largeTextSize * 0.7,
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
            horizontal: Dimensions.marginSize,
          ),
          child: Text(
            Strings.cardDetails,
            style: CustomStyle.commonTextTitle,
          ),
        ),
        const Divider()
      ],
    );
  }

  _cardDetails(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize,
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
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize * 0.5),
      child: Row(
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
    );
  }
}

_balanceWidget(BuildContext context,
    {required String balance, required Color color}) {
  return Container(
    // height: MediaQuery.of(context).size.height * 0.17,
    padding:
        EdgeInsets.symmetric(vertical: Dimensions.defaultPaddingSize * 0.1),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      color: color.withOpacity(0.8),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultPaddingSize * 0.5,
          vertical: Dimensions.defaultPaddingSize * 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.heightSize * 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Balance \$ $balance.00',
                style: TextStyle(
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.w900,
                  color: color == CustomColor.secondaryColor
                      ? CustomColor.primaryTextColor
                      : CustomColor.secondaryColor,
                ),
              ),
              // Image.asset(
              //   Strings.cardFrontImagePath,
              //   height: Dimensions.heightSize * 1.5,
              // ),
            ],
          ),
          // SizedBox(
          //   height: Dimensions.heightSize * 2,
          // ),
          SizedBox(
            height: Dimensions.heightSize * 0.5,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'SATISH JAYWANT KADAM',
          //       style: TextStyle(
          //           fontSize: Dimensions.mediumTextSize,
          //           fontWeight: FontWeight.w600,
          //           color: CustomColor.primaryTextColor),
          //     ),
          //     // Image.asset(Strings.balanceImagePath),
          //   ],
          // ),
          // SizedBox(
          //   height: Dimensions.heightSize * 2,
          // ),
          // Text(
          //   Strings.balance,
          //   style: TextStyle(
          //       fontSize: Dimensions.smallTextSize,
          //       fontWeight: FontWeight.w600,
          //       color: CustomColor.primaryTextColor),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       '\$ $balance.00',
          //       style: TextStyle(
          //           fontSize: Dimensions.largeTextSize,
          //           fontWeight: FontWeight.w900,
          //           color: CustomColor.primaryTextColor),
          //     ),
          //   ],
          // ),

          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          Text(
            '19/10/2024',
            style: TextStyle(
              fontSize: Dimensions.smallTextSize,
              fontWeight: FontWeight.w600,
              color: color == CustomColor.secondaryColor
                  ? CustomColor.primaryTextColor
                  : CustomColor.secondaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
