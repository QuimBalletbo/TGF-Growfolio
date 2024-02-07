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
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Container(
                      height: 46.v,
                      width: 312.h,
                      decoration: AppDecoration.outlinePrimary2.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: Stack(alignment: Alignment.centerLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle14,
                            height: 46.v,
                            width: 312.h,
                            radius: BorderRadius.circular(10.h),
                            alignment: Alignment.center,
                            onTap: () {
                              onTapImgImage(context);
                            }),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 15.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgSearch,
                                      height: 26.adaptSize,
                                      width: 26.adaptSize),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 22.h, top: 5.v, bottom: 5.v),
                                      child: Text("Settings",
                                          style: theme.textTheme.labelLarge))
                                ])))
                      ]))),
              SizedBox(height: 12.v),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Container(
                      height: 46.v,
                      width: 312.h,
                      decoration: AppDecoration.outlinePrimary2.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: Stack(alignment: Alignment.topLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle14,
                            height: 46.v,
                            width: 312.h,
                            radius: BorderRadius.circular(10.h),
                            alignment: Alignment.center,
                            onTap: () {
                              onTapImgImage1(context);
                            }),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 20.h, top: 12.v),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgUserPrimary,
                                      height: 20.v,
                                      width: 21.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 22.h, top: 4.v),
                                      child: Text("Log Out",
                                          style: theme.textTheme.labelLarge))
                                ])))
                      ]))),
              SizedBox(height: 10.v),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Container(
                      height: 46.v,
                      width: 312.h,
                      decoration: AppDecoration.outlinePrimary2.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: Stack(alignment: Alignment.centerLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle14,
                            height: 46.v,
                            width: 312.h,
                            radius: BorderRadius.circular(10.h),
                            alignment: Alignment.center,
                            onTap: () {
                              onTapImgImage2(context);
                            }),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 24.h),
                                child: Row(children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgContrast,
                                            height: 7.adaptSize,
                                            width: 7.adaptSize,
                                            margin: EdgeInsets.only(left: 3.h)),
                                        SizedBox(height: 2.v),
                                        SizedBox(
                                            height: 8.v,
                                            width: 20.h,
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomRight,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgContrastPrimary,
                                                      height: 7.v,
                                                      width: 12.h,
                                                      alignment:
                                                          Alignment.topLeft),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgCheckmark,
                                                      height: 7.v,
                                                      width: 10.h,
                                                      alignment:
                                                          Alignment.bottomRight)
                                                ]))
                                      ]),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 19.h, top: 2.v),
                                      child: Text("Log In",
                                          style: theme.textTheme.labelLarge))
                                ])))
                      ]))),
              SizedBox(height: 9.v),
              Padding(
                  padding: EdgeInsets.only(right: 6.h),
                  child: CustomTextFormField(
                      controller: nameController,
                      hintText: "Modify Name",
                      hintStyle: theme.textTheme.labelLarge!,
                      textInputAction: TextInputAction.done,
                      prefix: Container(
                          margin: EdgeInsets.fromLTRB(17.h, 13.v, 24.h, 12.v),
                          child: CustomImageView(
                              imagePath: ImageConstant
                                  .imgInterfaceuserprofilefocusclosegeometrichumanpersonprofilefocususer,
                              height: 21.v,
                              width: 22.h)),
                      prefixConstraints: BoxConstraints(maxHeight: 46.v),
                      contentPadding:
                          EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
                      borderDecoration:
                          TextFormFieldStyleHelper.outlinePrimaryTL102,
                      filled: true,
                      fillColor: appTheme.whiteA700)),
              SizedBox(height: 23.v),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Container(
                      height: 46.v,
                      width: 312.h,
                      decoration: AppDecoration.outlinePrimary2.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: Stack(alignment: Alignment.topLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle14,
                            height: 46.v,
                            width: 312.h,
                            radius: BorderRadius.circular(10.h),
                            alignment: Alignment.center,
                            onTap: () {
                              onTapImgImage3(context);
                            }),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 16.h, top: 8.v),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgInterfaceLockPrimary,
                                      height: 23.v,
                                      width: 24.h),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 23.h, top: 7.v),
                                      child: Text("Password & Security",
                                          style: theme.textTheme.labelLarge))
                                ])))
                      ]))),
              SizedBox(height: 13.v),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Container(
                      height: 46.v,
                      width: 312.h,
                      decoration: AppDecoration.outlinePrimary2.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: Stack(alignment: Alignment.topLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle14,
                            height: 46.v,
                            width: 312.h,
                            radius: BorderRadius.circular(10.h),
                            alignment: Alignment.center,
                            onTap: () {
                              onTapImgImage4(context);
                            }),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 19.h, top: 11.v),
                                child: Row(children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgSearchPrimary,
                                            height: 7.adaptSize,
                                            width: 7.adaptSize,
                                            margin: EdgeInsets.only(left: 3.h)),
                                        SizedBox(height: 2.v),
                                        Row(children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgContrastPrimary7x9,
                                              height: 7.v,
                                              width: 9.h,
                                              margin:
                                                  EdgeInsets.only(bottom: 1.v)),
                                          SizedBox(
                                              height: 8.v,
                                              width: 9.h,
                                              child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgVectorPrimary8x1,
                                                        height: 8.v,
                                                        width: 1.h,
                                                        alignment: Alignment
                                                            .centerRight,
                                                        margin: EdgeInsets.only(
                                                            right: 3.h)),
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgVectorPrimary8x1,
                                                        height: 1.v,
                                                        width: 9.h,
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        margin: EdgeInsets.only(
                                                            bottom: 2.v))
                                                  ]))
                                        ])
                                      ]),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 25.h, top: 3.v),
                                      child: Text("Create an Account",
                                          style: theme.textTheme.labelLarge))
                                ])))
                      ]))),
              SizedBox(height: 17.v),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Container(
                      height: 46.v,
                      width: 312.h,
                      decoration: AppDecoration.outlinePrimary2.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: Stack(alignment: Alignment.centerLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle14,
                            height: 46.v,
                            width: 312.h,
                            radius: BorderRadius.circular(10.h),
                            alignment: Alignment.center,
                            onTap: () {
                              onTapImgImage5(context);
                            }),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 18.h),
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgSettings,
                                      height: 21.adaptSize,
                                      width: 21.adaptSize),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.h, top: 2.v, bottom: 3.v),
                                      child: Text("Delete My Account",
                                          style: theme.textTheme.labelLarge))
                                ])))
                      ]))),
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
