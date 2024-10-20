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
    height: MediaQuery.of(context).size.height * 0.48,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(top: Dimensions.marginSize * 0.5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      color: CustomColor.secondaryColor.withOpacity(0.3),
    ),
    child: _cardSlider(context, controller),
  );
}

_cardSlider(BuildContext context, DashboardController controller) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.45,
    padding: EdgeInsets.symmetric(
      horizontal: Dimensions.defaultPaddingSize * 0.5,
      vertical: Dimensions.defaultPaddingSize * 0.7,
    ),
    // color: CustomColor.screenBGColor,
    child: Obx(
      () => Center(
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              controller.cardList[controller.activeIndex.value]['name'],
              textAlign: TextAlign.start,
              style: CustomStyle.commonTextTitle,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: Dimensions.defaultPaddingSize * 0.7,
                bottom: Dimensions.defaultPaddingSize * 0.8,
              ),
              child: GestureDetector(
                onTap: () {},
                child: CarouselSlider.builder(
                  itemCount: controller.sliderList.length,
                  itemBuilder: (context, index, realIndex) {
                    // return _buildSlider(context, index, controller);
                    return _balanceWidget(
                      context,
                      balance: controller.cardList[controller.activeIndex.value]
                              ['balance']
                          .toString(),
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

_buildSlider(BuildContext context, int index, DashboardController controller) {
  return controller.sliderList[index];
}

_buildIndicator(BuildContext context, DashboardController controller) {
  return Center(
    child: AnimatedSmoothIndicator(
      activeIndex: controller.activeIndex.value,
      count: controller.sliderList.length,
      effect: SlideEffect(
        dotHeight: 8,
        dotWidth: 8,
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
          height: MediaQuery.of(context).size.height / 13,
          width: Dimensions.heightSize * 4,
          decoration: BoxDecoration(
              color: CustomColor.secondaryColor.withOpacity(0.5),
              shape: BoxShape.circle),
          child: Image.asset(imagePath),
        ),
        addVerticalSpace(Dimensions.heightSize * 0.4),
        Text(
          label,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: Dimensions.mediumTextSize * 0.7,
              fontWeight: FontWeight.w600,
              color: CustomColor.primaryTextColor),
        ),
      ],
    ),
  );
}

_balanceWidget(BuildContext context, {required String balance}) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$ $balance.00',
                style: TextStyle(
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.w900,
                    color: CustomColor.primaryTextColor),
              ),
              // Image.asset(
              //   Strings.cardFrontImagePath,
              //   height: Dimensions.heightSize * 1.5,
              // ),
            ],
          ),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SATISH JAYWANT KADAM',
                style: TextStyle(
                    fontSize: Dimensions.mediumTextSize,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.primaryTextColor),
              ),
              // Image.asset(Strings.balanceImagePath),
            ],
          ),
          // SizedBox(
          //   height: Dimensions.heightSize * 2,
          // ),
          // Text(
          //   Strings.balance,
          //   style: TextStyle(
          //       fontSize: Dimensions.smallTextSize,
          //       fontWeight: FontWeight.w600,
          //       color: CustomColor.primaryTextColor),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       '\$ $balance.00',
          //       style: TextStyle(
          //           fontSize: Dimensions.largeTextSize,
          //           fontWeight: FontWeight.w900,
          //           color: CustomColor.primaryTextColor),
          //     ),
          //   ],
          // ),

          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          Text(
            '19/10/2024',
            style: TextStyle(
                fontSize: Dimensions.smallTextSize,
                fontWeight: FontWeight.w600,
                color: CustomColor.primaryTextColor),
          ),
        ],
      ),
    ),
  );
}
