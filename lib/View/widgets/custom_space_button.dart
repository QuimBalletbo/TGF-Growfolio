import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_elevated_button.dart';

class CustomSpaceButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final ButtonStyle? buttonStyle;

  const CustomSpaceButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        height: 45.v,
        text: text,
        margin: EdgeInsets.only(left: 58.h, right: 58.h),
        alignment: Alignment.bottomLeft,
        buttonStyle: buttonStyle,
        buttonTextStyle: theme.textTheme.labelLarge!,
        onPressed: () {
          onTap();
        });
  }
}
