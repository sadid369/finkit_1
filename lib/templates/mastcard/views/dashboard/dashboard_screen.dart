import 'package:finkit/templates/mastcard/widgets/triangle_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
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
          // height: MediaQuery.of(context).size.height,
          child: ListView(
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: Dimensions.heightSize,
              ),
              controller.isTransaction.value == false
                  ? Container(
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black),
                          ),
                      margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.marginSize),
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: ListView(
                        children: [
                          myCardWidget(context, controller),
                          // addVerticalSpace(Dimensions.heightSize),
                          // _balanceWidget(context),
                          // addVerticalSpace(Dimensions.heightSize)
                        ],
                      ),
                    )
                  : Container(),
              _transactionWidget(context, controller),
            ],
          ),
        ));
  }

  _transactionWidget(BuildContext context, DashboardController controller) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: Dimensions.defaultPaddingSize * 0.5,
      ),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        color: CustomColor.secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 4),
          topRight: Radius.circular(Dimensions.radius * 4),
        ),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // _topBarWidget(context),
              Gap(Dimensions.widthSize * 7),
            ],
          ),
          addVerticalSpace(Dimensions.heightSize),
          _headerTextWidget(context),
          // SizedBox(
          //   height: controller.isTransaction.value == true
          //       ? MediaQuery.of(context).size.height / 2
          //       : MediaQuery.of(context).size.height * 0.197,
          //   child: transactionWidget(context),
          // )
          transactionWidget(context),
        ],
      ),
    );
  }

  _balanceWidget(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.17,
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.defaultPaddingSize * 0.1),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        color: CustomColor.secondaryColor.withOpacity(0.3),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultPaddingSize * 0.5,
            vertical: Dimensions.defaultPaddingSize * 0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(Strings.balanceImagePath),
              ],
            ),
            Text(
              Strings.balance,
              style: TextStyle(
                  fontSize: Dimensions.mediumTextSize,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.primaryTextColor),
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            Text(
              '\$ 100.00',
              style: TextStyle(
                  fontSize: Dimensions.largeTextSize * 2,
                  fontWeight: FontWeight.w900,
                  color: CustomColor.primaryTextColor),
            ),
          ],
        ),
      ),
    );
  }

  // _topBarWidget(BuildContext context) {
  //   return InkWell(
  //     child: Container(
  //       alignment: Alignment.topCenter,
  //       height: Dimensions.heightSize * 0.3,
  //       margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize * 6.5),
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(Dimensions.radius * 2),
  //           // border: Border.all(color: Colors.black),
  //           color: CustomColor.screenBGColor),
  //     ),
  //     onTap: () {
  //       controller.isTransaction.value = !controller.isTransaction.value;
  //     },
  //   );
  // }
  _topBarWidget(BuildContext context) {
    return InkWell(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // shape: LinearBorder(),
          padding: EdgeInsets.zero,
          backgroundColor: CustomColor.primaryColor.withOpacity(0.6),
        ),
        onPressed: () {
          controller.isTransaction.value = !controller.isTransaction.value;
        },
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(
              controller.isTransaction.value == false ? 0 : 180 / 360),
          child: Center(
            child: CustomPaint(
              painter: TrianglePainter(
                strokeColor: CustomColor.screenBGColor,
                strokeWidth: 3,
                paintingStyle: PaintingStyle.fill,
              ),
              child: Container(
                height: 13,
                width: 13,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        controller.isTransaction.value = !controller.isTransaction.value;
      },
    );
  }

  _headerTextWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.black),
              ),
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.transactionHistory,
                style: CustomStyle.commonTextTitle,
              ),
              // _topBarWidget(context)
            ],
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
