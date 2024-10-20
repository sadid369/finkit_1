import 'package:carousel_slider/carousel_slider.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/dashboard/buy_card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controller/dashboard_controller.dart';
import '../../utils/custom_color.dart';
import '../../widgets/custom_appbar_with_bg.dart';

class BuyCardScreen extends StatelessWidget {
  BuyCardScreen({super.key});
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

  // _cardSlider(BuildContext context, DashboardController controller) {
  //   return Obx(
  //     () => Container(
  //       height: MediaQuery.of(context).size.height,
  //       width: MediaQuery.of(context).size.width,
  //       // margin: EdgeInsets.only(top: Dimensions.marginSize),
  //       child: ListView(
  //         children: [
  //           _buildSlider(),
  //           addVerticalSpace(Dimensions.heightSize * 1.8),
  //           _buildIndicator(context, controller),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  _cardSlider(BuildContext context, DashboardController controller) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.only(top: Dimensions.marginSize),
      child: _buildSlider(),
    );
  }

  // _buildSlider(
  //     BuildContext context, int index, DashboardController controller) {
  //   return controller.buyCardSliderList[index];
  // }
  _buildSlider() {
    return BuyCardItemWidget(
      cardHolderName: 'test user',
      cardExpDate: '11/2024',
      cardNumber: '5366131828291260',
    );
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
