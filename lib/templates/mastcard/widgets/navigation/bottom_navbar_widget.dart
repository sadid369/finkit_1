import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigation/navigation_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<NavigationController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 2.5),
          topRight: Radius.circular(Dimensions.radius * 2.5),
        ),
        child: BottomNavigationBar(
          onTap: controller.onTapChangeIndex,
          currentIndex: controller.currentIndex.value,
          selectedItemColor: CustomColor.secondaryColor,
          unselectedItemColor: CustomColor.secondaryColor.withOpacity(0.5),
          type: BottomNavigationBarType.fixed,
          backgroundColor: CustomColor.primaryColor,

          // unselectedLabelStyle:
          //     TextStyle(fontSize: Dimensions.smallTextSize * 0.5),
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          // fixedColor: CustomColor.primaryColor,

          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: "Deposit"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: "My Card"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
