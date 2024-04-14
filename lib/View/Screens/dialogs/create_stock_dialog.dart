import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/enter_text_%.dart';
import 'package:flutter_application_1/View/widgets/custom_toggle_button.dart';
import 'package:flutter_application_1/View/widgets/name_title_text.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/create_stock_dialog_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';

class CreateStockDialog extends StatefulWidget {
  CreateStockDialog({Key? key}) : super(key: key);
  CreateStockController controller = CreateStockController();

  @override
  _CreateStockDialogState createState() => _CreateStockDialogState();
}

class _CreateStockDialogState extends State<CreateStockDialog> {
  StockController controller = StockController();
  String stockName = '';
  bool includeFWT = false;
  int stockAllocation = 0;

  bool errorStockAllocation = false;
  bool errorStockName = false;
  bool errorFieldEmpty = false;
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
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Keep in mind that stocks from the S&P 500 will always be present, but availability of stocks from other countries may fluctuate.",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Choose a Stock",
              style: theme.textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 6.0),
          Divider(
            color: appTheme.deepOrange200,
            indent: 4.0,
            endIndent: 4.0,
          ),
          const SizedBox(height: 6.0),
          NameTitleText(
            title: "Stock Name",
            name: "Stock 1",
            controller: controller.stockNameController,
            onPortfolioNameChanged: (value) {
              setState(() {
                errorStockName = widget.controller.validateStockName(value);
                stockName =
                    widget.controller.getStockNameValue(value, errorStockName);
              });
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorStockName,
              child: Text(
                "Invalid format. Please enter a valid stock name (3-20 characters, no special characters).",
                style: errorStockName
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          ToggleButton(
            text: "Include Foreign Withholding Tax",
            onToggleChanged: (value) {
              setState(() {
                includeFWT = widget.controller.getIncludeFWT(
                    value); // Update the portfolio name in the state
              });
            },
          ),
          const SizedBox(height: 6.0),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Please provide the following information only if you selected that the stocks will not be equally weighted.",
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
            text: "Stock Allocation (%)  of total Stocks",
            defaultText: "%",
            controller: controller.enterTextController,
            onTextChanged: (value) {
              setState(() {
                errorStockAllocation =
                    widget.controller.checkIntegerValidity(value);
                stockAllocation = widget.controller
                    .getStockAllocation(value, errorStockAllocation);
              });
            },
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
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: errorStockAllocation,
              child: Text(
                "Invalid format. one or more fields are empty. Please fill in all fields and try again",
                style: errorStockAllocation
                    ? CustomTextStyles.bodyMediumPrimary
                        .copyWith(color: Colors.red)
                    : CustomTextStyles.bodyMediumPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          CustomSpaceButton(
            text: "Save Stock",
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
      errorFieldEmpty =
          widget.controller.createStock(stockName, includeFWT, stockAllocation);
      Navigator.pushNamed(context, AppRoutes.stockConfigurationScreen);
    });
  }
}
