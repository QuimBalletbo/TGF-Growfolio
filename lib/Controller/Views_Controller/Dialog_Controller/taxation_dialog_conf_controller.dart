import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/Views_Controller/taxation_conf_controller.dart';

class CreateTaxationConfiguration {
  final CreateTaxationConfigurationViewController viewController;

  CreateTaxationConfiguration({
    required this.viewController,
  });

  String getTaxation(String value) {
    viewController.setTaxation(value);
    return value;
  }

  double getTaxaRateShortTerm(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setTaxaRateShortTerm(double.parse(value));
      return double.parse(value);
    }
  }

  double getTaxaRateLongtTerm(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setTaxaRateLongtTerm(double.parse(value));
      return double.parse(value);
    }
  }

  int getShortToLongTransition(String value) {
    viewController.setShortToLongTransition(int.parse(value));
    return int.parse(value);
  }

  double getDividendTax(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setDividendTax(double.parse(value));
      return double.parse(value);
    }
  }

  double getFwt(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setFwt(double.parse(value));
      return double.parse(value);
    }
  }
}
