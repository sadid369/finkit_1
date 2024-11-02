import 'package:carousel_slider/carousel_slider.dart';
import 'package:finkit/templates/mastcard/controller/dashboard_controller.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';

Widget myCardWidget(BuildContext context, DashboardController controller) {
  return Container(
    height: Get.height * 0.48,
    width: Get.width,
    margin: EdgeInsets.only(top: Get.height * 0.01),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Get.height * 0.03),
      color: CustomColor.secondaryColor.withOpacity(0.3),
    ),
    child: _cardSlider(context, controller),
  );
}

_cardSlider(BuildContext context, DashboardController controller) {
  return Container(
    height: Get.height * 0.45,
    padding: EdgeInsets.symmetric(
      horizontal: Get.width * 0.05,
      vertical: Get.width * 0.05,
    ),
    child: Obx(
      () => Center(
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
                "${controller.cardList[controller.activeIndex.value]['name']} Wallet ",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: CustomColor.primaryTextColor,
                  fontSize: Get.width * 0.05,
                  fontWeight: FontWeight.w600,
                )),
            Padding(
              padding: EdgeInsets.only(
                top: Get.width * 0.05,
                bottom: Get.width * 0.05,
              ),
              child: GestureDetector(
                onTap: () {},
                child: CarouselSlider.builder(
                  itemCount: controller.sliderList.length,
                  itemBuilder: (context, index, realIndex) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Mascardroutes.cardDetailsScreenMastCard);
                      },
                      child: _cardWidget(
                        context,
                        balance: controller.cardList[index]['balance'],
                        color: controller.cardList[index]['color'],
                        validity: controller.cardList[index]['validity'],
                      ),
                    );
                  },
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        controller.changeIndicator(index);
                      }),
                ),
              ),
            ),
            _cardButtonWidget(context),
            const Spacer(),
            _buildIndicator(context, controller),
          ],
        ),
      ),
    ),
  );
}

// _buildSlider(BuildContext context, int index, DashboardController controller) {
//   return controller.sliderList[index];
// }

_buildIndicator(BuildContext context, DashboardController controller) {
  return Center(
    child: AnimatedSmoothIndicator(
      activeIndex: controller.activeIndex.value,
      count: controller.sliderList.length,
      effect: SlideEffect(
        dotHeight: Get.width * 0.02,
        dotWidth: Get.width * 0.02,
        activeDotColor: CustomColor.primaryColor,
        dotColor: Colors.grey.withOpacity(0.5),
      ),
    ),
  );
}

_cardButtonWidget(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: Dimensions.marginSize,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonItemWidget(context,
            imagePath: Strings.dealsImagePath,
            label: Strings.details, onTap: () {
          Get.toNamed(Mascardroutes.cardDetailsScreenMastCard);
        }),
        _buttonItemWidget(context,
            imagePath: Strings.fundImagePath, label: Strings.fund, onTap: () {
          Get.toNamed(Mascardroutes.fundScreenMastCard);
        }),
        _buttonItemWidget(context,
            imagePath: Strings.transactionImagePath,
            label: Strings.transaction, onTap: () {
          Get.toNamed(Mascardroutes.transactionHistoryScreenMastCard);
        }),
      ],
    ),
  );
}

_buttonItemWidget(BuildContext context,
    {required String imagePath,
    required String label,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          height: Get.height / 13,
          width: Get.width * 0.2,
          decoration: BoxDecoration(
              color: CustomColor.secondaryColor.withOpacity(0.5),
              shape: BoxShape.circle),
          child: Image.asset(imagePath),
        ),
        addVerticalSpace(Get.height * 0.01),
        Text(
          label,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: Get.width * 0.035,
              fontWeight: FontWeight.w600,
              color: CustomColor.primaryTextColor),
        ),
      ],
    ),
  );
}

_cardWidget(BuildContext context,
    {required String balance, required Color color, required validity}) {
  return Container(
    height: Get.width / 2,
    margin: EdgeInsets.symmetric(),
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(Strings.cardFrontImagePathNew2),
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          bottom: Get.width * 0.16,
          left: Get.width * 0.23,
          child: Text(
            'Balance \₹ $balance.00',
            style: TextStyle(
              fontSize: Get.width * 0.055,
              fontWeight: FontWeight.w900,
              color: CustomColor.secondaryColor,
            ),
          ),
        ),
        Positioned(
          bottom: Get.width * 0.025,
          left: Get.width * 0.54,
          child: Text(
            validity,
            style: TextStyle(
              color: Colors.white,
              fontSize: Get.width * 0.038,
            ),
          ),
        ),
      ],
    ),
  );
}
