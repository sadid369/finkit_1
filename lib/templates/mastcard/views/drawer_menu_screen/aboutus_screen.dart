import 'package:flutter/material.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import '../../widgets/custom_appbar_with_bg.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: Strings.aboutUs,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        _logoWidget(context),
        Container(
          height: MediaQuery.of(context).size.height / 1.5,
          margin: EdgeInsets.only(top: Dimensions.marginSize * 2),
          padding: EdgeInsets.only(top: Dimensions.marginSize * 0.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 3.5),
              topRight: Radius.circular(Dimensions.radius * 3.5),
            ),
            color: Colors.white,
          ),
          child: _mainBodyWidget(context),
        ),
      ],
    );
  }

  _mainBodyWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSize, vertical: Dimensions.marginSize),
      child: ListView(
        children: [
          _aboutUsText(context),
          _bottomTextWidget(),
        ],
      ),
    );
  }

  _logoWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.defaultPaddingSize),
      child: Image.asset(
        Strings.loginLogoImagePath,
        scale: 1,
        alignment: Alignment.topCenter,
        height: Dimensions.heightSize * 6.5,
      ),
    );
  }

  _bottomTextWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize),
      child: Column(
        children: [
          Text(
            Strings.copyRight,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.extraSmallTextSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            Strings.webSite,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColor.primaryTextColor,
              fontSize: Dimensions.extraSmallTextSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _aboutUsText(BuildContext context) {
    return Text(
      Strings.about,
      style: TextStyle(
        color: CustomColor.primaryTextColor.withOpacity(0.7),
        fontSize: Dimensions.smallTextSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
