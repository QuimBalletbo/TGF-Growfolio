import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/Views_Controller/create_portfolio_controller.dart';

class CreatePortfolioConfiguration {
  final CreatePortfolioViewController viewController;

  CreatePortfolioConfiguration({
    required this.viewController,
  });
  bool checkDoubleValidity(String value) {
    try {
      double doubleValue = double.parse(value);
      if (doubleValue > 1000 && doubleValue < 1000000000) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return true;
    }
  }

  bool validatePortfolioName(String stockName) {
    if ((stockName.isNotEmpty &&
        stockName.length <= 20 &&
        stockName.length >= 2)) {
      return false;
    }
    return true;
  }

  bool getBrokerFees(bool value) {
    viewController.setBrokerFees(value);
    return value;
  }

  bool getTaxation(bool value) {
    viewController.setTaxation(value);
    return value;
  }

  bool getRebalancing(bool value) {
    viewController.setRebalancing(value);
    return value;
  }

  String getFrequencyInvesting(String value) {
    viewController.setFrequencyInvesting(value);
    return value;
  }

  String getPortfolioNameValue(String value, bool isInCorrect) {
    if (isInCorrect) {
      return '';
    } else {
      viewController.setPortfolioName(value);
      return value;
    }
  }

  int getIntegerValue(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setDuration(int.parse(value));
      return int.parse(value);
    }
  }

  double getDoubleValue(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setMonetaryAmount(double.parse(value));
      return double.parse(value);
    }
  }
}

class PortfolioConfigurationController {
  TextEditingController portfolioNameController = TextEditingController();
  TextEditingController monetaryAmountController = TextEditingController();
}
