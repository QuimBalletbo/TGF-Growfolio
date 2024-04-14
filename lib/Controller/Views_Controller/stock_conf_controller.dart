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

  bool setStockConfPortfolio() {
    if (includeStocks && (equalWeightStocks == 'Include') ||
        (equalWeightStocks == 'Exclude') && stockAllocation > 0) {
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
}
