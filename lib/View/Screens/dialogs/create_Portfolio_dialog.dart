import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_toggle_button.dart';
import 'package:flutter_application_1/View/widgets/name_title_text.dart';
import 'package:flutter_application_1/View/widgets/rateDate.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';
import 'package:flutter_application_1/View/widgets/taxation_Section_extended.dart';

class PortfolioConfigurationDialog extends StatelessWidget {
  const PortfolioConfigurationDialog({Key? key}) : super(key: key);

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
            // NameTitleText(title: "Portfolio’s Name", name: "Plan 2"),
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
                      text: "Duration of Portfolio", defaultText: " years"),
                ],
              ),
            ),
            SizedBox(height: 14.0),
            Divider(indent: 4.0, endIndent: 4.0),
            SizedBox(height: 6.0),
            EnterTextEuros(text: "Monetary Objective", defaultText: "€"),
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
            ),
            SizedBox(height: 10.0),
            Divider(indent: 8.0),
            SizedBox(height: 12.0),
            //   ToggleButton(text: "Taxation"),
            SizedBox(height: 11.0),
            //    ToggleButton(text: "Broker Fees"),
            SizedBox(height: 11.0),
            // ToggleButton(text: "Portfolio rebalancing"),
          ],
        ),
      ),
    );
  }
}
