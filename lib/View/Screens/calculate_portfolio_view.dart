import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/calculate_portfolio_dialog.dart';
import 'package:flutter_application_1/View/widgets/smallArrowBack.dart';
import 'package:flutter_application_1/Controller/Views_Controller/calculate_portfolio_controller.dart';
import 'dart:async';

class CalculatePortfolio extends StatefulWidget {
  CalculatePortfolio({Key? key}) : super(key: key);
  CalculatePortfolioController viewController = CalculatePortfolioController();

  @override
  _CalculatePortfolioState createState() => _CalculatePortfolioState();
}

class _CalculatePortfolioState extends State<CalculatePortfolio> {
  int endedCalculations = 0;
  Timer? _timer;
  bool _tenSecondsPassed = false;

  @override
  void initState() {
    super.initState();
    // Start the repeated function call
    _startTimer();
    // Check if 10 seconds have passed
    _checkTenSecondsPassed();
    // Initial calculation
    widget.viewController.calculateStockReturn();
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
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      onTapContinue(context);
    });
  }

  void _checkTenSecondsPassed() async {
    await Future.delayed(Duration(seconds: 10));
    if (!_tenSecondsPassed) {
      _tenSecondsPassed = true;
      if (mounted) {
        Navigator.pushNamed(context, AppRoutes.homeScreen);
      }
    }
  }

  void onTapContinue(BuildContext context) {
    setState(() {
      endedCalculations = widget.viewController.getEndedCalculations();
    });

    if (endedCalculations == 1) {
      _timer?.cancel();
      Navigator.pushNamed(context, AppRoutes.homeScreen);
    } else if (endedCalculations == 2) {
      _timer?.cancel();
      Navigator.pushNamed(context, AppRoutes.showErrorPortfolioScreen);
    } else if (_tenSecondsPassed) {
      _timer?.cancel();
      Navigator.pushNamed(context, AppRoutes.showErrorPortfolioScreen);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
