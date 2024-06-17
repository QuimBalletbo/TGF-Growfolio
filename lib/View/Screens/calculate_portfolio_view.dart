import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/calculate_portfolio_dialog.dart';
import 'package:flutter_application_1/View/widgets/smallArrowBack.dart';
import 'package:flutter_application_1/Controller/Views_Controller/calculate_portfolio_controller.dart';
import 'dart:async';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/profile.dart';

class CalculatePortfolio extends StatefulWidget {
  CalculatePortfolio({Key? key}) : super(key: key);
  CalculatePortfolioController viewController = CalculatePortfolioController();

  @override
  _CalculatePortfolioState createState() => _CalculatePortfolioState();
}

class _CalculatePortfolioState extends State<CalculatePortfolio> {
  int endedCalculations = 0;

  @override
  void initState() {
    super.initState();
    // Start the repeated function call
    _startTimer();
    // Initial calculation
    widget.viewController.calculatePortfolioReturn();
  }

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
                  },
                ), // Placing the app bar here

                SizedBox(height: 22.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.59),
                  child: CalculatePortfolioDialog(),
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

  void _startTimer() {
    var counter = 11;
    Timer.periodic(const Duration(seconds: 10), (timer) {
      print(timer.tick);
      onTapContinue(context);
      counter--;
      if (endedCalculations == 1) {
        print('Reached timer');
        timer.cancel();
        Navigator.pushNamed(context, AppRoutes.showReturnView1);
      } else if (endedCalculations == 2) {
        print('Error timer');
        timer.cancel();
        widget.viewController.deletePortfolioWithError();
        Navigator.pushNamed(context, AppRoutes.showErrorPortfolioScreen);
      } else if (counter == 0 || endedCalculations == 5) {
        print('Cancel timer');
        timer.cancel();
        Navigator.pushNamed(context, AppRoutes.homeScreen);
      }
    });
  }

  void onTapContinue(BuildContext context) {
    endedCalculations = widget.viewController.getEndedCalculations();

    if (endedCalculations == 1) {
      ObjectId portfolioID = widget.viewController.newportfolioID;
      print("id: $portfolioID");
      Profile profile = AuthService().getProfile();
      final Realm realm = AuthService().getRealm();

      realm.write(() {
        profile.selectedPortfolio = portfolioID;
      });
    }
  }
}
