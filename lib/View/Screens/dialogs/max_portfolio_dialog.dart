import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class PGinaDIniciAlumneThreeDialog extends StatelessWidget {
  final String title;
  final String text;

  const PGinaDIniciAlumneThreeDialog(
      {Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapPortfolioLimit(context);
      },
      child: Container(
        width: 327.h,
        padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 15.v),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder22,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 11.v),
            Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Text(
                title,
                style: CustomTextStyles.bodyLarge18,
              ),
            ),
            SizedBox(height: 19.v),
            Container(
              width: 241.h,
              margin: EdgeInsets.only(left: 3.h),
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumMontserratPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the pGinaDIniciAlumneOneContainerScreen when the action is triggered.
  void onTapPortfolioLimit(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }
}
