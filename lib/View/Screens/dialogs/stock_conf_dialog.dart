import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';
import 'package:flutter_application_1/View/widgets/TaxationSection.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/stock_conf_dialog_controller.dart';
import 'package:flutter_application_1/Controller/Views_Controller/stock_conf_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_StockCard.dart';

class StockConfigurationDialog extends StatefulWidget {
  final CreateStockConfController viewController;
  StockConfigurationDialog({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  _CreateStockConfigurationDialogState createState() =>
      _CreateStockConfigurationDialogState();
}

class _CreateStockConfigurationDialogState
    extends State<StockConfigurationDialog> {
  late CreateStockConfConfiguration controller;

  @override
  void initState() {
    super.initState();
    controller = CreateStockConfConfiguration(
      viewController: widget.viewController,
    );
  }

  CreateStockConfigurationController dialogController =
      CreateStockConfigurationController();

  bool errorStockAllocation = false;
  @override
  Widget build(BuildContext context) {
    bool includeStocks = controller.initateIncludeStocks();
    String includeStockstoText =
        controller.getIncludeStocksString(includeStocks);
    String equalWeightStocks = controller.initiateEqualWeightStocks();
    double stockAllocation = controller.initiateStockAllocation();
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Stock Allocation",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          TaxationSection(
            text_1: "Exclude stocks from your portfolio",
            text_2: "Include stocks in your portfolio.",
            onSelectionChanged: (value) {
              setState(() {
                includeStocks = controller.getIncludeStocks(value);
              });
            },
            initialSelection: includeStockstoText,
          ),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Please provide the following information only if you selected to include individual stocks in your portfolio. ",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          const Divider(indent: 4.0, endIndent: 4.0),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Equally Weighted Stock Allocation",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          TaxationSection(
            text_1: "All stocks will be equally weighted.",
            text_2: "The stocks will not be equally weighted",
            onSelectionChanged: (value) {
              setState(() {
                equalWeightStocks = controller.getEquallyWeightedStocks(value);
              });
            },
            initialSelection: equalWeightStocks,
          ),
          EnterTextEuros(
            text: "Stock Allocation (%)  of total portfolio",
            defaultText: "%",
            controller: dialogController.stockAllocation,
            onTextChanged: (value) {
              setState(() {
                errorStockAllocation = controller.checkDoubleValidity(value);
                stockAllocation =
                    controller.getStockAllocation(value, errorStockAllocation);
              });
            },
            initialSelection: stockAllocation.toString(),
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorStockAllocation,
              child: Text(
                "Invalid format. Please enter a valid number between 1 and 100.",
                style: errorStockAllocation
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          const Divider(indent: 4.0, endIndent: 4.0),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Your Stock Selections",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 6.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: controller.stocksPortfolio.stocks.isEmpty
                ? [
                    // Display message when there are no portfolios
                    Container(
                        margin: EdgeInsets.only(right: 42.h),
                        alignment: Alignment.centerRight,
                        child: Text("There are currently no stocks",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.titleLargeMontserrat)),
                  ]
                : [
                    // Render portfolios if available stocksPortfolio
                    ...controller.stocksPortfolio.stocks.map(
                      (stocks) => Column(
                        children: [
                          customStockCard(stocks, controller.singleStock, () {
                            setState(() {}); // Update the UI
                          }),
                          const SizedBox(height: 31),
                        ],
                      ),
                    ),
                  ],
          ),
        ],
      ),
    ));
  }
}
