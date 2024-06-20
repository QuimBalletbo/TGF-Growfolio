import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class CreateTaxationConfigurationViewController {
  String taxation = '';
  double taxaRateShortTerm = 0;
  double taxaRateLongtTerm = 0;
  int shortToLongTransition = 0;
  double dividendTax = 0;
  double fwt = 0;
  bool brokerFees = false;
  ValueNotifier<bool> errorFieldEmpty = ValueNotifier<bool>(false);
  var taxationPortfolio = AuthService().getCreatePortfolio();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  getBrokerFees() {
    brokerFees = taxationPortfolio.brokerFees;
    return brokerFees;
  }

  setErrorFieldEmpty() {
    errorFieldEmpty.value = false;
  }

  setTaxation(String value) {
    taxation = value;
  }

  setTaxaRateShortTerm(double value) {
    taxaRateShortTerm = value;
  }

  setTaxaRateLongtTerm(double value) {
    taxaRateLongtTerm = value;
  }

  setShortToLongTransition(int value) {
    shortToLongTransition = value;
  }

  setDividendTax(double value) {
    dividendTax = value;
  }

  setFwt(double value) {
    fwt = value;
  }

  void setTaxationPortfolio() {
    if (taxation == 'Include' && shortToLongTransition > 0) {
      realm.write(() {
        taxationPortfolio.taxRateShortTerm = taxaRateShortTerm;
        taxationPortfolio.taxRateLongTerm = taxaRateLongtTerm;
        taxationPortfolio.shortToLongTransition = shortToLongTransition;
        taxationPortfolio.dividendTax = dividendTax;
        taxationPortfolio.fwt = fwt;
      });
      errorFieldEmpty.value = false;
    } else if (taxation == 'Exclude') {
      realm.write(() {
        taxationPortfolio.taxRateShortTerm = 0.23;
        taxationPortfolio.taxRateLongTerm = 0.23;
        taxationPortfolio.shortToLongTransition = 1;
        taxationPortfolio.dividendTax = 0.21;
        taxationPortfolio.fwt = 0.10;
      });
      errorFieldEmpty.value = false;
    } else {
      errorFieldEmpty.value = true;
    }
  }
}
