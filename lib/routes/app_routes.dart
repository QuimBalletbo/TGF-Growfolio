import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/login_view.dart';
import 'package:flutter_application_1/views/home_view.dart';

class AppRoutes {
  static const String iniciarSessiRegistrarSeScreen =
      '/iniciar_sessi_registrar_se_screen';

  static const String pGinaDIniciAlumneOneContainerScreen = '/home_view';

  static const String faqsOneScreen = '/faqs_one_screen';

  static const String userManualScreen = '/user_manual_screen';

  static const String passwordSecurityFourScreen =
      '/password_security_four_screen';

  static const String createAnAccountScreen = '/create_an_account_screen';

  static const String passwordSecurityScreen = '/password_security_screen';

  static const String logInScreen = '/log_in_screen';

  static const String modifyProfileScreen = '/modify_profile_screen';

  static const String configuraciOneScreen = '/configuraci_one_screen';

  static const String pGinaDIniciAlumneOnePage = '/home_view_part';

  static const String profile = '/profile_view_part';

  static const String pGinaDIniciAlumneTwoScreen =
      '/p_gina_d_inici_alumne_two_screen';

  static const String profileOneScreen = '/profile_one_screen';

  static const String brokerFeesConfigurationOneScreen =
      '/broker_fees_configuration_one_screen';

  static const String taxationConfigurationScreen =
      '/taxation_configuration_screen';

  static const String brokerFeesConfigurationScreen =
      '/broker_fees_configuration_screen';

  static const String viewMyPortfolioScreen = '/view_my_portfolio_screen';

  static const String viewMyPortfolioOneScreen =
      '/view_my_portfolio_one_screen';

  static const String viewMyPortfolioTwoScreen =
      '/view_my_portfolio_two_screen';

  static const String viewMyPortfolioThreeScreen =
      '/view_my_portfolio_three_screen';

  static const String viewMyPortfolioFiveScreen =
      '/view_my_portfolio_five_screen';

  static const String stockConfigurationEmptyScreen =
      '/stock_configuration_empty_screen';

  static const String stockConfigurationScreen = '/stock_configuration_screen';

  static const String saveStockViewScreen = '/save_stock_view_screen';

  static const String editStockViewScreen = '/edit_stock_view_screen';

  static const String addEtfViewWithoutEtfsAddedScreen =
      '/add_etf_view_without_etfs_added_screen';

  static const String etfConfigurationScreen = '/etf_configuration_screen';

  static const String saveANewEtfViewScreen = '/save_a_new_etf_view_screen';

  static const String editEtfViewScreen = '/edit_etf_view_screen';

  static const String createACustomizedNewEtfViewScreen =
      '/create_a_customized_new_etf_view_screen';

  static const String editEtfViewOneScreen = '/edit_etf_view_one_screen';

  static const String addBondViewWithoutBondsAddedScreen =
      '/add_bond_view_without_bonds_added_screen';

  static const String addBondViewWithBondsAddedScreen =
      '/add_bond_view_with_bonds_added_screen';

  static const String saveANewBondViewScreen = '/save_a_new_bond_view_screen';

  static const String editBondViewScreen = '/edit_bond_view_screen';

  static const String createACustomizedNewBondViewScreen =
      '/create_a_customized_new_bond_view_screen';

  static const String editBondViewOneScreen = '/edit_bond_view_one_screen';

  static const String calculatingReturnsScreen = '/calculating_returns_screen';

  static const String errorProtfolioCalculationScreen =
      '/error_protfolio_calculation_screen';

  static const String portfolioViewScreen = '/portfolio_view_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    iniciarSessiRegistrarSeScreen: (context) => IniciarSessiRegistrarSeScreen(),
    pGinaDIniciAlumneOneContainerScreen: (context) =>
        PGinaDIniciAlumneOneContainerScreen(),
  };
}
