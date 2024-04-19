import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/Views_Controller/stock_conf_controller.dart';
import 'package:flutter_application_1/Model/listStock.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';

class CreateStockConfConfiguration {
  final CreateStockConfController viewController;

  var stocks = AuthService().getCreateStocks();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  CreatePortfolio stocksPortfolio = AuthService().getCreatePortfolio();

  late StockBloc singleStock = StockBloc(realm: realm);
  late ListStock allStocks =
      ListStock(stocks: stocks, realm: realm, user: user);

  bool includeStocks = false;

  String equalWeightStocks = "";
  double stockAllocation = 0;

  CreateStockConfConfiguration({
    required this.viewController,
  });

  bool checkDoubleValidity(String value) {
    try {
      double doubleValue = double.parse(value);
      if (doubleValue >= 1 && doubleValue <= 100) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return true;
    }
  }

  bool getIncludeStocks(String value) {
    if (value.toLowerCase() == 'include') {
      viewController.setIncludeStocks(true);
      includeStocks = true;
      return true;
    } else {
      viewController.setIncludeStocks(false);

      includeStocks = false;
      return false;
    }
  }

  String getEquallyWeightedStocks(String value) {
    viewController.setEqualWeightStocks(value);
    equalWeightStocks = value;
    return value;
  }

  double getStockAllocation(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setStockAllocation(double.parse(value));

      stockAllocation = double.parse(value);
      return double.parse(value);
    }
  }

  bool initateIncludeStocks() {
    includeStocks = stocksPortfolio.includeStocks;
    return includeStocks;
  }

  String getIncludeStocksString(bool translation) {
    String boolToString = translation ? 'Include' : 'Exclude';

    return boolToString;
  }

  String initiateEqualWeightStocks() {
    equalWeightStocks = stocksPortfolio.equalWeightStocks;
    return equalWeightStocks;
  }

  double initiateStockAllocation() {
    stockAllocation = stocksPortfolio.stockAllocationPercentage;
    return stockAllocation;
  }
}

class CreateStockConfigurationController {
  TextEditingController stockAllocation = TextEditingController();
}
