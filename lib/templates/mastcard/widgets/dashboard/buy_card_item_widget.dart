import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_color.dart';
import '../../utils/strings.dart';

class BuyCardItemWidget extends StatelessWidget {
  const BuyCardItemWidget(
      {Key? key,
      required this.cardHolderName,
      required this.cardNumber,
      required this.cardExpDate})
      : super(key: key);
  final String cardHolderName;
  final String cardNumber;
  final String cardExpDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize * 0.8),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultPaddingSize,
        vertical: Dimensions.defaultPaddingSize * 2,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage(Strings.giftCard),
          //   fit: BoxFit.fitWidth,
          // ),
          ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          // _haderTitleWidget(context),
          const Spacer(),
          _logoWidget(context),
          _activationFeeWidget(context),
          _giftInfoWidget(context),
          _buyNowButtonWidget(context),
        ],
      ),
    );
  }

  _logoWidget(BuildContext context) {
    return Image.asset(
      Strings.cardFrontImagePath,
      scale: 1,
      alignment: Alignment.bottomLeft,
    );
  }

  _activationFeeWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize * 0.8),
      child: RichText(
        text: TextSpan(
          text: '\$10.00',
          style: TextStyle(
            color: CustomColor.primaryColor,
            fontSize: Dimensions.extraLargeTextSize * 1.2,
            fontWeight: FontWeight.w600,
          ),
          children: [
            const WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: SizedBox(width: 10)),
            TextSpan(
              text: 'activation fee',
              style: TextStyle(
                color: CustomColor.primaryTextColor,
                fontSize: Dimensions.extraSmallTextSize,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  _giftInfoWidget(BuildContext context) => Column(
        children: [
          _rowWidget('Gift friends with virtual cards'),
          _rowWidget('Delivered instantly by email'),
          _rowWidget('Redeemable for online purchases'),
        ],
      );

  _buyNowButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize * 1.5),
      child: PrimaryButton(
        title: 'Buy Now',
        onPressed: () {},
      ),
    );
  }

  _rowWidget(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.marginSize * 0.2),
      child: Row(
        children: [
          const Expanded(
            flex: 0,
            child: CircleAvatar(
              radius: 4,
              backgroundColor: Colors.white,
            ),
          ),
          addHorizontalSpace(Dimensions.widthSize),
          Expanded(
              child: Text(
            text,
            style: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.extraSmallTextSize,
              fontWeight: FontWeight.w400,
            ),
          )),
        ],
      ),
    );
  }

  _haderTitleWidget(BuildContext context) {
    return Text(
      'Test Card',
      style: TextStyle(
        color: CustomColor.primaryTextColor,
        fontSize: Dimensions.extraLargeTextSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
