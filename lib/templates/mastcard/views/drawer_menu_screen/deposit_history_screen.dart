import 'package:flutter/material.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';

import '../../widgets/custom_appbar_with_bg.dart';
import '../../widgets/custom_history_widget.dart';

class DepositHistoryScreen extends StatelessWidget {
  const DepositHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: Strings.depositHistory,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: Dimensions.marginSize * 1.5),
      padding: EdgeInsets.only(top: Dimensions.marginSize * 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 3.5),
          topRight: Radius.circular(Dimensions.radius * 3.5),
        ),
        color: Colors.white,
      ),
      child: _mainBodyWidget(context),
    );
  }

  _mainBodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return const CustomHistoryWidget(
            date: 'March 20, 2022',
            amount: 1000.00,
            isDeposit: true,
          );
        },
      ),
    );
  }
}
