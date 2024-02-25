import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_form_field.dart';

class PasswordSecurityDialog extends StatelessWidget {
  PasswordSecurityDialog({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController twostepsverificationController =
      TextEditingController();
  TextEditingController remembermeoptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 29.v),
      decoration: AppDecoration.outlinePrimary
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.h),
            child:
                Text(" Password", style: CustomTextStyles.titleLargeMontserrat),
          ),
          SizedBox(height: 21.v),
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: CustomElevatedButton(
                text: "Change password",
                buttonStyle: CustomButtonStyles.fillDeepOrange,
                onPressed: () {
                  onTapPassword(context);
                }),
          ),
          SizedBox(height: 13.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: CustomElevatedButton(
                text: "See password",
                buttonStyle: CustomButtonStyles.fillDeepOrange,
                onPressed: () {
                  onTapPassword(context);
                }),
          ),
          SizedBox(height: 33.v),
          Padding(
            padding: EdgeInsets.only(left: 5.h),
            child:
                Text("Security", style: CustomTextStyles.titleLargeMontserrat),
          ),
          SizedBox(height: 16.v),
          Container(
            margin: EdgeInsets.only(left: 2.h),
            decoration: AppDecoration.outlinePrimary2
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomElevatedButton(
                    text: "Two-Steps verification",
                    buttonStyle: CustomButtonStyles.fillDeepOrange,
                    onPressed: () {
                      onTapPassword(context);
                    }),
                SizedBox(height: 23.v),
                CustomElevatedButton(
                    text: "Remember Me option when logging in",
                    buttonStyle: CustomButtonStyles.fillDeepOrange,
                    onPressed: () {
                      onTapPassword(context);
                    }),
              ],
            ),
          ),
          SizedBox(height: 25.v),
          CustomElevatedButton(
              text: "Return",
              buttonStyle: CustomButtonStyles.fillGray,
              onPressed: () {
                onTapCancel(context);
              }),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }

  onTapPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }

  onTapCancel(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }
}
