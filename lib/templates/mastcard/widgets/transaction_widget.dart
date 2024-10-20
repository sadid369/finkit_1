import 'package:finkit/templates/mastcard/controller/dashboard_controller.dart';
import 'package:finkit/templates/mastcard/widgets/transaction_card.dart';
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
      itemCount: controller.tData.length,
      itemBuilder: (BuildContext context, int index) {
        // return CustomHistoryWidget(
        //   date: transactionList[index].date,
        //   amount: transactionList[index].amount,
        //   isDeposit: transactionList[index].isDeposit,
        // );
        return TransactionCard(
            height: Get.height,
            width: MediaQuery.of(context).size.width,
            title: controller.tData[index]['title'],
            subTitle: controller.tData[index]['subTitle'],
            date: controller.tData[index]['date'],
            txnId: controller.tData[index]['txnId'],
            amount: controller.tData[index]['amount'],
            coinAmount: controller.tData[index]['coinAmount'],
            txnType: controller.tData[index]['txnType'],
            txnDescription: controller.tData[index]['txnDescription']);
      },
    ),
  );
}
