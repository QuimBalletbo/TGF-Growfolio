import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Model/data/profile.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class ModifyNameController {
  Profile profile = AuthService().getProfile();

  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  bool nameError = false;

  bool validateName(String name) {
    nameError = !(name.isNotEmpty && name.length <= 20);
    return nameError;
  }

  bool getNameError() {
    return nameError;
  }

  void onTapChangeName(BuildContext context, String name) {
    try {
      validateName(name);

      if (!nameError) {
        realm.write(() {
          profile.userName = name;
        });
        Navigator.pushNamed(context, AppRoutes.profileContainerScreen);
      }
    } catch (e) {
      nameError = true;

      // Handle logout failure
      print("Logout failed: $e");
      // Optionally show an error message to the user
    }
  }
}

class ModifyNameTextController {
  TextEditingController nameController = TextEditingController();
}
