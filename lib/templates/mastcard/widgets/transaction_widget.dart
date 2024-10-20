import 'package:finkit/templates/mastcard/controller/dashboard_controller.dart';
import 'package:finkit/templates/mastcard/widgets/transaction_card.dart';
import 'package:finkit/templates/mastcard/widgets/transaction_coin_card_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/deposit_controller.dart';
import '../data/transcation_list.dart';
import '../utils/custom_color.dart';
import 'custom_history_widget.dart';

Widget transactionWidget(BuildContext context) {
  final controller = Get.put(DashboardController());
  return SizedBox(
    height: MediaQuery.of(context).size.height,
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
                txnDescription: controller.tData[index]['txnDescription'])
            : TransactionCoinCard(
                height: Get.height,
                width: Get.width,
                title: controller.tCoinData[index]['title'],
                subTitle: controller.tCoinData[index]['subTitle'],
                date: controller.tCoinData[index]['date'],
                txnId: controller.tCoinData[index]['txnId'],
                amount: controller.tCoinData[index]['amount'],
                coinAmount: controller.tCoinData[index]['coinAmount'],
                txnType: controller.tCoinData[index]['txnType'],
                txnDescription: controller.tCoinData[index]['txnDescription'],
              );
      },
    ),
  );
}
