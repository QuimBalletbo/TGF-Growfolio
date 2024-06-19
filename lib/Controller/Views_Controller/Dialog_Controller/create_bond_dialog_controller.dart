import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class CreateBondController {
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  late CreatePortfolio bondsPortfolio = AuthService().getCreatePortfolio();
  ObjectId objectiD = ObjectId();

  late CreateBond bond;

  bool getEqualWeightBonds() {
    return !(bondsPortfolio.equalWeightBonds == 'Exclude');
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

  bool validateBondName(String bondName) {
    if ((bondName.isNotEmpty &&
        bondName.length <= 20 &&
        bondName.length >= 2)) {
      return false;
    }
    return true;
  }

  String getBondNameValue(String value, bool isInCorrect) {
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

  int getBondAllocation(String value, bool isInCorrect) {
    if (isInCorrect) {
      return 0;
    } else {
      return int.parse(value);
    }
  }

  bool getIncludeFWT(bool value) {
    return value;
  }

  bool createBond(
    String bondName,
    bool includeFWT,
    int bondAllocation,
    double faceValue,
    double couponRate,
    double maturityDate,
  ) {
    if (bondName.isEmpty ||
        (bondAllocation == 0 && bondsPortfolio.equalWeightBonds == 'Include')) {
      return true;
    } else {
      if (bondsPortfolio.equalWeightBonds == 'Exclude') {
        int numberBonds = (bondsPortfolio.bonds.length) + 1;
        realm.write(() => realm.add(CreateBond(
              objectiD,
              (100 ~/ numberBonds),
              couponRate,
              faceValue,
              includeFWT,
              maturityDate,
              bondName,
              user.id,
            )));
        if (numberBonds > 1) {
          for (int i = 0; (1 + i) < numberBonds; i++) {
            realm.write(() {
              bondsPortfolio.bonds[(i)].bondAllocation = (100 ~/ numberBonds);
            });
          }
        }
      }
      if (bondsPortfolio.equalWeightBonds == 'Include') {
        realm.write(() => realm.add(CreateBond(
              objectiD,
              bondAllocation,
              couponRate,
              faceValue,
              includeFWT,
              maturityDate,
              bondName,
              user.id,
            )));
      }

      addBondtoPortfolio();
      return false;
    }
  }

  void addBondtoPortfolio() {
    bond = realm.query<CreateBond>('id == \$0', [objectiD]).first;

    realm.write(() => bondsPortfolio.bonds.add(bond));
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

  bool checkFaceValueValidity(String value) {
    try {
      double doubleValue = double.parse(value);
      if (doubleValue >= 100 && doubleValue <= 10000) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return true;
    }
  }
}

class BondController {
  TextEditingController bondNameController = TextEditingController();
  TextEditingController enterTextController = TextEditingController();
  TextEditingController faceValue = TextEditingController();
  TextEditingController couponRate = TextEditingController();
}
