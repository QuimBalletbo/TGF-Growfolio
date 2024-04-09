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
  bool includeStocks = false;
  bool equallyWeightedStocks = false;
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
                Container(
                  color: Colors.white, // Set the background color to white
                  child: Text(
                    "The includeStocks: $includeStocks , equallyWeightedStocks: $equallyWeightedStocks, stockAllocation: $stockAllocation",
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
                  text: "Add a Stock",
                  imageConstant: ImageConstant.imgPlus,
                  onTap: () => onTapContinue(context),
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
                    onTapContinue(context);
                  },
                ),

                SizedBox(height: 16.v),
                CustomSpaceButton(
                  text: "Go Back",
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL19,
                  onTap: () {
                    onTapReload(context);
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

  onTapReload(BuildContext context) {
    setState(() {
      includeStocks = widget.viewController.includeStocks;
      equallyWeightedStocks = widget.viewController.equallyWeightedStocks;
      stockAllocation = widget.viewController.stockAllocation;
    });
  }

  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.createStockScreen);
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
