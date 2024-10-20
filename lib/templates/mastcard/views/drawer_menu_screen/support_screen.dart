import 'package:finkit/templates/mastcard/controller/support_screen_controller.dart';
import 'package:finkit/templates/mastcard/widgets/inputs/text_field_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:finkit/templates/mastcard/utils/strings.dart';
import 'package:finkit/templates/mastcard/widgets/buttons/primary_button.dart';
import '../../widgets/custom_appbar_with_bg.dart';
import '../../widgets/inputs/message_input_widget.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({Key? key}) : super(key: key);
  final controller = Get.put(SupportController());
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      title: Strings.support,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
    margin: EdgeInsets.only(top: Dimensions.marginSize * 1.5),
      padding: EdgeInsets.only(top: Dimensions.marginSize * 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 3.5),
          topRight: Radius.circular(Dimensions.radius * 3.5),
        ),
        color: Colors.white,
      ),
      child: _mainBodyWidget(context),
    );
  }

  _mainBodyWidget(BuildContext context) {
    return ListView(
      children: [
        _inputFieldWidget(context),
        _createTicketButton(context),
      ],
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize,
        vertical: Dimensions.marginSize * 2,
      ),
      child: Form(
        child: Column(
          children: [
            CustomInputWidget(
              controller: controller.nameController,
              hintText: Strings.enterFirstName,
              labelText: Strings.name,
            ),
            CustomInputWidget(
              controller: controller.emailController,
              hintText: Strings.enterEmail,
              labelText: Strings.email,
            ),
            MessageInputWidget(
              controller: controller.messageController,
              hintText: Strings.enterMessage,
              labelText: Strings.message,
            ),
          ],
        ),
      ),
    );
  }

  _createTicketButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize,
      ),
      child: PrimaryButton(
        title: Strings.createTicket,
        onPressed: () {
          controller.createTicket();
        },
      ),
    );
  }
}
