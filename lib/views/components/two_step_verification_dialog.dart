import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_switch.dart';

// ignore_for_file: must_be_immutable
class PasswordSecurityThreeDialog extends StatelessWidget {
  PasswordSecurityThreeDialog({Key? key}) : super(key: key);

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
              SizedBox(height: 19.v),
              Container(
                  width: 302.h,
                  margin: EdgeInsets.only(left: 6.h, right: 25.h),
                  child: Text(
                      "Enable this feature to initiate two-step verification and utilize Face ID for enhanced security.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumMontserratPrimary)),
              SizedBox(height: 24.v),
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 6.v, bottom: 8.v),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Enable ",
                                      style:
                                          CustomTextStyles.bodySmallff000000),
                                  TextSpan(
                                      text: "Face ID",
                                      style: CustomTextStyles.bodySmallff000000)
                                ]),
                                textAlign: TextAlign.left)),
                        CustomSwitch(
                            margin: EdgeInsets.only(left: 39.h),
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
