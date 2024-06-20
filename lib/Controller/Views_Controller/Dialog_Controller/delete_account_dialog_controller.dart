import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:realm/realm.dart';

class DeleteAccountController {
  final App app;

  DeleteAccountController(this.app);

  bool passwordError = false;

  Future<void> onTapCancel(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }

  bool getPasswordError() {
    return passwordError;
  }

  bool validatePassword(String password) {
    passwordError =
        !(password.isNotEmpty && password.length <= 20 && password.length >= 6);
    return passwordError;
  }

  Future<void> onTapDeleteAccount(BuildContext context, String password) async {
    try {
      passwordError = validatePassword(password);
      if (!passwordError) {
        final currentUser = app.currentUser!;
        await app.deleteUser(currentUser);
        Navigator.pushNamed(context, AppRoutes.iniciarSessiRegistrarSeScreen);
      }
    } catch (e) {
      passwordError = true;
      // Handle logout failure
      print("Logout failed: $e");
      // Optionally show an error message to the user
    }
  }
}
