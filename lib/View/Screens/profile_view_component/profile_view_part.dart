import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_application_1/View/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_application_1/View/widgets/custom_betaPortfolio.dart';
import 'package:flutter_application_1/View/widgets/app_bar/appbar_subtitle.dart';
import 'package:flutter_application_1/View/Screens/home_view_component/home_view_bottom_part.dart';
import 'package:flutter_application_1/Model/listBloc.dart';
import 'package:flutter_application_1/Model/itemBloc.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/profile.dart';

class ProfileOneScreen extends StatelessWidget {
  ProfileOneScreen({Key? key, required this.bloc, required this.singlebloc})
      : super(key: key);

  TextEditingController returnvalueController = TextEditingController();

  TextEditingController namevalueController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final ListBloc bloc;
  final ItemBloc singlebloc;

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
                        _buildReturnvalueColumn(context, bloc),
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
                    profile?.userName ?? "null",
                    style: theme.textTheme.bodyLarge,
                  ),
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
                  "${profile?.portfolionum ?? "null"}",
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
                  profile?.preferedAssetclass ?? "null",
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
              allStockPlanText: profile?.bestPerformingPortfolio ?? "null",
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(right: 39.h),
            child: _buildRiskiestPortfolioRow(
              context,
              riskiestPortfolioText: "Riskiest  portfolio:",
              allStockPlanText: profile?.riskiestPortfolio ?? "null",
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
                          text: profile?.bestPortfolio ?? "null",
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
  Widget _buildReturnvalueColumn(BuildContext context, ListBloc bloc) {
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
              children: bloc.portfolios.isEmpty
                  ? [
                      // Display message when there are no portfolios
                      Container(
                          margin: EdgeInsets.only(right: 42.h),
                          alignment: Alignment.centerRight,
                          child: Text("There are currently no portfolios",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleLargeMontserrat)),

                      SizedBox(height: 22.v),
                    ]
                  : [
                      // Render portfolios if available
                      ...bloc.portfolios.map(
                        (portfolio) => Column(
                          children: [
                            customStockCard(portfolio, singlebloc),
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
