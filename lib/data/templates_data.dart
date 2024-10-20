import 'dart:ui';

import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';

import 'package:finkit/utils/strings.dart';
import 'package:get/get.dart';

class GridItem {
  final String title;
  final String image;
  final VoidCallback onTap;

  GridItem({
    required this.title,
    required this.image,
    required this.onTap,
  });
}

List<GridItem> items = [
  //>> mastcard 13
  GridItem(
    title: StringsMain.masterCard,
    image: StringsMain.masterCardLogo,
    onTap: () {
      // Get.toNamed(Mascardroutes.splashScreenMastCard);
      Get.toNamed(Mascardroutes.splashScreenMastCard);
    },
  ),
];
