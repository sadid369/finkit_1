import 'package:carousel_slider/carousel_slider.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controller/dashboard_controller.dart';
import '../../utils/custom_color.dart';
import '../../widgets/custom_appbar_with_bg.dart';

class BuyCardScreen extends StatelessWidget {
  BuyCardScreen({Key? key}) : super(key: key);
  final controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: Strings.buyCard,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return _cardSlider(context, controller);
  }

  _cardSlider(BuildContext context, DashboardController controller) {
    return Obx(
      () => Container(
        height: MediaQuery.of(context).size.height / 1.2,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: Dimensions.marginSize),
        child: ListView(
          children: [
            CarouselSlider.builder(
              itemCount: controller.buyCardSliderList.length,
              itemBuilder: (context, index, realIndex) {
                return _buildSlider(context, index, controller);
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height / 1.5,
                onPageChanged: (index, reason) =>
                    controller.changeIndicator(index),
              ),
            ),
            addVerticalSpace(Dimensions.heightSize * 1.8),
            _buildIndicator(context, controller),
          ],
        ),
      ),
    );
  }

  _buildSlider(
      BuildContext context, int index, DashboardController controller) {
    return controller.buyCardSliderList[index];
  }

  _buildIndicator(BuildContext context, DashboardController controller) {
    return Center(
      child: AnimatedSmoothIndicator(
        activeIndex: controller.activeIndex.value,
        count: controller.buyCardSliderList.length,
        effect: SlideEffect(
          dotHeight: 6,
          dotWidth: 6,
          activeDotColor: CustomColor.screenBGColor,
          dotColor: CustomColor.screenBGColor.withOpacity(0.4),
        ),
      ),
    );
  }
}
