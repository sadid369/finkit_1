import 'package:finkit/templates/mastcard/controller/profle/profile_controller.dart';
import 'package:finkit/templates/mastcard/widgets/custom_appbar_with_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/custom_color.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import '../../widgets/inputs/sign_up_country_picker_input_widget.dart';
import '../../widgets/inputs/sign_up_phone_with_code_input_widget.dart';
import '../../widgets/inputs/text_field_input_widget.dart';
import '../../widgets/inputs/text_label_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: Strings.editProfile,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSize * 3),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          _inputWidget(context),
          _userInformationWidget(context),
        ],
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: Dimensions.marginSize * 4.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 3.5),
            topRight: Radius.circular(Dimensions.radius * 3.5),
          ),
          color: Colors.white,
        ),
        child: _editProfileInputWidget(context));
  }

  // editProfile inputs
  _editProfileInputWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            CustomInputWidget(
              labelText: Strings.firstName,
              hintText: 'Enter ${Strings.firstName}',
              controller: controller.firstNameController,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            CustomInputWidget(
              labelText: Strings.lastName,
              hintText: 'Enter ${Strings.lastName}',
              controller: controller.lastNameController,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            CustomInputWidget(
              labelText: Strings.email,
              hintText: 'Enter ${Strings.email}',
              controller: controller.emailController,
              borderColor: CustomColor.primaryColor,
              color: CustomColor.secondaryColor,
            ),
            const CustomLabelWidget(text: Strings.country),
            SignUpCountryCodePickerWidget(
              hintText: 'Select Country',
              controller: controller.countryController,
            ),
            const CustomLabelWidget(text: Strings.phoneNumber),
            PhoneNumberWithCountryCodeInput(
              hintText: 'XXX XXX XXXX',
              controller: controller.phoneController,
            ),
            _saveChangeButtonWidget(context)
          ],
        ),
      ),
    );
  }

  _userInformationWidget(BuildContext context) {
    return Positioned(
      top: -65,
      child: Column(
        children: [
          GetBuilder<ProfileController>(
              assignId: true,
              builder: (logic) {
                return CircleAvatar(
                    radius: Dimensions.radius * 7.8,
                    backgroundColor: Colors.white,
                    child: controller.image == null
                        ? CircleAvatar(
                            radius: Dimensions.radius * 7,
                            backgroundImage: const AssetImage(Strings.profilePic),
                            child: CircleAvatar(
                              radius: Dimensions.radius * 7,
                              backgroundColor:
                                  const Color.fromARGB(118, 110, 108, 108),
                              child: InkWell(
                                onTap: () {
                                  _openImageSourceOptions(context);
                                },
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  margin: EdgeInsets.symmetric(
                                      vertical: Dimensions.marginSize * 0.5),
                                  child: SvgPicture.asset(Strings.camera),
                                ),
                              ),
                            ),
                          )
                        : CircleAvatar(
                            radius: Dimensions.radius * 7,
                             backgroundImage: FileImage(controller.image!),
                            child: CircleAvatar(
                              radius: Dimensions.radius * 7,
                              backgroundColor:
                                  const Color.fromARGB(118, 110, 108, 108),
                              child: InkWell(
                                onTap: () {
                                  _openImageSourceOptions(context);
                                },
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  margin: EdgeInsets.symmetric(
                                      vertical: Dimensions.marginSize * 0.5),
                                  child: SvgPicture.asset(Strings.camera),
                                ),
                              ),
                            ),
                          ));
              }),
        ],
      ),
    );
  }

  _saveChangeButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize * 0.5),
      child: PrimaryButton(
        title: Strings.saveChange,
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  _openImageSourceOptions(BuildContext context) {
    showGeneralDialog(
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.6),
        transitionDuration: const Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 150,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.camera_alt,
                            size: 40.0,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            controller.chooseFromCamera();
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          'from Camera',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.smallTextSize),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.photo,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          onTap: () {
                            controller.chooseFromGallery();
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.smallTextSize),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim),
            child: child,
          );
        });
  }
}
