import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/views/home_view_component/home_view_bottom_part.dart';

// ignore_for_file: must_be_immutable
class DeleteMyAccountDialog extends StatelessWidget {
  DeleteMyAccountDialog({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 370.h,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 43.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 315.h,
                  margin: EdgeInsets.only(right: 14.h),
                  child: Text("Are you sure you want to delete your account?",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeMontserrat)),
              SizedBox(height: 26.v),
              CustomTextFormField(
                  controller: passwordController,
                  hintText: "Enter password",
                  hintStyle: theme.textTheme.bodyMedium!,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true),
              SizedBox(height: 22.v),
              CustomElevatedButton(
                  text: "Cancel",
                  buttonStyle: CustomButtonStyles.fillGray,
                  onPressed: () {
                    onTapCancel(context);
                  }),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                  text: "Delete My Account",
                  buttonStyle: CustomButtonStyles.fillDeepOrange,
                  onPressed: () {
                    onTapDeleteMyAccount(context);
                  }),
              SizedBox(height: 20.v)
            ]));
  }

  /// Shows a modal bottom sheet with [PGinaDIniciAlumneBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height. pGinaDIniciAlumneOneContainerScreen
  onTapCancel(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }

  /// Navigates to the iniciarSessiRegistrarSeScreen when the action is triggered.
  onTapDeleteMyAccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.iniciarSessiRegistrarSeScreen);
  }
}
