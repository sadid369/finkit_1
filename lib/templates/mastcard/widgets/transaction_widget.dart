import 'package:finkit/templates/mastcard/controller/dashboard_controller.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/widgets/transaction_card.dart';
import 'package:finkit/templates/mastcard/widgets/transaction_cash_back_card.dart';
import 'package:finkit/templates/mastcard/widgets/transaction_coin_card_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/deposit_controller.dart';
import '../data/transcation_list.dart';
import '../utils/custom_color.dart';
import '../utils/dimensions.dart';
import 'custom_history_widget.dart';

Widget transactionWidget(BuildContext context) {
  final controller = Get.put(DashboardController());
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        controller.activeIndex.value == 2
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.008,
                      vertical: Get.width * 0.008,
                    ),
                    margin: EdgeInsets.only(bottom: Get.height * 0.01),
                    // height: 20,
                    // width: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // shape: BoxShape.circle,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                    child: Text(
                      'CashBack From Order',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.smallestTextSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.008,
                      vertical: Get.width * 0.008,
                    ),
                    margin: EdgeInsets.only(bottom: Get.height * 0.01),
                    // height: 20,
                    // width: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // shape: BoxShape.circle,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                    child: Text('CashBack From Referral',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.smallestTextSize,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ],
              )
            : Container(),
        Expanded(
          child: ListView.builder(
            itemCount: controller.activeIndex.value == 0
                ? controller.tData.length
                : controller.tCoinData.length,
            itemBuilder: (BuildContext context, int index) {
              // return CustomHistoryWidget(
              //   date: transactionList[index].date,
              //   amount: transactionList[index].amount,
              //   isDeposit: transactionList[index].isDeposit,
              // );
              return controller.activeIndex.value == 0
                  ? TransactionCard(
                      height: Get.height,
                      width: MediaQuery.of(context).size.width,
                      title: controller.tData[index]['title'],
                      subTitle: controller.tData[index]['subTitle'],
                      date: controller.tData[index]['date'],
                      txnId: controller.tData[index]['txnId'],
                      amount: controller.tData[index]['amount'],
                      coinAmount: controller.tData[index]['coinAmount'],
                      txnType: controller.tData[index]['txnType'],
                      txnDescription: controller.tData[index]['txnDescription'],
                    )
                  : controller.activeIndex.value == 1
                      ? TransactionCoinCard(
                          height: Get.height,
                          width: Get.width,
                          title: controller.tCoinData[index]['title'],
                          subTitle: controller.tCoinData[index]['subTitle'],
                          date: controller.tCoinData[index]['date'],
                          txnId: controller.tCoinData[index]['txnId'],
                          amount: controller.tCoinData[index]['amount'],
                          coinAmount: controller.tCoinData[index]['coinAmount'],
                          txnType: controller.tCoinData[index]['txnType'],
                          txnDescription: controller.tCoinData[index]
                              ['txnDescription'],
                        )
                      : TransactionCashBackRefCard(
                          height: Get.height,
                          width: Get.width,
                          title: 'CashBack From Referral Level 1',
                          subTitle: "Promote Lifelinekart for sanjay jadhav",
                          date: '14 Sep 2023, 03:14 PM',
                          txnId: 'Upline Name : satish kadam',
                          amount: double.parse('1000.00'),
                          coinAmount: double.parse('1000.00'),
                          txnType: controller.tCoinData[index]['txnType'],
                          txnDescription: 'Credited To CashBack Coin Wallet',
                        );
            },
          ),
        ),
      ],
    ),
  );
}
