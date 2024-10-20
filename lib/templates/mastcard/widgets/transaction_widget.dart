import 'package:flutter/material.dart';

import '../data/transcation_list.dart';
import 'custom_history_widget.dart';

Widget transactionWidget(BuildContext context){
 
  return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: transactionList.length,
        itemBuilder: (BuildContext context, int index) {
          return  CustomHistoryWidget(
            date:transactionList[index].date,
            amount: transactionList[index].amount,
            isDeposit:transactionList[index].isDeposit,
          );
        },
      ),
    );
}