import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/Views_Controller/broker_fees_controller.dart';

class CreateBrokerFeesConfiguration {
  final CreateBrokerFeesController viewController;

  CreateBrokerFeesConfiguration({
    required this.viewController,
  });

  bool checkDoubleValidity(String value) {
    try {
      double doubleValue = double.parse(value);
      if (doubleValue > 0 && doubleValue < 10000) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return true;
    }
  }

  String getSelection(String value) {
    viewController.setSelection(value);
    return value;
  }

  double getStockPurchaseFee(String value) {
    viewController.setStockPurchaseFee(double.parse(value));
    return double.parse(value);
  }

  double getStockPurchaseFlatFee(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setStockPurchaseFlatFee(double.parse(value));
      return double.parse(value);
    }
  }

  double getStockSaleFee(String value) {
    viewController.setStockSaleFee(double.parse(value));
    return double.parse(value);
  }

  double getStockSaleFlatFee(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setStockSaleFlatFee(double.parse(value));
      return double.parse(value);
    }
  }

  double getAccountMantainanceFee(String value) {
    viewController.setAccountMantainanceFee(double.parse(value));
    return double.parse(value);
  }

  double getAccountMantainanceFlatFee(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setAccountMantainanceFlatFee(double.parse(value));
      return double.parse(value);
    }
  }
}

class CreateBrokerFeesConfigurationController {
  TextEditingController stockPurchaseflatfee = TextEditingController();
  TextEditingController stockSaleflatfee = TextEditingController();
  TextEditingController accountMantainanceflatfee = TextEditingController();
}
