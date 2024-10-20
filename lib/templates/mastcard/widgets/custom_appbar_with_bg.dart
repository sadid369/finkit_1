import 'package:flutter/material.dart';
import '../utils/custom_style.dart';
import '../utils/strings.dart';
import 'buttons/custom_back_button.dart';

class BackgroundWidget extends StatelessWidget {
  final String title;
  final Widget body;
  const BackgroundWidget({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Strings.commonBgImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: customBackButton(),
          title: Text(
            title,
            style: CustomStyle.appBarTextStyle,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.transparent,
        body: body,
      ),
    );
  }
}
