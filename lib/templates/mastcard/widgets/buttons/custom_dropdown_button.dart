// ignore_for_file: unrelated_type_equality_checks

import 'package:finkit/templates/mastcard/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';

class CustomDropDown extends StatelessWidget {
  final RxString selectMethod;
  final List<String> itemsList;

  const CustomDropDown({
    required this.itemsList,
    Key? key,
    required this.selectMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: Dimensions.inputBoxHeight * 0.83,
      decoration: BoxDecoration(
          border: Border.all(
            color: CustomColor.primaryColor.withOpacity(0.4),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius)),
      child: DropdownButton(
        hint: Padding(
          padding:  EdgeInsets.only(left: Dimensions.marginSize*0.5),
          child: Text(
            selectMethod.value,
            style: CustomStyle.hintTextStyle,
          ),
        ),
        icon: Padding(
          padding:  EdgeInsets.only(right: Dimensions.marginSize*0.5),
          child:  Icon(
            Icons.arrow_drop_down,
            color: CustomColor.primaryTextColor.withOpacity(0.4),
          ),
        ),
        isExpanded: true,
   
        underline: Container(),
        borderRadius: BorderRadius.circular(Dimensions.radius),
        items: itemsList.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value.toString(),
            child: Text(
              value.toString(),
              style: CustomStyle.commonSubTextTitle,
            ),
          );
        }).toList(),
        onChanged: (String? value) {
          selectMethod.value = value!;
        },
      ),
    ));
  }
}
