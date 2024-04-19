import 'package:flutter_application_1/Model/listCreatePortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';

class CreateStockConfController {
  bool includeStocks = false;
  String equalWeightStocks = "";
  double stockAllocation = 0;
  CreatePortfolio taxationPortfolio = AuthService().getCreatePortfolio();

  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  setIncludeStocks(bool value) {
    includeStocks = value;
  }

  setEqualWeightStocks(String value) {
    equalWeightStocks = value;
  }

  setStockAllocation(double value) {
    stockAllocation = value;
  }

  initializaValues() {
    if (taxationPortfolio.equalWeightStocks != "") {
      includeStocks = taxationPortfolio.includeStocks;
      equalWeightStocks = taxationPortfolio.equalWeightStocks;
      stockAllocation = taxationPortfolio.stockAllocationPercentage;
    }
  }

  bool setStockConfPortfolio() {
    if (includeStocks &&
        ((equalWeightStocks == 'Include') ||
            (equalWeightStocks == 'Exclude')) &&
        stockAllocation > 0) {
      realm.write(() {
        taxationPortfolio.includeStocks = includeStocks;
        taxationPortfolio.stockAllocationPercentage = stockAllocation;
        taxationPortfolio.equalWeightStocks = equalWeightStocks;
      });

      return false;
    }
    if (!includeStocks) {
      realm.write(() {
        taxationPortfolio.includeStocks = includeStocks;
        taxationPortfolio.stockAllocationPercentage = 0;
        taxationPortfolio.equalWeightStocks = 'Exclude';
      });
      return false;
    }

    return true;
  }

  bool checkStockConfiguration() {
    if (!includeStocks) {
      return true;
    }

    return false;
  }

  bool checkStockDistribution() {
    int numberStocks = taxationPortfolio.stocks.length;
    double totalAllocation = 0.0;

    if (numberStocks > 0) {
      for (int i = 0; i < numberStocks; i++) {
        totalAllocation += taxationPortfolio.stocks[i].stockAllocation;
      }
      if (totalAllocation > 100.0) {
        return true;
      }
      if (totalAllocation < 99.0) {
        return true;
      }
    }
    return false;
  }
}
