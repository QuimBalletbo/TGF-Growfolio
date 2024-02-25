import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/views/home_view_component/home_view_bottom_part.dart';

class CreateAccountDialog extends StatefulWidget {
  @override
  _CreateAccountDialogState createState() => _CreateAccountDialogState();
}

class _CreateAccountDialogState extends State<CreateAccountDialog> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 25.v),
      decoration: AppDecoration.outlinePrimary
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            controller: emailController,
            hintText: "Enter email ",
            hintStyle: theme.textTheme.bodyMedium!,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20.v),
          CustomTextFormField(
            controller: nameController,
            hintText: "Enter name",
            hintStyle: theme.textTheme.bodyMedium!,
          ),
          SizedBox(height: 20.v),
          CustomTextFormField(
            controller: passwordController,
            hintText: "Enter password",
            hintStyle: theme.textTheme.bodyMedium!,
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          SizedBox(height: 20.v),
          CustomTextFormField(
            controller: confirmpasswordController,
            hintText: "confirm password",
            hintStyle: theme.textTheme.bodyMedium!,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          SizedBox(height: 19.v),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "Click here to view the Conditions of Use and Privacy Policy",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumMontserratBlue800.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 13.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8.h, right: 89.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 169.h,
                      child: Text(
                        "I have read and agree to the Terms of Service and Privacy Policy.",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyMediumMontserratPrimary,
                      ),
                    ),
                  ),
                  Checkbox(
                    value: value,
                    onChanged: (bool? newValue) {
                      setState(() {
                        value = newValue ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.v),
          CustomElevatedButton(
            text: "Cancel",
            buttonStyle: CustomButtonStyles.fillGray,
            onPressed: () {
              onTapCancel(context);
            },
          ),
          SizedBox(height: 25.v),
          CustomElevatedButton(
            text: "Create Account",
            buttonStyle: CustomButtonStyles.fillDeepOrange,
            onPressed: () {
              onTapLogin(context);
            },
          ),
          SizedBox(height: 5.v),
        ],
      ),
    );
  }

  onTapCancel(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }

  onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileContainerScreen);
  }
}
