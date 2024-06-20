import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/finish_conf_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/ArrowBackIosColumn.dart';
import 'package:flutter_application_1/Controller/Views_Controller/finish_conf_controller.dart';

class FinishConf extends StatefulWidget {
  FinishConf({Key? key}) : super(key: key);
  FinishConfViewController viewController = FinishConfViewController();

  @override
  _FinishConfViewControllerState createState() =>
      _FinishConfViewControllerState();
}

class _FinishConfViewControllerState extends State<FinishConf> {
  bool errorAllocation = false;
  bool errorDistribution = false;

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
                  text: "Portfolio Overview",
                ), // Placing the app bar here

                SizedBox(height: 22.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.52),
                  child:
                      FinishConfDialog(viewController: widget.viewController),
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(6.0), // Adjust the padding as needed
                  child: Align(
                    alignment: Alignment.center,
                    child: Visibility(
                      visible: errorDistribution,
                      child: Text(
                        "Incomplete Allocation. Ensure selected assets (stocks, ETFs, or bonds) total 100%.",
                        style: errorDistribution
                            ? CustomTextStyles.bodyMediumPrimary
                                .copyWith(color: Colors.red)
                            : CustomTextStyles.bodyMediumPrimary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22.v),
                CustomSpaceButton(
                  text: "Calculate Portfolio  return",
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
      errorAllocation = widget.viewController.getErrorAllocation();
      errorDistribution = widget.viewController.checkErrorDistribution();
    });
    if (!errorAllocation && !errorDistribution) {
      Navigator.pushNamed(context, AppRoutes.calculatePortfolioScreen);
    }
  }

  onTapGoBack(BuildContext context) {
    Navigator.pop(context);
  }

  /// Section Widget
}
