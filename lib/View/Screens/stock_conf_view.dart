import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/stock_conf_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/ArrowBackIosColumn.dart';
import 'package:flutter_application_1/View/widgets/custom_image_button.dart';
import 'package:flutter_application_1/Controller/Views_Controller/stock_conf_controller.dart';

class StockConfiguration extends StatefulWidget {
  StockConfiguration({Key? key}) : super(key: key);
  CreateStockConfController viewController = CreateStockConfController();

  @override
  _StockConfigurationScreenState createState() =>
      _StockConfigurationScreenState();
}

class _StockConfigurationScreenState extends State<StockConfiguration> {
  @override
  void initState() {
    super.initState();
    widget.viewController.initializaValues();
  }

  bool errorFieldEmpty = false;
  bool errorStockConfiguration = false;
  bool errorStockDistribution = false;

  bool includeStocks = false;
  String equalWeightStocks = "";
  double stockAllocation = 0;
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
                  text: "Stock configuration",
                ), // Placing the app bar here

                SizedBox(height: 22.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.40),
                  child: StockConfigurationDialog(
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
                    visible: errorStockConfiguration,
                    child: Text(
                      "Stock Configuration Error: Unable to Create Stock if Stocks Aren't Included in Your Portfolio.",
                      style: errorStockConfiguration
                          ? CustomTextStyles.bodyMediumPrimary
                              .copyWith(color: Colors.red)
                          : CustomTextStyles.bodyMediumPrimary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: errorStockDistribution,
                    child: Text(
                      "Error: Stock Distribution Issue Total allocation must be 100% ",
                      style: errorStockDistribution
                          ? CustomTextStyles.bodyMediumPrimary
                              .copyWith(color: Colors.red)
                          : CustomTextStyles.bodyMediumPrimary,
                    ),
                  ),
                ),

                SizedBox(height: 22.v),
                CustomImageButton(
                  text: "Add a Stock",
                  imageConstant: ImageConstant.imgPlus,
                  onTap: () => onTapCreateStock(context),
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
                    onTapFinish(context);
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
      errorStockDistribution = widget.viewController.checkStockDistribution();
    });
    if (!errorFieldEmpty && !errorStockDistribution) {
      Navigator.pushNamed(context, AppRoutes.etfConfigurationScreen);
    }
  }

  onTapFinish(BuildContext context) {
    setState(() {
      errorFieldEmpty = widget.viewController.setStockConfPortfolio();
      errorStockDistribution = widget.viewController.checkStockDistribution();
    });
    if (!errorFieldEmpty && !errorStockDistribution) {
      Navigator.pushNamed(context, AppRoutes.finishConfScreen);
    }
  }

  onTapCreateStock(BuildContext context) {
    setState(() {
      errorFieldEmpty = widget.viewController.setStockConfPortfolio();
      errorStockConfiguration = widget.viewController.checkStockConfiguration();
    });
    if (!errorFieldEmpty && !errorStockConfiguration) {
      Navigator.pushNamed(context, AppRoutes.createStockScreen);
    }
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
