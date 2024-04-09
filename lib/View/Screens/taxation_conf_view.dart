import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/taxation_conf_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/ArrowBackIosColumn.dart';
import 'package:flutter_application_1/View/Screens/dialogs/create_Portfolio_dialog.dart';
import 'package:flutter_application_1/Controller/Views_Controller/taxation_conf_controller.dart';

// ignore_for_file: must_be_immutable
class TaxationConfigurationOneScreen extends StatefulWidget {
  TaxationConfigurationOneScreen({Key? key}) : super(key: key);
  CreateTaxationConfigurationViewController viewController =
      CreateTaxationConfigurationViewController();

  @override
  _TaxationConfigurationOneScreenState createState() =>
      _TaxationConfigurationOneScreenState();
}

class _TaxationConfigurationOneScreenState
    extends State<TaxationConfigurationOneScreen> {
  String taxation = '';
  double taxaRateShortTerm = 0;
  double taxaRateLongtTerm = 0;
  int shortToLongTransition = 0;
  double dividendTax = 0;
  double fwt = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // AppBar
                const ArrowBackIosColumn(
                  text: "Taxation configuration",
                ), // Placing the app bar here

                SizedBox(height: 22.v),

                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.53),
                  child: CreateTaxationConfigurationDialog(
                      viewController: widget.viewController),
                ),
                Container(
                  color: Colors.white, // Set the background color to white
                  child: Text(
                    "The taxation: $taxation , taxaRateShortTerm: $taxaRateShortTerm, taxaRateLongtTerm: $taxaRateLongtTerm, shortToLongTransition: $shortToLongTransition , dividendTax: $dividendTax, fwt: $fwt",
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumInterff1e1e1e.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0XFF1E1E1E),
                    ),
                  ),
                ),

                SizedBox(height: 22.v),
                CustomSpaceButton(
                  text: "Continue",
                  onTap: () {
                    onTapContinue(context);
                  },
                ),
                SizedBox(height: 16.v),
                CustomSpaceButton(
                  text: "Go Back",
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL19,
                  onTap: () {
                    onTapReload(context);
                  },
                ),

                SizedBox(height: 16.v),
                // Form Content
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapReload(BuildContext context) {
    setState(() {
      taxation = widget.viewController.taxation;
      taxaRateShortTerm = widget.viewController.taxaRateShortTerm;
      taxaRateLongtTerm = widget.viewController.taxaRateLongtTerm;
      shortToLongTransition = widget.viewController.shortToLongTransition;
      dividendTax = widget.viewController.dividendTax;
      fwt = widget.viewController.fwt;
    });
  }

  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.brokerFeesScreen);
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
