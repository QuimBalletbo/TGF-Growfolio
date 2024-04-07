import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

class PGinaDIniciAlumneFourDialog extends StatelessWidget {
  const PGinaDIniciAlumneFourDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 327.h,
        padding: EdgeInsets.symmetric(vertical: 1.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 25.v),
          Text("Proceed with Deletion?", style: CustomTextStyles.bodyLarge18),
          SizedBox(height: 19.v),
          Container(
              width: 253.h,
              margin: EdgeInsets.only(left: 38.h, right: 35.h),
              child: Text(
                  "Deleting a portfolio is irreversible. Do you want to proceed?",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumMontserratPrimary)),
          SizedBox(height: 15.v),
          SizedBox(
              height: 55.v,
              width: 327.h,
              child: Stack(alignment: Alignment.center, children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                        onTap: () {
                          onTapTxtNo(context);
                        },
                        child: Padding(
                            padding: EdgeInsets.only(right: 54.h, bottom: 10.v),
                            child: Text("No",
                                style: CustomTextStyles
                                    .headlineSmallMontserratLight)))),
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 55.v,
                        width: 327.h,
                        child:
                            Stack(alignment: Alignment.centerLeft, children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                  width: 327.h,
                                  child: Divider(
                                      color: theme.colorScheme.primary
                                          .withOpacity(1)))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 67.h),
                                  child: Row(children: [
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtYes(context);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12.v),
                                            child: Text("Yes",
                                                style: CustomTextStyles
                                                    .headlineSmallMontserratLight))),
                                    Padding(
                                        padding: EdgeInsets.only(left: 56.h),
                                        child: SizedBox(
                                            height: 55.v,
                                            child: VerticalDivider(
                                                width: 1.h,
                                                thickness: 1.v,
                                                color: theme.colorScheme.primary
                                                    .withOpacity(1))))
                                  ])))
                        ])))
              ]))
        ]));
  }

  /// Navigates to the pGinaDIniciAlumneOneContainerScreen when the action is triggered.
  onTapTxtNo(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }

  /// Navigates to the pGinaDIniciAlumneOneContainerScreen when the action is triggered.
  onTapTxtYes(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }
}
