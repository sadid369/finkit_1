import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:finkit/templates/mastcard/routes/mastcard_routes.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum Availability { loading, available, unavailable }

class EndNavigationDrawerWidget extends StatefulWidget {
  const EndNavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<EndNavigationDrawerWidget> createState() =>
      _EndNavigationDrawerWidgetState();
}

class _EndNavigationDrawerWidgetState extends State<EndNavigationDrawerWidget> {
  final InAppReview _inAppReview = InAppReview.instance;

  String _appStoreId = '';
  String _microsoftStoreId = '';
  // ignore: unused_field
  final Availability _availability = Availability.loading;
  @override

  // ignore: override_on_non_overriding_member, unused_element
  void _setAppStoreId(String id) => _appStoreId = id;

  // ignore: unused_element
  void _setMicrosoftStoreId(String id) => _microsoftStoreId = id;

  // ignore: unused_element
  Future<void> _requestReview() => _inAppReview.requestReview();

  Future<void> _openStoreListing() => _inAppReview.openStoreListing(
        appStoreId: _appStoreId,
        microsoftStoreId: _microsoftStoreId,
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            _drawerHeaderWidget(context),
            _drawerItemWidget(context),
          ],
        ),
      ),
    );
  }

  _drawerItem(icon, title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSize,
          vertical: Dimensions.marginSize * 0.7,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: CustomColor.iconColor,
            ),
            addHorizontalSpace(Dimensions.widthSize),
            Text(
              title,
              style: CustomStyle.drawerTileTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  _drawerHeaderWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DrawerHeader(
        decoration:
            BoxDecoration(color: CustomColor.screenBGColor.withOpacity(0.5)),
        child: Padding(
          padding: EdgeInsets.only(bottom: Dimensions.defaultPaddingSize * 0.5),
          child: Image.asset(
            Strings.loginLogoImagePath,
            scale: 2.5,
            alignment: Alignment.bottomLeft,
          ),
        ),
      ),
    );
  }

  _drawerItemWidget(BuildContext context) {
    return Column(
      children: [
        _drawerItem(
          MdiIcons.file,
          Strings.transactionHistory,
          onTap: () {
            Get.toNamed(Mascardroutes.transactionHistoryScreenMastCard);
          },
        ),
        _drawerItem(
          Icons.currency_exchange_sharp,
          Strings.depositHistory,
          onTap: () {
            Get.toNamed(Mascardroutes.depositHistoryScreenMastCard);
          },
        ),
        _drawerItem(
          Icons.support,
          Strings.support,
          onTap: () {
            Get.toNamed(Mascardroutes.supportScreenMastCard);
          },
        ),
        _drawerItem(
          Icons.info,
          Strings.aboutUs,
          onTap: () {
            Get.toNamed(Mascardroutes.aboutUsScreenMastCard);
          },
        ),
        _drawerItem(
          MdiIcons.shieldCheck,
          Strings.privacyPolicy,
          onTap: () {},
        ),
        _drawerItem(
          MdiIcons.share,
          Strings.shareApp,
          onTap: () {
            // Share.share(
            //   "Download the latest ${Strings.appName} App on Play store\n\n",
            // );
          },
        ),
        _drawerItem(
          MdiIcons.starHalfFull,
          Strings.rateUs,
          onTap: _openStoreListing,
        ),
        _drawerItem(
          Icons.power_settings_new,
          Strings.signOut,
          onTap: () {
            Get.toNamed(Mascardroutes.mastcardSignInScreenMastCard);
          },
        ),
      ],
    );
  }
}
