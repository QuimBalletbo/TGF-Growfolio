import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/enter_text_%.dart';
import 'package:flutter_application_1/View/widgets/custom_toggle_button.dart';
import 'package:flutter_application_1/View/widgets/name_title_text.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/create_etf_dialog_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';

class CreateETFdialog extends StatefulWidget {
  CreateETFdialog({Key? key}) : super(key: key);
  CreateETFController controller = CreateETFController();

  @override
  _CreateStockDialogState createState() => _CreateStockDialogState();
}

class _CreateStockDialogState extends State<CreateETFdialog> {
  StockController controller = StockController();
  String etfName = '';
  bool includeFWT = false;
  int etfAllocation = 0;
  double expenseRatio = 0;
  double avgReturn = 0;
  double avgDividendYield = 0;

  bool errorStockAllocation = false;
  bool errorStockName = false;
  bool errorFieldEmpty = false;
  bool errorExpenseRatio = false;
  bool errorAvgReturn = false;
  bool errorAvgDividendYield = false;

  @override
  Widget build(BuildContext context) {
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
          NameTitleText(
            title: "ETF Name",
            name: "ETF ",
            controller: controller.etfNameController,
            onPortfolioNameChanged: (value) {
              setState(() {
                errorStockName = widget.controller.validateStockName(value);
                etfName =
                    widget.controller.getStockNameValue(value, errorStockName);
              });
            },
          ),
          const SizedBox(height: 6.0),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorStockName,
              child: Text(
                "Invalid format. Please enter a valid ETF name (3-20 characters, no special characters).",
                style: errorStockName
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          Divider(
            color: appTheme.deepOrange200,
            indent: 4.0,
            endIndent: 4.0,
          ),
          const SizedBox(height: 6.0),
          EnterTextEuros(
            text: "Expense Ratio (% of AUM )",
            defaultText: "%",
            controller: controller.expenseRatio,
            onTextChanged: (value) {
              setState(() {
                errorExpenseRatio =
                    widget.controller.checkDoubleValidity(value);
                expenseRatio =
                    widget.controller.getDoubleValue(value, errorExpenseRatio);
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorExpenseRatio,
              child: Text(
                "Invalid format. Please enter a valid number between 1 and 100.",
                style: errorExpenseRatio
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          const Divider(indent: 4.0, endIndent: 4.0),
          const SizedBox(height: 6.0),
          EnterTextEuros(
            text: "5-Year Average Price Return (%)",
            defaultText: "%",
            controller: controller.avgReturn,
            onTextChanged: (value) {
              setState(() {
                errorAvgReturn = widget.controller.checkDoubleValidity(value);
                avgReturn =
                    widget.controller.getDoubleValue(value, errorAvgReturn);
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorAvgReturn,
              child: Text(
                "Invalid format. Please enter a valid number between 1 and 100.",
                style: errorAvgReturn
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          const Divider(indent: 4.0, endIndent: 4.0),
          const SizedBox(height: 6.0),
          EnterTextEuros(
            text: "5-Year Average Dividend yield (%)",
            defaultText: "%",
            controller: controller.avgDividendYield,
            onTextChanged: (value) {
              setState(() {
                errorAvgDividendYield =
                    widget.controller.checkDoubleValidity(value);
                avgDividendYield = widget.controller
                    .getDoubleValue(value, errorAvgDividendYield);
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorAvgDividendYield,
              child: Text(
                "Invalid format. Please enter a valid number between 1 and 100.",
                style: errorAvgDividendYield
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          const Divider(indent: 4.0, endIndent: 4.0),
          const SizedBox(height: 6.0),
          ToggleButton(
            text: "Include Foreign Withholding Tax",
            onToggleChanged: (value) {
              setState(() {
                includeFWT = widget.controller.getIncludeFWT(value);
              });
            },
          ),
          const SizedBox(height: 6.0),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Please provide the following information only if you selected that the ETFs will not be equally weighted.",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          EnterTextPercentage(
            text: "ETF Allocation (%)  of total ETFs",
            defaultText: "%",
            controller: controller.enterTextController,
            onTextChanged: (value) {
              setState(() {
                errorStockAllocation =
                    widget.controller.checkIntegerValidity(value);
                etfAllocation = widget.controller
                    .getStockAllocation(value, errorStockAllocation);
              });
            },
          ),
          Align(
            alignment: Alignment.topLeft,
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
          Align(
            alignment: Alignment.topLeft,
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
          const SizedBox(height: 6.0),
          CustomSpaceButton(
            text: "Save ETF",
            onTap: () {
              onTapContinue(context);
            },
          ),
        ],
      ),
    ));
  }

  onTapContinue(BuildContext context) {
    setState(() {
      errorFieldEmpty = widget.controller.createETF(etfName, includeFWT,
          etfAllocation, expenseRatio, avgReturn, avgDividendYield);
      if (errorFieldEmpty == false) {
        Navigator.pushNamed(context, AppRoutes.etfConfigurationScreen);
      }
    });
  }
}
