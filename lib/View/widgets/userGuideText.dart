import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class UserGuideText extends StatelessWidget {
  final String title;

  const UserGuideText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 24),
      decoration: AppDecoration.outlinePrimary3.copyWith(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              style: CustomTextStyles.headlineSmallInterWhiteA700,
            ),
          ),
        ],
      ),
    );
  }

  onTapHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }
}
