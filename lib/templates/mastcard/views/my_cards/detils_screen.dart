import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import '../../widgets/custom_appbar_with_bg.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: Strings.cardDetails,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        _cardWidget(context),
        Container(
          height: MediaQuery.of(context).size.height /1.6,
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
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.marginSize),
      child: Column(
        children: [
          _headerTitleWidget(context),
          _cardDetails(context),
        ],
      ),
    );
  }

  _cardWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.2,
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize * 1.5, ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.cardFrontImagePath),
        ),
      ),
    );
  }

  _headerTitleWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Container(
           margin: EdgeInsets.symmetric( horizontal: Dimensions.marginSize,),
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
          margin: EdgeInsets.symmetric( horizontal: Dimensions.marginSize,),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          _spaceBetWidget(Strings.cardType,'Value'),
          _spaceBetWidget(Strings.issuanceFee,'\$5.00'),
          _spaceBetWidget(Strings.cardLoadType,'Reloadable'),
          _spaceBetWidget(Strings.loadFee,'\$2.00 + 2%'),
          _spaceBetWidget(Strings.minLoad,'\$5.00'),
          _spaceBetWidget(Strings.maxLoad,'\$1500.00'),
          _spaceBetWidget(Strings.validity,'4 Years'),
          _spaceBetWidget(Strings.monthlyFees,'N/O'),
          _spaceBetWidget(Strings.status,'Active', textColor: CustomColor.primaryColor),
        ],
      ),
    );
  }

_spaceBetWidget(String text, String text2, {Color? textColor=CustomColor.primaryTextColor}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize*0.5),
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
