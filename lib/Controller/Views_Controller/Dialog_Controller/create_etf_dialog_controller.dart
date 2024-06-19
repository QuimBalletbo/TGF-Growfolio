import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class CreateETFController {
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  late CreatePortfolio etfsPortfolio = AuthService().getCreatePortfolio();
  ObjectId objectiD = ObjectId();

  late CreateETF etf;

  bool getEqualWeightETFs() {
    return !(etfsPortfolio.equalWeightETFs == 'Exclude');
  }

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

  bool validateStockName(String etfName) {
    if ((etfName.isNotEmpty && etfName.length <= 20 && etfName.length >= 2)) {
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

  double getDoubleValue(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      return double.parse(value);
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

  bool createETF(
    String etfName,
    bool includeFWT,
    int etfAllocation,
    double expenseRatio,
    double avgReturn,
    double avgDividendYield,
  ) {
    if (etfName.isEmpty ||
        (etfAllocation == 0 && etfsPortfolio.equalWeightETFs == 'Include')) {
      return true;
    } else {
      if (etfsPortfolio.equalWeightETFs == 'Exclude') {
        int numberETFs = (etfsPortfolio.etfs.length) + 1;
        realm.write(() => realm.add(CreateETF(
              objectiD,
              avgDividendYield,
              avgReturn,
              (100 ~/ numberETFs),
              expenseRatio,
              includeFWT,
              etfName,
              user.id,
            )));
        if (numberETFs > 1) {
          for (int i = 0; (1 + i) < numberETFs; i++) {
            realm.write(() {
              etfsPortfolio.etfs[(i)].eTFAllocation = (100 ~/ numberETFs);
            });
          }
        }
      }
      if (etfsPortfolio.equalWeightETFs == 'Include') {
        realm.write(() => realm.add(CreateETF(
              objectiD,
              avgDividendYield,
              avgReturn,
              etfAllocation,
              expenseRatio,
              includeFWT,
              etfName,
              user.id,
            )));
      }

      addETFtoPortfolio();
      return false;
    }
  }

  void addETFtoPortfolio() {
    etf = realm.query<CreateETF>('id == \$0', [objectiD]).first;

    realm.write(() => etfsPortfolio.etfs.add(etf));
  }

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
}

class StockController {
  TextEditingController etfNameController = TextEditingController();
  TextEditingController enterTextController = TextEditingController();
  TextEditingController expenseRatio = TextEditingController();
  TextEditingController avgReturn = TextEditingController();
  TextEditingController avgDividendYield = TextEditingController();
}
