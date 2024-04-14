import 'package:flutter_application_1/Model/listCreatePortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';

class CreateBrokerFeesController {
  String selection = '';
  double stockPurchaseFee = 0;
  double stockPurchaseFlatFee = 0;
  double stockSaleFee = 0;
  double stockSaleFlatFee = 0;
  double accountMantainanceFee = 0;
  double accountMantainanceFlatFee = 0;
  CreatePortfolio taxationPortfolio = AuthService().getCreatePortfolio();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  setSelection(String value) {
    selection = value;
  }

  setStockPurchaseFee(double value) {
    stockPurchaseFee = value;
  }

  setStockPurchaseFlatFee(double value) {
    stockPurchaseFlatFee = value;
  }

  setStockSaleFee(double value) {
    stockSaleFee = value;
  }

  setStockSaleFlatFee(double value) {
    stockSaleFlatFee = value;
  }

  setAccountMantainanceFee(double value) {
    accountMantainanceFee = value;
  }

  setAccountMantainanceFlatFee(double value) {
    accountMantainanceFlatFee = value;
  }

  bool setBrokerFeesPortfolio() {
    if (selection == 'Include') {
      realm.write(() {
        taxationPortfolio.stockPurchaseFee = stockPurchaseFee;
        taxationPortfolio.stockPurchaseFlatFee = stockPurchaseFlatFee;
        taxationPortfolio.stockSaleFee = stockSaleFee;
        taxationPortfolio.stockSaleFlatFee = stockSaleFlatFee;
        taxationPortfolio.accountMaintenanceFee = accountMantainanceFee;
        taxationPortfolio.accountMaintenanceFlatFee = accountMantainanceFlatFee;
      });
      return false;
    }
    if (selection == 'Exclude') {
      realm.write(() {
        taxationPortfolio.stockPurchaseFee = 0.003;
        taxationPortfolio.stockPurchaseFlatFee = 0;
        taxationPortfolio.stockSaleFee = 0.003;
        taxationPortfolio.stockSaleFlatFee = 0;
        taxationPortfolio.accountMaintenanceFee = 0;
        taxationPortfolio.accountMaintenanceFlatFee = 0;
      });
      return false;
    }

    return true;
  }
}
