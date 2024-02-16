import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_application_1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_application_1/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/views/home_view_component/home_view_bottom_part.dart';
import 'package:flutter_application_1/views/components/homeScreen_dialog.dart';
import 'package:flutter_application_1/widgets/custom_StockCard.dart';

// ignore_for_file: must_be_immutable
class PGinaDIniciAlumneOnePage extends StatelessWidget {
  PGinaDIniciAlumneOnePage({Key? key}) : super(key: key);

  TextEditingController perfilController = TextEditingController();

  TextEditingController allStockPlanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray100,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 0.v),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16.v),
                      Padding(
                          padding: EdgeInsets.only(left: 34.h),
                          child: Text("My current Portfolios",
                              style: CustomTextStyles
                                  .headlineSmallMontserratLight)),
                      SizedBox(height: 23.v),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 21.h, vertical: 24.v),
                          decoration: AppDecoration.outlinePrimary.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL18),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                customStockCard("Plan 1"),
                                SizedBox(height: 31.v),
                                customStockCard("All Stock Plan"),
                                SizedBox(height: 33.v),
                                customStockCard("50 % Stock 50 % Bonds Plan"),
                                SizedBox(height: 34.v),
                                customStockCard("Plan 2"),
                                SizedBox(height: 25.v),
                                _buildDeletePortfolio(context),
                                SizedBox(height: 13.v),
                                _buildEditAPortfolio(context),
                                SizedBox(height: 15.v),
                                _buildCreateNewPortfolio(context),
                                SizedBox(height: 22.v)
                              ]))
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 106.v,
      leadingWidth: double.maxFinite,
      title: AppbarSubtitle(text: "Home", margin: EdgeInsets.only(left: 33.h)),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgMegaphone,
          margin: EdgeInsets.fromLTRB(34.h, 14.v, 34.h, 26.v),
          onTap: () {
            onTapMegaphone(context); // Pass the context directly
          },
        ),
      ],
    );
  }

  // Delete Portfolio

  Widget _buildDeletePortfolio(BuildContext context) {
    return CustomElevatedButton(
        height: 45.v,
        text: "Delete Portfolio          ",
        margin: EdgeInsets.only(left: 35.h, right: 58.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
              imagePath: ImageConstant
                  .imgInterfaceremovecircledeleteaddcirclesubtractbuttonbuttonsremove,
              height: 30.v,
              width: 32.h,
              color: Colors.black,
            )),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL19,
        buttonTextStyle: theme.textTheme.labelLarge!,
        onPressed: () {
          onTapEditAPortfolio(context);
        });
  }

  /// Section Widget ImageConstant.imgPlus
  Widget _buildEditAPortfolio(BuildContext context) {
    return CustomElevatedButton(
        height: 45.v,
        text: "Edit a  Portfolio          ",
        margin: EdgeInsets.only(left: 35.h, right: 58.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
              imagePath: ImageConstant
                  .imgInterfaceeditwritecirclechangecircleeditmodifypencilwritewriting,
              height: 30.v,
              width: 32.h,
              color: Colors.black,
            )),
        buttonTextStyle: theme.textTheme.labelLarge!,
        onPressed: () {
          onTapEditAPortfolio(context);
        });
  }

  /// Section Widget Create new Portfolio
  Widget _buildCreateNewPortfolio(BuildContext context) {
    return CustomElevatedButton(
        height: 45.v,
        text: "Create new Portfolio",
        margin: EdgeInsets.only(left: 35.h, right: 58.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgPlus,
              height: 30.v,
              width: 32.h,
              color: Colors.black,
            )),
        buttonTextStyle: theme.textTheme.labelLarge!,
        onPressed: () {
          onTapEditAPortfolio(context);
        });
  }

  /// Shows a modal bottom sheet with [PGinaDIniciAlumneBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapMegaphone(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => PGinaDIniciAlumneBottomsheet(),
        isScrollControlled: true);
  }

  /// Navigates to the pGinaDIniciAlumneTwoScreen when the action is triggered.
  onTapDeletePortfolio(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneTwoScreen);
  }

  /// Displays a dialog with the [PGinaDIniciAlumneThreeDialog] content.
  onTapEditAPortfolio(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const AlertDialog(
              content: PGinaDIniciAlumneThreeDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.only(left: 0),
            ));
  }

  /// Navigates to the brokerFeesConfigurationOneScreen when the action is triggered.
  onTapCreateNewPortfolio(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.brokerFeesConfigurationOneScreen);
  }
}
