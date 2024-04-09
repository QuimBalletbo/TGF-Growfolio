import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/rateDate.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';
import 'package:flutter_application_1/View/widgets/TaxationSection.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/broker_fees_dialog_controller.dart';
import 'package:flutter_application_1/Controller/Views_Controller/broker_fees_controller.dart';

class BrokerFeesConfigurationDialog extends StatefulWidget {
  final CreateBrokerFeesController viewController;
  BrokerFeesConfigurationDialog({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  _CreateBrokerFeesConfigurationDialogState createState() =>
      _CreateBrokerFeesConfigurationDialogState();
}

class _CreateBrokerFeesConfigurationDialogState
    extends State<BrokerFeesConfigurationDialog> {
  late CreateBrokerFeesConfiguration controller;

  @override
  void initState() {
    super.initState();
    controller = CreateBrokerFeesConfiguration(
      viewController: widget.viewController,
    );
  }

  CreateBrokerFeesConfigurationController dialogController =
      CreateBrokerFeesConfigurationController();

  String selection = '';
  double stockPurchaseFee = 0;
  double stockPurchaseFlatFee = 0;
  double stockSaleFee = 0;
  double stockSaleFlatFee = 0;
  double accountMantainanceFee = 0;
  double accountMantainanceFlatFee = 0;

  bool errorStockPurchaseFlatFee = false;
  bool errorStockSaleFlatFee = false;
  bool errorAccountMantainanceFlatFee = false;

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
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Broker Fee Selection",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          TaxationSection(
            text_1: "Default",
            text_2: "Customized",
            onSelectionChanged: (value) {
              setState(() {
                selection = controller.getSelection(value);
              });
            },
          ),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Please provide the following information only if you selected a customized broker fee.",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
          ),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          RateDate(
            text: "Stock Purchase Fee (%)",
            defaultText: " %",
            onNumberChanged: (value) {
              setState(() {
                stockPurchaseFee = controller.getStockPurchaseFee(value);
              });
            },
          ),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          EnterTextEuros(
            text: "Stock Purchase flat fee",
            defaultText: "€",
            controller: dialogController.stockPurchaseflatfee,
            onTextChanged: (value) {
              setState(() {
                errorStockPurchaseFlatFee =
                    controller.checkDoubleValidity(value);
                stockPurchaseFlatFee = controller.getStockPurchaseFlatFee(
                    value, errorStockPurchaseFlatFee);
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorStockPurchaseFlatFee,
              child: Text(
                "Invalid format. Please enter a valid number between 0 and 10000.",
                style: errorStockPurchaseFlatFee
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          RateDate(
            text: "Stock Sale Fee (%)",
            defaultText: " %",
            onNumberChanged: (value) {
              setState(() {
                stockSaleFee = controller.getStockSaleFee(value);
              });
            },
          ),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          EnterTextEuros(
            text: "Stock Sale flat fee",
            defaultText: "€",
            controller: dialogController.stockSaleflatfee,
            onTextChanged: (value) {
              setState(() {
                errorStockSaleFlatFee = controller.checkDoubleValidity(value);
                stockSaleFlatFee = controller.getStockSaleFlatFee(
                    value, errorStockSaleFlatFee);
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorStockSaleFlatFee,
              child: Text(
                "Invalid format. Please enter a valid number between 0 and 10000.",
                style: errorStockSaleFlatFee
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          RateDate(
            text: "Account maintenance fee (% of Assets)",
            defaultText: " %",
            onNumberChanged: (value) {
              setState(() {
                accountMantainanceFee =
                    controller.getAccountMantainanceFee(value);
              });
            },
          ),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          EnterTextEuros(
            text: "Account maintenance fee (Flat Fee yearly)",
            defaultText: "€",
            controller: dialogController.accountMantainanceflatfee,
            onTextChanged: (value) {
              setState(() {
                errorAccountMantainanceFlatFee =
                    controller.checkDoubleValidity(value);
                accountMantainanceFlatFee =
                    controller.getAccountMantainanceFlatFee(
                        value, errorAccountMantainanceFlatFee);
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorAccountMantainanceFlatFee,
              child: Text(
                "Invalid format. Please enter a valid number between 0 and 10000.",
                style: errorAccountMantainanceFlatFee
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          Text(
            "The selection: $selection , stockPurchaseFee: $stockPurchaseFee, stockPurchaseFlatFee: $stockPurchaseFlatFee, stockSaleFee: $stockSaleFee , stockSaleFlatFee: $stockSaleFlatFee, accountMantainanceFee: $accountMantainanceFee, accountMantainanceFlatFee: $accountMantainanceFlatFee",
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: const Color(0XFF1E1E1E),
            ),
          ),
        ],
      ),
    ));
  }
}
