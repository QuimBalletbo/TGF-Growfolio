import 'package:flutter_application_1/Model/data/portfolioReturn.dart';
import 'package:flutter_application_1/Model/data/profile.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class ShowReturnView1Controller {
  Profile profile = AuthService().getProfile();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  late PortfolioReturn portfolio;
  String portfolioName = '';
  String frequencyInvesting = '';
  double amountInvested = 0;
  double finalportfolioValue = 0;
  double finalStockValue = 0;
  double finalETFValue = 0;
  double finalBondValue = 0;
  double avgReturn = 0;
  int score = 0;
  double durationScore = 0;
  double diversaificationScore = 0;
  double returnScore = 0;
  double allocationScore = 0;
  double finalStockPercentage = 0;
  double finalETFPercentage = 0;
  double finalBondPercentage = 0;

  String initViewData() {
    portfolio = realm
        .query<PortfolioReturn>('id == \$0', [profile.selectedPortfolio]).first;
    portfolioName = portfolio.name;
    return portfolioName;
  }

  String getFrequencyInvesting() {
    portfolio = realm
        .query<PortfolioReturn>('id == \$0', [profile.selectedPortfolio]).first;
    frequencyInvesting = portfolio.frequencyInvesting;
    return frequencyInvesting;
  }

  double getAmountInvested() {
    portfolio = realm
        .query<PortfolioReturn>('id == \$0', [profile.selectedPortfolio]).first;
    amountInvested = portfolio.amountInvested;
    return amountInvested;
  }

  double getFinalportfolioValue() {
    portfolio = realm
        .query<PortfolioReturn>('id == \$0', [profile.selectedPortfolio]).first;
    finalportfolioValue = portfolio.finalportfolioValue;
    return finalportfolioValue;
  }

  RealmList<AssetReturn> getAssets() {
    RealmList<AssetReturn> assetList = portfolio.assets;
    return assetList;
  }

  double getFinalStockValue() {
    finalStockValue = portfolio.finalStockValue;
    return finalStockValue;
  }

  double getFinalETFValue() {
    finalETFValue = portfolio.finalETFValue;
    return finalETFValue;
  }

  double getFinalBondValue() {
    finalBondValue = portfolio.finalBondValue;
    return finalBondValue;
  }

  double getFinalavgReturn() {
    avgReturn = portfolio.avgReturn;
    return avgReturn;
  }

  double getDurationScore() {
    durationScore = portfolio.durationScore;
    return durationScore;
  }

  double getDiversaificationScore() {
    diversaificationScore = portfolio.diversaificationScore;
    return diversaificationScore;
  }

  double getReturnScore() {
    returnScore = portfolio.returnScore;
    return returnScore;
  }

  double getAllocationScore() {
    allocationScore = portfolio.allocationScore;
    return allocationScore;
  }

  int getScore() {
    score = portfolio.score;
    return score;
  }

  double getFinalStockPercentageValue() {
    portfolio = realm
        .query<PortfolioReturn>('id == \$0', [profile.selectedPortfolio]).first;
    finalportfolioValue = portfolio.finalportfolioValue;
    finalStockValue = portfolio.finalStockValue;
    finalStockPercentage = (finalStockValue / finalportfolioValue) * 100;
    return finalStockPercentage;
  }

  double getFinalETFPercentageValue() {
    finalportfolioValue = portfolio.finalportfolioValue;
    finalETFValue = portfolio.finalETFValue;
    finalETFPercentage = (finalETFValue / finalportfolioValue) * 100;
    return finalETFPercentage;
  }

  double getFinalBondPercentageValue() {
    finalportfolioValue = portfolio.finalportfolioValue;
    finalBondValue = portfolio.finalBondValue;
    finalBondPercentage = (finalBondValue / finalportfolioValue) * 100;
    return finalBondPercentage;
  }
}
