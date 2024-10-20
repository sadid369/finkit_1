import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data/onboard_model.dart';
import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';

import '../utils/custom_color.dart';
import '../utils/strings.dart';
import '../widgets/buttons/primary_button.dart';

class OnboardController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardModePages.length;
  bool get isFirstPage => selectedPageIndex.value == 0;
  bool get isSecondPage => selectedPageIndex.value == 1;
  bool get isThirdPage => selectedPageIndex.value == 2;

  void nextPage() {
    if (isLastPage) {
    } else {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.ease,
      );
    }
  }

  void backPage() {
    pageController.previousPage(
      duration: 300.milliseconds,
      curve: Curves.ease,
    );
  }

// navigate to the welcome screen
  pageNavigate() {
    Get.toNamed(Mascardroutes.mastcardWelcomeScreenMastCard);
  }

  Container buildDot({int? index}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 10.h,
        width: 10.w,
        decoration: BoxDecoration(
          color: index! <= selectedPageIndex.value
              ? CustomColor.primaryColor
              : Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

// generate the line equal to page List length
  dotWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onBoardModePages.length,
        (index) => buildDot(index: index),
      ),
    );
  }

  // button widget with color and size
  buttonWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 36.w,
      ),
      child: SizedBox(
          child: PrimaryButton(
        onPressed: () {
          pageNavigate();
        },
        borderColorName: CustomColor.primaryColor,
        title: Strings.getStarted,
      )),
    );
  }
}
