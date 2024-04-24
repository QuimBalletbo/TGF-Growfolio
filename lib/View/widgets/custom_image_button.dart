import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

import 'package:flutter_application_1/View/widgets/custom_elevated_button.dart';

class CustomImageButton extends StatelessWidget {
  final String text;
  final String imageConstant;
  final ButtonStyle? buttonStyle;
  final VoidCallback onTap;

  const CustomImageButton({
    Key? key,
    required this.text,
    required this.imageConstant,
    this.buttonStyle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        height: 45.v,
        text: text,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 58.h, right: 58.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            alignment: Alignment.centerLeft,
            child: CustomImageView(
              imagePath: imageConstant,
              height: 30.v,
              width: 32.h,
              color: Colors.black,
            )),
        buttonStyle: buttonStyle,
        buttonTextStyle: theme.textTheme.labelLarge!,
        onPressed: () {
          onTap();
        });
  }
}
