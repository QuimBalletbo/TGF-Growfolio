import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/taxation_conf_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/ArrowBackIosColumn.dart';
import 'package:flutter_application_1/Controller/Views_Controller/taxation_conf_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_PortfolioCard.dart';

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
  bool errorFieldEmpty = false;

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
                Align(
                  alignment: Alignment.center,
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
                    onTapGoBack(context);
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

  onTapReload(BuildContext context) {}

  onTapContinue(BuildContext context) {
    setState(() {
      errorFieldEmpty = widget.viewController.setTaxationPortfolio();
    });
    if (!errorFieldEmpty) {
      Navigator.pushNamed(context, AppRoutes.brokerFeesScreen);
    }
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
