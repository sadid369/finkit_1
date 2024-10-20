import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/on_board_controller.dart';
import '../../data/onboard_model.dart';
import '../../utils/size.dart';
import '../../widgets/onboard/onboard_content_widget.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardController());
    return Scaffold(
      // backgroundColor: CustomColor.screenBGColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _body(context, controller),
      ),
    );
  }

  Widget _body(BuildContext context, OnboardController controller) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                onPageChanged: controller.selectedPageIndex,
                controller: controller.pageController,
                itemCount: onBoardModePages.length,
                itemBuilder: (context, index) => OnboardContentWidget(
                  title: onBoardModePages[index].title,
                  image: onBoardModePages[index].imagePath,
                  backgroundImagePath: onBoardModePages[index].backgroundImage,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 40,
          right: 40,
          left: 40,
          child: Column(
            mainAxisAlignment: mainCenter,
            children: [
              Obx(() => controller.dotWidget()),
              addVerticalSpace(55.h),
              controller.buttonWidget(),
              addVerticalSpace(14.h),
            ],
          ),
        ),
      ],
    );
  }
}
