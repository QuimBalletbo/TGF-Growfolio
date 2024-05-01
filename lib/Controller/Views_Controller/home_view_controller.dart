import 'package:flutter_application_1/Model/listReturnPortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:flutter_application_1/Model/data/portfolioReturn.dart';

class HomeViewController {
  RealmResults<PortfolioReturn> allPortfolioReturn =
      AuthService().getPortfolioReturn();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  CreatePortfolio returnPortfolio = AuthService().getCreatePortfolio();

  late ReturnPortfolioBloc singlePortfolio = ReturnPortfolioBloc(realm: realm);
  late ListReturnPortfolio allPortfolios = ListReturnPortfolio(
      portfolios: allPortfolioReturn, realm: realm, user: user);
  int numPortfolio = 0;
  String preferedAsset = "none";
  String riskiestPortfolio = "none";
  String bestPortfolio = "none";
  String bestPerformingPortfolio = "none";

  void initializeNumPortfolio() {
    numPortfolio = allPortfolioReturn.length;
  }

  void initializePreferedAsset() {
    double stockAmount = 0;
    double bondAmount = 0;
    double etfAmount = 0;
    if (allPortfolioReturn.isNotEmpty) {
      for (int i = 0; i < allPortfolioReturn.length; i++) {
        stockAmount += allPortfolioReturn[i].finalStockValue;
        bondAmount += allPortfolioReturn[i].finalBondValue;
        etfAmount += allPortfolioReturn[i].finalETFValue;
      }
      if (stockAmount > bondAmount && stockAmount > etfAmount) {
        preferedAsset = "Stock";
      } else if (bondAmount > stockAmount && bondAmount > etfAmount) {
        preferedAsset = "Bond";
      } else {
        preferedAsset = "ETF";
      }
    }
  }

  void initializeRiskiestPortfolio() {
    double minScore = 101;
    if (allPortfolioReturn.isNotEmpty) {
      for (int i = 0; i < allPortfolioReturn.length; i++) {
        double currentScore = (allPortfolioReturn[i].allocationScore +
                allPortfolioReturn[i].diversaificationScore) /
            2;
        if (currentScore < minScore) {
          minScore = currentScore;
          riskiestPortfolio = allPortfolioReturn[i].name;
        }
      }
    }
  }

  void initializeBestPortfolio() {
    int maxScore = -1;
    if (allPortfolioReturn.isNotEmpty) {
      for (int i = 0; i < allPortfolioReturn.length; i++) {
        int currentScore = allPortfolioReturn[i].score;
        if (currentScore > maxScore) {
          maxScore = currentScore;
          bestPortfolio = allPortfolioReturn[i].name;
        }
      }
    }
  }

  void initializeBestPerformingPortfolio() {
    double maxReturn = -100;
    if (allPortfolioReturn.isNotEmpty) {
      for (int i = 0; i < allPortfolioReturn.length; i++) {
        double currentReturn = allPortfolioReturn[i].avgReturn;
        if (currentReturn > maxReturn) {
          maxReturn = currentReturn;
          bestPerformingPortfolio = allPortfolioReturn[i].name;
        }
      }
    }
  }
}
