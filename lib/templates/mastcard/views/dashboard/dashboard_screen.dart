import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import '../../controller/dashboard_controller.dart';
import '../../utils/size.dart';
import '../../widgets/my_cards_widget.dart';
import '../../widgets/navigation/end_navigation_drawer_widget.dart';
import '../../widgets/transaction_widget.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const EndNavigationDrawerWidget(),
      backgroundColor: Colors.transparent,
      body: _bodyWidget(context, controller),
    );
  }

  // body widget containing all widget elements
  _bodyWidget(BuildContext context, DashboardController controller) {
    return Obx(() => SizedBox(
          child: ListView(
            children: [
              SizedBox(
                height: Get.height * 0.009,
              ),
              controller.isTransaction.value == false
                  ? Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      height: Get.height * 0.5,
                      child: ListView(
                        children: [
                          myCardWidget(context, controller),
                        ],
                      ),
                    )
                  : Container(),
              _transactionWidget(context),
            ],
          ),
        ));
  }

  _transactionWidget(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: EdgeInsets.only(
        top: Get.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Get.height * 0.045),
          topRight: Radius.circular(Get.height * 0.045),
        ),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Gap(Get.width * 0.05),
            ],
          ),
          addVerticalSpace(Get.height * 0.01),
          _headerTextWidget(context),
          transactionWidget(context),
        ],
      ),
    );
  }

  _headerTextWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.transactionHistory,
                style: CustomStyle.commonTextTitle,
              ),
            ],
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
