import 'package:finkit/templates/mastcard/controller/profle/profile_controller.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize * 5),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          _profileTileWidget(context),
          _userInformationWidget(context),
        ],
      ),
    );
  }

  _profileTileWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: Dimensions.marginSize * 7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 3.5),
          topRight: Radius.circular(Dimensions.radius * 3.5),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _navigationTile(
            MdiIcons.accountCircleOutline,
            Strings.editProfile,
            onTap:(){
               profileController.goToEditProfileScreen();
            }
          ),
          _navigationTile(
            Icons.security_outlined,
            Strings.twoFactor,
            onTap: () {
               profileController.goToTwoFactorScreen();
            },
          ),
          _navigationTile(
            Icons.vpn_key_rounded,
            Strings.changePassword,
            onTap: () {
               profileController.goToChangePasswordScreen();
            },
          ),
        ],
      ),
    );
  }

  _userInformationWidget(BuildContext context) {
    return Positioned(
      top: -65,
      child: Column(
        children: [
          CircleAvatar(
            radius: Dimensions.radius * 7.8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: Dimensions.radius * 7,
               backgroundImage: const AssetImage(Strings.profilePic),
            ),
          ),
          addVerticalSpace(Dimensions.heightSize * 0.5),
          Text(Strings.user, style: CustomStyle.commonLargeTextTitle),
          addVerticalSpace(Dimensions.heightSize * 0.2),
          Text('${Strings.userId}9632158746',
              style: CustomStyle.commonSubTextTitle),
        ],
      ),
    );
  }

  _navigationTile(IconData iconData, String title,
      {required VoidCallback onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          iconData,
          size: Dimensions.iconSizeDefault,
          color: CustomColor.screenBGColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: CustomColor.screenBGColor,
            fontSize: Dimensions.largeTextSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: CircleAvatar(
          radius: 13,
          backgroundColor: CustomColor.screenBGColor.withOpacity(0.4),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: Dimensions.iconSizeDefault * 0.7,
            color: CustomColor.screenBGColor,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
