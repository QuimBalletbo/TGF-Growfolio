import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:flutter_application_1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter_application_1/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/custom_drop_down.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_radio_button.dart';
import 'package:flutter_application_1/widgets/custom_switch.dart';
import 'package:flutter_application_1/widgets/custom_text_form_field.dart';

class PortfolioConfigurationDialog extends StatefulWidget {
  PortfolioConfigurationDialog({Key? key}) : super(key: key);

  @override
  _CreatePortfolioConfigurationDialogState createState() =>
      _CreatePortfolioConfigurationDialogState();
}

class _CreatePortfolioConfigurationDialogState
    extends State<PortfolioConfigurationDialog> {
  TextEditingController portfolioNameController = TextEditingController();
  TextEditingController portfolioObjectiveController = TextEditingController();

  String portfolioName = '';
  int portfolioDuration = 0;
  int portfolioObjective = 0;
  List<String> dropdownItemList = [
    " 1",
    " 2",
    " 3",
    " 4",
    " 5",
    " 6",
    " 7",
    " 8",
    " 9",
    " 10",
    " 15",
    " 20",
    " 25",
    " 30",
    " 50"
  ];

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
            padding: EdgeInsets.only(left: 1.0),
            child: Text(
              "Portfolio’s Name",
              style: CustomTextStyles.bodyLargeLight,
            ),
          ),
          SizedBox(height: 9.0),
          Padding(
            padding: EdgeInsets.only(left: 1.0),
            child: CustomTextFormField(
              width: 228.0,
              controller: portfolioNameController,
              hintText: "Plan 2",
              hintStyle: CustomTextStyles.headlineSmallMontserrat,
              textInputAction: TextInputAction.done,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL6,
              onEditingComplete: () {
                setState(() {
                  portfolioName = portfolioNameController.text;
                });
              },
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
                Padding(
                  padding: EdgeInsets.only(top: 3.0, bottom: 5.0),
                  child: Text(
                    "Duration of Portfolio",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.0),
                  child: CustomDropDown(
                    width: 117.0,
                    hintText: " years",
                    items: dropdownItemList,
                    onChanged: (value) {
                      portfolioDuration = int.parse(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          _buildMonetaryObjectiveRow(context),
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
          _buildFrequencyOfInvestmentRadioGroup(context),
          SizedBox(height: 10.0),
          Divider(indent: 8.0),
          SizedBox(height: 12.0),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6.0, bottom: 8.0),
                  child: Text(
                    "Taxation",
                    style: CustomTextStyles.bodySmallRegular11,
                  ),
                ),
                CustomSwitch(
                  margin: EdgeInsets.only(left: 122.0),
                  initialValue:
                      isTaxationSelected, // Use initialValue instead of value
                  onChange: (value) {
                    isTaxationSelected = value;
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 11.0),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 6.0, bottom: 8.0),
                  child: Text(
                    "Broker Fees",
                    style: CustomTextStyles.bodySmallRegular11,
                  ),
                ),
                CustomSwitch(
                  margin: EdgeInsets.only(left: 103.0),
                  initialValue: isBrokerSelected,
                  onChange: (value) {
                    isBrokerSelected = value;
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 11.0),
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 4.0),
                  child: Text(
                    "Portfolio rebalancing",
                    style: CustomTextStyles.bodySmallRegular11,
                  ),
                ),
                CustomSwitch(
                  margin: EdgeInsets.only(left: 52.0),
                  initialValue: isRebalancingSelected,
                  onChange: (value) {
                    isRebalancingSelected = value;
                  },
                ),
              ],
            ),
          ),
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
  Widget _buildFrequencyOfInvestmentRadioGroup(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 9.h, right: 290.h),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          CustomRadioButton(
            text: "One-time",
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
            text: "Monthly",
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
          CustomRadioButton(
            text: "Quarterly",
            value: radioList[2],
            groupValue: frequencyInvesting,
            onChange: (value) {
              setState(() {
                frequencyInvesting = value;
              });
            },
            isRightCheck: frequencyInvesting == radioList[2],
          ),
          SizedBox(height: 10.h),
          CustomRadioButton(
            text: "Annual",
            value: radioList[3],
            groupValue: frequencyInvesting,
            onChange: (value) {
              setState(() {
                frequencyInvesting = value;
              });
            },
            isRightCheck: frequencyInvesting == radioList[3],
          )
        ],
      ),
    );
  }

  /// Navigates to the taxationConfigurationScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    //  Navigator.pushNamed(context, AppRoutes.taxationConfigurationScreen);
  }

  /// Navigates to the pGinaDIniciAlumneOneContainerScreen when the action is triggered.
  onTapCancel(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }
}
