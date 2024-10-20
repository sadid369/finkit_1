import 'package:finkit/templates/mastcard/controller/profle/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import '../../controller/dashboard_controller.dart';
import '../../widgets/my_cards_widget.dart';

class MyCardsScreen extends StatelessWidget {
  MyCardsScreen({Key? key}) : super(key: key);
  final profileController = Get.put(ProfileController());
  final controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
      child: Column(
        children: [
          myCardWidget(context, controller),
          _newCardButtonWidget(context),
        ],
      ),
    );
  }

  _newCardButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize*2),
      child: PrimaryButton(
        title: Strings.newCard,
        onPressed: () {},
      ),
    );
  }
}
