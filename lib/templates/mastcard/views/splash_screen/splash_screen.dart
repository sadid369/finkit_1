import 'package:flutter/material.dart';

import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.splashBgImagePath),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _bodyWidget(context),
        ),
      ),
    );
  }

  // body widget contain all the widgets
  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.defaultPaddingSize,
        right: Dimensions.defaultPaddingSize,
        top: Dimensions.defaultPaddingSize,
        bottom: Dimensions.defaultPaddingSize,
      ),
      child: Column(
        children: [
          _mainBodyWidget(context),
        ],
      ),
    );
  }

  _mainBodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.90,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Strings.splashScreenLogoImagePath),
          SizedBox(
            height: Dimensions.heightSize * 2,
          ),
          Text(
            Strings.splashScreenMessage,
            style: CustomStyle.splashScreenSubTextTitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
