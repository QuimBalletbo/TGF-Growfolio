import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class CreatePortfolioViewController {
  String portfolioName = '';
  double monetaryAmount = 0;
  int duration = 0;
  String frequencyInvesting = '';
  bool taxation = false;
  bool brokerFees = false;
  bool rebalancing = false;
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  setPortfolioName(String value) {
    portfolioName = value;
  }

  setMonetaryAmount(double value) {
    monetaryAmount = value;
  }

  setDuration(int value) {
    duration = value;
  }

  setFrequencyInvesting(String value) {
    frequencyInvesting = value;
  }

  setTaxation(bool value) {
    taxation = value;
  }

  setBrokerFees(bool value) {
    brokerFees = value;
  }

  setRebalancing(bool value) {
    rebalancing = value;
  }

  bool checkAttributesNotEmpty(
    String portfolioName,
    int duration,
    double monetaryAmount,
    String frequencyInvesting,
  ) {
    if (portfolioName.isEmpty ||
        duration == 0 ||
        monetaryAmount == 0 ||
        frequencyInvesting.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void createPortfolio(
      String portfolioName,
      int duration,
      double monetaryAmount,
      String frequencyInvesting,
      bool taxation,
      bool brokerFees,
      bool rebalancing) {
    realm.write(() => realm.add(CreatePortfolio(
          ObjectId(),
          user.id,
          portfolioName,
          duration,
          monetaryAmount,
          frequencyInvesting,
          taxation,
          brokerFees,
          rebalancing,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          false,
          false,
          false,
          0,
          0,
          0,
        )));
  }
}