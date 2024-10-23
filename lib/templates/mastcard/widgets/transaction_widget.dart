import 'package:finkit/templates/mastcard/controller/dashboard_controller.dart';
import 'package:finkit/templates/mastcard/widgets/transaction_card.dart';
import 'package:finkit/templates/mastcard/widgets/transaction_cash_back_card.dart';
import 'package:finkit/templates/mastcard/widgets/transaction_cash_back_order_card%20.dart';
import 'package:finkit/templates/mastcard/widgets/transaction_coin_card_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/custom_color.dart';
import '../utils/dimensions.dart';

Widget transactionWidget(BuildContext context) {
  final controller = Get.put(DashboardController());
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Column(
      children: [
        controller.activeIndex.value == 2
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      controller.changeIsOrder(!controller.isOrder.value);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.008,
                        vertical: Get.width * 0.008,
                      ),
                      margin: EdgeInsets.only(bottom: Get.height * 0.01),
                      decoration: BoxDecoration(
                        color: controller.isOrder.value
                            ? CustomColor.primaryColor.withOpacity(0.3)
                            : Colors.white,
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
                  ),
                  InkWell(
                    onTap: () {
                      controller.changeIsOrder(!controller.isOrder.value);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.008,
                        vertical: Get.width * 0.008,
                      ),
                      margin: EdgeInsets.only(bottom: Get.height * 0.01),
                      decoration: BoxDecoration(
                        color: !controller.isOrder.value
                            ? CustomColor.primaryColor.withOpacity(0.3)
                            : Colors.white,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(Get.width * 0.02),
                      ),
                      child: Text(
                        'CashBack From Referral',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.smallestTextSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        Divider(
          color: CustomColor.borderColor,
          thickness: 2,
        ),
        Expanded(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.activeIndex.value == 0
                ? controller.tData.length
                : controller.tCoinData.length,
            itemBuilder: (BuildContext context, int index) {
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
                      : controller.isOrder.value == false
                          ? TransactionCashBackRefCard(
                              height: Get.height,
                              width: Get.width,
                              title: 'CashBack From Referral Level 1',
                              subTitle:
                                  "Promote Lifelinekart for sanjay jadhav",
                              date: '14 Sep 2023, 03:14 PM',
                              txnId: 'Upline Name : satish kadam',
                              amount: double.parse('1000.00'),
                              coinAmount: double.parse('1000.00'),
                              txnType: controller.tCoinData[index]['txnType'],
                              txnDescription:
                                  'Credited To CashBack Coin Wallet',
                            )
                          : TransactionCashBackOrderCard(
                              height: Get.height,
                              width: Get.width,
                              title: 'Received From Order',
                              subTitle: "437555",
                              date: '14 Sep 2023, 03:14 PM',
                              txnId: '',
                              amount: double.parse('1000.00'),
                              coinAmount: double.parse('1000.00'),
                              txnType: controller.tCoinData[index]['txnType'],
                              txnDescription: '600',
                            );
            },
          ),
        ),
      ],
    ),
  );
}
