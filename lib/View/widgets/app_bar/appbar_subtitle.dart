import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({
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
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.homeScreen,
          (route) => false,
        );
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: CustomTextStyles.headlineSmallMontserratLight.copyWith(
            color: theme.colorScheme.primary.withOpacity(1),
          ),
        ),
      ),
    );
  }
}
