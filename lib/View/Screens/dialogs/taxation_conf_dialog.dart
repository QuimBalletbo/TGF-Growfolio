import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_drop_down.dart';
import 'package:flutter_application_1/View/widgets/custom_radio_button.dart';
import 'package:flutter_application_1/View/widgets/custom_switch.dart';
import 'package:flutter_application_1/View/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/View/widgets/rateTax.dart';
import 'package:flutter_application_1/View/widgets/rateDate.dart';

class TaxationConfigurationDialog extends StatefulWidget {
  TaxationConfigurationDialog({Key? key}) : super(key: key);

  @override
  _CreatePortfolioConfigurationDialogState createState() =>
      _CreatePortfolioConfigurationDialogState();
}

class _CreatePortfolioConfigurationDialogState
    extends State<TaxationConfigurationDialog> {
  TextEditingController portfolioNameController = TextEditingController();
  TextEditingController portfolioObjectiveController = TextEditingController();

  String portfolioName = '';

  int portfolioObjective = 0;

  String frequencyInvesting = "";

  List<String> radioList = [
    "lbl_one_time",
    "lbl_monthly",
    "lbl_quarterly",
    "lbl_annual"
  ];

  bool isTaxationSelected = false;

  bool isBrokerSelected = false;

  bool isRebalancingSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              "Taxation Selection",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          _buildTaxationSection(context),
          Container(
            width: 304.h,
            margin: EdgeInsets.only(left: 8.h, right: 15.h),
            child: Text(
              "*Please provide the following information only if you've chosen a customized taxation option. The default taxation setting aligns with the regulations in Spain.",
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
          RateTax(text: "Tax Rate on Short-Term Capital Gains Tax"),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          RateTax(text: "Tax Rate on Long-Term Capital Gains Tax"),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          RateDate(
              text: "Choose Short-to-Long Transition Point",
              defaultText: "months"),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          RateTax(text: "Ordinary Dividend Tax Rate"),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          RateTax(text: "Foreign Withholding Tax"),
          SizedBox(height: 6.0),
        ],
      ),
    );
  }
// can you modify the _buildMonetaryObjectiveRow to insted writting a text creating a custom text form field in the same way as plan 2?

  /// Section Widget
  Widget _buildMonetaryObjectiveRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the top
        children: [
          Padding(
              padding: EdgeInsets.only(top: 24.v, bottom: 0.v),
              child:
                  Text("Monetary Objective", style: theme.textTheme.bodyLarge)),
          Flexible(
            // Wrap the Container with Flexible
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.v),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 1.v),
                  Padding(
                    padding: EdgeInsets.only(left: 28.h),
                    child: CustomTextFormField(
                      controller: portfolioObjectiveController,
                      hintText: "Enter amount in euros",
                      hintStyle: theme.textTheme.bodyMedium!,
                      textInputType: TextInputType.emailAddress,
                      onEditingComplete: () {
                        setState(() {
                          portfolioObjective =
                              int.parse(portfolioObjectiveController.text);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTaxationSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          CustomRadioButton(
            text: "Default",
            value: radioList[0],
            groupValue: frequencyInvesting,
            onChange: (value) {
              setState(() {
                frequencyInvesting = value;
              });
            },
            isRightCheck: frequencyInvesting == radioList[0],
          ),
          SizedBox(height: 10.h),
          CustomRadioButton(
            text: "Customized",
            value: radioList[1],
            groupValue: frequencyInvesting,
            onChange: (value) {
              setState(() {
                frequencyInvesting = value;
              });
            },
            isRightCheck: frequencyInvesting == radioList[1],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
