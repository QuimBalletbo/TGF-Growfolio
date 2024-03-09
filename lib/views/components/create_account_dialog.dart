import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_form_field.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/core/utils/auth_service.dart';
import 'package:flutter_application_1/core/data/profile.dart';

class CreateAccountDialog extends StatefulWidget {
  CreateAccountDialog({Key? key, required this.app}) : super(key: key);
  final App app;
  @override
  _CreateAccountDialogState createState() => _CreateAccountDialogState();
}

class _CreateAccountDialogState extends State<CreateAccountDialog> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool value = false;
  String email = '';
  String name = '';
  String password = '';
  String confirmPassword = '';
  bool errorCheckBox = false;
  bool emailError = false;
  bool nameError = false;
  bool passwordError = false;
  bool secondPasswordError = false;
  bool errorCratinggAccount = false;

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
            onEditingComplete: () {
              setState(() {
                email = emailController.text;
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: emailError,
              child: Text(
                "The email format is incorrect or too long.",
                style: emailError
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          SizedBox(height: 20.v),
          CustomTextFormField(
            controller: nameController,
            hintText: "Enter name",
            hintStyle: theme.textTheme.bodyMedium!,
            onEditingComplete: () {
              setState(() {
                name = nameController.text;
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: nameError,
              child: Text(
                "The name is too lengthy or contains unavailable characters.",
                style: nameError
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          SizedBox(height: 20.v),
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
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: passwordError,
              child: Text(
                "The password format is incorrect or exceeds the maximum length.",
                style: passwordError
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          SizedBox(height: 20.v),
          CustomTextFormField(
            controller: confirmpasswordController,
            hintText: "confirm password",
            hintStyle: theme.textTheme.bodyMedium!,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            onEditingComplete: () {
              setState(() {
                confirmPassword = confirmpasswordController.text;
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: secondPasswordError,
              child: Text(
                "The password and the confirmation password do not match",
                style: secondPasswordError
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          SizedBox(height: 19.v),
          GestureDetector(
            onTap: () {
              // Call the lollypop function here
              onTapConditions(context);
            },
            child: Container(
              width: 304.h,
              margin: EdgeInsets.only(left: 8.h, right: 15.h),
              child: Text(
                "Click here to view the Conditions of Use and Privacy Policy",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyMediumMontserratBlue800.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: appTheme.blue800,
                ),
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
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorCheckBox,
              child: Text(
                "To create an Account you must agree to the terms of service.",
                style: errorCheckBox
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          SizedBox(height: 25.v),
          CustomElevatedButton(
            text: "Create Account",
            buttonStyle: CustomButtonStyles.fillDeepOrange,
            onPressed: () {
              createAccount(context);
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorCratinggAccount,
              child: Text(
                "An error occurred while creating the account.",
                style: errorCratinggAccount
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          SizedBox(height: 5.v),
        ],
      ),
    );
  }

  onTapConditions(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.conditionsUseScreen);
  }

  Future<void> createAccount(BuildContext context) async {
    late User user;
    errorCheckBox = false;
    emailError = false;
    nameError = false;
    passwordError = false;
    secondPasswordError = false;
    errorCratinggAccount = false;
    late Realm realm;
    if (email.isEmpty || !email.contains('@') || email.length > 50) {
      setState(() {
        emailError = true;
      });
      print("emailError: $emailError");
      return;
    }
    if (name.isEmpty || name.length > 20) {
      setState(() {
        nameError = true;
      });
      print("nameError: $nameError");
      return;
    }
    if (password.isEmpty || password.length > 20) {
      setState(() {
        passwordError = true;
      });
      print("passwordError: $passwordError");
      return;
    }
    if (password != confirmPassword || confirmPassword.length > 20) {
      setState(() {
        secondPasswordError = true;
      });
      print("secondPasswordError: $secondPasswordError");
      return;
    }
    if (value == false) {
      setState(() {
        errorCheckBox = true;
      });
      print("errorCheckBox: $errorCheckBox");
      return;
    }

    try {
      EmailPasswordAuthProvider authProvider =
          EmailPasswordAuthProvider(widget.app);
      await authProvider.registerUser(email, password);

      // Registration successful, proceed with login and initialization
      user = await widget.app.logIn(Credentials.emailPassword(email, password));
      AuthService().initializefirstTime(user, name);

      print(
          "Successful logging in: User id: ${user.id} User id: ${user.profile}");
      Navigator.pushNamed(
          context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
    } catch (e) {
      // Registration failed
      setState(() {
        errorCratinggAccount = true;
      });
      print("Error $errorCheckBox Error logging in: $e");
    }
  }
}
