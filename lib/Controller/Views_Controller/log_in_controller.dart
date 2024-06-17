import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class LoginController {
  final App _app;

  LoginController(this._app);

  bool error = false;
  late User user;

  bool validateLogIn() {
    return error;
  }

  Future<bool> initializeUserAndRealm(BuildContext context, String email,
      String password, VoidCallback callback) async {
    try {
      error = false;
      user = await _app.logIn(Credentials.emailPassword(email, password));
      AuthService().initialize(user);
      print("Successful logging in");
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.homeScreen,
        (route) => false,
      );
    } catch (e) {
      error = true;
      callback();
      print("Error $error Error logging in: $e");
    }

    return error;
  }

  void onTapLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }
}
