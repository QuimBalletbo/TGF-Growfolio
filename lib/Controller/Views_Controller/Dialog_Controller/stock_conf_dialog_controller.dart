import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/Views_Controller/stock_conf_controller.dart';

class CreateStockConfConfiguration {
  final CreateStockConfController viewController;

  CreateStockConfConfiguration({
    required this.viewController,
  });

  bool checkDoubleValidity(String value) {
    try {
      double doubleValue = double.parse(value);
      if (doubleValue > 0 && doubleValue < 100) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return true;
    }
  }

  bool getIncludeStocks(String value) {
    if (value.toLowerCase() == 'include') {
      viewController.setIncludeStocks(true);
      return true;
    } else {
      viewController.setIncludeStocks(false);
      return false;
    }
  }

  bool getEquallyWeightedStocks(String value) {
    if (value.toLowerCase() == 'include') {
      viewController.setEquallyWeightedStocks(true);
      return true;
    } else {
      viewController.setEquallyWeightedStocks(false);
      return false;
    }
  }

  double getStockAllocation(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setStockAllocation(double.parse(value));
      return double.parse(value);
    }
  }
}

class CreateStockConfigurationController {
  TextEditingController stockAllocation = TextEditingController();
}
