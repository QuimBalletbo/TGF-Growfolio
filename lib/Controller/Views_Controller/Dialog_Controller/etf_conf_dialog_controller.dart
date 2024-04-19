import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/Views_Controller/etf_conf_controller.dart';
import 'package:flutter_application_1/Model/listETF.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';

class CreateETFConfConfiguration {
  final CreateETFConfController viewController;

  var etfs = AuthService().getCreateETFs();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  CreatePortfolio etfPortfolio = AuthService().getCreatePortfolio();

  late ETFBloc singleETF = ETFBloc(realm: realm);
  late ListETF allETFs = ListETF(etfs: etfs, realm: realm, user: user);

  bool includeETFs = false;

  String equalWeightETFs = "";
  double etfAllocation = 0;

  CreateETFConfConfiguration({
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

  bool getIncludeETFs(String value) {
    if (value.toLowerCase() == 'include') {
      viewController.setIncludeETFs(true);
      includeETFs = true;
      return true;
    } else {
      viewController.setIncludeETFs(false);

      includeETFs = false;
      return false;
    }
  }

  String getEquallyWeightedETFs(String value) {
    viewController.setEqualWeightETFs(value);
    equalWeightETFs = value;
    return value;
  }

  double getETFAllocation(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setETFAllocation(double.parse(value));

      etfAllocation = double.parse(value);
      return double.parse(value);
    }
  }

  bool initateIncludeETFs() {
    includeETFs = etfPortfolio.includeETF;
    return includeETFs;
  }

  String getIncludeETFsString(bool translation) {
    String boolToString = translation ? 'Include' : 'Exclude';

    return boolToString;
  }

  String initiateEqualWeightETFs() {
    equalWeightETFs = etfPortfolio.equalWeightETFs;
    return equalWeightETFs;
  }

  double initiateETFAllocation() {
    etfAllocation = etfPortfolio.etfAllocationPercentage;
    return etfAllocation;
  }
}

class CreateStockConfigurationController {
  TextEditingController etfAllocation = TextEditingController();
}
