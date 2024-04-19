import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';
import 'package:flutter_application_1/View/widgets/TaxationSection.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/etf_conf_dialog_controller.dart';
import 'package:flutter_application_1/Controller/Views_Controller/etf_conf_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_ETFCard.dart';

class ETFConfigurationDialog extends StatefulWidget {
  final CreateETFConfController viewController;
  ETFConfigurationDialog({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  _CreateStockConfigurationDialogState createState() =>
      _CreateStockConfigurationDialogState();
}

class _CreateStockConfigurationDialogState
    extends State<ETFConfigurationDialog> {
  late CreateETFConfConfiguration controller;

  @override
  void initState() {
    super.initState();
    controller = CreateETFConfConfiguration(
      viewController: widget.viewController,
    );
  }

  CreateStockConfigurationController dialogController =
      CreateStockConfigurationController();

  bool errorETFAllocation = false;
  @override
  Widget build(BuildContext context) {
    bool includeETFs = controller.initateIncludeETFs();
    String includeETFstoText = controller.getIncludeETFsString(includeETFs);
    String equalWeightETFs = controller.initiateEqualWeightETFs();
    double etfAllocation = controller.initiateETFAllocation();
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
              "ETF Allocation",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          TaxationSection(
            text_1: "Exclude ETFs from your portfolio",
            text_2: "Include ETFs in your portfolio.",
            onSelectionChanged: (value) {
              setState(() {
                includeETFs = controller.getIncludeETFs(value);
              });
            },
            initialSelection: includeETFstoText,
          ),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Please provide the following information only if you selected to include ETFs in your portfolio. ",
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
              "Equally Weighted ETF Allocation",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          TaxationSection(
            text_1: "All ETFs will be equally weighted.",
            text_2: "The ETFs will not be equally weighted",
            onSelectionChanged: (value) {
              setState(() {
                equalWeightETFs = controller.getEquallyWeightedETFs(value);
              });
            },
            initialSelection: equalWeightETFs,
          ),
          EnterTextEuros(
            text: "ETF Allocation (%)  of total portfolio",
            defaultText: "%",
            controller: dialogController.etfAllocation,
            onTextChanged: (value) {
              setState(() {
                errorETFAllocation = controller.checkDoubleValidity(value);
                etfAllocation =
                    controller.getETFAllocation(value, errorETFAllocation);
              });
            },
            initialSelection: etfAllocation.toString(),
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorETFAllocation,
              child: Text(
                "Invalid format. Please enter a valid number between 1 and 100.",
                style: errorETFAllocation
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
              "Your ETF Selections",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 6.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: controller.etfPortfolio.etfs.isEmpty
                ? [
                    // Display message when there are no portfolios
                    Container(
                        margin: EdgeInsets.only(right: 42.h),
                        alignment: Alignment.centerRight,
                        child: Text("There are currently no ETFs",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.titleLargeMontserrat)),
                  ]
                : [
                    // Render portfolios if available ETFPortfolio
                    ...controller.etfPortfolio.etfs.map(
                      (etfs) => Column(
                        children: [
                          customETFCard(etfs, controller.singleETF),
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
