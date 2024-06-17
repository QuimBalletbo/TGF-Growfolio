import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class CreateAccountController {
  final App _app;

  bool emailError = false;
  bool nameError = false;
  bool passwordError = false;
  bool secondPasswordError = false;
  bool errorCreatingAccount = false;
  bool errorCheckBox = false;

  CreateAccountController(this._app);

  bool validateEmail(String email) {
    emailError =
        !(email.isNotEmpty && email.contains('@') && email.length <= 50);
    return emailError;
  }

  bool validateName(String name) {
    nameError = !(name.isNotEmpty && name.length <= 20);
    return nameError;
  }

  bool validatePassword(String password) {
    passwordError =
        !(password.isNotEmpty && password.length <= 20 && password.length >= 6);
    return passwordError;
  }

  bool validateConfirmPassword(String password, String confirmPassword) {
    secondPasswordError = !(password == confirmPassword &&
        confirmPassword.length <= 20 &&
        confirmPassword.isNotEmpty);
    return secondPasswordError;
  }

  bool validateCheckbox(bool value) {
    errorCheckBox = !value;
    return errorCheckBox;
  }

  bool validateCreatingAccount() {
    return errorCreatingAccount;
  }

  // Other validation methods

  Future<void> createAccount(
      BuildContext context, String email, String password, String name) async {
    if (errorCheckBox == true ||
        emailError == true ||
        nameError == true ||
        passwordError == true ||
        secondPasswordError == true) {
      return;
    }
    late User user;

    late Realm realm;
    errorCreatingAccount = false;

    try {
      EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(_app);
      await authProvider.registerUser(email, password);
      // Registration successful, proceed with login and initialization
      user = await _app.logIn(Credentials.emailPassword(email, password));

      AuthService().initializefirstTime(user, name);

      print("Successful logging in");
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.homeScreen,
        (route) => false,
      );
    } catch (e) {
      // Registration failed
      errorCreatingAccount = true;

      print("Error $errorCheckBox Error logging in: $e");
    }
  }
}

class AccountController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
}
