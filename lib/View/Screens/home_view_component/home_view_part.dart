import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_application_1/View/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_application_1/View/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_application_1/View/widgets/custom_image_button.dart';
import 'package:flutter_application_1/View/Screens/home_view_component/home_view_bottom_part.dart';
import 'package:flutter_application_1/View/Screens/dialogs/max_portfolio_dialog.dart';
import 'package:flutter_application_1/Model/listBloc.dart';
import 'package:flutter_application_1/View/widgets/custom_betaPortfolio.dart';
import 'package:flutter_application_1/Model/itemBloc.dart';
import 'package:flutter_application_1/Controller/Views_Controller/home_view_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_PortfolioReturnCard.dart';

class PGinaDIniciAlumneOnePage extends StatelessWidget {
  PGinaDIniciAlumneOnePage({Key? key}) : super(key: key);
  HomeViewController controller = HomeViewController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray100,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 34),
                  child: Text(
                    "My current Portfolios",
                    style: CustomTextStyles.headlineSmallMontserratLight,
                  ),
                ),
                SizedBox(height: 23),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 21, vertical: 24),
                  decoration: AppDecoration.outlinePrimary.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: controller.allPortfolioReturn.isEmpty
                        ? [
                            // Display message when there are no portfolios
                            Container(
                                margin: EdgeInsets.only(right: 42.h),
                                alignment: Alignment.centerRight,
                                child: Text("There are currently no Portfolios",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        CustomTextStyles.titleLargeMontserrat)),
                            SizedBox(height: 22.v),
                            CustomImageButton(
                              text: "Delete Portfolio         ",
                              imageConstant: ImageConstant
                                  .imgInterfaceremovecircledeleteaddcirclesubtractbuttonbuttonsremove,
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL19,
                              onTap: () => onTapEditAPortfolio(context),
                            ),

                            SizedBox(height: 15.v),
                            CustomImageButton(
                              text: "Edit a  Portfolio         ",
                              imageConstant: ImageConstant
                                  .imgInterfaceeditwritecirclechangecircleeditmodifypencilwritewriting,
                              onTap: () => onTapEditAPortfolio(context),
                            ),
                            SizedBox(height: 15.v),
                            CustomImageButton(
                              text: "Create new Portfolio",
                              imageConstant: ImageConstant.imgPlus,
                              onTap: () => onTapCreateNewPortfolio(context),
                            ),

                            SizedBox(height: 22.v),
                          ]
                        : [
                            // Render portfolios if available BondPortfolio
                            ...controller.allPortfolioReturn.map(
                              (portfolios) => Column(
                                children: [
                                  customPortfolioReturnCard(
                                      portfolios, controller.singlePortfolio,
                                      () {
                                    // Update the UI
                                  }, context),
                                  const SizedBox(height: 31),
                                ],
                              ),
                            ),
                            CustomImageButton(
                              text: "Delete Portfolio         ",
                              imageConstant: ImageConstant
                                  .imgInterfaceremovecircledeleteaddcirclesubtractbuttonbuttonsremove,
                              buttonStyle:
                                  CustomButtonStyles.outlinePrimaryTL19,
                              onTap: () {
                                onTapEditAPortfolio(context);
                              },
                            ),
                            SizedBox(height: 15.v),
                            CustomImageButton(
                              text: "Edit a  Portfolio         ",
                              imageConstant: ImageConstant
                                  .imgInterfaceeditwritecirclechangecircleeditmodifypencilwritewriting,
                              onTap: () {
                                onTapEditAPortfolio(context);
                              },
                            ),

                            SizedBox(height: 15.v),
                            CustomImageButton(
                              text: "Create new Portfolio",
                              imageConstant: ImageConstant.imgPlus,
                              onTap: () {
                                onTapCreateNewPortfolio(context);
                              },
                            ),

                            SizedBox(height: 22.v),
                          ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
    bool isStackReset = !Navigator.canPop(context);
    if (isStackReset == true) {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: PGinaDIniciAlumneThreeDialog(),
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                insetPadding: EdgeInsets.only(left: 0),
              ));
    }
  }

  /// Navigates to the brokerFeesConfigurationOneScreen when the action is triggered.
  onTapCreateNewPortfolio(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.cretatePortfolioScreen);
  }
}
