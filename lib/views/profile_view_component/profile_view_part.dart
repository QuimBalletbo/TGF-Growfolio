import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_application_1/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/custom_StockCard.dart';
import 'package:flutter_application_1/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_application_1/views/home_view_component/home_view_bottom_part.dart';

class ProfileOneScreen extends StatelessWidget {
  ProfileOneScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController returnvalueController = TextEditingController();

  TextEditingController namevalueController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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
                        _buildPerfilColumn(context),
                        SizedBox(height: 15.v),
                        _buildReturnvalueColumn(context),
                        SizedBox(height: 15.v),
                        _buildPortfolioReviewColumn(context),
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
  Widget _buildPerfilColumn(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.h),
      decoration: AppDecoration.fillGray100,
      child: Container(
        width: 384.h,
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
                CustomImageView(
                  imagePath: ImageConstant.imgImage19,
                  height: 47.v,
                  width: 45.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 21.h,
                    top: 14.v,
                    bottom: 12.v,
                  ),
                  child: Text(
                    "Asterix Obelix",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            SizedBox(height: 27.v),
            Text(
              "Number of portfolios:                     4",
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPortfolioReviewColumn(BuildContext context) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 145.h,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Preferred asset class:",
                        style: CustomTextStyles.titleLargeff000000,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 32.h,
                  top: 2.v,
                  bottom: 22.v,
                ),
                child: Text(
                  "ETF",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(right: 39.h),
            child: _buildRiskiestPortfolioRow(
              context,
              riskiestPortfolioText: "Best performing portfolio:",
              allStockPlanText: "All Stock Plan",
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(right: 39.h),
            child: _buildRiskiestPortfolioRow(
              context,
              riskiestPortfolioText: "Riskiest  portfolio:",
              allStockPlanText: "All Stock Plan",
            ),
          ),
          SizedBox(height: 19.v),
          Padding(
            padding: EdgeInsets.only(right: 49.h),
            child: Row(
              children: [
                SizedBox(
                  width: 113.h,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Overall best portfolio:",
                          style: CustomTextStyles.titleLargeff000000,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: 118.h,
                  margin: EdgeInsets.only(
                    left: 64.h,
                    top: 3.v,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "50 % Stock 50 % Bonds Plan",
                          style: CustomTextStyles.titleLargeff000000,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
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
          SizedBox(height: 12.v),
          customStockCard("Plan 1"),
          SizedBox(height: 30.v),
          customStockCard("All Stock Plan"),
          SizedBox(height: 32.v),
          customStockCard("50 % Stock 50 % Bonds Plan"),
          SizedBox(height: 33.v),
          customStockCard("Plan 2"),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRiskiestPortfolioRow(
    BuildContext context, {
    required String riskiestPortfolioText,
    required String allStockPlanText,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 84.h,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Riskiest  portfolio:",
                  style: CustomTextStyles.titleLargeff000000,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 93.h,
            top: 4.v,
            bottom: 23.v,
          ),
          child: Text(
            allStockPlanText,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.primary.withOpacity(1),
            ),
          ),
        ),
      ],
    );
  }

  onTapMegaphone(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => PGinaDIniciAlumneBottomsheet(),
        isScrollControlled: true);
  }
}
