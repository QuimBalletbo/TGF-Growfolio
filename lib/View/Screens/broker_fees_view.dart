import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/broker_fees_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/ArrowBackIosColumn.dart';
import 'package:flutter_application_1/Controller/Views_Controller/broker_fees_controller.dart';

class brokerFeesConfiguration extends StatefulWidget {
  brokerFeesConfiguration({Key? key}) : super(key: key);
  CreateBrokerFeesController viewController = CreateBrokerFeesController();

  @override
  _TaxationConfigurationOneScreenState createState() =>
      _TaxationConfigurationOneScreenState();
}

class _TaxationConfigurationOneScreenState
    extends State<brokerFeesConfiguration> {
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
                  text: "Broker Fees configuration",
                ), // Placing the app bar here

                SizedBox(height: 22.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.53),
                  child: BrokerFeesConfigurationDialog(
                      viewController: widget.viewController),
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(6.0), // Adjust the padding as needed
                  child: Align(
                    alignment: Alignment.center,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: widget.viewController.errorFieldEmpty,
                      builder: (context, errorFieldEmpty, child) {
                        return Visibility(
                          visible: errorFieldEmpty,
                          child: Text(
                            "Invalid format. One or more fields are empty. Please fill in all fields and try again",
                            style: errorFieldEmpty
                                ? CustomTextStyles.bodyMediumPrimary
                                    .copyWith(color: Colors.red)
                                : CustomTextStyles.bodyMediumPrimary,
                          ),
                        );
                      },
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

  onTapContinue(BuildContext context) {
    setState(() {
      widget.viewController.setBrokerFeesPortfolio();
    });

    if (!widget.viewController.errorFieldEmpty.value) {
      Navigator.pushNamed(context, AppRoutes.stockConfigurationScreen);
    }
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
