import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/Views_Controller/bond_conf_controller.dart';
import 'package:flutter_application_1/Model/listBond.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';

class CreateBondConfiguration {
  final CreateBondConfController viewController;

  var bonds = AuthService().getCreateBonds();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  CreatePortfolio bondPortfolio = AuthService().getCreatePortfolio();

  late BondBloc singleBond = BondBloc(realm: realm);
  late ListBond allBonds = ListBond(bonds: bonds, realm: realm, user: user);

  bool includeBonds = false;

  String equalWeightBonds = "";
  double bondAllocation = 0;

  CreateBondConfiguration({
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

  bool getIncludeBonds(String value) {
    if (value.toLowerCase() == 'include') {
      viewController.setIncludeBonds(true);
      includeBonds = true;
      return true;
    } else {
      viewController.setIncludeBonds(false);

      includeBonds = false;
      return false;
    }
  }

  String getEquallyWeightedBonds(String value) {
    viewController.setEqualWeightBonds(value);
    equalWeightBonds = value;
    return value;
  }

  double getBondAllocation(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      viewController.setBondAllocation(double.parse(value));

      bondAllocation = double.parse(value);
      return double.parse(value);
    }
  }

  bool initateIncludeBonds() {
    includeBonds = bondPortfolio.includeBonds;
    return includeBonds;
  }

  String getIncludeBondsString(bool translation) {
    String boolToString = translation ? 'Include' : 'Exclude';

    return boolToString;
  }

  String initiateEqualWeightBonds() {
    equalWeightBonds = bondPortfolio.equalWeightBonds;
    return equalWeightBonds;
  }

  double initiateBondAllocation() {
    bondAllocation = bondPortfolio.bondAllocationPercentage;
    return bondAllocation;
  }
}

class CreateBondConfigurationController {
  TextEditingController bondAllocation = TextEditingController();
}
