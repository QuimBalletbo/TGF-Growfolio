import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/Screens/login_view.dart';
import 'package:flutter_application_1/View/Screens/home_view.dart';
import 'package:flutter_application_1/View/Screens/delete_account_view.dart';
import 'package:flutter_application_1/View/Screens/create_account_view.dart';
import 'package:flutter_application_1/View/Screens/profile_view.dart';
import 'package:flutter_application_1/View/Screens/modify_name_view.dart';
import 'package:flutter_application_1/View/Screens/log_out_view.dart';
import 'package:flutter_application_1/View/Screens/change_log_in_view.dart';
import 'package:flutter_application_1/View/Screens/password_security_view.dart';
import 'package:flutter_application_1/View/Screens/conditions_use_view.dart';
import 'package:flutter_application_1/View/Screens/createPortfolio_view.dart';
import 'package:flutter_application_1/View/Screens/taxation_conf_view.dart';
import 'package:flutter_application_1/View/Screens/broker_fees_view.dart';
import 'package:flutter_application_1/View/Screens/stock_conf_view.dart';
import 'package:flutter_application_1/View/Screens/create_stock_view.dart';
import 'package:flutter_application_1/View/Screens/etf_conf_view.dart';
import 'package:flutter_application_1/View/Screens/create_etf_view.dart';
import 'package:flutter_application_1/View/Screens/bond_conf_view.dart';
import 'package:flutter_application_1/View/Screens/create_bond_view.dart';
import 'package:flutter_application_1/View/Screens/finish_conf_view.dart';
import 'package:flutter_application_1/View/Screens/calculate_portfolio_view.dart';
import 'package:flutter_application_1/View/Screens/showPortfolioValues_view.dart';

import 'package:realm/realm.dart';

class AppRoutes {
  static const String iniciarSessiRegistrarSeScreen =
      '/iniciar_sessi_registrar_se_screen';
  static const String homeScreen = '/home_view';
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
  static const String cretatePortfolioScreen = '/CretatePortfolioScreen';
  static const String taxationScreen = '/taxationScreen';
  static const String brokerFeesScreen = '/brokerFeesScreen';
  static const String stockConfigurationScreen = '/stockConfigurationScreen';
  static const String createStockScreen = '/createStockScreen';
  static const String etfConfigurationScreen = '/etfConfigurationScreen';
  static const String createETFScreen = '/createETFScreen';
  static const String bondConfigurationScreen = '/bondConfigurationScreen';
  static const String createBondScreen = '/createBondScreen';
  static const String finishConfScreen = '/finishConfScreen';
  static const String calculatePortfolioScreen = '/calculatePortfolioScreen';
  static const String showPortfolioScreen = '/showPortfolioScreen';

  static Map<String, WidgetBuilder> routes(App app) {
    return {
      iniciarSessiRegistrarSeScreen: (context) =>
          IniciarSessiRegistrarSeScreen(app: app),
      homeScreen: (context) => HomeScreen(),
      profileContainerScreen: (context) => ProfileContainerScreen(),
      deleteAccountScreen: (context) => DeleteAccountScreen(),
      createAccountScreen: (context) => CreateAnAccountScreen(app: app),
      modifyNameScreen: (context) => ModifyNameScreen(),
      logOutScreen: (context) => LogOutScreen(),
      logInScreen: (context) => LogInScreen(app: app),
      passwordSecurityScreen: (context) => PasswordScreen(),
      conditionsUseScreen: (context) => ConditionsUseScreen(),
      cretatePortfolioScreen: (context) =>
          CreateBrokerFeesConfigurationOneScreen(),
      taxationScreen: (context) => TaxationConfigurationOneScreen(),
      brokerFeesScreen: (context) => brokerFeesConfiguration(),
      stockConfigurationScreen: (context) => StockConfiguration(),
      createStockScreen: (context) => const CreateStock(),
      etfConfigurationScreen: (context) => ETFConfiguration(),
      createETFScreen: (context) => const CreateETF(),
      bondConfigurationScreen: (context) => BondConfiguration(),
      createBondScreen: (context) => const CreateBond(),
      finishConfScreen: (context) => FinishConf(),
      calculatePortfolioScreen: (context) => CalculatePortfolio(),
      showPortfolioScreen: (context) => const ShowPortfolio(),
    };
  }
}
