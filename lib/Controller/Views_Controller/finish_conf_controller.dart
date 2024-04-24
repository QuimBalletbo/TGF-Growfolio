import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';

class FinishConfViewController {
  bool errorAllocation = false;
  bool errorDistribution = false;
  int stockAllocation = 0;
  int bondAllocation = 0;
  int etfAllocation = 0;

  CreatePortfolio portfolio = AuthService().getCreatePortfolio();

  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  setErrorAllocation(bool value) {
    errorAllocation = value;
  }

  setStockAllocation(int value) {
    stockAllocation = value;
  }

  setBondAllocation(int value) {
    bondAllocation = value;
  }

  setEtfAllocation(int value) {
    etfAllocation = value;
  }

  bool getErrorAllocation() {
    return errorAllocation;
  }

  bool getValue() {
    return portfolio.includeBonds;
  }

  bool checkErrorDistribution() {
    if ((stockAllocation != 99) &&
        (stockAllocation != 100) &&
        portfolio.includeStocks) {
      return true;
    }
    if ((bondAllocation != 99) &&
        (bondAllocation != 100) &&
        portfolio.includeBonds) {
      return true;
    }
    if ((etfAllocation != 99) &&
        (etfAllocation != 100) &&
        portfolio.includeETF) {
      return true;
    }
    return false;
  }
}
