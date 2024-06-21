import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/log_out_dialog.dart';
import 'package:flutter_application_1/View/Screens/dialogs/delete_my_account_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_card_button.dart';

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
                text: "User guide",
                imagePath: ImageConstant.imgproperties,
                onTap: () {
                  onTapImgImage9(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "FAQs",
                imagePath: ImageConstant.imgFaqs,
                onTap: () {
                  onTapImgImage7(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Log Out",
                imagePath: ImageConstant.imgUserPrimary,
                onTap: () {
                  onTapImgImage5(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Log In",
                imagePath: ImageConstant.logIn,
                onTap: () {
                  onTapImgImage6(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Modify Name",
                imagePath: ImageConstant.modifyName,
                onTap: () {
                  onTapImgImage4(context);
                },
              ),
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Create an Account",
                imagePath: ImageConstant.createanAccount,
                onTap: () {
                  onTapImgImage3(context);
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
              SizedBox(height: 23.v),
              CustomCardButton(
                text: "Conditions of use",
                imagePath: ImageConstant.imgConditions,
                onTap: () {
                  onTapImgImage8(context);
                },
              ),
              SizedBox(height: 17.v)
            ])));
  }

  /// Displays a dialog with the [LogOutDialog] content.
  onTapImgImage1(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: LogOutDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapImgImage2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.deleteAccountScreen);
  }

  /// Navigates to the passwordSecurityScreen when the action is triggered.
  onTapImgImage3(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.createAccountScreen);
  }

  /// Navigates to the createAnAccountScreen when the action is triggered.
  onTapImgImage4(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.modifyNameScreen);
  }

  /// Displays a dialog with the [DeleteMyAccountDialog] content.
  onTapImgImage5(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.logOutScreen);
  }

  /// Displays a dialog with the [DeleteMyAccountDialog] content.
  onTapImgImage6(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.logInScreen);
  }

  onTapImgImage7(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.faqsView);
  }

  onTapImgImage8(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.conditionsUseScreen);
  }

  onTapImgImage9(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userGuideView);
  }
}
