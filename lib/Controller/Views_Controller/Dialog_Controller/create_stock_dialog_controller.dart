import 'package:flutter/material.dart';

class CreateStockController {
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

  int getIntegerValue(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      return int.parse(value);
    }
  }
}

class StockController {
  TextEditingController stockNameController = TextEditingController();
  TextEditingController enterTextController = TextEditingController();
}
