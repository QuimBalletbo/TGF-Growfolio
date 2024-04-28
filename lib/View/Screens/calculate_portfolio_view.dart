import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/calculate_portfolio_dialog.dart';
import 'package:flutter_application_1/View/widgets/smallArrowBack.dart';
import 'package:flutter_application_1/Controller/Views_Controller/calculate_portfolio_controller.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';

class CalculatePortfolio extends StatefulWidget {
  CalculatePortfolio({Key? key}) : super(key: key);
  CalculatePortfolioController viewController = CalculatePortfolioController();

  @override
  _CalculatePortfolioState createState() => _CalculatePortfolioState();
}

class _CalculatePortfolioState extends State<CalculatePortfolio> {
  bool endedCalculations = false;

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
                const ArrowBackIosColumn(), // Placing the app bar here

                SizedBox(height: 22.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.59),
                  child: CalculatePortfolioDialog(),
                ),
                SizedBox(height: 22.v),
                CustomSpaceButton(
                  text: "Calculate Portfolio  return",
                  onTap: () {
                    endedCalculations =
                        widget.viewController.calculateStockReturn();
                    onTapContinue(context);
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
    // Wait for 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      // Check if calculations have ended
      if (endedCalculations) {
        Navigator.pushNamed(context, AppRoutes.showPortfolioScreen);
      } else {
        Navigator.pushNamed(context, AppRoutes.showPortfolioScreen);
      }
    });
  }

  /// Section Widget
}
