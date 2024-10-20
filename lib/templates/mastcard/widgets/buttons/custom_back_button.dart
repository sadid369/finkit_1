import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

Widget customBackButton() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () {
            Get.back();
          },
          child: IconButton(
            icon: CircleAvatar(
              radius: Dimensions.radius * 1.6,
              backgroundColor: Colors.black.withOpacity(0.3),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: Dimensions.iconSizeDefault,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        );
      });
}
