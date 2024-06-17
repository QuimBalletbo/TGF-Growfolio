import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/bond_conf_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/ArrowBackIosColumn.dart';
import 'package:flutter_application_1/View/widgets/custom_image_button.dart';
import 'package:flutter_application_1/Controller/Views_Controller/bond_conf_controller.dart';
import 'package:flutter_application_1/View/Screens/dialogs/max_portfolio_dialog.dart';

class BondConfiguration extends StatefulWidget {
  BondConfiguration({Key? key}) : super(key: key);
  CreateBondConfController viewController = CreateBondConfController();

  @override
  _BondConfigurationScreenState createState() =>
      _BondConfigurationScreenState();
}

class _BondConfigurationScreenState extends State<BondConfiguration> {
  @override
  void initState() {
    super.initState();
    widget.viewController.initializaValues();
  }

  bool errorFieldEmpty = false;
  bool errorBondConfiguration = false;
  bool errorBondDistribution = false;

  bool includeBonds = false;
  String equalWeightBonds = "";
  double bondAllocation = 0;
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
                  text: "Bond configuration",
                ), // Placing the app bar here

                SizedBox(height: 22.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.40),
                  child: BondConfigurationDialog(
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
                Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: errorBondConfiguration,
                    child: Text(
                      "Bond Configuration Error: Unable to Create Bond if Bonds Aren't Included in Your Portfolio.",
                      style: errorBondConfiguration
                          ? CustomTextStyles.bodyMediumPrimary
                              .copyWith(color: Colors.red)
                          : CustomTextStyles.bodyMediumPrimary,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: errorBondDistribution,
                    child: Text(
                      "Error: Bond Distribution Issue Total allocation must be 100% ",
                      style: errorBondDistribution
                          ? CustomTextStyles.bodyMediumPrimary
                              .copyWith(color: Colors.red)
                          : CustomTextStyles.bodyMediumPrimary,
                    ),
                  ),
                ),

                SizedBox(height: 22.v),
                CustomImageButton(
                  text: "Add a Bond",
                  imageConstant: ImageConstant.imgPlus,
                  onTap: () => onTapCreateBond(context),
                ),
                SizedBox(height: 22.v),
                CustomSpaceButton(
                  text: "Next step",
                  onTap: () {
                    onTapContinue(context);
                  },
                ),
                SizedBox(height: 16.v),
                CustomSpaceButton(
                  text: "Finish Portfolio Configuration",
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
      errorFieldEmpty = widget.viewController.setBondConfPortfolio();
      errorBondDistribution = widget.viewController.checkBondDistribution();
    });
    if (!errorFieldEmpty && !errorBondDistribution) {
      Navigator.pushNamed(context, AppRoutes.finishConfScreen);
    }
  }

  onTapCreateBond(BuildContext context) {
    setState(() {
      errorFieldEmpty = widget.viewController.setBondConfPortfolio();
      errorBondConfiguration = widget.viewController.checkBondConfiguration();
    });
    if (!errorFieldEmpty && !errorBondConfiguration) {
      widget.viewController.initializeNumBonds();
      if (widget.viewController.numBond >= 5) {
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
                  content: PGinaDIniciAlumneThreeDialog(
                      title: "Bond Limit Reached",
                      text:
                          "Maximum Bonds reached. Clear space by deleting an existing one."),
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                  insetPadding: EdgeInsets.only(left: 0),
                ));
      } else {
        Navigator.pushNamed(context, AppRoutes.createBondScreen);
      }
    }
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
