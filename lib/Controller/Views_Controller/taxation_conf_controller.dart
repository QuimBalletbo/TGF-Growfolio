import 'package:flutter_application_1/Model/listCreatePortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';

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
  late CreatePortfolio taxationPortfolio = portfolios.first;

  late PortfolioBloc singlePortfolio = PortfolioBloc(realm: realm);
  late ListCreatePortfolio allPortfolios =
      ListCreatePortfolio(portfolios: portfolios, realm: realm, user: user);

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

  bool setTaxationPortfolio() {
    if (taxation == 'Include' && shortToLongTransition > 0) {
      realm.write(() {
        taxationPortfolio.taxRateShortTerm = taxaRateShortTerm;
        taxationPortfolio.taxRateLongTerm = taxaRateLongtTerm;
        taxationPortfolio.shortToLongTransition = shortToLongTransition;
        taxationPortfolio.dividendTax = dividendTax;
        taxationPortfolio.fwt = fwt;
      });
      return false;
    }
    if (taxation == 'Exclude') {
      realm.write(() {
        taxationPortfolio.taxRateShortTerm = 0.23;
        taxationPortfolio.taxRateLongTerm = 0.23;
        taxationPortfolio.shortToLongTransition = 1;
        taxationPortfolio.dividendTax = 0.21;
        taxationPortfolio.fwt = 0.10;
      });
      return false;
    }

    return true;
  }
}
