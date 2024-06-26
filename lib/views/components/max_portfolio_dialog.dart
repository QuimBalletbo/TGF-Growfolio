import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';

class PGinaDIniciAlumneThreeDialog extends StatelessWidget {
  const PGinaDIniciAlumneThreeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapPortfolioLimit(context);
        },
        child: Container(
            width: 327.h,
            padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 15.v),
            decoration: AppDecoration.fillWhiteA
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 11.v),
                  Padding(
                      padding: EdgeInsets.only(left: 12.h),
                      child: Text("Portfolio Limit Reached",
                          style: CustomTextStyles.bodyLarge18)),
                  SizedBox(height: 19.v),
                  Container(
                      width: 241.h,
                      margin: EdgeInsets.only(left: 3.h),
                      child: Text(
                          "Maximum portfolios reached. Clear space by deleting an existing one.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMediumMontserratPrimary))
                ])));
  }

  /// Navigates to the pGinaDIniciAlumneOneContainerScreen when the action is triggered.
  onTapPortfolioLimit(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }
}
