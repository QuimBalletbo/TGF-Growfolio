import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/View/widgets/custom_text_form_field.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/create_account_controller.dart';

class CreateAccountDialog extends StatefulWidget {
  final App app;
  final CreateAccountController controller;

  CreateAccountDialog({Key? key, required this.app})
      : controller = CreateAccountController(app),
        super(key: key);

  @override
  _CreateAccountDialogState createState() => _CreateAccountDialogState();
}

class _CreateAccountDialogState extends State<CreateAccountDialog> {
  AccountController controller = AccountController();

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
  bool errorCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 25.v),
        decoration: AppDecoration.outlinePrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: controller.emailController,
              hintText: "Enter email ",
              hintStyle: theme.textTheme.bodyMedium!,
              textInputType: TextInputType.emailAddress,
              onEditingComplete: () {
                setState(() {
                  email = controller.emailController.text;
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
              controller: controller.nameController,
              hintText: "Enter name",
              hintStyle: theme.textTheme.bodyMedium!,
              onEditingComplete: () {
                setState(() {
                  name = controller.nameController.text;
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
              controller: controller.passwordController,
              hintText: "Enter password",
              hintStyle: theme.textTheme.bodyMedium!,
              textInputType: TextInputType.visiblePassword,
              onEditingComplete: () {
                setState(() {
                  password = controller.passwordController.text;
                });
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible: passwordError,
                child: Text(
                  "The password is either too long, too short, or in an incorrect format.",
                  style: passwordError
                      ? CustomTextStyles.bodyMediumPrimary
                          .copyWith(color: Colors.red)
                      : CustomTextStyles.bodyMediumPrimary,
                ),
              ),
            ),
            SizedBox(height: 20.v),
            CustomTextFormField(
              controller: controller.confirmpasswordController,
              hintText: "confirm password",
              hintStyle: theme.textTheme.bodyMedium!,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              onEditingComplete: () {
                setState(() {
                  confirmPassword = controller.confirmpasswordController.text;
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
                emailError = widget.controller.validateEmail(email);
                nameError = widget.controller.validateName(name);
                passwordError = widget.controller.validatePassword(password);
                secondPasswordError = widget.controller
                    .validateConfirmPassword(password, confirmPassword);
                errorCheckBox = widget.controller.validateCheckbox(value);

                widget.controller.createAccount(context, email, password, name);
                errorCreatingAccount =
                    widget.controller.validateCreatingAccount();
                setState(() {});

                //  createAccount(context);
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible: errorCreatingAccount,
                child: Text(
                  "An error occurred while creating the account.",
                  style: errorCreatingAccount
                      ? CustomTextStyles.bodyMediumPrimary
                          .copyWith(color: Colors.red)
                      : CustomTextStyles.bodyMediumPrimary,
                ),
              ),
            ),
            SizedBox(height: 5.v),
          ],
        ),
      ),
    );
  }

  onTapConditions(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.conditionsUseScreen);
  }
}
