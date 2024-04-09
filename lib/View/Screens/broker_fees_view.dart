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
  String selection = '';
  double stockPurchaseFee = 0;
  double stockPurchaseFlatFee = 0;
  double stockSaleFee = 0;
  double stockSaleFlatFee = 0;
  double accountMantainanceFee = 0;
  double accountMantainanceFlatFee = 0;

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
      selection = widget.viewController.selection;
      stockPurchaseFee = widget.viewController.stockPurchaseFee;
      stockPurchaseFlatFee = widget.viewController.stockPurchaseFlatFee;
      stockSaleFee = widget.viewController.stockSaleFee;
      stockSaleFlatFee = widget.viewController.stockSaleFlatFee;
      accountMantainanceFee = widget.viewController.accountMantainanceFee;
      accountMantainanceFlatFee =
          widget.viewController.accountMantainanceFlatFee;
    });
  }

  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.stockConfigurationScreen);
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
