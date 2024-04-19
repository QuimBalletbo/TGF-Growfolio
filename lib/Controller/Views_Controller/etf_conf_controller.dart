import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';

class CreateETFConfController {
  bool includeETFs = false;
  String equalWeightETFs = "";
  double etfAllocation = 0;
  CreatePortfolio portfolio = AuthService().getCreatePortfolio();

  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  setIncludeETFs(bool value) {
    includeETFs = value;
  }

  setEqualWeightETFs(String value) {
    equalWeightETFs = value;
  }

  setETFAllocation(double value) {
    etfAllocation = value;
  }

  initializaValues() {
    if (portfolio.equalWeightETFs != "") {
      includeETFs = portfolio.includeETF;
      equalWeightETFs = portfolio.equalWeightETFs;
      etfAllocation = portfolio.etfAllocationPercentage;
    }
  }

  bool setStockConfPortfolio() {
    if (includeETFs &&
        ((equalWeightETFs == 'Include') || (equalWeightETFs == 'Exclude')) &&
        etfAllocation > 0) {
      realm.write(() {
        portfolio.includeETF = includeETFs;
        portfolio.etfAllocationPercentage = etfAllocation;
        portfolio.equalWeightETFs = equalWeightETFs;
      });

      return false;
    }
    if (!includeETFs) {
      realm.write(() {
        portfolio.includeETF = includeETFs;
        portfolio.etfAllocationPercentage = 0;
        portfolio.equalWeightETFs = 'Exclude';
      });
      return false;
    }

    return true;
  }

  bool checkStockConfiguration() {
    if (!includeETFs) {
      return true;
    }

    return false;
  }

  bool checkStockDistribution() {
    int numberETFs = portfolio.etfs.length;
    double totalAllocation = 0.0;

    if (numberETFs > 0) {
      for (int i = 0; i < numberETFs; i++) {
        totalAllocation += portfolio.etfs[i].eTFAllocation;
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
