import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/etf_conf_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/ArrowBackIosColumn.dart';
import 'package:flutter_application_1/View/widgets/custom_image_button.dart';
import 'package:flutter_application_1/Controller/Views_Controller/etf_conf_controller.dart';

class ETFConfiguration extends StatefulWidget {
  ETFConfiguration({Key? key}) : super(key: key);
  CreateETFConfController viewController = CreateETFConfController();

  @override
  _StockConfigurationScreenState createState() =>
      _StockConfigurationScreenState();
}

class _StockConfigurationScreenState extends State<ETFConfiguration> {
  @override
  void initState() {
    super.initState();
    widget.viewController.initializaValues();
  }

  bool errorFieldEmpty = false;
  bool errorETFConfiguration = false;
  bool errorETFDistribution = false;

  bool includeETFs = false;
  String equalWeightETFs = "";
  double etfAllocation = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // AppBar
                const ArrowBackIosColumn(
                  text: "ETF configuration",
                ), // Placing the app bar here

                SizedBox(height: 22.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.40),
                  child: ETFConfigurationDialog(
                      viewController: widget.viewController),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: errorFieldEmpty,
                    child: Text(
                      "Invalid format. one or more fields are empty. Please fill in all fields and try again",
                      style: errorFieldEmpty
                          ? CustomTextStyles.bodyMediumPrimary
                              .copyWith(color: Colors.red)
                          : CustomTextStyles.bodyMediumPrimary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: errorETFConfiguration,
                    child: Text(
                      "ETF Configuration Error: Unable to Create ETF if ETFs Aren't Included in Your Portfolio.",
                      style: errorETFConfiguration
                          ? CustomTextStyles.bodyMediumPrimary
                              .copyWith(color: Colors.red)
                          : CustomTextStyles.bodyMediumPrimary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: errorETFDistribution,
                    child: Text(
                      "Error: ETF Distribution Issue Total allocation must be 100% ",
                      style: errorETFDistribution
                          ? CustomTextStyles.bodyMediumPrimary
                              .copyWith(color: Colors.red)
                          : CustomTextStyles.bodyMediumPrimary,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white, // Set the background color to white
                  child: Text(
                    "The errorFieldEmpty: $errorFieldEmpty , errorStockConfiguration: $errorETFConfiguration, includeStocks: $includeETFs, equalWeightStocks: $equalWeightETFs, ETFAllocation: $etfAllocation",
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0XFF1E1E1E),
                    ),
                  ),
                ),

                SizedBox(height: 22.v),
                CustomImageButton(
                  text: "Add a ETF",
                  imageConstant: ImageConstant.imgPlus,
                  onTap: () => onTapCreateETF(context),
                ),
                SizedBox(height: 22.v),
                CustomSpaceButton(
                  text: "Next step",
                  onTap: () {
                    onTapContinue(context);
                  },
                ),
                SizedBox(height: 16.v),
                CustomSpaceButton(
                  text: "Finish Portfolio Configuration",
                  onTap: () {
                    onReload(context);
                  },
                ),

                SizedBox(height: 16.v),
                CustomSpaceButton(
                  text: "Go Back",
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL19,
                  onTap: () {
                    onTapGoBack(context);
                  },
                ),

                SizedBox(height: 16.v),
                // Form Content
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapContinue(BuildContext context) {
    setState(() {
      errorFieldEmpty = widget.viewController.setStockConfPortfolio();
      errorETFDistribution = widget.viewController.checkStockDistribution();
    });
    if (!errorFieldEmpty && !errorETFDistribution) {
      Navigator.pushNamed(context, AppRoutes.createStockScreen);
    }
  }

  onReload(BuildContext context) {
    setState(() {
      includeETFs = widget.viewController.includeETFs;
      equalWeightETFs = widget.viewController.equalWeightETFs;
      etfAllocation = widget.viewController.etfAllocation;
    });
  }

  onTapCreateETF(BuildContext context) {
    setState(() {
      errorFieldEmpty = widget.viewController.setStockConfPortfolio();
      errorETFConfiguration = widget.viewController.checkStockConfiguration();
    });
    if (!errorFieldEmpty && !errorETFConfiguration) {
      Navigator.pushNamed(context, AppRoutes.createETFScreen);
    }
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
