import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/create_Portfolio_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/ArrowBackIosColumn.dart';
import 'package:flutter_application_1/Controller/Views_Controller/create_portfolio_controller.dart';

class CreateBrokerFeesConfigurationOneScreen extends StatefulWidget {
  CreateBrokerFeesConfigurationOneScreen({Key? key}) : super(key: key);
  CreatePortfolioViewController viewController =
      CreatePortfolioViewController();

  @override
  _CreateBrokerFeesConfigurationOneScreenState createState() =>
      _CreateBrokerFeesConfigurationOneScreenState();
}

class _CreateBrokerFeesConfigurationOneScreenState
    extends State<CreateBrokerFeesConfigurationOneScreen> {
  String portfolioName = '';
  double monetaryAmount = 0;
  int duration = 0;
  String frequencyInvesting = '';

  bool taxation = false;
  bool brokerFees = false;
  bool rebalancing = false;

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
                const ArrowBackIosColumn(
                  text: "Portfolio initial configuration",
                ),

                SizedBox(height: 22.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.53),
                  child: CreatePortfolioConfigurationDialog(
                      viewController: widget.viewController),
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(6.0), // Adjust the padding as needed
                  child: Align(
                    alignment: Alignment.center,
                    child: Visibility(
                      visible: errorFieldEmpty,
                      child: Text(
                        "Invalid format. One or more fields are empty. Please fill in all fields and try again",
                        style: errorFieldEmpty
                            ? CustomTextStyles.bodyMediumPrimary
                                .copyWith(color: Colors.red)
                            : CustomTextStyles.bodyMediumPrimary,
                      ),
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
                  text: "Cancel",
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

  onTapHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }

  onTapContinue(BuildContext context) {
    setState(() {
      portfolioName = widget.viewController.portfolioName;
      monetaryAmount = widget.viewController.monetaryAmount;
      duration = widget.viewController.duration;
      frequencyInvesting = widget.viewController.frequencyInvesting;

      taxation = widget.viewController.taxation;
      brokerFees = widget.viewController.brokerFees;
      rebalancing = widget.viewController.rebalancing;
      errorFieldEmpty = widget.viewController.checkAttributesNotEmpty(
          portfolioName, duration, monetaryAmount, frequencyInvesting);
      if (!errorFieldEmpty) {
        widget.viewController.createPortfolio(
            portfolioName,
            duration,
            monetaryAmount,
            frequencyInvesting,
            taxation,
            brokerFees,
            rebalancing);
        if (taxation) {
          Navigator.pushNamed(context, AppRoutes.taxationScreen);
        } else if (brokerFees) {
          Navigator.pushNamed(context, AppRoutes.brokerFeesScreen);
        } else {
          Navigator.pushNamed(context, AppRoutes.stockConfigurationScreen);
        }
      }
    });
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
