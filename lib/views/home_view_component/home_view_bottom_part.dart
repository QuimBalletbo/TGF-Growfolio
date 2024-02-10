import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/views/components/log_out_dialog.dart';
import 'package:flutter_application_1/views/components/delete_my_account_dialog.dart';

// ignore_for_file: must_be_immutable
class PGinaDIniciAlumneBottomsheet extends StatelessWidget {
  PGinaDIniciAlumneBottomsheet({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 47.h, vertical: 19.v),
            child: Column(children: [
              SizedBox(width: 52.h, child: Divider(color: appTheme.gray600)),
              SizedBox(height: 48.v),
              Container(
                  decoration: AppDecoration.outlinePrimary10,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: SizedBox(
                          height: 46.v,
                          width: 306.h,
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 18.h),
                                    child: Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgSearch,
                                          height: 28.v,
                                          width: 30.h,
                                          color: Colors.black,
                                          onTap: () {
                                            onTapImgImage(context);
                                          }),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 24.h,
                                              top: 2.v,
                                              bottom: 3.v),
                                          child: Text("Settings",
                                              style:
                                                  theme.textTheme.labelLarge))
                                    ])))
                          ])))),
              SizedBox(height: 23.v),
              Container(
                  decoration: AppDecoration.outlinePrimary10,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: SizedBox(
                          height: 46.v,
                          width: 306.h,
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 18.h),
                                    child: Row(children: [
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgUserPrimary,
                                          height: 28.v,
                                          width: 30.h,
                                          color: Colors.black,
                                          onTap: () {
                                            onTapImgImage1(context);
                                          }),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 24.h,
                                              top: 2.v,
                                              bottom: 3.v),
                                          child: Text("Log Out",
                                              style:
                                                  theme.textTheme.labelLarge))
                                    ])))
                          ])))),
              SizedBox(height: 23.v),
              Container(
                  decoration: AppDecoration.outlinePrimary10,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: SizedBox(
                          height: 46.v,
                          width: 306.h,
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 18.h),
                                    child: Row(children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.logIn,
                                        height: 28.v,
                                        width: 30.h,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 24.h,
                                              top: 2.v,
                                              bottom: 3.v),
                                          child: Text("Log In",
                                              style:
                                                  theme.textTheme.labelLarge))
                                    ])))
                          ])))),
              SizedBox(height: 23.v),
              Container(
                  // Log In  imgContrastPrimary
                  decoration: AppDecoration.outlinePrimary10,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: SizedBox(
                          height: 46.v,
                          width: 306.h,
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 18.h),
                                    child: Row(children: [
                                      CustomImageView(
                                        imagePath: ImageConstant
                                            .imgInterfaceuserprofilefocusclosegeometrichumanpersonprofilefocususer,
                                        height: 28.v,
                                        width: 30.h,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 24.h,
                                              top: 2.v,
                                              bottom: 3.v),
                                          child: Text("Modify Name",
                                              style:
                                                  theme.textTheme.labelLarge))
                                    ])))
                          ])))),
              SizedBox(height: 23.v),
              Container(
                  decoration: AppDecoration.outlinePrimary10,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: SizedBox(
                          height: 46.v,
                          width: 306.h,
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 18.h),
                                    child: Row(children: [
                                      CustomImageView(
                                        imagePath: ImageConstant
                                            .imgInterfaceLockPrimary,
                                        height: 28.v,
                                        width: 30.h,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 24.h,
                                              top: 2.v,
                                              bottom: 3.v),
                                          child: Text("Password & Security",
                                              style:
                                                  theme.textTheme.labelLarge))
                                    ])))
                          ])))),
              SizedBox(height: 23.v),
              Container(
                  decoration: AppDecoration.outlinePrimary10,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: SizedBox(
                          height: 46.v,
                          width: 306.h,
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 18.h),
                                    child: Row(children: [
                                      CustomImageView(
                                        imagePath:
                                            ImageConstant.createanAccount,
                                        height: 28.v,
                                        width: 30.h,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 24.h,
                                              top: 2.v,
                                              bottom: 3.v),
                                          child: Text("Create an Account",
                                              style:
                                                  theme.textTheme.labelLarge))
                                    ])))
                          ])))),
              SizedBox(height: 23.v),
              Container(
                  decoration: AppDecoration.outlinePrimary10,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: SizedBox(
                          height: 46.v,
                          width: 306.h,
                          child:
                              Stack(alignment: Alignment.centerLeft, children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 18.h),
                                    child: Row(children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.imgSettings,
                                        height: 28.v,
                                        width: 30.h,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 24.h,
                                              top: 2.v,
                                              bottom: 3.v),
                                          child: Text("Delete My Account",
                                              style:
                                                  theme.textTheme.labelLarge))
                                    ])))
                          ])))),
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
    Navigator.pushNamed(context, AppRoutes.logInScreen);
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
