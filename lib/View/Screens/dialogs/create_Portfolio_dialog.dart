import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_toggle_button.dart';
import 'package:flutter_application_1/View/widgets/name_title_text.dart';
import 'package:flutter_application_1/View/widgets/rateDate.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';
import 'package:flutter_application_1/View/widgets/taxation_Section_extended.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/create_portfolio_dialog_controller.dart';
import 'package:flutter_application_1/Controller/Views_Controller/create_portfolio_controller.dart';

class CreatePortfolioConfigurationDialog extends StatefulWidget {
  final CreatePortfolioViewController viewController;
  CreatePortfolioConfigurationDialog({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  _CreatePortfolioConfigurationDialogState createState() =>
      _CreatePortfolioConfigurationDialogState();
}

class _CreatePortfolioConfigurationDialogState
    extends State<CreatePortfolioConfigurationDialog> {
  late CreatePortfolioConfiguration controller;

  @override
  void initState() {
    super.initState();
    controller = CreatePortfolioConfiguration(
      viewController: widget.viewController,
    );
  }

  PortfolioConfigurationController dialogController =
      PortfolioConfigurationController();
  String portfolioName = '';
  double monetaryAmount = 0;
  int duration = 0;
  String frequencyInvesting = '';

  bool taxation = false;
  bool brokerFees = false;
  bool rebalancing = false;

  bool errorPortfolioName = false;
  bool errorMonetaryAmount = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 30.0),
        decoration: AppDecoration.outlinePrimary8.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NameTitleText(
              title: "Portfolio’s Name",
              name: "Plan ",
              controller: dialogController.portfolioNameController,
              onPortfolioNameChanged: (value) {
                setState(() {
                  errorPortfolioName = controller.validatePortfolioName(value);
                  portfolioName = controller.getPortfolioNameValue(
                      value, errorPortfolioName);
                });
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible: errorPortfolioName,
                child: Text(
                  "Invalid format. Please enter a valid Portfolio name (3-20 characters, no special characters).",
                  style: errorPortfolioName
                      ? CustomTextStyles.bodyMediumPrimary
                          .copyWith(color: Colors.red)
                      : CustomTextStyles.bodyMediumPrimary,
                ),
              ),
            ),
            SizedBox(height: 13.0),
            Divider(
              color: appTheme.deepOrange200,
              indent: 4.0,
              endIndent: 4.0,
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 2.0, right: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RateDate(
                    text: "Duration of Portfolio",
                    defaultText: " years",
                    onNumberChanged: (value) {
                      setState(() {
                        duration = controller.getIntegerValue(value, false);
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.0),
            Divider(indent: 4.0, endIndent: 4.0),
            SizedBox(height: 6.0),
            EnterTextEuros(
              text: "Monetary Objective",
              defaultText: "€",
              controller: dialogController.monetaryAmountController,
              onTextChanged: (value) {
                setState(() {
                  errorMonetaryAmount = controller.checkDoubleValidity(value);
                  monetaryAmount =
                      controller.getDoubleValue(value, errorMonetaryAmount);
                });
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible: errorMonetaryAmount,
                child: Text(
                  "Invalid format. Please enter a valid number between 1000 and 1000000000.",
                  style: errorMonetaryAmount
                      ? CustomTextStyles.bodyMediumPrimary
                          .copyWith(color: Colors.red)
                      : CustomTextStyles.bodyMediumPrimary,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Divider(indent: 4.0, endIndent: 4.0),
            SizedBox(height: 7.0),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Frequency of Investment",
                style: theme.textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 1.0),
            TaxationSectionExtended(
              text_1: "One-time",
              text_2: "Monthly",
              text_3: "Quarterly",
              text_4: "Annual",
              onSelectionChanged: (value) {
                setState(() {
                  frequencyInvesting = controller.getFrequencyInvesting(value);
                });
              },
            ),
            SizedBox(height: 10.0),
            Divider(indent: 8.0),
            SizedBox(height: 12.0),
            ToggleButton(
              text: "Taxation",
              onToggleChanged: (value) {
                setState(() {
                  taxation = controller.getTaxation(value);
                });
              },
            ),
            SizedBox(height: 11.0),
            ToggleButton(
              text: "Broker Fees",
              onToggleChanged: (value) {
                setState(() {
                  brokerFees = controller.getBrokerFees(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
