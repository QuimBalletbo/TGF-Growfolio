import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_application_1/View/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_application_1/View/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_application_1/View/Screens/home_view_component/home_view_bottom_part.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/profile.dart';
import 'package:flutter_application_1/Controller/Views_Controller/home_view_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_PortfolioReturnCard.dart';

class ProfileOneScreen extends StatefulWidget {
  ProfileOneScreen({Key? key}) : super(key: key);

  @override
  _ProfileOneScreenState createState() => _ProfileOneScreenState();
}

class _ProfileOneScreenState extends State<ProfileOneScreen> {
  HomeViewController controller = HomeViewController();

  @override
  void initState() {
    super.initState();
    controller.initializeNumPortfolio();
    controller.initializePreferedAsset();
    controller.initializeBestPortfolio();
    controller.initializeRiskiestPortfolio();
    controller.initializeBestPerformingPortfolio();
  }

  @override
  Widget build(BuildContext context) {
    Profile? profile = AuthService().getProfile();
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
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the start (top) of the column
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPerfilColumn(context, profile),
                        SizedBox(height: 15.v),
                        _buildReturnvalueColumn(context),
                        SizedBox(height: 15.v),
                        _buildPortfolioReviewColumn(context, profile),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
      title:
          AppbarSubtitle(text: "Profile", margin: EdgeInsets.only(left: 33.h)),
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

  /// Section Widget
  Widget _buildPerfilColumn(BuildContext context, Profile? profile) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.h),
      decoration: AppDecoration.fillGray100,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 27.h,
          vertical: 14.v,
        ),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment
              .start, // Align children to the start (top) of the column
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  profile?.userName ?? "null",
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(height: 27.v),
            Row(
              children: [
                Text(
                  "Number of portfolios:",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(width: 10.v), // Adjust as needed for spacing
                Text(
                  "${controller.numPortfolio ?? "null"}",
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPortfolioReviewColumn(BuildContext context, Profile? profile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 34.h,
        vertical: 21.v,
      ),
      decoration: AppDecoration.outlinePrimary
          .copyWith(borderRadius: BorderRadiusStyle.customBorderTL18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Portfolio review",
            style: CustomTextStyles.headlineSmallLight,
          ),
          SizedBox(height: 40.v),
          portfolioReviewRow(
            context,
            riskiestPortfolioText: "Preferred asset class:",
            allStockPlanText: controller.preferedAsset,
          ),
          SizedBox(height: 15.v),
          portfolioReviewRow(
            context,
            riskiestPortfolioText: "Best performing portfolio:",
            allStockPlanText: controller.bestPerformingPortfolio,
          ),
          SizedBox(height: 15.v),
          portfolioReviewRow(
            context,
            riskiestPortfolioText: "Riskiest  portfolio:",
            allStockPlanText: controller.riskiestPortfolio,
          ),
          SizedBox(height: 19.v),
          portfolioReviewRow(
            context,
            riskiestPortfolioText: "Overall best portfolio:",
            allStockPlanText: controller.bestPortfolio,
          ),
          SizedBox(height: 23.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildReturnvalueColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment
            .start, // Align children to the start (top) of the column
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 26.h,
              right: 37.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 3.v),
                  child: Text(
                    "Portfolios ",
                    style: CustomTextStyles.headlineSmallLight,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 23),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 24),
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
                              style: CustomTextStyles.titleLargeMontserrat)),
                      SizedBox(height: 22.v),
                    ]
                  : [
                      // Render portfolios if available BondPortfolio
                      ...controller.allPortfolioReturn.map(
                        (portfolios) => Column(
                          children: [
                            customPortfolioReturnCard(
                                portfolios, controller.singlePortfolio, () {
                              // Update the UI
                              setState(() {});
                            }, context),
                            const SizedBox(height: 31),
                          ],
                        ),
                      ),
                      SizedBox(height: 22.v),
                    ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget portfolioReviewRow(
    BuildContext context, {
    required String riskiestPortfolioText,
    required String allStockPlanText,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 14.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                  right:
                      8.0), // Add padding between bond name and bond allocation
              child: Text(
                riskiestPortfolioText, // Display bond name on the left side
                maxLines: 4, // Allow multiline text
                overflow: TextOverflow.ellipsis, // Handle overflow
                style: CustomTextStyles.titleLargeff000000,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              Text(
                allStockPlanText,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.primary.withOpacity(1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  onTapMegaphone(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => PGinaDIniciAlumneBottomsheet(),
        isScrollControlled: true);
  }
}
