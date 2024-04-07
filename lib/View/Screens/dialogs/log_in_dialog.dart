import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/View/widgets/custom_text_form_field.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Controller/Views_Controller/log_in_controller.dart';

class LogInDialog extends StatefulWidget {
  final App app;
  final LoginController controller;

  LogInDialog({Key? key, required this.app})
      : controller = LoginController(app),
        super(key: key);

  @override
  _LogInDialogState createState() => _LogInDialogState();
}

class _LogInDialogState extends State<LogInDialog> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';
  bool error = false;
  late User user;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 13.v),
        decoration: AppDecoration.outlinePrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 12.v), //"Enter email "
          CustomTextFormField(
            controller: emailController,
            hintText: "Enter email ",
            hintStyle: theme.textTheme.bodyMedium!,
            textInputType: TextInputType.emailAddress,
            onEditingComplete: () {
              setState(() {
                email = emailController.text;
              });
            },
          ),
          SizedBox(height: 11.v),
          CustomTextFormField(
            controller: passwordController,
            hintText: "Enter password",
            hintStyle: theme.textTheme.bodyMedium!,
            textInputType: TextInputType.visiblePassword,
            onEditingComplete: () {
              setState(() {
                password = passwordController.text;
              });
            },
          ),
          SizedBox(height: 5.v),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: error,
              child: Text(
                "The user or the password is wrong.",
                style: error
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Align(
              alignment: Alignment.centerRight,
              child: Text("Forget Password ?",
                  style: CustomTextStyles.bodyMediumPrimary)),
          SizedBox(height: 23.v),
          CustomElevatedButton(
            text: "Login",
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB888), // FFB888 color
              foregroundColor: Colors.black, // Text color
              // Add other properties as needed
            ),
            onPressed: () async {
              error = await widget.controller
                  .initializeUserAndRealm(context, email, password);
            },
          ),
          SizedBox(height: 35.v),
          Padding(
              padding: EdgeInsets.only(left: 19.h, right: 11.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 9.v, bottom: 6.v),
                        child: SizedBox(
                            width: 105.h,
                            child: Divider(color: appTheme.gray500))),
                    Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text("Or sign up with",
                            style: CustomTextStyles
                                .bodySmallOutfitSecondaryContainer)),
                    Padding(
                        padding: EdgeInsets.only(top: 9.v, bottom: 6.v),
                        child: SizedBox(
                            width: 109.h,
                            child:
                                Divider(color: appTheme.gray500, indent: 4.h)))
                  ])),
          SizedBox(height: 33.v),
          Container(
              height: 48.v,
              width: 75.h,
              padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 9.v),
              decoration: AppDecoration.outlineGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Image.asset(
                ImageConstant.imgGoogleLogo,
                height: 27.adaptSize,
                width: 27.adaptSize,
                alignment: Alignment.center,
              ))
        ]));
  }

  /// Navigates to the pGinaDIniciAlumneOneContainerScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }
}
