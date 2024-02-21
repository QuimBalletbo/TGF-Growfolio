import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_switch.dart';

// ignore_for_file: must_be_immutable
class PasswordSecurityOneDialog extends StatelessWidget {
  PasswordSecurityOneDialog({Key? key}) : super(key: key);

  bool isSelectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 370.h,
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 31.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.v),
              Container(
                  width: 321.h,
                  margin: EdgeInsets.symmetric(horizontal: 6.h),
                  child: Text(
                      "Enable this option to facilitate automatic login upon entering the application, eliminating the need to manually input the account and password.",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumMontserratPrimary)),
              SizedBox(height: 16.v),
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(top: 8.v, bottom: 6.v),
                        child: Text("Enable Auto-Login",
                            style: CustomTextStyles.bodySmallRegular11)),
                    CustomSwitch(
                        margin: EdgeInsets.only(left: 31.h),
                        value: isSelectedSwitch,
                        onChange: (value) {
                          isSelectedSwitch = value;
                        })
                  ])),
              SizedBox(height: 66.v),
              CustomElevatedButton(
                  text: "Return",
                  margin: EdgeInsets.only(right: 6.h),
                  buttonStyle: CustomButtonStyles.fillDeepOrange,
                  onPressed: () {
                    onTapReturn(context);
                  })
            ]));
  }

  /// Navigates to the passwordSecurityScreen when the action is triggered.
  onTapReturn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.passwordSecurityScreen);
  }
}
