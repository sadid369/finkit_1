import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class MyCardItemWidget extends StatelessWidget {
  const MyCardItemWidget(
      {Key? key,
      required this.cardHolderName,
      required this.cardNumber,
      required this.cardExpDate})
      : super(key: key);
  final String cardHolderName;
  final String cardNumber;
  final String cardExpDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.cardFrontImagePath),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: Dimensions.defaultPaddingSize * 0.9,
          left: Dimensions.defaultPaddingSize * 0.5,
          right: Dimensions.defaultPaddingSize * 0.5,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
