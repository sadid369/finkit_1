import 'package:finkit/templates/mastcard/widgets/navigation/end_navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import '../../controller/navigation/navigation_controller.dart';
import '../../widgets/navigation/bottom_navbar_widget.dart';
import '../dashboard/dashboard_screen.dart';
import '../deposit/deposit_screen.dart';
import '../my_cards/my_cards_screen.dart';
import '../profile/profile_screen.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({Key? key}) : super(key: key);
  final _controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Strings.commonBgImagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            appBar: _appBarWidget(context),
            drawer: const EndNavigationDrawerWidget(),
            extendBody: true,
            backgroundColor: Colors.transparent,
            bottomNavigationBar: BottomNavBar(),
            body: IndexedStack(
              index: _controller.currentIndex.value,
              children: [
                DashboardScreen(),
                DepositScreen(),
                MyCardsScreen(),
                ProfileScreen(),
              ],
            ),
          ),
        ));
  }

  _appBarWidget(BuildContext context) {
    return AppBar(
      title: Text(
        _controller.currentIndex.value == 0
            ? Strings.dashboard
            : _controller.currentIndex.value == 1
                ? 'Deposit'
                : _controller.currentIndex.value == 2
                    ? Strings.myCards
                    : Strings.profile,
        style: CustomStyle.appBarTextStyle,
      ),
      actions: [
        _controller.currentIndex.value == 0
            ? InkWell(
              onTap: () => Get.toNamed(Mascardroutes.buyCardScreenMastCard),
              child: Row(
                  children: [
                    Container(
                      height: Dimensions.heightSize * 2,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        color: CustomColor.screenBGColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius * 5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_circle_outline,
                            color: CustomColor.secondaryColor,
                          ),
                          Text(
                            Strings.buyCard,
                            style: TextStyle(
                              color: CustomColor.secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: Dimensions.smallestTextSize,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.widthSize,
                    )
                  ],
                ),
            )
            : Container()
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: CustomColor.primaryColor,
      ),
    );
  }
}
