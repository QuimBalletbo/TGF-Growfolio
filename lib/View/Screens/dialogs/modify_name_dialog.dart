import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/View/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/View/Screens/home_view_component/home_view_bottom_part.dart';

// ignore_for_file: must_be_immutable
class ModifyNameDialog extends StatelessWidget {
  ModifyNameDialog({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 25.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 14.h),
                  child: Text("Name",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeMontserrat)),
              SizedBox(height: 26.v),
              CustomTextFormField(
                  controller: passwordController,
                  hintText: "enter name",
                  hintStyle: theme.textTheme.bodyMedium!,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true),
              SizedBox(height: 22.v),
              Container(
                  margin: EdgeInsets.only(right: 14.h),
                  child: Text("Password",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleLargeMontserrat)),
              SizedBox(height: 26.v),
              CustomTextFormField(
                  controller: passwordController,
                  hintText: "enter password",
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
                  text: "Modify Name",
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
    Navigator.pushNamed(context, AppRoutes.profileContainerScreen);
  }
}
