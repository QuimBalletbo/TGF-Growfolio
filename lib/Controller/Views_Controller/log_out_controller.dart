import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class LogoutController {
  final AuthService _authService = AuthService();

  Future<void> onTapCancel(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }

  Future<void> onTapLogOut(BuildContext context) async {
    try {
      final user = _authService.getUser();
      await user.logOut();
      Navigator.pushNamed(context, AppRoutes.iniciarSessiRegistrarSeScreen);
    } catch (e) {
      // Handle logout failure
      print("Logout failed: $e");
      // Optionally show an error message to the user
    }
  }
}
