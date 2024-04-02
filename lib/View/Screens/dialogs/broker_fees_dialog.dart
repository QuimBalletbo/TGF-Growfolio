import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/rateTax.dart';
import 'package:flutter_application_1/View/widgets/enter_text_euros.dart';
import 'package:flutter_application_1/View/widgets/TaxationSection.dart';

class BrokerFeesConfigurationDialog extends StatelessWidget {
  const BrokerFeesConfigurationDialog({Key? key}) : super(key: key);

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
          RateTax(text: "Stock Purchase Fee (%)"),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          EnterTextEuros(text: "Stock Purchase flat fee", defaultText: "€"),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          RateTax(text: "Stock Sale Fee (%)"),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          RateTax(text: "Stock Sale flat fee"),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          RateTax(text: "Account maintenance fee (% of Assets)"),
          SizedBox(height: 6.0),
          Divider(indent: 4.0, endIndent: 4.0),
          SizedBox(height: 6.0),
          EnterTextEuros(
              text: "Account maintenance fee (Flat Fee yearly)",
              defaultText: "€"),
        ],
      ),
    ));
  }
}
