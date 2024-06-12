import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/error_portfolio_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/smallArrowBack.dart';

// ignore_for_file: must_be_immutable
class ShowErrorPortfolio extends StatelessWidget {
  const ShowErrorPortfolio({Key? key}) : super(key: key);

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
                ArrowBackIosColumn(
                  onTapGoBack: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 22.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.75),
                  child: ErrorPortfolioDialog(),
                ),
                SizedBox(height: 22.v),
                CustomSpaceButton(
                  text: "Return to Home",
                  onTap: () {
                    onTapContinue(context);
                  },
                ),
                SizedBox(height: 22.v),
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
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }

  onTapGoBack(BuildContext context) {
    Navigator.of(context).pop(); // Go back to the previous screen
    Navigator.of(context).pop();
  }

  /// Section Widget
}
