import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: CustomTextStyles.headlineLargeLight.copyWith(
            color: theme.colorScheme.primary.withOpacity(1),
          ),
        ),
      ),
    );
  }
}
