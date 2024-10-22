import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/custom_color.dart';

class TransactionCard extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final String subTitle;
  final String date;
  final String txnId;
  final num amount;
  final num coinAmount;
  final String txnType;
  final String txnDescription;

  const TransactionCard({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.txnId,
    required this.amount,
    required this.coinAmount,
    required this.txnType,
    required this.txnDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.01, vertical: height * 0.007),
      width: width,
      height: height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: CustomColor.borderColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: width * 0.085,
                padding: EdgeInsets.all(width * 0.01),
                child: txnType == 'Rewarded'
                    ? Image.asset(Strings.rewardLogo)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            txnType == 'Debited'
                                ? Strings.walletLogo
                                : Strings.profileLogo,
                          ),
                          Gap(width * 0.008),
                          Image.asset(
                            txnType == 'Send' || txnType == 'Debited'
                                ? Strings.sendLogo
                                : Strings.receiveLogo,
                          ),
                        ],
                      ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: width * 0.02,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: width * 0.02,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    txnId,
                    style: TextStyle(
                      fontSize: width * 0.02,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${amount < 0 ? '' : '+'} $amount'.toString(),
                  style: TextStyle(
                    color: amount < 0
                        ? const Color(0xffFF1919)
                        : const Color(0xff0BBC18),
                    fontSize: width * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$coinAmount'.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.02,
                  ),
                ),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: width * 0.02,
                  ),
                ),
                Text(
                  txnDescription,
                  style: TextStyle(
                    fontSize: width * 0.02,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
