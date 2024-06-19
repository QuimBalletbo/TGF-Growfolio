import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_portfolioSectionCard.dart';
import 'package:flutter_application_1/View/widgets/customColorBar.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/finish_conf_dialog_controller.dart';
import 'package:flutter_application_1/Controller/Views_Controller/finish_conf_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';

class FinishConfDialog extends StatefulWidget {
  FinishConfViewController viewController = FinishConfViewController();
  FinishConfDialog({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  _CreateFinishConfDialogState createState() => _CreateFinishConfDialogState();
}

class _CreateFinishConfDialogState extends State<FinishConfDialog> {
  late FinishBondDialogController controller;

  @override
  void initState() {
    super.initState();
    controller = FinishBondDialogController(
      viewController: widget.viewController,
    );

    includeStocks = widget.viewController.getIncludeStocks();
    includeETF = widget.viewController.getIncludeETF();
    includeBonds = widget.viewController.getIncludeBonds();
  }

  bool includeStocks = false;
  bool includeETF = false;
  bool includeBonds = false;
  @override
  Widget build(BuildContext context) {
    bool errorAllocation = controller.checkStockAllocation();
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30.0),
      decoration: AppDecoration.outlinePrimary8.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  style: CustomTextStyles.headlineSmallMontserratLight,
          Container(
            margin: EdgeInsets.only(left: 8.h, right: 8.h),
            child: Text(
              "*Verify that the total for stocks amounts to 100%, as well as for ETFs and bonds. Bear in mind that these guidelines are applicable only if your portfolio includes all the categories. If your portfolio does not include a particular category, there is no requirement to address the percentage allocation for that category.",
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            "Portfolio distribution",
            style: CustomTextStyles.headlineSmallMontserratLight,
          ),
          const SizedBox(height: 6.0),
          Divider(
            color: appTheme.deepOrange200,
            indent: 4.0,
            endIndent: 4.0,
          ),

          const SizedBox(height: 6.0),
          Visibility(
            visible: includeStocks,
            child: customPortfolioSection(
                'Stock distribution', controller.returnStockDistribution(), () {
              Navigator.pushNamed(context, AppRoutes.stockConfigurationScreen);
            }),
          ),
          Visibility(
            visible: !includeStocks,
            child: CustomSpaceButton(
              text: "Change Stock Selection",
              buttonStyle: CustomButtonStyles.outlinePrimaryTL19,
              onTap: () {
                Navigator.pushNamed(
                    context, AppRoutes.stockConfigurationScreen);
              },
            ),
          ),
          const SizedBox(height: 18.0),
          Visibility(
            visible: includeETF,
            child: customPortfolioSection(
                'ETF distribution', controller.returnETFDistribution(), () {
              Navigator.pushNamed(context, AppRoutes.etfConfigurationScreen);
            }),
          ),
          Visibility(
            visible: !includeETF,
            child: CustomSpaceButton(
              text: "Change ETF Selection",
              buttonStyle: CustomButtonStyles.outlinePrimaryTL19,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.etfConfigurationScreen);
              },
            ),
          ),
          const SizedBox(height: 18.0),
          Visibility(
            visible: includeBonds,
            child: customPortfolioSection(
                'Bond distribution', controller.returnBondDistribution(), () {
              Navigator.pushNamed(context, AppRoutes.bondConfigurationScreen);
            }),
          ),
          Visibility(
            visible: !includeBonds,
            child: CustomSpaceButton(
              text: "Change Bond Selection",
              buttonStyle: CustomButtonStyles.outlinePrimaryTL19,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.bondConfigurationScreen);
              },
            ),
          ),
          const SizedBox(height: 18.0),
          Text(
            "*Review your portfolio to ensure that the combined percentages of stocks, ETFs, and bonds equal 100%. ",
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: const Color(0XFF1E1E1E),
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            "Overall Portfolio Investment Allocation",
            style: CustomTextStyles.headlineSmallMontserratLight,
          ),
          const SizedBox(height: 6.0),
          Divider(
            color: appTheme.deepOrange200,
            indent: 4.0,
            endIndent: 4.0,
          ),
          const SizedBox(height: 18.0),
          CustomColorBar(
            value1: controller
                .returnAllocation('Stock'), // Percentage for left section
            value2: controller
                .returnAllocation('ETF'), // Percentage for center section
            value3: controller
                .returnAllocation('Bond'), // Percentage for right section
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorAllocation,
              child: Text(
                "The total weight of stocks, ETFs, and bonds either falls short of or exceeds 100%. Please adjust the weights to ensure they total 100%.",
                style: errorAllocation
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  onTapContinue(BuildContext context) {
    setState(() {
      //  errorFieldEmpty = widget.controller.createBond(bondName, includeFWT,
      //       bondAllocation, faceValue, couponRate, maturityDate);
      // if (errorFieldEmpty == false) {
      Navigator.pushNamed(context, AppRoutes.bondConfigurationScreen);
      //    }
    });
  }
}
