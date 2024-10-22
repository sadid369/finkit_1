import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionCashBackRefCard extends StatelessWidget {
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

  const TransactionCashBackRefCard({
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
        border: Border.all(
          color: Color.fromARGB(255, 117, 119, 118),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: width * 0.14,
                  padding: EdgeInsets.all(width * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width: width * 0.06,
                      //   child: Image.asset(
                      //     Strings.coinLogo,
                      //   ),
                      // ),
                      // Gap(width * 0.008),
                      Image.asset(Strings.rewardLogo),
                    ],
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    subTitle,
                    style:
                        TextStyle(fontSize: width * 0.02, color: Colors.black),
                  ),
                  Text(
                    txnId,
                    style:
                        TextStyle(fontSize: width * 0.02, color: Colors.black),
                  ),
                  Text(
                    date,
                    style:
                        TextStyle(fontSize: width * 0.02, color: Colors.black),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${amount < 0 ? '' : '+'} $amount'.toString(),
                  style: TextStyle(
                    color: Color(0xff0A5012),
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   '',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: width * 0.02,
                //   ),
                // ),
                // Text(
                //   '',
                //   style: TextStyle(
                //     fontSize: width * 0.02,
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.006, vertical: width * 0.007),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.05),
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    txnDescription,
                    style:
                        TextStyle(fontSize: width * 0.02, color: Colors.black),
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
