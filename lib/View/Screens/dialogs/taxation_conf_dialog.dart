import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/rateDate.dart';
import 'package:flutter_application_1/View/widgets/TaxationSection.dart';
import 'package:flutter_application_1/Controller/Views_Controller/Dialog_Controller/taxation_dialog_conf_controller.dart';
import 'package:flutter_application_1/Controller/Views_Controller/taxation_conf_controller.dart';

class CreateTaxationConfigurationDialog extends StatefulWidget {
  final CreateTaxationConfigurationViewController viewController;
  CreateTaxationConfigurationDialog({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  _CreateTaxationConfigurationDialogDialogState createState() =>
      _CreateTaxationConfigurationDialogDialogState();
}

class _CreateTaxationConfigurationDialogDialogState
    extends State<CreateTaxationConfigurationDialog> {
  late CreateTaxationConfiguration controller;

  @override
  void initState() {
    super.initState();
    controller = CreateTaxationConfiguration(
      viewController: widget.viewController,
    );
  }

  String taxation = '';
  double taxaRateShortTerm = 0;
  double taxaRateLongtTerm = 0;
  int shortToLongTransition = 0;
  double dividendTax = 0;
  double fwt = 0;

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
              onSelectionChanged: (value) {
                setState(() {
                  taxation = controller.getTaxation(value);
                });
              },
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
            RateDate(
              text: "Tax Rate on Short-Term Capital Gains Tax",
              defaultText: " %",
              onNumberChanged: (value) {
                setState(() {
                  taxaRateShortTerm =
                      controller.getTaxaRateShortTerm(value, false);
                });
              },
            ),
            SizedBox(height: 6.0),
            Divider(indent: 4.0, endIndent: 4.0),
            SizedBox(height: 6.0),
            RateDate(
              text: "Tax Rate on Long-Term Capital Gains Tax",
              defaultText: " %",
              onNumberChanged: (value) {
                setState(() {
                  taxaRateLongtTerm =
                      controller.getTaxaRateLongtTerm(value, false);
                });
              },
            ),
            Divider(indent: 4.0, endIndent: 4.0),
            SizedBox(height: 6.0),
            RateDate(
              text: "Choose Short-to-Long Transition Point",
              defaultText: " months",
              onNumberChanged: (value) {
                setState(() {
                  shortToLongTransition =
                      controller.getShortToLongTransition(value);
                });
              },
            ),
            SizedBox(height: 6.0),
            Divider(indent: 4.0, endIndent: 4.0),
            SizedBox(height: 6.0),
            RateDate(
              text: "Ordinary Dividend Tax Rate",
              defaultText: " %",
              onNumberChanged: (value) {
                setState(() {
                  dividendTax = controller.getDividendTax(value, false);
                });
              },
            ),
            Divider(indent: 4.0, endIndent: 4.0),
            SizedBox(height: 6.0),
            RateDate(
              text: "Foreign Withholding Tax",
              defaultText: " %",
              onNumberChanged: (value) {
                setState(() {
                  fwt = controller.getFwt(value, false);
                });
              },
            ),
            SizedBox(height: 6.0),
            Text(
              "The taxation: $taxation , taxaRateShortTerm: $taxaRateShortTerm, taxaRateLongtTerm: $taxaRateLongtTerm, shortToLongTransition: $shortToLongTransition , dividendTax: $dividendTax, fwt: $fwt",
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0XFF1E1E1E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
