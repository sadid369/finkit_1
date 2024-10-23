import 'package:finkit/templates/mastcard/controller/profle/profile_controller.dart';
import 'package:finkit/templates/mastcard/utils/size.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/custom_style.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BuyNowScreen extends StatelessWidget {
  BuyNowScreen({super.key});
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Colors.white,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize * 2),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize * 0.5),
        child: SingleChildScrollView(
          child: Column(
            // clipBehavior: Clip.none,
            // alignment: Alignment.topCenter,
            children: [
              _userInformationWidget(context),
              Divider(
                thickness: 5,
              ),
              addVerticalSpace(Dimensions.widthSize * 1.5),
              _walletCard(),
              _cardWidget(context),
              addVerticalSpace(Dimensions.widthSize * 0.5),
              _balanceCard(),
              addVerticalSpace(Dimensions.widthSize * 1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Send Money', style: CustomStyle.commonTextTitle),
                ],
              ),
              Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(Dimensions.marginSize * 0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.card_travel,
                          ),
                          addHorizontalSpace(Dimensions.widthSize * 0.8),
                          Text('Name', style: CustomStyle.commonTextTitle),
                        ],
                      ),
                      Row(
                        children: [
                          Text('₹645.009', style: CustomStyle.commonTextTitle),
                          addHorizontalSpace(Dimensions.widthSize * 0.8),
                          const Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              addVerticalSpace(Dimensions.widthSize * 0.9),
              PrimaryButton(title: '+ Add Wallet', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }

  Container _balanceCard() {
    return Container(
      padding: EdgeInsets.all(Dimensions.marginSize * 0.5),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColor.borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          Dimensions.radius * 1.5,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Main Balance', style: CustomStyle.commonTextTitle),
                  Text('₹534.745.00', style: CustomStyle.commonTextTitle),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.auto_graph_rounded),
                      addHorizontalSpace(Dimensions.widthSize * 0.5),
                      Text('₹ 43.76', style: CustomStyle.commonTextTitle),
                    ],
                  ),
                  addHorizontalSpace(Dimensions.widthSize * 0.5),
                  Row(
                    children: [
                      Icon(Icons.auto_graph_rounded),
                      addHorizontalSpace(Dimensions.widthSize * 0.5),
                      Text('₹ 23.40', style: CustomStyle.commonTextTitle),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Currency', style: CustomStyle.commonTextTitle),
                  Text('Indian Rupee', style: CustomStyle.commonTextTitle),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.arrow_back_sharp,
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('United', style: CustomStyle.commonTextTitle),
                    ],
                  ),
                  addHorizontalSpace(Dimensions.widthSize * 0.5),
                  Row(
                    children: [
                      Text('Ecro Dollar', style: CustomStyle.commonTextTitle),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _walletCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('My Debit Card', style: CustomStyle.commonTextTitle),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2)),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 10,
                ),
              ),
            ),
            addHorizontalSpace(Dimensions.widthSize * 0.8),
            Container(
              alignment: Alignment.center,
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2)),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                ),
              ),
            ),
            // Text(' 3', style: CustomStyle.commonTextTitle)
          ],
        )
      ],
    );
  }

  _cardWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSize * 0.5,
      ),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(Strings.cardFrontImagePathNew),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.025,
            left: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              'SATISH KADAM',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.025,
            left: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              '10/26',
              style: TextStyle(color: Colors.white),
            ),
          ),
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
            // topLeft: Radius.circular(Dimensions.radius * 3.5),
            // topRight: Radius.circular(Dimensions.radius * 3.5),
            ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _navigationTile(MdiIcons.accountCircleOutline, Strings.editProfile,
              onTap: () {
            profileController.goToEditProfileScreen();
          }),
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black),
          ),
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.widthSize * 1.2),
              gradient: const LinearGradient(
                colors: [
                  CustomColor.primaryColor,
                  CustomColor.secondaryColor,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addHorizontalSpace(Dimensions.widthSize * 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    addVerticalSpace(Dimensions.heightSize * 1.2),
                    Text(Strings.profile, style: CustomStyle.commonTextTitle),
                    Text(Strings.updateYourPhoto,
                        style: CustomStyle.commonSubTextTitle),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 44,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                right: Dimensions.marginSize * 0.5,
              ),
              child: CircleAvatar(
                radius: Dimensions.radius * 4,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: Dimensions.radius * 3.5,
                  backgroundImage: const AssetImage(Strings.profilePic),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 30,
            child: Container(
              margin: EdgeInsets.only(left: Dimensions.marginSize * 0.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      addVerticalSpace(Dimensions.heightSize * 0.5),
                      Text(Strings.user,
                          style: CustomStyle.commonLargeTextTitle),
                      addVerticalSpace(Dimensions.heightSize * 0.2),
                      Text('${Strings.userId}9632158746',
                          style: CustomStyle.commonSubTextTitle),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
