import 'package:flutter_application_1/Model/listCreatePortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class CreateTaxationConfigurationViewController {
  String taxation = '';
  double taxaRateShortTerm = 0;
  double taxaRateLongtTerm = 0;
  int shortToLongTransition = 0;
  double dividendTax = 0;
  double fwt = 0;
  var portfolios = AuthService().getCreatePortfolio();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  late ListCreatePortfolio allPortfolios;
  late PortfolioBloc singlePortfolio;

  setTaxation(String value) {
    taxation = value;
  }

  setTaxaRateShortTerm(double value) {
    taxaRateShortTerm = value;
  }

  setTaxaRateLongtTerm(double value) {
    taxaRateLongtTerm = value;
  }

  setShortToLongTransition(int value) {
    shortToLongTransition = value;
  }

  setDividendTax(double value) {
    dividendTax = value;
  }

  setFwt(double value) {
    fwt = value;
  }

  initController() {
    allPortfolios =
        ListCreatePortfolio(portfolios: portfolios, realm: realm, user: user);
    singlePortfolio = PortfolioBloc(realm: realm);
  }
}
