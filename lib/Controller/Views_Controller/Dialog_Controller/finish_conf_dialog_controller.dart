import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Controller/Views_Controller/finish_conf_controller.dart';

class FinishBondDialogController {
  final FinishConfViewController viewController;
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  late CreatePortfolio portfolio = AuthService().getCreatePortfolio();
  ObjectId objectiD = ObjectId();

  late CreateBond bond;

  FinishBondDialogController({
    required this.viewController,
  });

  int returnAllocation(String value) {
    if (value == 'Stock') {
      return portfolio.stockAllocationPercentage.toInt();
    }
    if (value == 'Bond') {
      return portfolio.bondAllocationPercentage.toInt();
    }
    if (value == 'ETF') {
      return portfolio.etfAllocationPercentage.toInt();
    }
    return 0;
  }

  int returnStockDistribution() {
    int numberStocks = portfolio.stocks.length;
    double totalAllocation = 0.0;

    if (numberStocks > 0) {
      for (int i = 0; i < numberStocks; i++) {
        totalAllocation += portfolio.stocks[i].stockAllocation;
      }
      viewController.setStockAllocation(totalAllocation.toInt());
      return totalAllocation.toInt();
    }
    return 0;
  }

  int returnETFDistribution() {
    int numberETFs = portfolio.etfs.length;
    double totalAllocation = 0.0;

    if (numberETFs > 0) {
      for (int i = 0; i < numberETFs; i++) {
        totalAllocation += portfolio.etfs[i].eTFAllocation;
      }
      viewController.setEtfAllocation(totalAllocation.toInt());
      return totalAllocation.toInt();
    }
    return 0;
  }

  int returnBondDistribution() {
    int numberBonds = portfolio.bonds.length;
    double totalAllocation = 0.0;

    if (numberBonds > 0) {
      for (int i = 0; i < numberBonds; i++) {
        totalAllocation += portfolio.bonds[i].bondAllocation;
      }
      viewController.setBondAllocation(totalAllocation.toInt());
      return totalAllocation.toInt();
    }
    return 0;
  }

  bool checkStockAllocation() {
    int totalAllocation = portfolio.stockAllocationPercentage.toInt() +
        portfolio.bondAllocationPercentage.toInt() +
        portfolio.etfAllocationPercentage.toInt();
    if (totalAllocation == 100) {
      viewController.setErrorAllocation(false);
      return false;
    }
    viewController.setErrorAllocation(true);
    return true;
  }
}
