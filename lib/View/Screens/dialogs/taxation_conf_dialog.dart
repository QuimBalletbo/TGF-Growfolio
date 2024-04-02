import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/rateTax.dart';
import 'package:flutter_application_1/View/widgets/rateDate.dart';
import 'package:flutter_application_1/View/widgets/TaxationSection.dart';

class TaxationConfigurationDialog extends StatelessWidget {
  const TaxationConfigurationDialog({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Taxation Selection",
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
      ),
    );
  }
}
