import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class CreateStockController {
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  late CreatePortfolio stocksPortfolio = AuthService().getCreatePortfolio();
  var portfolio = AuthService().getCreatePortfolio();
  ObjectId objectiD = ObjectId();

  late CreateStock stock;
  bool checkIntegerValidity(String value) {
    try {
      int intValue = int.parse(value);
      if (intValue >= 1 && intValue <= 100) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return true;
    }
  }

  bool validateStockName(String stockName) {
    if ((stockName.isNotEmpty &&
        stockName.length <= 20 &&
        stockName.length >= 2)) {
      return false;
    }
    return true;
  }

  String getStockNameValue(String value, bool isInCorrect) {
    if (isInCorrect) {
      return '';
    } else {
      return value;
    }
  }

  int getStockAllocation(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      return int.parse(value);
    }
  }

  bool getIncludeFWT(bool value) {
    return value;
  }

  bool createStock(
    String stockName,
    bool includeFWT,
    int stockAllocation,
  ) {
    if (stockName.isEmpty || stockAllocation == 0) {
      return true;
    } else {
      if (stocksPortfolio.equalWeightStocks == 'Exclude') {
        int numberStocks = (stocksPortfolio.stocks.length) + 1;
        realm.write(() => realm.add(CreateStock(
              objectiD,
              0,
              0,
              includeFWT,
              stockName,
              (100 ~/ numberStocks),
              user.id,
            )));
        if (numberStocks > 1) {
          for (int i = 0; (1 + i) < numberStocks; i++) {
            realm.write(() {
              stocksPortfolio.stocks[(i)].stockAllocation =
                  (100 ~/ numberStocks);
            });
          }
        }
      }
      if (stocksPortfolio.equalWeightStocks == 'Include') {
        realm.write(() => realm.add(CreateStock(
              objectiD,
              0,
              0,
              includeFWT,
              stockName,
              stockAllocation,
              user.id,
            )));
      }

      addStockToPortfolio(stockName);
      return false;
    }
  }

  void addStockToPortfolio(String stockName) {
    stock = realm.query<CreateStock>('id == \$0', [objectiD]).first;

    realm.write(() => stocksPortfolio.stocks.add(stock));
  }
}

class StockController {
  TextEditingController stockNameController = TextEditingController();
  TextEditingController enterTextController = TextEditingController();
}
