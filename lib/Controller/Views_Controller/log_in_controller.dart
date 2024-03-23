import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';

import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class LoginController {
  final App _app;

  LoginController(this._app);

  bool error = false;
  late User user;

  Future<bool> initializeUserAndRealm(
      BuildContext context, String email, String password) async {
    try {
      error = false;
      user = await _app.logIn(Credentials.emailPassword(email, password));
      AuthService().initialize(user);
      print(
          "Successful logging in: User id: ${user.id} User id: ${user.profile}");
      Navigator.pushNamed(
          context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
    } catch (e) {
      error = true;
      print("Error $error Error logging in: $e");
    }

    return error;
  }

  void onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }
}
