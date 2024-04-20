import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';

class CreateBondConfController {
  bool includeBonds = false;
  String equalWeightBonds = "";
  double bondAllocation = 0;
  CreatePortfolio portfolio = AuthService().getCreatePortfolio();

  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  setIncludeBonds(bool value) {
    includeBonds = value;
  }

  setEqualWeightBonds(String value) {
    equalWeightBonds = value;
  }

  setBondAllocation(double value) {
    bondAllocation = value;
  }

  initializaValues() {
    if (portfolio.equalWeightBonds != "") {
      includeBonds = portfolio.includeBonds;
      equalWeightBonds = portfolio.equalWeightBonds;
      bondAllocation = portfolio.bondAllocationPercentage;
    }
  }

  bool setBondConfPortfolio() {
    if (includeBonds &&
        ((equalWeightBonds == 'Include') || (equalWeightBonds == 'Exclude')) &&
        bondAllocation > 0) {
      realm.write(() {
        portfolio.includeBonds = includeBonds;
        portfolio.bondAllocationPercentage = bondAllocation;
        portfolio.equalWeightBonds = equalWeightBonds;
      });

      return false;
    }
    if (!includeBonds) {
      realm.write(() {
        portfolio.includeBonds = includeBonds;
        portfolio.bondAllocationPercentage = 0;
        portfolio.equalWeightBonds = 'Exclude';
      });
      return false;
    }

    return true;
  }

  bool checkBondConfiguration() {
    if (!includeBonds) {
      return true;
    }

    return false;
  }

  bool checkBondDistribution() {
    int numberBonds = portfolio.bonds.length;
    double totalAllocation = 0.0;

    if (numberBonds > 0) {
      for (int i = 0; i < numberBonds; i++) {
        totalAllocation += portfolio.bonds[i].bondAllocation;
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
