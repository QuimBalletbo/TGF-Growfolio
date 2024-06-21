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
            textInputType: TextInputType.emailAddress,
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
              child: Text("Forgot Password ?",
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
                  .initializeUserAndRealm(context, email, password, () {
                setState(() {
                  error = widget.controller.validateLogIn();
                });
              });
            },
          ),
          SizedBox(height: 35.v),
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
