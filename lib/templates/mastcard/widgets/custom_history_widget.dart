import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';

class CustomHistoryWidget extends StatelessWidget {
  final double amount;
  final String date;
  final bool isDeposit;
  const CustomHistoryWidget(
      {Key? key,
      required this.date,
      required this.amount,
      required this.isDeposit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSize * 0.2,
          vertical: Dimensions.marginSize * 0.1),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColor.screenBGColor),
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: Dimensions.marginSize * 0.8),
            leading: Padding(
              padding: EdgeInsets.all(Dimensions.defaultPaddingSize * 0.3),
              child: SvgPicture.asset(
                  isDeposit == true ? Strings.donate : Strings.payCard),
            ),
            title: Text(isDeposit == true ? 'Money Deposit' : 'Buy Card',
                style: CustomStyle.commonTextTitle),
            subtitle: Text(date, style: CustomStyle.commonSubTextTitle),
            trailing: Text("\₹${amount.toString()}",
                style: CustomStyle.commonTextTitle),
          ),
          Container(height: 1, color: CustomColor.borderColor),
        ],
      ),
    );
  }
}
