import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/views/components/log_out_dialog.dart';
import 'package:flutter_application_1/views/components/delete_my_account_dialog.dart';
import 'package:flutter_application_1/widgets/custom_card_button.dart';

// ignore_for_file: must_be_immutable
class PGinaDIniciAlumneBottomsheet extends StatelessWidget {
  PGinaDIniciAlumneBottomsheet({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 47.h, vertical: 19.v),
            child: Column(children: [
              SizedBox(width: 52.h, child: Divider(color: appTheme.gray600)),
              SizedBox(height: 48.v),
              CustomCardButton(
                text: "Settings",
                imagePath: ImageConstant.imgSearch,
                onTap: () {
                  onTapImgImage(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Log Out",
                imagePath: ImageConstant.imgUserPrimary,
                onTap: () {
                  onTapImgImage1(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Log In",
                imagePath: ImageConstant.logIn,
                onTap: () {
                  onTapImgImage(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Modify Name",
                imagePath: ImageConstant.modifyName,
                onTap: () {
                  onTapImgImage(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Password & Security",
                imagePath: ImageConstant.imgInterfaceLockPrimary,
                onTap: () {
                  onTapImgImage(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Create an Account",
                imagePath: ImageConstant.createanAccount,
                onTap: () {
                  onTapImgImage(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Delete My Account",
                imagePath: ImageConstant.imgSettings,
                onTap: () {
                  onTapImgImage2(context);
                },
              ),
              SizedBox(height: 17.v)
            ])));
  }

  /// Navigates to the configuraciOneScreen when the action is triggered.
  onTapImgImage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.configuraciOneScreen);
  }

  /// Displays a dialog with the [LogOutDialog] content.
  onTapImgImage1(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const AlertDialog(
              content: LogOutDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.only(left: 0),
            ));
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapImgImage2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.deleteAccountScreen);
  }

  /// Navigates to the passwordSecurityScreen when the action is triggered.
  onTapImgImage3(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.passwordSecurityScreen);
  }

  /// Navigates to the createAnAccountScreen when the action is triggered.
  onTapImgImage4(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.createAnAccountScreen);
  }

  /// Displays a dialog with the [DeleteMyAccountDialog] content.
  onTapImgImage5(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: DeleteMyAccountDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
