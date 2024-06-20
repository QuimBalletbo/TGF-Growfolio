import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/View/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/delete_account_dialog_controller.dart';
import 'package:realm/realm.dart';

// ignore_for_file: must_be_immutable
class DeleteMyAccountDialog extends StatefulWidget {
  final App app;
  final DeleteAccountController controller;

  DeleteMyAccountDialog({Key? key, required this.app})
      : controller = DeleteAccountController(app),
        super(key: key);
  @override
  _DeleteMyAccountDialogState createState() => _DeleteMyAccountDialogState();
}

class _DeleteMyAccountDialogState extends State<DeleteMyAccountDialog> {
  bool error = false;
  String password = '';
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30.0),
            decoration: AppDecoration.outlinePrimary8.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder30,
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 14.h),
                      child: Text(
                          "Are you sure you want to delete your account?",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeMontserrat)),
                  SizedBox(height: 26.v),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: "Enter password",
                    hintStyle: theme.textTheme.bodyMedium!,
                    textInputType: TextInputType.emailAddress,
                    obscureText: true,
                    onEditingComplete: () {
                      setState(() {
                        password = passwordController.text;
                      });
                    },
                  ),
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
                      onPressed: () async {
                        setState(() {
                          widget.controller
                              .onTapDeleteAccount(context, password);
                          error = widget.controller.getPasswordError();
                        });
                      }),
                  SizedBox(height: 5.v),
                  Padding(
                    padding: const EdgeInsets.all(
                        6.0), // Adjust the padding as needed
                    child: Align(
                      alignment: Alignment.center,
                      child: Visibility(
                        visible: error,
                        child: Text(
                          "The password is wrong.",
                          style: error
                              ? CustomTextStyles.bodyMediumPrimary
                                  .copyWith(color: Colors.red)
                              : CustomTextStyles.bodyMediumPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.v)
                ])));
  }

  onTapCancel(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }
}
