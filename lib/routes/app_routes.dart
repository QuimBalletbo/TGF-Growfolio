import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/login_view.dart';
import 'package:flutter_application_1/views/home_view.dart';
import 'package:flutter_application_1/views/delete_account_view.dart';
import 'package:flutter_application_1/views/create_account_view.dart';
import 'package:flutter_application_1/views/profile_view.dart';
import 'package:flutter_application_1/views/modify_name_view.dart';
import 'package:flutter_application_1/views/log_out_view.dart';
import 'package:flutter_application_1/views/change_log_in_view.dart';
import 'package:flutter_application_1/views/password_security_view.dart';
import 'package:flutter_application_1/views/conditions_use_view.dart';
import 'package:flutter_application_1/views/broker_fees_view.dart';
import 'package:realm/realm.dart';

class AppRoutes {
  static const String iniciarSessiRegistrarSeScreen =
      '/iniciar_sessi_registrar_se_screen';

  static const String pGinaDIniciAlumneOneContainerScreen = '/home_view';

  static const String profileContainerScreen = '/profile_view';

  static const String deleteAccountScreen = '/delete_account';

  static const String createAccountScreen = '/create_account';

  static const String passwordSecurityScreen = '/password_security_screen';

  static const String configuraciOneScreen = '/configuraci_one_screen';

  static const String pGinaDIniciAlumneTwoScreen =
      '/p_gina_d_inici_alumne_two_screen';

  static const String brokerFeesConfigurationOneScreen =
      '/broker_fees_configuration_one_screen';

  static const String modifyNameScreen = '/modifyNameScreen';

  static const String logOutScreen = '/logOutScreen';

  static const String logInScreen = '/logInScreen';

  static const String conditionsUseScreen = '/conditionsUseScreen';
  static const String brokerFeesScreen = '/brokerFeesScreen';

  static Map<String, WidgetBuilder> routes(App app) {
    return {
      iniciarSessiRegistrarSeScreen: (context) =>
          IniciarSessiRegistrarSeScreen(app: app),
      pGinaDIniciAlumneOneContainerScreen: (context) =>
          PGinaDIniciAlumneOneContainerScreen(),
      profileContainerScreen: (context) => ProfileContainerScreen(),
      deleteAccountScreen: (context) => DeleteAccountScreen(),
      createAccountScreen: (context) => CreateAnAccountScreen(app: app),
      modifyNameScreen: (context) => ModifyNameScreen(),
      logOutScreen: (context) => LogOutScreen(),
      logInScreen: (context) => LogInScreen(app: app),
      passwordSecurityScreen: (context) => PasswordScreen(),
      conditionsUseScreen: (context) => ConditionsUseScreen(),
      brokerFeesScreen: (context) => BrokerFeesConfigurationOneScreen(),
    };
  }
}
